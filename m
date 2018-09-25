Return-Path: <Mingli.Yu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A14866079F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Sep 2018 04:01:29 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w8P41TDT020178
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 24 Sep 2018 21:01:29 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Mon, 24 Sep 2018 21:01:28 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <raj.khem@gmail.com>
Date: Tue, 25 Sep 2018 12:01:27 +0800
Message-ID: <1537848087-196413-1-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-networking][PATCH] lksctp-tools: fix ptest Segmentation fault
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
X-List-Received-Date: Tue, 25 Sep 2018 04:01:29 -0000
Content-Type: text/plain

From: Mingli Yu <Mingli.Yu@windriver.com>

Initialize the variable event properly
to fix the below Segmentation fault:
 # cd /usr/lib64/lksctp-tools/ptest
 # ./test_1_to_1_events
 test_1_to_1_events.c 1 PASS : COMM_UP notification on client socket - SUCCESS
 test_1_to_1_events.c 2 PASS : COMM_UP notification on server socket - SUCCESS
 test_1_to_1_events.c 3 BROK : Got a datamsg, expecting notification
 DUMP_CORE sctputil.c: 187
 [ 1468.733938] test_1_to_1_eve[2376]: segfault at 0 ip 0000561a4a3d5079 sp 00007ffd49101580 error 6 in test_1_to_1_events[561a4a3d4000+2000]
 [ 1468.734479] Code: ff bf 0a 00 00 00 e8 e6 ef ff ff b9 c9 00 00 00 48 8d 15 61 13 00 00 bf 01 00 00 00 31 c0 48 8d 35 c7 0f 00 00 e8 97 f0
 Segmentation fault

Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
---
 ...1_to_1_events.c-initialize-event-properly.patch | 44 ++++++++++++++++++++++
 .../lksctp-tools/lksctp-tools_1.0.18.bb            |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta-networking/recipes-support/lksctp-tools/lksctp-tools/0001-test_1_to_1_events.c-initialize-event-properly.patch

diff --git a/meta-networking/recipes-support/lksctp-tools/lksctp-tools/0001-test_1_to_1_events.c-initialize-event-properly.patch b/meta-networking/recipes-support/lksctp-tools/lksctp-tools/0001-test_1_to_1_events.c-initialize-event-properly.patch
new file mode 100644
index 0000000..621e6f4
--- /dev/null
+++ b/meta-networking/recipes-support/lksctp-tools/lksctp-tools/0001-test_1_to_1_events.c-initialize-event-properly.patch
@@ -0,0 +1,44 @@
+From e1e670defb84d51efdd124e5f3fa166a1a4b7c1d Mon Sep 17 00:00:00 2001
+From: Mingli Yu <Mingli.Yu@windriver.com>
+Date: Tue, 25 Sep 2018 11:39:43 +0800
+Subject: [PATCH] test_1_to_1_events.c: initialize event properly
+
+Initialize event properly to avoid below
+Segmentation fault when run below test
+related to AUTH_NO_AUTH.
+
+ # ./test_1_to_1_events
+test_1_to_1_events.c 1 PASS : COMM_UP notification on client socket - SUCCESS
+test_1_to_1_events.c 2 PASS : COMM_UP notification on server socket - SUCCESS
+test_1_to_1_events.c 3 BROK : Got a datamsg, expecting notification
+DUMP_CORE sctputil.c: 187
+[ 1468.733938] test_1_to_1_eve[2376]: segfault at 0 ip 0000561a4a3d5079 sp 00007ffd49101580 error 6 in test_1_to_1_events[561a4a3d4000+2000]
+[ 1468.734479] Code: ff bf 0a 00 00 00 e8 e6 ef ff ff b9 c9 00 00 00 48 8d 15 61 13 00 00 bf 01 00 00 00 31 c0 48 8d 35 c7 0f 00 00 e8 97 f0
+Segmentation fault
+
+Upstream-Status: Pending
+
+Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
+---
+ src/func_tests/test_1_to_1_events.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/func_tests/test_1_to_1_events.c b/src/func_tests/test_1_to_1_events.c
+index 46439bf..a086832 100644
+--- a/src/func_tests/test_1_to_1_events.c
++++ b/src/func_tests/test_1_to_1_events.c
+@@ -92,9 +92,11 @@ main(int argc, char *argv[])
+ 	/* Create the client socket.  */
+ 	clt_sk = test_socket(AF_INET, SOCK_STREAM, IPPROTO_SCTP);
+ 
++	memset(&event, 0, sizeof(event));
+ 	event.sctp_data_io_event = 1;
+ 	event.sctp_association_event = 1;
+ 	event.sctp_shutdown_event = 1;
++	event.sctp_authentication_event = 1;
+ 	len = sizeof(struct sctp_event_subscribe);
+ 	test_setsockopt(svr_sk, SCTP_EVENTS, &event, len);
+ 	test_setsockopt(clt_sk, SCTP_EVENTS, &event, len);
+-- 
+2.7.4
+
diff --git a/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.18.bb b/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.18.bb
index cc2f835..70cea6c 100644
--- a/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.18.bb
+++ b/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.18.bb
@@ -21,6 +21,7 @@ SRC_URI = " \
     file://0001-build-remove-v4.12-secondary-defines-in-favor-of-HAV.patch \
     file://0001-build-fix-probing-for-HAVE_SCTP_SENDV.patch \
     file://0001-build-0b0dce7a36fb-actually-belongs-to-v4.19.patch \
+    file://0001-test_1_to_1_events.c-initialize-event-properly.patch \
     file://run-ptest \
     file://v4test.sh \
     file://v6test.sh \
-- 
2.7.4


