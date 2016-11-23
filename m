Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 6B45371AE4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Nov 2016 09:22:41 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id x23so664167pgx.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Nov 2016 01:22:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=eDzdScc0qX4TC2XVJ/wTq7ux9FOTle/X0frZ52VlTcQ=;
	b=sU7wkuv7KD+cjjYDeNHocYsgh5R4yr2Yz1GHD/5tq+EV6Gw7Sg3lZ7Nm9kFveDnq5u
	x94ZIL7qMsv9UEGVkBTLq7TP7vISn2nfwhXtV2AJhgZql/7JvRsKf7ZFbKiVnT2+t+Bk
	MD25p1vTFrGI/kwIfyRn0o90dtCTvIYXraHt1A09+bAz0w82n0xsjZF6NF5G2J3AiPV/
	bHEj/ohytf1Ydj08U1gPVy6BmTej3h1YCOswvq+nkZj9+T/lrhw8raTafVsYsY64ZBTO
	Qggyn9Ae3gGUgDyvAAtVUjSFXfS8zKPU9J6KvrjtPmoB7aDeKNy2dHizytuLC3ISuwS9
	agfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=eDzdScc0qX4TC2XVJ/wTq7ux9FOTle/X0frZ52VlTcQ=;
	b=kCbt9STFLCh09vjoB+lOHwN0kBOxz38hueLiMpWupt/v509YDT8g9SG1rJ/EgrNIrM
	3WnRwqh+Mg0ZeLji2+8klH+82Awva6wp94CtD1CauQx/gPz/H/AQ9PxygHK+OhiRMfoW
	jU6H+YECo5fdGm2C7W3bVyDNb0FFRPOX2F7goth6UiuAB6wSSFh204wPa9UGyjVh7lLk
	J1V+4aToD3obhvzWLp0RTzJRcawr/vF62qkkfHdQgBV0QZprEZUCicSRqmFpPZRlT7SL
	nQKNKou7+cVo5HFS/jZ1NlIv52KOB3Z8efvtwFWuBQVGtVEagI/vXC3HIkX6qvwxOi+w
	GMcg==
X-Gm-Message-State: AKaTC03ZDKC8Z6FofVuGAqNm42T3EUrVim3IdoZqUiQn6RsuuvyZg2BHyx6yKTNTM4RbjQ==
X-Received: by 10.99.126.6 with SMTP id z6mr3532087pgc.182.1479892962921;
	Wed, 23 Nov 2016 01:22:42 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	u23sm51056087pfg.86.2016.11.23.01.22.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Nov 2016 01:22:42 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 23 Nov 2016 01:21:54 -0800
Message-Id: <20161123092209.23699-34-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20161123092209.23699-1-raj.khem@gmail.com>
References: <20161123092209.23699-1-raj.khem@gmail.com>
Subject: [meta-networking][PATCH 34/49] ipsec-tools: Fix build with clang
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
X-List-Received-Date: Wed, 23 Nov 2016 09:22:41 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../ipsec-tools/0001-Fix-build-with-clang.patch    | 115 +++++++++++++++++++++
 .../ipsec-tools/ipsec-tools_0.8.2.bb               |   1 +
 2 files changed, 116 insertions(+)
 create mode 100644 meta-networking/recipes-support/ipsec-tools/ipsec-tools/0001-Fix-build-with-clang.patch

diff --git a/meta-networking/recipes-support/ipsec-tools/ipsec-tools/0001-Fix-build-with-clang.patch b/meta-networking/recipes-support/ipsec-tools/ipsec-tools/0001-Fix-build-with-clang.patch
new file mode 100644
index 0000000..5c09147
--- /dev/null
+++ b/meta-networking/recipes-support/ipsec-tools/ipsec-tools/0001-Fix-build-with-clang.patch
@@ -0,0 +1,115 @@
+From 9135ca401186fb14e5e5110bbb04d1ccc480360a Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 15 Nov 2016 04:15:44 +0000
+Subject: [PATCH] Fix build with clang
+
+Fixes for following errors found by clang
+
+src/racoon/eaytest.c:316:6: error: comparison of array 'dnstr_w1' not equal to a null pointer is always true
+      [-Werror,-Wtautological-pointer-compare]
+        if (dnstr_w1 != NULL) {
+            ^~~~~~~~    ~~~~
+src/racoon/eaytest.c:326:6: error: comparison of array 'dnstr_w1' not equal to a null pointer is always true
+      [-Werror,-Wtautological-pointer-compare]
+        if (dnstr_w1 != NULL) {
+            ^~~~~~~~    ~~~~
+
+src/racoon/isakmp.c:1134:11: error: promoted type 'int' of K&R function parameter is not compatible with the
+                  parameter type 'u_int8_t' (aka 'unsigned char') declared in a previous prototype [-Werror,-Wknr-promoted-parameter]
+                    u_int8_t etype;
+                             ^
+src/racoon/isakmp.c:184:48: note: previous declaration is here
+        struct sockaddr *, struct sockaddr *, u_int8_t));
+                                                     ^
+            1 error generated.
+
+src/racoon/racoonctl.c:1457:15: error: incompatible pointer types passing 'struct evt_async *' to parameter of type
+        'caddr_t' (aka 'char *') [-Werror,-Wincompatible-pointer-types]
+                            print_cfg(ec, len);
+                                      ^~
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/racoon/eaytest.c   |  4 ++--
+ src/racoon/isakmp.c    | 10 +++++-----
+ src/racoon/racoonctl.c |  7 +++----
+ 3 files changed, 10 insertions(+), 11 deletions(-)
+
+diff --git a/src/racoon/eaytest.c b/src/racoon/eaytest.c
+index 1474bdc..d609e4f 100644
+--- a/src/racoon/eaytest.c
++++ b/src/racoon/eaytest.c
+@@ -313,7 +313,7 @@ certtest(ac, av)
+ 
+ 	printf("exact match: succeed.\n");
+ 
+-	if (dnstr_w1 != NULL) {
++	if (dnstr_w1[0] != '\0') {
+ 		asn1dn = eay_str2asn1dn(dnstr_w1, strlen(dnstr_w1));
+ 		if (asn1dn == NULL || asn1dn->l == asn1dn0.l)
+ 			errx(1, "asn1dn length wrong for wildcard 1\n");
+@@ -323,7 +323,7 @@ certtest(ac, av)
+ 		printf("wildcard 1 match: succeed.\n");
+ 	}
+ 
+-	if (dnstr_w1 != NULL) {
++	if (dnstr_w1[0] != '\0') {
+ 		asn1dn = eay_str2asn1dn(dnstr_w2, strlen(dnstr_w2));
+ 		if (asn1dn == NULL || asn1dn->l == asn1dn0.l)
+ 			errx(1, "asn1dn length wrong for wildcard 2\n");
+diff --git a/src/racoon/isakmp.c b/src/racoon/isakmp.c
+index 2672f7a..da7ebe8 100644
+--- a/src/racoon/isakmp.c
++++ b/src/racoon/isakmp.c
+@@ -567,7 +567,7 @@ isakmp_main(msg, remote, local)
+ 
+ 				/* it must be responder's 1st exchange. */
+ 				if (isakmp_ph1begin_r(msg, remote, local,
+-					isakmp->etype) < 0)
++					(u_int8_t)isakmp->etype) < 0)
+ 					return -1;
+ 				break;
+ 
+@@ -1128,10 +1128,10 @@ isakmp_ph1begin_i(rmconf, remote, local)
+ 
+ /* new negotiation of phase 1 for responder */
+ static int
+-isakmp_ph1begin_r(msg, remote, local, etype)
+-	vchar_t *msg;
+-	struct sockaddr *remote, *local;
+-	u_int8_t etype;
++isakmp_ph1begin_r(vchar_t *msg,
++	struct sockaddr *remote,
++	struct sockaddr *local,
++	u_int8_t etype)
+ {
+ 	struct isakmp *isakmp = (struct isakmp *)msg->v;
+ 	struct ph1handle *iph1;
+diff --git a/src/racoon/racoonctl.c b/src/racoon/racoonctl.c
+index da28ecd..bbf068e 100644
+--- a/src/racoon/racoonctl.c
++++ b/src/racoon/racoonctl.c
+@@ -1299,9 +1299,8 @@ print_evt(evtdump)
+  * Print ISAKMP mode config info (IP and banner)
+  */
+ void
+-print_cfg(buf, len)
+-	caddr_t buf;
+-	int len;
++print_cfg(caddr_t buf,
++	int len)
+ {
+ 	struct evt_async *evtdump = (struct evt_async *)buf;
+ 	struct isakmp_data *attr;
+@@ -1454,7 +1453,7 @@ handle_recv(combuf)
+ 		else if (evt_quit_event == ec->ec_type) {
+ 			switch (ec->ec_type) {
+ 			case EVT_PHASE1_MODE_CFG:
+-				print_cfg(ec, len);
++				print_cfg((caddr_t)ec, len);
+ 				break;
+ 			default:
+ 				print_evt(ec);
+-- 
+1.9.1
+
diff --git a/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.2.bb b/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.2.bb
index 4466974..a9b5b95 100644
--- a/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.2.bb
+++ b/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.2.bb
@@ -21,6 +21,7 @@ SRC_URI = "ftp://ftp.netbsd.org/pub/NetBSD/misc/ipsec-tools/0.8/ipsec-tools-${PV
            file://racoon.conf \
            file://racoon.service \
            file://fix-CVE-2015-4047.patch \
+           file://0001-Fix-build-with-clang.patch \
           "
 SRC_URI[md5sum] = "d53ec14a0a3ece64e09e5e34b3350b41"
 SRC_URI[sha256sum] = "8eb6b38716e2f3a8a72f1f549c9444c2bc28d52c9536792690564c74fe722f2d"
-- 
2.10.2


