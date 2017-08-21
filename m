Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8915D77E12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Aug 2017 03:19:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v7L3J2sc018492
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Aug 2017 20:19:02 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Sun, 20 Aug 2017 20:19:01 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 21 Aug 2017 11:07:57 +0800
Message-ID: <20170821030757.22265-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.10.1
MIME-Version: 1.0
Subject: [meta-networking][PATCH] ipsec-tools: fix CVE-2016-10396
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 21 Aug 2017 03:19:01 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Backport patch from debian to fix CVE-2016-10396 for ipsec-tools.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../ipsec-tools/fix-CVE-2016-10396.patch           | 207 +++++++++++++++++++++
 .../ipsec-tools/ipsec-tools_0.8.2.bb               |   1 +
 2 files changed, 208 insertions(+)
 create mode 100644 meta-networking/recipes-support/ipsec-tools/ipsec-tools/fix-CVE-2016-10396.patch

diff --git a/meta-networking/recipes-support/ipsec-tools/ipsec-tools/fix-CVE-2016-10396.patch b/meta-networking/recipes-support/ipsec-tools/ipsec-tools/fix-CVE-2016-10396.patch
new file mode 100644
index 0000000..bd07965
--- /dev/null
+++ b/meta-networking/recipes-support/ipsec-tools/ipsec-tools/fix-CVE-2016-10396.patch
@@ -0,0 +1,207 @@
+Upstream-Status: Backport [https://anonscm.debian.org/cgit/pkg-ipsec-tools/pkg-ipsec-tools.git/plain/debian/patches/CVE-2016-10396.patch?id=62ac12648a4eb7c5ba5dba0f81998d1acf310d8b]
+
+Fix CVE-2016-10396.
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+Description: Fix remotely exploitable DoS. http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2016-10396
+Source: vendor; https://gnats.netbsd.org/cgi-bin/query-pr-single.pl?number=51682
+Bug-debian: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=867986
+
+Index: pkg-ipsec-tools/src/racoon/isakmp_frag.c
+===================================================================
+--- pkg-ipsec-tools.orig/src/racoon/isakmp_frag.c
++++ pkg-ipsec-tools/src/racoon/isakmp_frag.c
+@@ -1,4 +1,4 @@
+-/*	$NetBSD: isakmp_frag.c,v 1.5 2009/04/22 11:24:20 tteras Exp $	*/
++/*	$NetBSD: isakmp_frag.c,v 1.5.36.1 2017/04/21 16:50:42 bouyer Exp $	*/
+ 
+ /* Id: isakmp_frag.c,v 1.4 2004/11/13 17:31:36 manubsd Exp */
+ 
+@@ -173,6 +173,43 @@ vendorid_frag_cap(gen)
+ 	return ntohl(hp[MD5_DIGEST_LENGTH / sizeof(*hp)]);
+ }
+ 
++static int 
++isakmp_frag_insert(struct ph1handle *iph1, struct isakmp_frag_item *item)
++{
++	struct isakmp_frag_item *pitem = NULL;
++	struct isakmp_frag_item *citem = iph1->frag_chain;
++
++	/* no frag yet, just insert at beginning of list */
++	if (iph1->frag_chain == NULL) {
++		iph1->frag_chain = item;
++		return 0;
++	}
++
++	do {
++		/* duplicate fragment number, abort (CVE-2016-10396) */
++		if (citem->frag_num == item->frag_num)
++			return -1;
++
++		/* need to insert before current item */
++		if (citem->frag_num > item->frag_num) {
++			if (pitem != NULL)
++				pitem->frag_next = item;
++			else
++				/* insert at the beginning of the list  */
++				iph1->frag_chain = item;
++			item->frag_next = citem;
++			return 0;
++		}
++
++		pitem = citem;
++		citem = citem->frag_next;
++	} while (citem != NULL);
++
++	/* we reached the end of the list, insert */
++	pitem->frag_next = item;
++	return 0;
++}
++
+ int 
+ isakmp_frag_extract(iph1, msg)
+ 	struct ph1handle *iph1;
+@@ -224,39 +261,43 @@ isakmp_frag_extract(iph1, msg)
+ 	item->frag_next = NULL;
+ 	item->frag_packet = buf;
+ 
+-	/* Look for the last frag while inserting the new item in the chain */
+-	if (item->frag_last)
+-		last_frag = item->frag_num;
++	/* Check for the last frag before inserting the new item in the chain */
++	if (item->frag_last) {
++		/* if we have the last fragment, indices must match */
++		if (iph1->frag_last_index != 0 &&
++		    item->frag_last != iph1->frag_last_index) {
++			plog(LLV_ERROR, LOCATION, NULL,
++			     "Repeated last fragment index mismatch\n");
++			racoon_free(item);
++			vfree(buf);
++			return -1;
++		}
+ 
+-	if (iph1->frag_chain == NULL) {
+-		iph1->frag_chain = item;
+-	} else {
+-		struct isakmp_frag_item *current;
++		last_frag = iph1->frag_last_index = item->frag_num;
++	}
+ 
+-		current = iph1->frag_chain;
+-		while (current->frag_next) {
+-			if (current->frag_last)
+-				last_frag = item->frag_num;
+-			current = current->frag_next;
+-		}
+-		current->frag_next = item;
++	/* insert fragment into chain */
++	if (isakmp_frag_insert(iph1, item) == -1) {
++		plog(LLV_ERROR, LOCATION, NULL,
++		    "Repeated fragment index mismatch\n");
++		racoon_free(item);
++		vfree(buf);
++		return -1;
+ 	}
+ 
+-	/* If we saw the last frag, check if the chain is complete */
++	/* If we saw the last frag, check if the chain is complete
++	 * we have a sorted list now, so just walk through */
+ 	if (last_frag != 0) {
++		item = iph1->frag_chain;
+ 		for (i = 1; i <= last_frag; i++) {
+-			item = iph1->frag_chain;
+-			do {
+-				if (item->frag_num == i)
+-					break;
+-				item = item->frag_next;
+-			} while (item != NULL);
+-
++			if (item->frag_num != i)
++				break;
++			item = item->frag_next;
+ 			if (item == NULL) /* Not found */
+ 				break;
+ 		}
+ 
+-		if (item != NULL) /* It is complete */
++		if (i > last_frag) /* It is complete */
+ 			return 1;
+ 	}
+ 		
+@@ -291,15 +332,9 @@ isakmp_frag_reassembly(iph1)
+ 	}
+ 	data = buf->v;
+ 
++	item = iph1->frag_chain;
+ 	for (i = 1; i <= frag_count; i++) {
+-		item = iph1->frag_chain;
+-		do {
+-			if (item->frag_num == i)
+-				break;
+-			item = item->frag_next;
+-		} while (item != NULL);
+-
+-		if (item == NULL) {
++		if (item->frag_num != i) {
+ 			plog(LLV_ERROR, LOCATION, NULL, 
+ 			    "Missing fragment #%d\n", i);
+ 			vfree(buf);
+@@ -308,6 +343,7 @@ isakmp_frag_reassembly(iph1)
+ 		}
+ 		memcpy(data, item->frag_packet->v, item->frag_packet->l);
+ 		data += item->frag_packet->l;
++		item = item->frag_next;
+ 	}
+ 
+ out:
+Index: pkg-ipsec-tools/src/racoon/isakmp_inf.c
+===================================================================
+--- pkg-ipsec-tools.orig/src/racoon/isakmp_inf.c
++++ pkg-ipsec-tools/src/racoon/isakmp_inf.c
+@@ -720,6 +720,7 @@ isakmp_info_send_nx(isakmp, remote, loca
+ #endif
+ #ifdef ENABLE_FRAG
+ 	iph1->frag = 0;
++	iph1->frag_last_index = 0;
+ 	iph1->frag_chain = NULL;
+ #endif
+ 
+Index: pkg-ipsec-tools/src/racoon/isakmp.c
+===================================================================
+--- pkg-ipsec-tools.orig/src/racoon/isakmp.c
++++ pkg-ipsec-tools/src/racoon/isakmp.c
+@@ -1072,6 +1072,7 @@ isakmp_ph1begin_i(rmconf, remote, local)
+ 		iph1->frag = 1;
+ 	else
+ 		iph1->frag = 0;
++	iph1->frag_last_index = 0;
+ 	iph1->frag_chain = NULL;
+ #endif
+ 	iph1->approval = NULL;
+@@ -1176,6 +1177,7 @@ isakmp_ph1begin_r(msg, remote, local, et
+ #endif
+ #ifdef ENABLE_FRAG
+ 	iph1->frag = 0;
++	iph1->frag_last_index = 0;
+ 	iph1->frag_chain = NULL;
+ #endif
+ 	iph1->approval = NULL;
+Index: pkg-ipsec-tools/src/racoon/handler.h
+===================================================================
+--- pkg-ipsec-tools.orig/src/racoon/handler.h
++++ pkg-ipsec-tools/src/racoon/handler.h
+@@ -1,4 +1,4 @@
+-/*	$NetBSD: handler.h,v 1.25 2010/11/17 10:40:41 tteras Exp $	*/
++/*	$NetBSD: handler.h,v 1.26 2017/01/24 19:23:56 christos Exp $	*/
+ 
+ /* Id: handler.h,v 1.19 2006/02/25 08:25:12 manubsd Exp */
+ 
+@@ -141,6 +141,7 @@ struct ph1handle {
+ #endif
+ #ifdef ENABLE_FRAG
+ 	int frag;			/* IKE phase 1 fragmentation */
++	int frag_last_index;
+ 	struct isakmp_frag_item *frag_chain;	/* Received fragments */
+ #endif
+ 
diff --git a/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.2.bb b/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.2.bb
index d7e8b25..5cbeb15 100644
--- a/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.2.bb
+++ b/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.2.bb
@@ -24,6 +24,7 @@ SRC_URI = "http://ftp.netbsd.org/pub/NetBSD/misc/ipsec-tools/0.8/ipsec-tools-${P
            file://0001-Fix-build-with-clang.patch \
            file://0001-Fix-header-issues-found-with-musl-libc.patch \
            file://0002-cfparse-clear-memory-equal-to-size-of-array.patch \
+           file://fix-CVE-2016-10396.patch \
            "
 SRC_URI[md5sum] = "d53ec14a0a3ece64e09e5e34b3350b41"
 SRC_URI[sha256sum] = "8eb6b38716e2f3a8a72f1f549c9444c2bc28d52c9536792690564c74fe722f2d"
-- 
2.10.1


