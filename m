Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 710D7104BED3
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 10:25:48 +0000 (UTC)
Received: from alln-iport-6.cisco.com (alln-iport-6.cisco.com [173.37.142.93])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17977.1773224743079250853
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Mar 2026 03:25:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=cubLC5rm;
 spf=pass (domain: cisco.com, ip: 173.37.142.93, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=6247; q=dns/txt;
  s=iport01; t=1773224743; x=1774434343;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=IYH9ERIMJslBe8tWp1URzWpws6nwMmU2/ZN7aF6kYow=;
  b=cubLC5rmRNMgCYgj23RJ5bT1fHRUbpZLOZogqDX82HaS6ftgaLXWbZ6n
   fVCEMsznZTeF/o4ElwpGLJDA6OC6XeKU5mIwlaF+J/XNX+7aQm/A9ZLct
   4WGp+sA9azA0uMzgCGqnJQw6K4EuyGumr+7IpokrmghnXayBrMpgEbBSo
   nonueKqnv46WoKKptHvrqb9eD8SDrbbNno7M8mvhDe43cwB4okvgkTlse
   dNybZIMCRurew9m/b9/buMX0Hul8zrpXQNzCPB/IZjU1vMggXWYul5SDR
   eK1UOFQ5qPgptnGF0B/n8rjqz5M/TOZowHylwSnD5qz0F6NERJxD12PBt
   Q==;
X-CSE-ConnectionGUID: B8RMfY1TSUep19sfkFb4+w==
X-CSE-MsgGUID: Bbo3CQUVSN2klNc4gRDL0Q==
X-IPAS-Result: =?us-ascii?q?A0CZBQBmQbFp/4v/Ja1agQmBUIJID3FfQkkDhFSPU4IhA?=
 =?us-ascii?q?54agX8PAQEBD0QNBAEBhQcCjSICJjQJDgECBAEBAQEDAgMBAQEBAQEBAQEBA?=
 =?us-ascii?q?QsBAQUBAQECAQcFgQ4Thk8NhloBAgEDIwQLARgBPQkTAwECAwImAgIrIwgQC?=
 =?us-ascii?q?YMCAYJzAgERklCbRHp/M4EBgygBMQUJAkNP2yYBCxQBgQouhTyDGAGFAFsYA?=
 =?us-ascii?q?YR6JxsbgXKBFYNogQWBXAQYgQ2EFIJpBIIigQ6BYR+FPgaETIcTSIECHANZL?=
 =?us-ascii?q?AFVEw0KCwcFgWYDNRIqFW4yHYEjPhczWBsHBYUeD4hwdG6BEYMpAwsYDUgRL?=
 =?us-ascii?q?DcUGwQ9AW4HjXU9gjSBDiyCFBgOA6NCgiGhDgoog3SMHpU6GjOEBJQVklKZB?=
 =?us-ascii?q?oJYizGWUIRogWg8gVlwFYMiCUkZD44tCwuIccQvIzUCCQMuAgcBCgEBAwmRa?=
 =?us-ascii?q?oF9AQE?=
IronPort-Data: A9a23:tPasBajMJEYfmoIKUvWdf0kDX161MBEKZh0ujC45NGQN5FlHY01je
 htvDGvSPqrfN2X1Ld91b4+//UNQu8CGm4RnTAA6/Hg1RSpjpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FH1dOOn9SUgvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZeEULOZ82QsaDxMsPva8EoHUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqUyqtxSD1AXy
 cclJShUPwuNhMy8nPGkH7wEasQLdKEHPasFsX1miDWcBvE8TNWbGePB5MRT23E7gcUm8fT2P
 pVCL2EwKk6dPlsWYQZ/5JEWxI9EglHzfjBCoU6VooI84nPYy0p6172F3N/9JIzUG5oJxhbBz
 o7A107zBUoxDeGh8hzf8XaKjbPApw/fALtHQdVU8dYv2jV/3Fc7DwUbU1a+q/S1hkOyHt5SN
 UEQ0i4vtrQpskuzQ9/wWhe1rHKJslgbQdU4LgEhwBuGxqyR50OSAXIJC2YbLtcnr8QxAzct0
 zdlgu/UONCmi5XNIVr1y1tehWra1fQ9RYPaWRI5cA==
IronPort-HdrOrdr: A9a23:2hZ5z6z1IcOToMKQM3ocKrPwK71zdoMgy1knxilNoHtuA6ulfq
 GV7ZAmPHDP5gr5NEtMpTnEAtjifZq+z+8R3WBuB9aftWDd0QPCRr2Kr7GSoQEIcBeQygcy78
 tdmtBFaOEZyTNB/L/HCM7SKadH/OW6
X-Talos-CUID: 9a23:cGb+EWNiOhvqL+5Dcnld0UAlQ/weT3DFlSbLLUyWAzoqV+jA
X-Talos-MUID: 9a23:6pAHWQUoTfbBZIPq/BXmg2pJDfpW2IL0C0QrmskJgeWgbRUlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.23,113,1770595200"; 
   d="scan'208";a="686674081"
Received: from rcdn-l-core-02.cisco.com ([173.37.255.139])
  by alln-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 11 Mar 2026 10:25:41 +0000
Received: from sjc-ads-3552.cisco.com (sjc-ads-3552.cisco.com [171.68.249.250])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-02.cisco.com (Postfix) with ESMTPS id C5F7918000360
	for <openembedded-devel@lists.openembedded.org>; Wed, 11 Mar 2026 10:25:41 +0000 (GMT)
Received: by sjc-ads-3552.cisco.com (Postfix, from userid 1795984)
	id 6B981CC12B5; Wed, 11 Mar 2026 03:25:41 -0700 (PDT)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-openembedded][whinlatter][PATCH v2] libssh: Fix CVE-2026-3731
Date: Wed, 11 Mar 2026 03:25:14 -0700
Message-Id: <20260311102514.2921809-1-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260310121621.196342-1-deerath@cisco.com>
References: <20260310121621.196342-1-deerath@cisco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 171.68.249.250, sjc-ads-3552.cisco.com
X-Outbound-Node: rcdn-l-core-02.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 11 Mar 2026 10:25:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125081

From: Deepak Rathore <deeratho@cisco.com>

Pick the patch [1] and [2] as mentioned in [3]

[1] https://git.libssh.org/projects/libssh.git/commit/?id=f80670a7aba86cbb442c9b115c9eaf4ca04601b8
[2] https://git.libssh.org/projects/libssh.git/commit/?id=02c6f5f7ec8629a7cff6a28cde9701ab10304540
[3] https://security-tracker.debian.org/tracker/CVE-2026-3731

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
Changes from v1 to v2:
- Update the commit message.
- Cherry pick it from libssh-0.11.4 release tag and add the second patch
  to add the reproducer for the CVE.

diff --git a/meta-oe/recipes-support/libssh/libssh/CVE-2026-3731_p1.patch b/meta-oe/recipes-support/libssh/libssh/CVE-2026-3731_p1.patch
new file mode 100644
index 0000000000..bf1fbcc027
--- /dev/null
+++ b/meta-oe/recipes-support/libssh/libssh/CVE-2026-3731_p1.patch
@@ -0,0 +1,35 @@
+From 04d2f831fa8da74c973538cd3f621061a7656771 Mon Sep 17 00:00:00 2001
+From: Jakub Jelen <jjelen@redhat.com>
+Date: Thu, 11 Dec 2025 13:22:44 +0100
+Subject: [PATCH 1/2] sftp: Fix out-of-bound read from sftp extensions
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+CVE: CVE-2026-3731
+Upstream-Status: Backport [https://git.libssh.org/projects/libssh.git/commit/?id=f80670a7aba86cbb442c9b115c9eaf4ca04601b8]
+
+Signed-off-by: Jakub Jelen <jjelen@redhat.com>
+Reviewed-by: Pavol Žáčik <pzacik@redhat.com>
+(cherry picked from commit 855a0853ad3abd4a6cd85ce06fce6d8d4c7a0b60)
+(cherry picked from commit f80670a7aba86cbb442c9b115c9eaf4ca04601b8)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ src/sftp.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/sftp.c b/src/sftp.c
+index 37b4133b..05e05019 100644
+--- a/src/sftp.c
++++ b/src/sftp.c
+@@ -583,7 +583,7 @@ const char *sftp_extensions_get_name(sftp_session sftp, unsigned int idx) {
+     return NULL;
+   }
+
+-  if (idx > sftp->ext->count) {
++  if (idx >= sftp->ext->count) {
+     ssh_set_error_invalid(sftp->session);
+     return NULL;
+   }
+--
+2.35.6
diff --git a/meta-oe/recipes-support/libssh/libssh/CVE-2026-3731_p2.patch b/meta-oe/recipes-support/libssh/libssh/CVE-2026-3731_p2.patch
new file mode 100644
index 0000000000..b5a267b808
--- /dev/null
+++ b/meta-oe/recipes-support/libssh/libssh/CVE-2026-3731_p2.patch
@@ -0,0 +1,102 @@
+From df01168bb3863306ba0f35b50e5b2e5dd00ba9f6 Mon Sep 17 00:00:00 2001
+From: Jakub Jelen <jjelen@redhat.com>
+Date: Thu, 11 Dec 2025 13:21:23 +0100
+Subject: [PATCH 2/2] Reproducer for out of bounds read of SFTP extensions
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+CVE: CVE-2026-3731
+Upstream-Status: Backport [https://git.libssh.org/projects/libssh.git/commit/?id=02c6f5f7ec8629a7cff6a28cde9701ab10304540]
+
+Signed-off-by: Jakub Jelen <jjelen@redhat.com>
+Reviewed-by: Pavol Žáčik <pzacik@redhat.com>
+(cherry picked from commit b90b7f24517efa7ab21506db9379aa3dce9fee7d)
+(cherry picked from commit 02c6f5f7ec8629a7cff6a28cde9701ab10304540)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ tests/client/torture_sftp_init.c | 62 +++++++++++++++++++++++++++++++-
+ 1 file changed, 61 insertions(+), 1 deletion(-)
+
+diff --git a/tests/client/torture_sftp_init.c b/tests/client/torture_sftp_init.c
+index a17f01fe..cdc24426 100644
+--- a/tests/client/torture_sftp_init.c
++++ b/tests/client/torture_sftp_init.c
+@@ -72,6 +72,63 @@ static void session_setup_channel(void **state)
+     assert_non_null(s->ssh.tsftp);
+ }
+
++static void session_setup_extensions(void **state)
++{
++    struct torture_state *s = *state;
++    struct passwd *pwd = NULL;
++    int rc, count;
++    const char *name = NULL, *data = NULL;
++    sftp_session sftp = NULL;
++
++    pwd = getpwnam("bob");
++    assert_non_null(pwd);
++
++    rc = setuid(pwd->pw_uid);
++    assert_return_code(rc, errno);
++
++    s->ssh.session = torture_ssh_session(s,
++                                         TORTURE_SSH_SERVER,
++                                         NULL,
++                                         TORTURE_SSH_USER_ALICE,
++                                         NULL);
++    assert_non_null(s->ssh.session);
++
++    s->ssh.tsftp = torture_sftp_session(s->ssh.session);
++    assert_non_null(s->ssh.tsftp);
++    sftp = s->ssh.tsftp->sftp;
++
++    /* null parameter */
++    count = sftp_extensions_get_count(NULL);
++    assert_int_equal(count, 0);
++
++    count = sftp_extensions_get_count(sftp);
++    assert_int_not_equal(count, 0);
++
++    /* first null parameter */
++    name = sftp_extensions_get_name(NULL, 0);
++    assert_null(name);
++    data = sftp_extensions_get_data(NULL, 0);
++    assert_null(data);
++
++    /* First extension */
++    name = sftp_extensions_get_name(sftp, 0);
++    assert_non_null(name);
++    data = sftp_extensions_get_data(sftp, 0);
++    assert_non_null(data);
++
++    /* Last extension */
++    name = sftp_extensions_get_name(sftp, count - 1);
++    assert_non_null(name);
++    data = sftp_extensions_get_data(sftp, count - 1);
++    assert_non_null(data);
++
++    /* Overrun */
++    name = sftp_extensions_get_name(sftp, count);
++    assert_null(name);
++    data = sftp_extensions_get_data(sftp, count);
++    assert_null(data);
++}
++
+ static int session_teardown(void **state)
+ {
+     struct torture_state *s = *state;
+@@ -92,7 +149,10 @@ int torture_run_tests(void) {
+                                         session_teardown),
+         cmocka_unit_test_setup_teardown(session_setup_channel,
+                                         NULL,
+-                                        session_teardown)
++                                        session_teardown),
++        cmocka_unit_test_setup_teardown(session_setup_extensions,
++                                        NULL,
++                                        session_teardown),
+     };
+
+     ssh_init();
+--
+2.35.6
diff --git a/meta-oe/recipes-support/libssh/libssh_0.11.3.bb b/meta-oe/recipes-support/libssh/libssh_0.11.3.bb
index 5928581312..ab47931fa3 100644
--- a/meta-oe/recipes-support/libssh/libssh_0.11.3.bb
+++ b/meta-oe/recipes-support/libssh/libssh_0.11.3.bb
@@ -9,6 +9,8 @@ DEPENDS = "zlib openssl"
 SRC_URI = "git://git.libssh.org/projects/libssh.git;protocol=https;branch=stable-0.11;tag=${BPN}-${PV} \
            file://0001-tests-CMakeLists.txt-do-not-search-ssh-sshd-commands.patch \
            file://run-ptest \
+           file://CVE-2026-3731_p1.patch \
+           file://CVE-2026-3731_p2.patch \
           "
 
 SRC_URI:append:toolchain-clang = " file://0001-CompilerChecks.cmake-drop-Wunused-variable-flag.patch"
-- 
2.35.6


