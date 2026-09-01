Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94E97C61DD6
	for <webhook@archiver.kernel.org>; Tue,  1 Sep 2026 08:54:26 +0000 (UTC)
Received: from alln-iport-8.cisco.com (alln-iport-8.cisco.com [173.37.142.95])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3309.1788252860626039236
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Sep 2026 01:54:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=eVdrIaih;
 spf=pass (domain: cisco.com, ip: 173.37.142.95, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=5055; q=dns/txt;
  s=iport01; t=1788252860; x=1789462460;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fg+WyYGiUpsDVOkRePQVcsL2NKfldO5kn8iYHtHWkJc=;
  b=eVdrIaihetjEpbuYKmyAw2Wdif0WziloGyFoHaJAiqo5tv8qRZcV1skO
   mjoCoK1NI7jIKEWzo/Ufu4zKhL3GxLpSTgTPX9OxzDhVQebZJ4XXWJKkZ
   2DyNEPSEbcJHS+5huVQ3vslMVvkd362AeExZH76wiZfsp1dL+LtvNBlPm
   P3pDGAQdRyJeERXTB+RnKzuPJ29kYxfgWVYL0pdxazjpKE/EIG5BGpCJC
   lhO1kTh1+aANwNsuw0P+JqUpbffSOmirOFnWm6ZE5nbhMDd1gbMogaLIX
   Es/bREu4dtGQmi1qkBg55gwfSCJbQcqNGZU5Y6PGGnnXXdZwtUlJQcmVj
   w==;
X-CSE-ConnectionGUID: jyGzd99YSneU+mK89l1K0A==
X-CSE-MsgGUID: veD0MIxjTVy8/2mXqwY89g==
X-IPAS-Result: =?us-ascii?q?A0BMAgBIkpZq/5UQJK1aglmCV3RfQkkDhFSRcwOeG4F+D?=
 =?us-ascii?q?wEBAQ9EDQQBAYUFAo13AiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQsBAQUBAQECA?=
 =?us-ascii?q?QcFgQ4Thk8NhloBAgEDIwQLARgBHg8QCRMDAQIDAiYCAisjCBAJgwIBgnQCA?=
 =?us-ascii?q?REGoEubI3p/M4EBgygBPwJDUNswAQsUAQWBBS6FP4MfAYUCXRgBhHwnGxuBc?=
 =?us-ascii?q?oEVg2mBBYFcBBiFIYJqBIIiehKBWh5wkHtIgQIcA1ksAVUTDQoLBwWBZgM1E?=
 =?us-ascii?q?ioVbjIdgSM+FzVYGwYFgR2BKINEIxk2eoEJXoErKWABEheBCYIIAoJXggMCA?=
 =?us-ascii?q?UlDDgdHUwkqAgkLGA1IESw3FRkEPQFuB45fH4IyGQcBPFEBExgXgX0YDgMLA?=
 =?us-ascii?q?aVZn1GBPgoog3aMIpU6GjOqbAuYfY4KlgZKhGmBaDyBWXAVO4JnCUoZD44tC?=
 =?us-ascii?q?wuDYIUTxyYkNQIJAy8BAQcCBwEBCwEDC4FokAItgU8BAQ?=
IronPort-Data: A9a23:xhIfnqqApUUM3FMy1wxGof2vmMBeBmJOZBIvgKrLsJaIsI4StFCzt
 garIBmPOPzYNzHyLd53Pti3/EsG6JbVzdRlT1M6+ShkHngRpePIVI+TRqvS04x+DSFioGZPt
 Zh2hgzodZhsJpPkjk7zdOCn9j8kif3gqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziLBVOSvV0
 T/Ji5OZYgLNNwJcaDpOtfrS8Eo35ZwehRtB1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86r5K255G7Q4yA2AdqjlLvhGmVSKlIFFVHT4pb+c/HKbilq/kTe4I5iXBYvQRs/ZwGyojxE4
 I4lWapc5useFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpfh660GMa04AWEX0uRmLnNCp
 K0pEzYAU1OGpLLnxOuYEsA506zPLOGzVG8eknhkyTecCbMtRorOBvyQo9RZxzw3wMtJGJ4yZ
 eJANmEpN0qGOkMJYwtGYH49tL/Aan3XcyFYoVGcv4I84nPYy0p6172F3N/9KobUGpwJzhrCz
 o7A13r0Lkk/Fcyd9QSUojX2g9/WghKrCY1HQdVU8dYv2jV/3Fc7DwUbU1a+q/S1hkOyHt5SN
 UEQ0i4vtrQpskuzQ9/wWhe1rHKJslgbQdU4LgEhwAiJzqyR50OSAXIJC2cbLtcnr8QxAzct0
 zdlgu/UONCmi5XNIVr1y1tehWna1fQ9RYPaWRI5cA==
IronPort-HdrOrdr: A9a23:MwEtS61aNZGZdYuKusxLiQqjBGwkLtp133Aq2lEZdPWaSKOlfq
 eV7ZImPH7P+VEssR4b+OxoVJPsfZqYz+8W3WBzB8bHYOCZgguVxehZhOOIqQEIWReOk9K1vp
 0PT0ERMrHN5HFB/L/HCXGDYrUd6ejC1ry0juHDyHooZwRrZ6Z8qzpdMG+gYzVLrM0sP+tCKH
 JajfA33AadRQ==
X-Talos-CUID: =?us-ascii?q?9a23=3A5OEwd2m6slnkSDAhZO5XJ7l/a5nXOX/M42Xcch6?=
 =?us-ascii?q?JMmBkdf6Qag/B/PpHy+M7zg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AqcsY+w1oCM3d0kIl7G7MNZEDIjUj/amCUGUsgZc?=
 =?us-ascii?q?6hdjUcnZ1Cy6CvWTmTdpy?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,255,1779148800"; 
   d="scan'208";a="826714842"
Received: from alln-l-core-12.cisco.com ([173.36.16.149])
  by alln-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 01 Sep 2026 08:54:19 +0000
Received: from sjc-ads-4178.cisco.com (sjc-ads-4178.cisco.com [171.70.54.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-12.cisco.com (Postfix) with ESMTPS id 8920F18000164;
	Tue,  1 Sep 2026 08:54:19 +0000 (GMT)
Received: by sjc-ads-4178.cisco.com (Postfix, from userid 1887505)
	id 27F56CE1C04; Tue,  1 Sep 2026 01:54:19 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Hetvi Thakar <hthakar@cisco.com>
Subject: [OE-core][scarthgap][Patch v2 3/5] libssh: Fix CVE-2026-59846
Date: Tue,  1 Sep 2026 01:53:55 -0700
Message-Id: <20260901085357.1254306-4-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260901085357.1254306-1-hthakar@cisco.com>
References: <20260901085357.1254306-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-4178.cisco.com [171.70.54.199];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.54.199, sjc-ads-4178.cisco.com
X-Outbound-Node: alln-l-core-12.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Sep 2026 08:54:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129623

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
Changes in v2
- rebase the patch on the current scarthgap branch
---
 .../libssh/libssh/CVE-2026-59846.patch        | 87 +++++++++++++++++++
 .../recipes-support/libssh/libssh_0.10.6.bb   |  1 +
 2 files changed, 88 insertions(+)
 create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2026-59846.patch

diff --git a/meta-oe/recipes-support/libssh/libssh/CVE-2026-59846.patch b/meta-oe/recipes-support/libssh/libssh/CVE-2026-59846.patch
new file mode 100644
index 000000000..9c626d113
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
index 5c40b80b4..669e229ee 100644
--- a/meta-oe/recipes-support/libssh/libssh_0.10.6.bb
+++ b/meta-oe/recipes-support/libssh/libssh_0.10.6.bb
@@ -34,6 +34,7 @@ SRC_URI = "git://git.libssh.org/projects/libssh.git;protocol=https;branch=stable
            file://CVE-2026-0965.patch \
            file://CVE-2026-59843.patch \
            file://CVE-2026-59844.patch \
+           file://CVE-2026-59846.patch \
           "
 SRCREV = "10e09e273f69e149389b3e0e5d44b8c221c2e7f6"
 
-- 
2.35.6


