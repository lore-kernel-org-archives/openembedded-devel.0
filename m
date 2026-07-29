Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CD29C54FCD
	for <webhook@archiver.kernel.org>; Wed, 29 Jul 2026 09:26:10 +0000 (UTC)
Received: from alln-iport-4.cisco.com (alln-iport-4.cisco.com [173.37.142.91])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7530.1785317162970021642
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Jul 2026 02:26:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=h5rDcWsw;
 spf=pass (domain: cisco.com, ip: 173.37.142.91, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2938; q=dns/txt;
  s=iport01; t=1785317163; x=1786526763;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3CAyXnC7SH8bRcTasXWaaO4w/IF2SEAHEuFQy9HItB4=;
  b=h5rDcWswyoaTRYc/Puu8T+Gpgl6lYXWNXI3UGNWd9qOpYxyOmdRWnhLv
   hbyB0hSh4DfyG1zLYW6ncTQFLPhRDk/OvDIvGjJpVzyyBupCvl2oaxMMK
   Ab1XO7yTWhb2gEN+lzS04dsmxpqV83wAmxvliWNAdu+R6zYeIaHqRRZBg
   myRCUfXincct5PB1ez8SwvZ/s1nMn/x0vBn9SgZc9Pkvq2RwCsVVVOhq+
   dIUlXvPG8I6o/yjXJlTH/839eVyJlmwPftH65kfRyVJHU+LlzKBJ3/reI
   K8NVUZ+9dZVpWqjMRi21Pe+tBc4wIZcuHf6b+Xk8goovSm0SRoe1lRV3J
   g==;
X-CSE-ConnectionGUID: wdREonRsQnK4vzwyVnnThw==
X-CSE-MsgGUID: BVaDw/N4SIqGFvW5oiH9Jg==
X-IPAS-Result: =?us-ascii?q?A0BHAgC9xmlq/5UQJK1aglmCV3ReQ0kDlVtsA4ETnQiBf?=
 =?us-ascii?q?g8BAQEPRA0EAQGFBQKNZgImNAkOAQIEAwIDAQEBAQEBAQEBAQELAQEFAQEBA?=
 =?us-ascii?q?gEHBYEOE4ZPDYZaAQIBAzIBRhAcAwECLysjCBmDAgGCdAMRviiCLIEBg2gCQ?=
 =?us-ascii?q?1DbLgELFAEFgTOFP4ggXBgBhHwnGxuBcoEVgnN2gQWBPh4CgSeBBoV4BIIig?=
 =?us-ascii?q?QyBWh6QN0iBHgNZLAFVEw0KCwcFgWYDNRIqFW4yHYEjPheBDRsHBYEdgSw/h?=
 =?us-ascii?q?FcjGTZ/gS91SnctaQESF4EagzkCgkEDCxgNSBEsNxQZBD5uB41vIYJFgQ4BK?=
 =?us-ascii?q?gGCLEulK6EPCiiDdYwhlToaM4VbpRELmH2OCpZQhGmBaDyBWXAVgyIJShkPj?=
 =?us-ascii?q?i0BCguDYIUTNMkSJzILAy8BAQcCBw4DC4FokACBfgEB?=
IronPort-Data: A9a23:64ZyEqz2BVorYYnZKyJ6t+dhxyrEfRIJ4+MujC+fZmUNrF6WrkUPn
 WAYDz3VPa3YZWWhKN4kO4Sx9kJSusKAnNQ2S1Ztq1hgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCea/VH1buSJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 46aT/H3Ygf/hWYraDNMsspvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJF46B6Af/NxsOGdtq
 eIKNyEzaBa/h/3jldpXSsE07igiBMDvOIVavjRryivUSK98B5vCWK7No9Rf2V/chOgXQq2YP
 JRfMGQpNUiRC/FMEg9/5JYWnPuoj3r2aRVTqUmeouw85G27IAlZj+m1YYuJIIbQLSlTtmymr
 07ZuEKlOTADG/KB9meC81L9pOCayEsXX6pXTtVU7MVCh0WewGEWAhAaWVa35PW0lEO6c9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc9NUF+t/7ESGzbDZpl/DQGMFVTVGLtchsafaWAAX6
 7NApPuxbRQHjVFfYS31Gmu8xd9qBRUoEA==
IronPort-HdrOrdr: A9a23:eXTSEavJhSH7FlHke9PtOoq67skDrtV00zEX/kB9WHVpmwKj+P
 xG+85rsiMc5wxxZJhNo7290ey7MBHhHP1OkO0s1MmZPDUO0VHAROoJ0WKh+UyEJ8SUzIBgPM
 lbH5SWIeeAa2SS9fyKgzWQIpIH3MSN9ryuiKP1yndgShwvVoRbhj0Jczpy1iZNNXJ77V1TLu
 vl2vZ6
X-Talos-CUID: 9a23:ShP9Om8HoBcLCVzFPnSVv1EYIO0idEfG9XHzf1GqFndXTrupSUDFrQ==
X-Talos-MUID: 9a23:EkBJaAoThAe7XU1DDUwezxtcPet3pILyM2EUvrsYhJSDNAwhGTjI2Q==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,192,1779148800"; 
   d="scan'208";a="790994222"
Received: from alln-l-core-12.cisco.com ([173.36.16.149])
  by alln-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 29 Jul 2026 09:25:56 +0000
Received: from sjc-ads-5471.cisco.com (sjc-ads-5471.cisco.com [10.28.23.235])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-12.cisco.com (Postfix) with ESMTPS id 735D318000214;
	Wed, 29 Jul 2026 09:25:56 +0000 (GMT)
Received: by sjc-ads-5471.cisco.com (Postfix, from userid 1887505)
	id 0D6F7CC12A7; Wed, 29 Jul 2026 02:25:56 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [meta-oe][scarthgap][PATCH 2/5] libdbi-perl: Fix CVE-2026-10879
Date: Wed, 29 Jul 2026 02:25:52 -0700
Message-Id: <20260729092556.45457-2-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260729092556.45457-1-hthakar@cisco.com>
References: <20260729092556.45457-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-5471.cisco.com [10.28.23.235];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.28.23.235, sjc-ads-5471.cisco.com
X-Outbound-Node: alln-l-core-12.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Jul 2026 09:26:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128560

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream fix as referenced in [2], using the
commit shown in [1].

[1] https://github.com/perl5-dbi/dbi/commit/af79036c07aa9a457971c0f4136e37c85dc20978
[2] https://security-tracker.debian.org/tracker/CVE-2026-10879

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../perl/libdbi-perl/CVE-2026-10879.patch     | 34 +++++++++++++++++++
 .../perl/libdbi-perl_1.643.bb                 |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026-10879.patch

diff --git a/meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026-10879.patch b/meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026-10879.patch
new file mode 100644
index 0000000000..9979f63243
--- /dev/null
+++ b/meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026-10879.patch
@@ -0,0 +1,34 @@
+From 2a69c8a256fa83dee2e532c97d3f60f39795c861 Mon Sep 17 00:00:00 2001
+From: "H.Merijn Brand - Tux" <linux@tux.freedom.nl>
+Date: Thu, 28 May 2026 14:14:50 +0200
+Subject: [PATCH] Replacing `?` with `:p#` in `preparse ()` with more than 9
+ `?` causes buffer overflow
+
+`:p1` is length 3, `?` just 1, but `:p1003` is length 6!
+
+CVE: CVE-2026-10879
+Upstream-Status: Backport [https://github.com/perl5-dbi/dbi/commit/af79036c07aa9a457971c0f4136e37c85dc20978]
+
+Backport Changes:
+ - Omit ChangeLog, dbixs_rev.h, and lib/DBI/Changes.pm release metadata because the target remains DBI 1.643.
+ - Omit generated doc/DBI.3 and doc/DBI.man changes; the DBI.xs security hunk is unchanged.
+
+(cherry picked from commit af79036c07aa9a457971c0f4136e37c85dc20978)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ DBI.xs | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/DBI.xs b/DBI.xs
+index c549d15..8858e21 100644
+--- a/DBI.xs
++++ b/DBI.xs
+@@ -4201,7 +4201,7 @@ preparse(SV *dbh, const char *statement, IV ps_return, IV ps_accept, void *foo)
+     }
+ 
+     /* XXX this allocation strategy won't work when we get to more advanced stuff */
+-    new_stmt_sv = newSV(strlen(statement) * 3);
++    new_stmt_sv = newSV(strlen(statement) * 6 + 16);
+     sv_setpv(new_stmt_sv,"");
+     src  = statement;
+     dest = SvPVX(new_stmt_sv);
diff --git a/meta-oe/recipes-devtools/perl/libdbi-perl_1.643.bb b/meta-oe/recipes-devtools/perl/libdbi-perl_1.643.bb
index 88d5aa3294..99e8c209fe 100644
--- a/meta-oe/recipes-devtools/perl/libdbi-perl_1.643.bb
+++ b/meta-oe/recipes-devtools/perl/libdbi-perl_1.643.bb
@@ -12,6 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=10982c7148e0a012c0fd80534522f5c5"
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/T/TI/TIMB/DBI-${PV}.tar.gz \
            file://CVE-2014-10402.patch \
            file://CVE-2026-9698.patch \
+           file://CVE-2026-10879.patch \
            "
 SRC_URI[md5sum] = "352f80b1e23769c116082a90905d7398"
 SRC_URI[sha256sum] = "8a2b993db560a2c373c174ee976a51027dd780ec766ae17620c20393d2e836fa"
-- 
2.35.6


