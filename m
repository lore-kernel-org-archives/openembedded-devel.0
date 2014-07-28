Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B692F65F01
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Jul 2014 08:15:03 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s6S8F5ij022619
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Jul 2014 01:15:05 -0700 (PDT)
Received: from pek-hostel-vm11.wrs.com (128.224.153.181) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Mon, 28 Jul 2014 01:15:04 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 28 Jul 2014 04:15:03 -0400
Message-ID: <1406535303-26611-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.0.0
MIME-Version: 1.0
Subject: [meta-networking][PATCH] quagga: Security Advisory - quagga - CVE-2013-2236
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 28 Jul 2014 08:15:03 -0000
Content-Type: text/plain

From: Yue Tao <Yue.Tao@windriver.com>

Stack-based buffer overflow in the new_msg_lsa_change_notify function in
the OSPFD API (ospf_api.c) in Quagga before 0.99.22.2, when
--enable-opaque-lsa and the -a command line option are used, allows
remote attackers to cause a denial of service (crash) via a large LSA.

http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-2236

Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 ...-CVE-2013-2236-stack-overrun-in-apiserver.patch | 106 +++++++++++++++++++++
 .../recipes-protocols/quagga/quagga_0.99.21.bb     |   1 +
 2 files changed, 107 insertions(+)
 create mode 100644 meta-networking/recipes-protocols/quagga/files/0001-ospfd-CVE-2013-2236-stack-overrun-in-apiserver.patch

diff --git a/meta-networking/recipes-protocols/quagga/files/0001-ospfd-CVE-2013-2236-stack-overrun-in-apiserver.patch b/meta-networking/recipes-protocols/quagga/files/0001-ospfd-CVE-2013-2236-stack-overrun-in-apiserver.patch
new file mode 100644
index 0000000..30b05c2
--- /dev/null
+++ b/meta-networking/recipes-protocols/quagga/files/0001-ospfd-CVE-2013-2236-stack-overrun-in-apiserver.patch
@@ -0,0 +1,106 @@
+Subject: [PATCH] ospfd: CVE-2013-2236, stack overrun in apiserver
+
+Upstream-Status: Backport
+
+the OSPF API-server (exporting the LSDB and allowing announcement of
+Opaque-LSAs) writes past the end of fixed on-stack buffers.  This leads
+to an exploitable stack overflow.
+
+For this condition to occur, the following two conditions must be true:
+- Quagga is configured with --enable-opaque-lsa
+- ospfd is started with the "-a" command line option
+
+If either of these does not hold, the relevant code is not executed and
+the issue does not get triggered.
+
+Since the issue occurs on receiving large LSAs (larger than 1488 bytes),
+it is possible for this to happen during normal operation of a network.
+In particular, if there is an OSPF router with a large number of
+interfaces, the Router-LSA of that router may exceed 1488 bytes and
+trigger this, leading to an ospfd crash.
+
+For an attacker to exploit this, s/he must be able to inject valid LSAs
+into the OSPF domain.  Any best-practice protection measure (using
+crypto authentication, restricting OSPF to internal interfaces, packet
+filtering protocol 89, etc.) will prevent exploitation.  On top of that,
+remote (not on an OSPF-speaking network segment) attackers will have
+difficulties bringing up the adjacency needed to inject a LSA.
+
+This patch only performs minimal changes to remove the possibility of a
+stack overrun.  The OSPF API in general is quite ugly and needs a
+rewrite.
+
+Reported-by: Ricky Charlet <ricky.charlet@hp.com>
+Cc: Florian Weimer <fweimer@redhat.com>
+Signed-off-by: David Lamparter <equinox@opensourcerouting.org>
+---
+ ospfd/ospf_api.c |   25 ++++++++++++++++++-------
+ 1 files changed, 18 insertions(+), 7 deletions(-)
+
+diff --git a/ospfd/ospf_api.c b/ospfd/ospf_api.c
+index 74a49e3..fae942e 100644
+--- a/ospfd/ospf_api.c
++++ b/ospfd/ospf_api.c
+@@ -472,6 +472,9 @@ new_msg_register_event (u_int32_t seqnum, struct lsa_filter_type *filter)
+   emsg->filter.typemask = htons (filter->typemask);
+   emsg->filter.origin = filter->origin;
+   emsg->filter.num_areas = filter->num_areas;
++  if (len > sizeof (buf))
++    len = sizeof(buf);
++  /* API broken - missing memcpy to fill data */
+   return msg_new (MSG_REGISTER_EVENT, emsg, seqnum, len);
+ }
+ 
+@@ -488,6 +491,9 @@ new_msg_sync_lsdb (u_int32_t seqnum, struct lsa_filter_type *filter)
+   smsg->filter.typemask = htons (filter->typemask);
+   smsg->filter.origin = filter->origin;
+   smsg->filter.num_areas = filter->num_areas;
++  if (len > sizeof (buf))
++    len = sizeof(buf);
++  /* API broken - missing memcpy to fill data */
+   return msg_new (MSG_SYNC_LSDB, smsg, seqnum, len);
+ }
+ 
+@@ -501,13 +507,15 @@ new_msg_originate_request (u_int32_t seqnum,
+   int omsglen;
+   char buf[OSPF_API_MAX_MSG_SIZE];
+ 
+-  omsglen = sizeof (struct msg_originate_request) - sizeof (struct lsa_header)
+-    + ntohs (data->length);
+-
+   omsg = (struct msg_originate_request *) buf;
+   omsg->ifaddr = ifaddr;
+   omsg->area_id = area_id;
+-  memcpy (&omsg->data, data, ntohs (data->length));
++
++  omsglen = ntohs (data->length);
++  if (omsglen > sizeof (buf) - offsetof (struct msg_originate_request, data))
++    omsglen = sizeof (buf) - offsetof (struct msg_originate_request, data);
++  memcpy (&omsg->data, data, omsglen);
++  omsglen += sizeof (struct msg_originate_request) - sizeof (struct lsa_header);
+ 
+   return msg_new (MSG_ORIGINATE_REQUEST, omsg, seqnum, omsglen);
+ }
+@@ -627,13 +635,16 @@ new_msg_lsa_change_notify (u_char msgtype,
+   assert (data);
+ 
+   nmsg = (struct msg_lsa_change_notify *) buf;
+-  len = ntohs (data->length) + sizeof (struct msg_lsa_change_notify)
+-    - sizeof (struct lsa_header);
+   nmsg->ifaddr = ifaddr;
+   nmsg->area_id = area_id;
+   nmsg->is_self_originated = is_self_originated;
+   memset (&nmsg->pad, 0, sizeof (nmsg->pad));
+-  memcpy (&nmsg->data, data, ntohs (data->length));
++
++  len = ntohs (data->length);
++  if (len > sizeof (buf) - offsetof (struct msg_lsa_change_notify, data))
++    len = sizeof (buf) - offsetof (struct msg_lsa_change_notify, data);
++  memcpy (&nmsg->data, data, len);
++  len += sizeof (struct msg_lsa_change_notify) - sizeof (struct lsa_header);
+ 
+   return msg_new (msgtype, nmsg, seqnum, len);
+ }
+-- 
+1.7.5.4
+
diff --git a/meta-networking/recipes-protocols/quagga/quagga_0.99.21.bb b/meta-networking/recipes-protocols/quagga/quagga_0.99.21.bb
index 0988b70..596d703 100644
--- a/meta-networking/recipes-protocols/quagga/quagga_0.99.21.bb
+++ b/meta-networking/recipes-protocols/quagga/quagga_0.99.21.bb
@@ -7,6 +7,7 @@ SRC_URI += "file://0001-doc-fix-makeinfo-errors-and-one-warning.patch \
             file://build-fix-extract.pl-for-cross-compilation.patch \
             file://babel-close-the-stdout-stderr-as-in-other-daemons.patch \
             file://work-with-new-readline.patch \
+            file://0001-ospfd-CVE-2013-2236-stack-overrun-in-apiserver.patch \
 "
 
 SRC_URI[quagga-0.99.21.md5sum] = "99840adbe57047c90dfba6b6ed9aec7f"
-- 
2.0.0


