Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DCAD10BA458
	for <webhook@archiver.kernel.org>; Fri, 27 Mar 2026 09:10:02 +0000 (UTC)
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.68840.1774602592995117837
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Mar 2026 02:09:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=X6CV+zRo;
 spf=pass (domain: mvista.com, ip: 74.125.82.181, mailfrom: vanusuri@mvista.com)
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2c160308a54so908164eec.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 27 Mar 2026 02:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1774602592; x=1775207392; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0JOKr7b1gI9nBnhB+zRY5zp2slD9qGzjQSp017rLGAk=;
        b=X6CV+zRoRmPIxiC07zu+FaNKzj3P1x4GBGe/MKFdqTHqTLDa+ZJ4CsvUdA8CXDrmjP
         /Zc5oN4IQiL9eH4EUi6CppKOZkuLc+vxtA7z0IwegmtDxV6i6mPAr3nypGNFAJHAEWc+
         xrFDaJH1kpOZEIL5OB41A4OWkpMPOJfxEpKc8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774602592; x=1775207392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0JOKr7b1gI9nBnhB+zRY5zp2slD9qGzjQSp017rLGAk=;
        b=RoJrv8NegljgvEUXVv5IYW/yNB5yTxVSNDqd4j+anu+pxR0qxU0YtuBCn/uoHEfL5E
         E9c06L/YaZoi7t8cAWjz6I86gfupNClrlxe64G5qo0jV9p7WupnTfnLjXi3Mlnn0YoGM
         qcSb5VlAKl/cFABIoNXYwlvv2yyLgWSyIrFNojfOpfhjEfFqmBQCld1c9bRrrESkvLHn
         z789pGBOFZ85Vcx6SRzdeBLAf++v1SaxxxUS3sF5Kg0U8UZYul4MXRfw1OOnPMXND+Yf
         5GequW/vZrCR61poCYJv6SCHHoMMEGv0XAYK6c+O+S7l/Qudco6h4f6XS4/ZmbYM0jK1
         x+Ng==
X-Gm-Message-State: AOJu0YwgFnXG3D2PsOwgIMqti5Ptfojo6N8gygT7UyLV0AUHi5iIF0kO
	q+Sh1g0JOQqu7MJycs6C75ffTRc8W0+yqIBhXEob4WBtycdbOsZ70R0d38HjPMbO5x4ctWcVSCM
	+5riG
X-Gm-Gg: ATEYQzz43fjq030k1jhmmii5dgczn6MnQGmbCqROtzd2QF2xyJdEpZSli7yN+DrmhVa
	t/YX6RRfxyLb/WdiUBuM9rhjCnnZ7mDklxuym3IJcbAtKK8aS/gsb2WjUgr0FflPpSVs9vUCZ01
	OPvWPnusqPDz6TAM5AVrecKm4cb3nVwpjgDIeofxtNpSg+oCOM6xMP1KtBeprg8cy+wEXgyn/Vp
	RCIDp7k6hTSXNA5yspt00TDqiTnz6AAJuJqHGsnekKbpgaX633h9fGdrWvAxzvkZGCLb+uV5tIq
	qrSXCsGyQsSpfI4yafO0xRdsdzfpp9ruRcr0wDUVWDOV9MwmNwK/oXADDcHh+zJbAe2XvHPJH+h
	OVQBK33c9e9bfOkojPyz72VWESs+3nuIwgxhUYe6CfZLvpzyOF/Dy/VqOY3HK9JGo7/Vz2ivmyF
	zE/xGD63NoRwCN7vou0m3R3AXPq78sOzaa1Jx0HX0jm9wx20M=
X-Received: by 2002:a05:7301:1006:b0:2be:a041:5d75 with SMTP id 5a478bee46e88-2c185e94a09mr817160eec.33.1774602591780;
        Fri, 27 Mar 2026 02:09:51 -0700 (PDT)
Received: from MVIN00352.mvista.com ([2406:7400:54:2bec:d873:3467:d1cb:22ab])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c16ec258c6sm4906284eec.4.2026.03.27.02.09.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 02:09:51 -0700 (PDT)
From: Vijay Anusuri <vanusuri@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [oe][meta-oe][scarthgap][patch 2/3] libssh: Fix CVE-2026-0966
Date: Fri, 27 Mar 2026 14:39:19 +0530
Message-ID: <20260327090921.114180-2-vanusuri@mvista.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260327090921.114180-1-vanusuri@mvista.com>
References: <20260327090921.114180-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Mar 2026 09:10:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125782

Pick commits according to [1]

[1] https://security-tracker.debian.org/tracker/CVE-2026-0966
[2] https://www.libssh.org/security/advisories/CVE-2026-0966.txt

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../libssh/libssh/CVE-2026-0966-1.patch       | 35 +++++++++
 .../libssh/libssh/CVE-2026-0966-2.patch       | 71 +++++++++++++++++++
 .../libssh/libssh/CVE-2026-0966-3.patch       | 65 +++++++++++++++++
 .../recipes-support/libssh/libssh_0.10.6.bb   |  3 +
 4 files changed, 174 insertions(+)
 create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2026-0966-1.patch
 create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2026-0966-2.patch
 create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2026-0966-3.patch

diff --git a/meta-oe/recipes-support/libssh/libssh/CVE-2026-0966-1.patch b/meta-oe/recipes-support/libssh/libssh/CVE-2026-0966-1.patch
new file mode 100644
index 0000000000..346e3e36ce
--- /dev/null
+++ b/meta-oe/recipes-support/libssh/libssh/CVE-2026-0966-1.patch
@@ -0,0 +1,35 @@
+From 6ba5ff1b7b1547a59f750fbc06b89737b7456117 Mon Sep 17 00:00:00 2001
+From: Jakub Jelen <jjelen@redhat.com>
+Date: Thu, 8 Jan 2026 12:09:50 +0100
+Subject: [PATCH] CVE-2026-0966 misc: Avoid heap buffer underflow in ssh_get_hexa
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Signed-off-by: Jakub Jelen <jjelen@redhat.com>
+Reviewed-by: Pavol Žáčik <pzacik@redhat.com>
+(cherry picked from commit 417a095e6749a1f3635e02332061edad3c6a3401)
+
+Upstream-Status: Backport [https://git.libssh.org/projects/libssh.git/commit/?id=6ba5ff1b7b1547a59f750fbc06b89737b7456117]
+CVE: CVE-2026-0966
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ src/misc.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/misc.c b/src/misc.c
+index f371f332..565abcfc 100644
+--- a/src/misc.c
++++ b/src/misc.c
+@@ -451,7 +451,7 @@ char *ssh_get_hexa(const unsigned char *what, size_t len)
+     size_t i;
+     size_t hlen = len * 3;
+ 
+-    if (len > (UINT_MAX - 1) / 3) {
++    if (what == NULL || len < 1 || len > (UINT_MAX - 1) / 3) {
+         return NULL;
+     }
+ 
+-- 
+2.43.0
+
diff --git a/meta-oe/recipes-support/libssh/libssh/CVE-2026-0966-2.patch b/meta-oe/recipes-support/libssh/libssh/CVE-2026-0966-2.patch
new file mode 100644
index 0000000000..efe90942d2
--- /dev/null
+++ b/meta-oe/recipes-support/libssh/libssh/CVE-2026-0966-2.patch
@@ -0,0 +1,71 @@
+From b156391833c66322436cf177d57e10b0325fbcc8 Mon Sep 17 00:00:00 2001
+From: Jakub Jelen <jjelen@redhat.com>
+Date: Thu, 8 Jan 2026 12:10:16 +0100
+Subject: [PATCH] CVE-2026-0966 tests: Test coverage for ssh_get_hexa
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Signed-off-by: Jakub Jelen <jjelen@redhat.com>
+Reviewed-by: Pavol Žáčik <pzacik@redhat.com>
+(cherry picked from commit 9be83584a56580da5a2f41e47137056dc0249b52)
+
+Upstream-Status: Backport [https://git.libssh.org/projects/libssh.git/commit/?id=b156391833c66322436cf177d57e10b0325fbcc8]
+CVE: CVE-2026-0966
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ tests/unittests/torture_misc.c | 31 +++++++++++++++++++++++++++++++
+ 1 file changed, 31 insertions(+)
+
+diff --git a/tests/unittests/torture_misc.c b/tests/unittests/torture_misc.c
+index 77166759..82d6cf16 100644
+--- a/tests/unittests/torture_misc.c
++++ b/tests/unittests/torture_misc.c
+@@ -877,6 +877,36 @@ static void torture_ssh_is_ipaddr(void **state) {
+     assert_int_equal(rc, 0);
+ }
+ 
++static void torture_ssh_get_hexa(void **state)
++{
++    const unsigned char *bin = NULL;
++    char *hex = NULL;
++
++    (void)state;
++
++    /* Null pointer should not crash */
++    bin = NULL;
++    hex = ssh_get_hexa(bin, 0);
++    assert_null(hex);
++
++    /* Null pointer should not crash regardless the length */
++    bin = NULL;
++    hex = ssh_get_hexa(bin, 99);
++    assert_null(hex);
++
++    /* Zero length input is not much useful. Just expect NULL too */
++    bin = (const unsigned char *)"";
++    hex = ssh_get_hexa(bin, 0);
++    assert_null(hex);
++
++    /* Valid inputs */
++    bin = (const unsigned char *)"\x00\xFF";
++    hex = ssh_get_hexa(bin, 2);
++    assert_non_null(hex);
++    assert_string_equal(hex, "00:ff");
++    ssh_string_free_char(hex);
++}
++
+ int torture_run_tests(void) {
+     int rc;
+     struct CMUnitTest tests[] = {
+@@ -903,6 +933,7 @@ int torture_run_tests(void) {
+         cmocka_unit_test(torture_ssh_strerror),
+         cmocka_unit_test(torture_ssh_check_hostname_syntax),
+         cmocka_unit_test(torture_ssh_is_ipaddr),
++	cmocka_unit_test(torture_ssh_get_hexa),
+     };
+ 
+     ssh_init();
+-- 
+2.43.0
+
diff --git a/meta-oe/recipes-support/libssh/libssh/CVE-2026-0966-3.patch b/meta-oe/recipes-support/libssh/libssh/CVE-2026-0966-3.patch
new file mode 100644
index 0000000000..853ab15c5a
--- /dev/null
+++ b/meta-oe/recipes-support/libssh/libssh/CVE-2026-0966-3.patch
@@ -0,0 +1,65 @@
+From 3e1d276a5a030938a8f144f46ff4f2a2efe31ced Mon Sep 17 00:00:00 2001
+From: Jakub Jelen <jjelen@redhat.com>
+Date: Thu, 8 Jan 2026 12:10:44 +0100
+Subject: [PATCH] CVE-2026-0966 doc: Update guided tour to use SHA256 fingerprints
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Signed-off-by: Jakub Jelen <jjelen@redhat.com>
+Reviewed-by: Pavol Žáčik <pzacik@redhat.com>
+(cherry picked from commit 1b2a4f760bec35121c490f2294f915ebb9c992ae)
+
+Upstream-Status: Backport [https://git.libssh.org/projects/libssh.git/commit/?id=3e1d276a5a030938a8f144f46ff4f2a2efe31ced]
+CVE: CVE-2026-0966
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ doc/guided_tour.dox | 10 ++++------
+ 1 file changed, 4 insertions(+), 6 deletions(-)
+
+diff --git a/doc/guided_tour.dox b/doc/guided_tour.dox
+index 60f4087e..331c4b0a 100644
+--- a/doc/guided_tour.dox
++++ b/doc/guided_tour.dox
+@@ -190,7 +190,6 @@ int verify_knownhost(ssh_session session)
+     ssh_key srv_pubkey = NULL;
+     size_t hlen;
+     char buf[10];
+-    char *hexa = NULL;
+     char *p = NULL;
+     int cmp;
+     int rc;
+@@ -201,7 +200,7 @@ int verify_knownhost(ssh_session session)
+     }
+ 
+     rc = ssh_get_publickey_hash(srv_pubkey,
+-                                SSH_PUBLICKEY_HASH_SHA1,
++                                SSH_PUBLICKEY_HASH_SHA256,
+                                 &hash,
+                                 &hlen);
+     ssh_key_free(srv_pubkey);
+@@ -217,7 +216,7 @@ int verify_knownhost(ssh_session session)
+             break;
+         case SSH_KNOWN_HOSTS_CHANGED:
+             fprintf(stderr, "Host key for server changed: it is now:\n");
+-            ssh_print_hexa("Public key hash", hash, hlen);
++            ssh_print_hash(SSH_PUBLICKEY_HASH_SHA256, hash, hlen);
+             fprintf(stderr, "For security reasons, connection will be stopped\n");
+             ssh_clean_pubkey_hash(&hash);
+ 
+@@ -238,10 +237,9 @@ int verify_knownhost(ssh_session session)
+             /* FALL THROUGH to SSH_SERVER_NOT_KNOWN behavior */
+ 
+         case SSH_KNOWN_HOSTS_UNKNOWN:
+-            hexa = ssh_get_hexa(hash, hlen);
+             fprintf(stderr,"The server is unknown. Do you trust the host key?\n");
+-            fprintf(stderr, "Public key hash: %s\n", hexa);
+-            ssh_string_free_char(hexa);
++            fprintf(stderr, "Public key hash: ");
++            ssh_print_hash(SSH_PUBLICKEY_HASH_SHA256, hash, hlen);
+             ssh_clean_pubkey_hash(&hash);
+             p = fgets(buf, sizeof(buf), stdin);
+             if (p == NULL) {
+-- 
+2.43.0
+
diff --git a/meta-oe/recipes-support/libssh/libssh_0.10.6.bb b/meta-oe/recipes-support/libssh/libssh_0.10.6.bb
index d37fccf26c..30f68f87ce 100644
--- a/meta-oe/recipes-support/libssh/libssh_0.10.6.bb
+++ b/meta-oe/recipes-support/libssh/libssh_0.10.6.bb
@@ -25,6 +25,9 @@ SRC_URI = "git://git.libssh.org/projects/libssh.git;protocol=https;branch=stable
            file://CVE-2026-3731-1.patch \
            file://CVE-2026-3731-2.patch \
            file://CVE-2026-0964.patch \
+           file://CVE-2026-0966-1.patch \
+           file://CVE-2026-0966-2.patch \
+           file://CVE-2026-0966-3.patch \
           "
 SRCREV = "10e09e273f69e149389b3e0e5d44b8c221c2e7f6"
 
-- 
2.43.0


