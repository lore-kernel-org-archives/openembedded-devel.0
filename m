Return-Path: <Dengke.Du@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id F041A78477
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Sep 2017 05:26:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v815QWHd025856
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Aug 2017 22:26:33 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Thu, 31 Aug 2017 22:26:31 -0700
From: Dengke Du <dengke.du@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 1 Sep 2017 01:26:30 -0400
Message-ID: <1504243590-86579-1-git-send-email-dengke.du@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH] iscsitarget: fix few arguments for netlink_ack
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
X-List-Received-Date: Fri, 01 Sep 2017 05:26:32 -0000
Content-Type: text/plain

After kernel version 4.12, the function netlink_ack need four arguments,
so adjust it in iscsitarget.

Signed-off-by: Dengke Du <dengke.du@windriver.com>
---
 ...itarget-fix-few-arguments-for-netlink_ack.patch | 35 ++++++++++++++++++++++
 .../iscsitarget/iscsitarget_1.4.20.3+svn502.bb     |  4 ++-
 2 files changed, 38 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-extended/iscsitarget/files/0001-iscsitarget-fix-few-arguments-for-netlink_ack.patch

diff --git a/meta-networking/recipes-extended/iscsitarget/files/0001-iscsitarget-fix-few-arguments-for-netlink_ack.patch b/meta-networking/recipes-extended/iscsitarget/files/0001-iscsitarget-fix-few-arguments-for-netlink_ack.patch
new file mode 100644
index 0000000..84e5853
--- /dev/null
+++ b/meta-networking/recipes-extended/iscsitarget/files/0001-iscsitarget-fix-few-arguments-for-netlink_ack.patch
@@ -0,0 +1,35 @@
+From 878b6830cbeb912362ea4cc3497954e72df6f043 Mon Sep 17 00:00:00 2001
+From: Dengke Du <dengke.du@windriver.com>
+Date: Wed, 30 Aug 2017 06:06:49 -0400
+Subject: [PATCH] iscsitarget: fix few arguments for netlink_ack
+
+After the kernel upgrade to 4.12 in OE, the netlink_ack function
+need four arguments, so add it. we can check the commit:
+
+    2d4bc93368f5a0ddb57c8c885cdad9c9b7a10ed5
+
+in kernel.
+
+Upstream-Status: Pending
+
+Signed-off-by: Dengke Du <dengke.du@windriver.com>
+---
+ kernel/event.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/kernel/event.c b/kernel/event.c
+index ef4adcb..8ba5978 100644
+--- a/kernel/event.c
++++ b/kernel/event.c
+@@ -29,7 +29,7 @@ static void event_recv_skb(struct sk_buff *skb)
+ 		ietd_pid = NETLINK_CB(skb).portid;
+ 		WARN_ON(ietd_pid == 0);
+ 		if (nlh->nlmsg_flags & NLM_F_ACK)
+-			netlink_ack(skb, nlh, 0);
++			netlink_ack(skb, nlh, 0, NULL);
+ 		skb_pull(skb, rlen);
+ 	}
+ }
+-- 
+2.8.1
+
diff --git a/meta-networking/recipes-extended/iscsitarget/iscsitarget_1.4.20.3+svn502.bb b/meta-networking/recipes-extended/iscsitarget/iscsitarget_1.4.20.3+svn502.bb
index 5c1e38e..dddea10 100644
--- a/meta-networking/recipes-extended/iscsitarget/iscsitarget_1.4.20.3+svn502.bb
+++ b/meta-networking/recipes-extended/iscsitarget/iscsitarget_1.4.20.3+svn502.bb
@@ -14,7 +14,9 @@ SRC_URI = "http://ftp.heanet.ie/mirrors/ubuntu/pool/universe/i/${BPN}/${BPN}_${P
            file://access-sk_v6_daddr-iff-IPV6-defined.patch \
            file://build_with_updated_bio_struct_of_linux_v4.3_and_above.patch \
            file://build_with_updated_interfaces_of_linux_v4.8_and_above.patch \
-           file://fix-call-trace-of-ahash-API-calling.patch"
+           file://fix-call-trace-of-ahash-API-calling.patch \
+           file://0001-iscsitarget-fix-few-arguments-for-netlink_ack.patch \
+          "
 
 SRC_URI[md5sum] = "ef9bc823bbabd3c772208c00d5f2d089"
 SRC_URI[sha256sum] = "d3196ccb78a43266dce28587bfe30d8ab4db7566d7bce96057dfbb84100babb5"
-- 
2.8.1


