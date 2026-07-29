Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CCA9C54F51
	for <webhook@archiver.kernel.org>; Wed, 29 Jul 2026 09:26:00 +0000 (UTC)
Received: from alln-iport-6.cisco.com (alln-iport-6.cisco.com [173.37.142.93])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7528.1785317159160305076
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Jul 2026 02:25:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Ic4HdLOp;
 spf=pass (domain: cisco.com, ip: 173.37.142.93, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2934; q=dns/txt;
  s=iport01; t=1785317159; x=1786526759;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0FL+yU4HxEnbUvvj4ppwxKridKemacSePktTNLfgt/E=;
  b=Ic4HdLOp9v/8vDrexxFr73P6NHKjBFdMg+4gqf8sPJSJQaRGdteLvfpY
   sxCGFAD8c9FavpJEgqqFVA3yvr9RHbbMxnN7skujLGK/djcLQYjiHW8zf
   hcGW5+WuUzbBdAVaXq1AiZI7C7baBAZE+Vt9uJKuCxd1vJd6pVx/lAp4t
   yMsZ7Lv5A0EJEWuI+YUlR9jzkaiuuRSG/n+4r504slQqCYYZaWbA2wCAJ
   ppM+2FUmlkn7GrYIqIuJnjAxIVgYqor7iMwvbFptxtJx6YQ867tbrRIkv
   gdh+fhsRXHxrQ3Zg7RkShZY/Ybya55YgYxky0syEK2FAAztUulrFZKOrZ
   w==;
X-CSE-ConnectionGUID: cSU8rx5MQtuL6hKAo4GzlA==
X-CSE-MsgGUID: fG4cGZQESjCFe+r5a59Kqg==
X-IPAS-Result: =?us-ascii?q?A0BGAgC9xmlq/4wQJK1aglmCV3ReQ0mVXmwDnhuBfg8BA?=
 =?us-ascii?q?QEPRA0EAQGFBQKNZgImNAkOAQIEAwIDAQEBAQEBAQEBAQELAQEFAQEBAgEHB?=
 =?us-ascii?q?YEOE4ZPDYZaAQIBAzIBRhAcAwECLysjCBmDAgGCdAMRviiCLIEBg2gCQ1DbL?=
 =?us-ascii?q?gELFAEFgTOFP4ggXBgBhHwnGxuBcoEVg2mBBYE+HgEBgSeBBoV4BIIigQyBW?=
 =?us-ascii?q?h6QN0iBHgNZLAFVEw0KCwcFgWYDNRIqFW4yHYEjPheBDRsHBYEdgSw/hFcjG?=
 =?us-ascii?q?TZ/gS91SnctaQESF4EagzkCgkEDCxgNSBEsNxQZBD5uB41vIYJFgQ4BKgF/p?=
 =?us-ascii?q?yOhDwoog3WMIY9ChXgaM4QEgVeSQJJRC5h9jgqWUIRpgWg8gUcLB3AVgyIJS?=
 =?us-ascii?q?hkPji0BCguDYIF/gxTJRicyCzIBAQcCBw4DC4FokACBHmABAQ?=
IronPort-Data: A9a23:it6e56lrxyPBGZWem4IGKW/o5gzXJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIWXD2OM6qKajf2e9AgO96x90kO78DVn9I3HAZk+HoyF1tH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaC4E/raf658SUUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dha++2k
 Y20+ZC31GONgWYubDpLsfPb8XuDgdyr0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSb
 /rD1ryw4lTC9B4rDN6/+p6jGqHdauePVeQmoiM+t5mK2nCulARrukoIHKZ0hXNsttm8t4sZJ
 OOhGnCHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqHLWyOE/hlgMK05FYYjx7ZtETxrz
 OAFDG4NTTmE282kxJvuH4GAhux7RCXqFIobvnclyXTSCuwrBMiYBa7L/tRfmjw3g6iiH96HO
 JFfMmQpNUqGOkEXUrsUIMpWcOOAhmX/ej5RsnqepLE85C7YywkZPL3Fb4uNIoXUHJoL9qqej
 mzpo2/WMCg3D9605zfG6C+l277shCyuDer+E5X9rJaGmma7wXQeDhATX1a3rfS1z0KzRd9bA
 0gV4TY1668q+UqmS9PwUxG1rDiDpBF0ZjZLO+Q+7AfIzu/f5ByUQzBfCDVAc9ch8sQxQFTGy
 2O0oj8gPhQ32JX9dJ5X3u78Qe+aUcTNEVI/WA==
IronPort-HdrOrdr: A9a23:R86eEqw0NoSfJMSnJj8TKrPw9L1zdoMgy1knxilNoNJuHfBw8P
 re+8jzuiWUtN98YhwdcJW7Scu9qBDnhPpICPcqXYtKNTOO0ADDEGgh1/qG/9SKIUPDH4BmuZ
 uIWpIObuEYdWIK7vrS0U2fD8sqxsWB/eSDgOfTyGoocCRRApsQljuQzm2gYzZLrM4sP+tAKK
 ah
X-Talos-CUID: 9a23:5HXxv22hPJ5NvOKK7tZKQLxfEfsYImfNkVLpP1KcV2ZKYbrJZk2U0fYx
X-Talos-MUID: =?us-ascii?q?9a23=3AkhiM1Q3X7/vnFJ6v4+qfkA7tyjUj7YvyA28/qLg?=
 =?us-ascii?q?9ueKqOG9qZj7A3ReuTdpy?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,192,1779148800"; 
   d="scan'208";a="790016176"
Received: from alln-l-core-03.cisco.com ([173.36.16.140])
  by alln-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 29 Jul 2026 09:25:56 +0000
Received: from sjc-ads-5471.cisco.com (sjc-ads-5471.cisco.com [10.28.23.235])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-03.cisco.com (Postfix) with ESMTPS id 77A7018000427;
	Wed, 29 Jul 2026 09:25:56 +0000 (GMT)
Received: by sjc-ads-5471.cisco.com (Postfix, from userid 1887505)
	id 1AE4CCC124A; Wed, 29 Jul 2026 02:25:56 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [meta-oe][scarthgap][PATCH 5/5] libdbi-perl: Fix CVE-2026-14740
Date: Wed, 29 Jul 2026 02:25:55 -0700
Message-Id: <20260729092556.45457-5-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260729092556.45457-1-hthakar@cisco.com>
References: <20260729092556.45457-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-5471.cisco.com [10.28.23.235];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.28.23.235, sjc-ads-5471.cisco.com
X-Outbound-Node: alln-l-core-03.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Jul 2026 09:26:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128559

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://github.com/perl5-dbi/dbi/commit/fc16f9e8b3dd5c65caf1867781ab2bfe2fadcc01
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-14740

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../perl/libdbi-perl/CVE-2026-14740.patch     | 40 +++++++++++++++++++
 .../perl/libdbi-perl_1.643.bb                 |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026-14740.patch

diff --git a/meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026-14740.patch b/meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026-14740.patch
new file mode 100644
index 0000000000..7ac0c24a02
--- /dev/null
+++ b/meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026-14740.patch
@@ -0,0 +1,40 @@
+From 016bd2b384ed34185a1770312124ceca0086d7a8 Mon Sep 17 00:00:00 2001
+From: Robert Rothenberg <perl@rhizomnic.com>
+Date: Sat, 4 Jul 2026 10:49:42 +0100
+Subject: [PATCH] Fix out-of-bounds read in preparse when an initial comment is
+ deleted
+
+This fixes CVE-2026-14740
+
+Co-Authored-By: Claude Opus 4.8 (1M context) <noreply@anthropic.com>
+
+Signed-off-by: Robert Rothenberg <rrwo@cpansec.org>
+
+CVE: CVE-2026-14740
+Upstream-Status: Backport [https://github.com/perl5-dbi/dbi/commit/fc16f9e8b3dd5c65caf1867781ab2bfe2fadcc01]
+
+(cherry picked from commit fc16f9e8b3dd5c65caf1867781ab2bfe2fadcc01)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ DBI.xs | 8 +++++++-
+ 1 file changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/DBI.xs b/DBI.xs
+index 23ad34a..f40c17a 100644
+--- a/DBI.xs
++++ b/DBI.xs
+@@ -4237,7 +4237,13 @@ preparse(SV *dbh, const char *statement, IV ps_return, IV ps_accept, void *foo)
+                 }
+                 if (in_comment == '/')
+                     src++;
+-                src += (*src != '\n' || *(dest-1)=='\n') ? 1 : 0;
++                /* Only inspect the previously-emitted byte if one exists;
++                   when an initial line comment is deleted, dest is still at
++                   the start of the output buffer and *(dest-1) would read
++                   one byte before it (OOB read). */
++                src += (*src != '\n'
++                        || (dest > SvPVX(new_stmt_sv) && *(dest-1)=='\n'))
++                       ? 1 : 0;
+                 in_comment = '\0';
+                 rt_comment = '\0';
+              }
diff --git a/meta-oe/recipes-devtools/perl/libdbi-perl_1.643.bb b/meta-oe/recipes-devtools/perl/libdbi-perl_1.643.bb
index 4733378700..7e3d1a0161 100644
--- a/meta-oe/recipes-devtools/perl/libdbi-perl_1.643.bb
+++ b/meta-oe/recipes-devtools/perl/libdbi-perl_1.643.bb
@@ -18,6 +18,7 @@ SRC_URI = "http://search.cpan.org/CPAN/authors/id/T/TI/TIMB/DBI-${PV}.tar.gz \
            file://CVE-2026-14380_p3.patch \
            file://CVE-2026-14380_p4.patch \
            file://CVE-2026-14739.patch \
+           file://CVE-2026-14740.patch \
            "
 SRC_URI[md5sum] = "352f80b1e23769c116082a90905d7398"
 SRC_URI[sha256sum] = "8a2b993db560a2c373c174ee976a51027dd780ec766ae17620c20393d2e836fa"
-- 
2.35.6


