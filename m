Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15AACC5DF89
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 11:11:07 +0000 (UTC)
Received: from alln-iport-6.cisco.com (alln-iport-6.cisco.com [173.37.142.93])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4703.1787137859782424526
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Aug 2026 04:11:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=jwFwQS/v;
 spf=pass (domain: cisco.com, ip: 173.37.142.93, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=5097; q=dns/txt;
  s=iport01; t=1787137861; x=1788347461;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RyPPcARkdfDJZgfxAhvfUl8h3r9xGa61C7RhmshIdZo=;
  b=jwFwQS/vIR46+dPEVHLdsAGoYQpNtvfpAfBZ/T/wyKSkIfrB5lNN+ujh
   eyn1BP0ztpRqdS+CLmzL3jSH0958U6zlBGKnJVb3BiY5V9dUFAhFThVrJ
   +RW9hTxvfqZFQ33t9WHA8v4x6zH+WfaR9APnubcpRD6fWcDDmddXgtJyv
   bF7IBB4GcrOvnXtPTqd5j34jI9TKg+IUDcfX5GLfh4uc4ybPp/sg+0ehu
   OE6I0UzYUIIFFgNBJFwwtLIa8c/rzS/hxPOWNFoQwUj/hCt31TIt7Z1w3
   V0o6fhekOn2LEGlwoA9ZoHfuITS69qYNh8Zxe8iPFw5cfmehyYzf92xxL
   w==;
X-CSE-ConnectionGUID: 4g5kFlHmQtS4M4c/U+1lbQ==
X-CSE-MsgGUID: PYWdPkt3SAa0h4jz8Frg1Q==
X-IPAS-Result: =?us-ascii?q?A0BMAgDEjoVq/4wQJK1aglmCV3ReQ0kDhFSRcwOeG4F+D?=
 =?us-ascii?q?wEBAQ9EDQQBAYUFAo1rAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQsBAQUBAQECA?=
 =?us-ascii?q?QcFgQ4Thk8NhloBAgEDIwQLARgBHg8QCRMDAQIDAiYCAisjCBAJgwIBgnQDE?=
 =?us-ascii?q?QaoUJsjen8zgQGDKAE/AkNQ2zABCxQBBYEFLoU/gx8BhQJdGAGEfCcbG4Fyg?=
 =?us-ascii?q?RWDaYEFgVwEGIUhgmoEgiJ6EoFaHoEPkDhIgQIcA1ksAVUTDQoLBwWBZgM1E?=
 =?us-ascii?q?ioVbjIdgSM+FzVYGwYFgR2BKIQ3Ixk2eoEJXoErKmEBEheBCYIKAoJzggYCA?=
 =?us-ascii?q?UlFEQoLCxgNSBEsNxQZBD0BbgeOSSCCJxkHAYENARMYF4F9GA4DCwGlWZ9Rg?=
 =?us-ascii?q?T4KKIN2jCGVOhozqmwLmH2OCpYGSoRpgWg8gVlwFTuCZwlKGQ+OLQsLg2CFE?=
 =?us-ascii?q?8cmJzICCQMvAQEHAgcBAQsBAwuBaJACLYFPAQE?=
IronPort-Data: A9a23:7SMW86CIGkII6hVW/3/iw5YqxClBgxIJ4kV8jS/XYbTApG5w1jNVy
 zQbXziOaKnbNjeheYhyPYy3oElSvMLXy9Q3OVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGdIZvCCeA+n9BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357jXmthh
 fuo+5eBYA/8imYtWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TEn/ozD28yHYgh5t0rJD1Fs
 sFbcTQHV0XW7w626OrTpuhEj8AnKozveYgYoHwllWqfBvc9SpeFSKLPjTNa9G5v3YYVQ7CHO
 YxANWIHgBfoO3WjPn8XFJI3n+6yrnL+aDZf7lmSoMLb5kCDlVUvgeCzaYW9ltqiffRqkn6bu
 jn91m2hAk0YJoyx0zXcyyf57gPItWahMG4IL5W/7vNsjViZy2AfBRFTWValrP2Rjk+lR8kZL
 FQZ/Ccrp6U++EGnCN7nUHWFTGWstxoYXZ9UVuY98gzIkvGS6AeCDW9CRTlEADA7iPILqfUR/
 gfht7vU6fZH69V5lVr1Gm+okA6P
IronPort-HdrOrdr: A9a23:nHxljq2RSY4U2+kict1NOAqjBGwkLtp133Aq2lEZdPWaSKOlfq
 eV7ZImPH7P+VEssR4b+OxoVJPsfZqYz+8W3WBzB8bHYOCZgguVxehZhOOIqQEIWReOk9K1vp
 0PT0ERMrHN5HFB/L/HCXGDYrUd6ejC1ry0juHDyHooZwRrZ6Z8qzpdMG+gYzVLrM0sP+tCKH
 JajfA33AadRQ==
X-Talos-CUID: =?us-ascii?q?9a23=3A3cnmlWvh+KXAqUtOUROnXYsb6It5fSDe4nPwJna?=
 =?us-ascii?q?kMjpMFLbSdBzJ/Kldxp8=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3ArMRZQQzAi9rha3nwasCI+nNE2qGaqJyfN0w1kol?=
 =?us-ascii?q?dgOCNbSwsOSXNoi64G7Zyfw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,231,1779148800"; 
   d="scan'208";a="811690617"
Received: from alln-l-core-03.cisco.com ([173.36.16.140])
  by alln-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 19 Aug 2026 11:10:58 +0000
Received: from sjc-ads-5471.cisco.com (sjc-ads-5471.cisco.com [10.28.23.235])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-03.cisco.com (Postfix) with ESMTPS id 9A5A9180001CF;
	Wed, 19 Aug 2026 11:10:58 +0000 (GMT)
Received: by sjc-ads-5471.cisco.com (Postfix, from userid 1887505)
	id 3E03DCC12A6; Wed, 19 Aug 2026 04:10:58 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Hetvi Thakar <hthakar@cisco.com>
Subject: [meta-oe][scarthgap][PATCH 3/5] libssh: Fix CVE-2026-59846
Date: Wed, 19 Aug 2026 04:10:45 -0700
Message-Id: <20260819111047.44043-4-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260819111047.44043-1-hthakar@cisco.com>
References: <20260819111047.44043-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-5471.cisco.com [10.28.23.235];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.28.23.235, sjc-ads-5471.cisco.com
X-Outbound-Node: alln-l-core-03.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 11:11:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129350

From: Hetvi Thakar <hthakar@cisco.com>

libssh 0.10.6 predates the username-validation helper used by the
stable-0.11 fix, so the upstream commit in [1] cannot be applied as-is.
Adapt the same dangerous-character check directly at the ProxyCommand %r
expansion sink and add focused regression coverage.

The upstream advisory [2] identifies libssh 0.11.5 and 0.12.1 as the
fixed releases.

[1] https://gitlab.com/libssh/libssh-mirror/-/commit/56ce3c193eb06af5bf3b07ec0b4c7308b5c72130
[2] https://www.libssh.org/security/advisories/CVE-2026-59846.txt

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../libssh/libssh/CVE-2026-59846.patch        | 87 +++++++++++++++++++
 .../recipes-support/libssh/libssh_0.10.6.bb   |  5 ++
 2 files changed, 92 insertions(+)
 create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2026-59846.patch

diff --git a/meta-oe/recipes-support/libssh/libssh/CVE-2026-59846.patch b/meta-oe/recipes-support/libssh/libssh/CVE-2026-59846.patch
new file mode 100644
index 0000000000..9c626d113d
--- /dev/null
+++ b/meta-oe/recipes-support/libssh/libssh/CVE-2026-59846.patch
@@ -0,0 +1,87 @@
+From 19fe4c9fc7b3bd3553250bf9ddea03ed1dcf044f Mon Sep 17 00:00:00 2001
+From: Jakub Jelen <jjelen@redhat.com>
+Date: Thu, 2 Apr 2026 15:39:25 +0200
+Subject: [PATCH] CVE-2026-59846 Block shell metacharacters from usernames
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+When an attacker could sneak the dollar sign or backslash into the username
+expanded for example in proxy command, it can result in printing environment
+variables that might contain secrets.
+
+This is a fixup of CVE-2023-6004 which fixed this for hostnames, but these
+two metacharacters were left out from the username filter.
+
+This keeps the list in one place to simplify maintenance.
+
+Signed-off-by: Jakub Jelen <jjelen@redhat.com>
+Reviewed-by: Pavol Žáčik <pzacik@redhat.com>
+(cherry picked from commit 6309df220e3431deb41946f892f4bb5af8b59dba)
+
+CVE: CVE-2026-59846
+Upstream-Status: Backport [https://git.libssh.org/projects/libssh.git/commit/?id=56ce3c193eb06af5bf3b07ec0b4c7308b5c72130]
+
+Backport Changes:
+- libssh 0.10.6 predates ssh_check_username_syntax() and the centralized
+  SSH_DANGEROUS_SHELL_CHARS definition, so enforce the same character list
+  directly at the %r expansion sink in ssh_path_expand_escape().
+- Add focused regression coverage to the existing path-expansion unit test
+  for dollar-sign, backslash, and command-separator usernames.
+
+(cherry picked from commit 56ce3c193eb06af5bf3b07ec0b4c7308b5c72130)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ src/misc.c                     |  9 +++++++++
+ tests/unittests/torture_misc.c | 18 ++++++++++++++++++
+ 2 files changed, 27 insertions(+)
+
+diff --git a/src/misc.c b/src/misc.c
+index e78c92ba..15b427d7 100644
+--- a/src/misc.c
++++ b/src/misc.c
+@@ -1262,6 +1262,15 @@ char *ssh_path_expand_escape(ssh_session session, const char *s)
+                 break;
+             case 'r':
+                 if (session->opts.username) {
++                    if (strpbrk(session->opts.username,
++                                "'`\";&<>|(){}$\\,") != NULL) {
++                        ssh_set_error(session,
++                                      SSH_FATAL,
++                                      "Invalid shell metacharacter in username");
++                        free(buf);
++                        free(r);
++                        return NULL;
++                    }
+                     x = strdup(session->opts.username);
+                 } else {
+                     ssh_set_error(session, SSH_FATAL,
+diff --git a/tests/unittests/torture_misc.c b/tests/unittests/torture_misc.c
+index 82d6cf16..66d392ed 100644
+--- a/tests/unittests/torture_misc.c
++++ b/tests/unittests/torture_misc.c
+@@ -194,6 +194,24 @@ static void torture_path_expand_escape(void **state) {
+     assert_non_null(e);
+     assert_string_equal(e, "guru/meditation/222/by/root");
+     ssh_string_free_char(e);
++
++    free(session->opts.username);
++    session->opts.username = strdup("root$HOME");
++    assert_non_null(session->opts.username);
++    e = ssh_path_expand_escape(session, s);
++    assert_null(e);
++
++    free(session->opts.username);
++    session->opts.username = strdup("root\\user");
++    assert_non_null(session->opts.username);
++    e = ssh_path_expand_escape(session, s);
++    assert_null(e);
++
++    free(session->opts.username);
++    session->opts.username = strdup("root;id");
++    assert_non_null(session->opts.username);
++    e = ssh_path_expand_escape(session, s);
++    assert_null(e);
+ }
+ 
+ static void torture_path_expand_known_hosts(void **state) {
diff --git a/meta-oe/recipes-support/libssh/libssh_0.10.6.bb b/meta-oe/recipes-support/libssh/libssh_0.10.6.bb
index a9d7729f2c..8e86073fd3 100644
--- a/meta-oe/recipes-support/libssh/libssh_0.10.6.bb
+++ b/meta-oe/recipes-support/libssh/libssh_0.10.6.bb
@@ -34,6 +34,11 @@ SRC_URI = "git://git.libssh.org/projects/libssh.git;protocol=https;branch=stable
            file://CVE-2026-0965.patch \
            file://CVE-2026-59843.patch \
            file://CVE-2026-59844.patch \
+<<<<<<< HEAD
+=======
+           file://CVE-2026-59845.patch \
+           file://CVE-2026-59846.patch \
+>>>>>>> b782f294a0 (libssh: Fix CVE-2026-59846)
           "
 SRCREV = "10e09e273f69e149389b3e0e5d44b8c221c2e7f6"
 
-- 
2.35.6


