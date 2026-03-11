Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0EE0FD064E
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 07:38:18 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15265.1773214689044024530
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Mar 2026 00:38:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=imJ3gvbp;
 spf=pass (domain: mvista.com, ip: 209.85.210.178, mailfrom: vanusuri@mvista.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-82976220e97so3898288b3a.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 11 Mar 2026 00:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1773214688; x=1773819488; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=du1KuU//5dCO5dcW5BX/ji/n6nc7mtSOpD+mELBXczo=;
        b=imJ3gvbpky/SMZZh0MfLQFYDmdFGdaw7IWZHKLZsew+c+GvnF/u1D/kQaaXUI5hFJ+
         JL8W3amlx0GteqL4fHe4j/3VEDF1OmxCdXFJUq+g5QW7jmdZ3cMneD9Fjkl3Z4fKU1eq
         +Z9J0MhQ+GtXS8n5LHMNMyyhmAv3xFC3KA3TI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773214688; x=1773819488;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=du1KuU//5dCO5dcW5BX/ji/n6nc7mtSOpD+mELBXczo=;
        b=Alvs57wK3kNtAi4aQlRx+PBJWlgXTsC3+iqy8eAoK/lPva7cysB1tNu3NNhOkYGyLi
         7PeSSMVZBmYAipNQnjLotNstmoalySf7cUFeVagJuie/zD2mQp/Q41ehmD8D5/MXM56x
         Po7jCS6NC9JfL1dCGQpRfz9nf19g2rz3pD3cOSf83AkU5xvGLVnpLSYMdu3CHbsmlLDD
         XF2jPEoju5/DM1MIIE2XLLrmBhZcp9gT2D4UDToeCY7PMPQKn32Qmsu69xXgiWkAbK1i
         dDfjAlr9+XoB2e4OfN7tpadn0REPwRKkt8gc3wGo7vHHGcDeB8ZLGoD/nmGZdAbJm8/m
         s8PA==
X-Gm-Message-State: AOJu0Yy9kdTnhi+QzQxY+6kg365Wu4Zu47izOVh50xG8Vtfy4GqiOyjL
	SmZsp8rXscMcYYeIq1SgKkCfFQNpnX2F6xyHKDMT5/sDNi1nr8ffYVaAjMW7Vm3tyaygLbypwiU
	6AWVx
X-Gm-Gg: ATEYQzxniEAwwxoHfd4XuiRCkO0OVlnJV0XmYKC++m7z0plUN0bkyJx7NJdQxrKMr3H
	CSpXYiT20WJkN6ohPahVBn72bpMnT8rj3G8h1cA23FsMC5yO0qPGVE6hQQdl+BFfA3hmEa1as6q
	WhtXnj/szqoF580xfRU5bLKlJjRnwmiqWJrbCSAAxMN+BfwECekTm5c9ASREBUOcTGaOjK66n/N
	opGBtIuy7F/7v27a5GRKyyuNbNiINgK6bMC45Ul/2uPzvPq+cF0bOZD0B/XR0sPLgG+3FiHOu8R
	Arp2UD+LDu94Qx0XbeyyE6Tk/4nX9Mk7MU2WgTHPQxOpNXjYWc+yPEYgJSD5CcgpWKP0SsBzgNX
	JFDgatMFM0Dd48pCyPaSQM2KFWof50hUcy44Uem5nnsXGLcwu49WrO3Ec4lrxnPEP70hSZOc9bJ
	ouvXnES5xEp2LbMji0lsyGl9hVZa0UMLcSHxCy
X-Received: by 2002:a05:6a00:ac0f:b0:823:1d10:cf04 with SMTP id d2e1a72fcca58-829f718ac1emr1728912b3a.55.1773214687907;
        Wed, 11 Mar 2026 00:38:07 -0700 (PDT)
Received: from MVIN00352.mvista.com ([2406:7400:54:1b6c:ff43:847e:b957:7946])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829f6dc2b34sm1810193b3a.3.2026.03.11.00.38.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 00:38:07 -0700 (PDT)
From: Vijay Anusuri <vanusuri@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [oe][meta-oe][scarthgap][patch] libssh: Fix CVE-2026-3731
Date: Wed, 11 Mar 2026 13:07:51 +0530
Message-ID: <20260311073755.56215-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 11 Mar 2026 07:38:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125064

Pick commits according to [1]

[1] https://security-tracker.debian.org/tracker/CVE-2026-3731
[2] https://www.libssh.org/security/advisories/libssh-2026-sftp-extensions.txt

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../libssh/libssh/CVE-2026-3731-1.patch       |  44 ++++++++
 .../libssh/libssh/CVE-2026-3731-2.patch       | 102 ++++++++++++++++++
 .../recipes-support/libssh/libssh_0.10.6.bb   |   2 +
 3 files changed, 148 insertions(+)
 create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2026-3731-1.patch
 create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2026-3731-2.patch

diff --git a/meta-oe/recipes-support/libssh/libssh/CVE-2026-3731-1.patch b/meta-oe/recipes-support/libssh/libssh/CVE-2026-3731-1.patch
new file mode 100644
index 0000000000..69a012d294
--- /dev/null
+++ b/meta-oe/recipes-support/libssh/libssh/CVE-2026-3731-1.patch
@@ -0,0 +1,44 @@
+From f80670a7aba86cbb442c9b115c9eaf4ca04601b8 Mon Sep 17 00:00:00 2001
+From: Jakub Jelen <jjelen@redhat.com>
+Date: Thu, 11 Dec 2025 13:22:44 +0100
+Subject: [PATCH] sftp: Fix out-of-bound read from sftp extensions
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Signed-off-by: Jakub Jelen <jjelen@redhat.com>
+Reviewed-by: Pavol Žáčik <pzacik@redhat.com>
+(cherry picked from commit 855a0853ad3abd4a6cd85ce06fce6d8d4c7a0b60)
+
+Upstream-Status: Backport [https://git.libssh.org/projects/libssh.git/commit/?id=f80670a7aba86cbb442c9b115c9eaf4ca04601b8]
+CVE: CVE-2026-3731
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ src/sftp.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/sftp.c b/src/sftp.c
+index e01012a8..4a77141b 100644
+--- a/src/sftp.c
++++ b/src/sftp.c
+@@ -768,7 +768,7 @@ const char *sftp_extensions_get_name(sftp_session sftp, unsigned int idx) {
+     return NULL;
+   }
+ 
+-  if (idx > sftp->ext->count) {
++  if (idx >= sftp->ext->count) {
+     ssh_set_error_invalid(sftp->session);
+     return NULL;
+   }
+@@ -784,7 +784,7 @@ const char *sftp_extensions_get_data(sftp_session sftp, unsigned int idx) {
+     return NULL;
+   }
+ 
+-  if (idx > sftp->ext->count) {
++  if (idx >= sftp->ext->count) {
+     ssh_set_error_invalid(sftp->session);
+     return NULL;
+   }
+-- 
+2.43.0
+
diff --git a/meta-oe/recipes-support/libssh/libssh/CVE-2026-3731-2.patch b/meta-oe/recipes-support/libssh/libssh/CVE-2026-3731-2.patch
new file mode 100644
index 0000000000..ae0ffefa03
--- /dev/null
+++ b/meta-oe/recipes-support/libssh/libssh/CVE-2026-3731-2.patch
@@ -0,0 +1,102 @@
+From 02c6f5f7ec8629a7cff6a28cde9701ab10304540 Mon Sep 17 00:00:00 2001
+From: Jakub Jelen <jjelen@redhat.com>
+Date: Thu, 11 Dec 2025 13:21:23 +0100
+Subject: Reproducer for out of bounds read of SFTP extensions
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Signed-off-by: Jakub Jelen <jjelen@redhat.com>
+Reviewed-by: Pavol Žáčik <pzacik@redhat.com>
+(cherry picked from commit b90b7f24517efa7ab21506db9379aa3dce9fee7d)
+
+Upstream-Status: Backport [https://git.libssh.org/projects/libssh.git/commit/?id=02c6f5f7ec8629a7cff6a28cde9701ab10304540]
+CVE: CVE-2026-3731
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ tests/client/torture_sftp_init.c | 62 +++++++++++++++++++++++++++++++++++++++-
+ 1 file changed, 61 insertions(+), 1 deletion(-)
+
+diff --git a/tests/client/torture_sftp_init.c b/tests/client/torture_sftp_init.c
+index a17f01fe2..cdc244263 100644
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
+cgit v1.2.3
+
diff --git a/meta-oe/recipes-support/libssh/libssh_0.10.6.bb b/meta-oe/recipes-support/libssh/libssh_0.10.6.bb
index de37719b09..614b656216 100644
--- a/meta-oe/recipes-support/libssh/libssh_0.10.6.bb
+++ b/meta-oe/recipes-support/libssh/libssh_0.10.6.bb
@@ -22,6 +22,8 @@ SRC_URI = "git://git.libssh.org/projects/libssh.git;protocol=https;branch=stable
            file://CVE-2025-8277-2.patch \
            file://CVE-2025-8277-3.patch \
            file://CVE-2025-8277-4.patch \
+           file://CVE-2026-3731-1.patch \
+           file://CVE-2026-3731-2.patch \
           "
 SRCREV = "10e09e273f69e149389b3e0e5d44b8c221c2e7f6"
 
-- 
2.43.0


