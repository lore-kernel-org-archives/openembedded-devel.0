Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBB35C02181
	for <webhook@archiver.kernel.org>; Fri, 24 Jan 2025 14:34:13 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.13243.1737729248370106236
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Jan 2025 06:34:08 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C8C83497
	for <openembedded-devel@lists.openembedded.org>; Fri, 24 Jan 2025 06:34:35 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 802003F694
	for <openembedded-devel@lists.openembedded.org>; Fri, 24 Jan 2025 06:34:07 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 4/4] ntp: set CONFIG_SITE in do_compile
Date: Fri, 24 Jan 2025 14:34:01 +0000
Message-ID: <20250124143401.1635224-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250124143401.1635224-1-ross.burton@arm.com>
References: <20250124143401.1635224-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Jan 2025 14:34:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115065

Recent changes in to the autotools class in core means that it no longer
sets CONFIG_SITE for compile tasks.  However, ntp decides to reconfigure
itself mid-build, so the CONFIG_SITE values are lost.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-networking/recipes-support/ntp/ntp_4.2.8p18.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-networking/recipes-support/ntp/ntp_4.2.8p18.bb b/meta-n=
etworking/recipes-support/ntp/ntp_4.2.8p18.bb
index 302cf9915f..6fae993482 100644
--- a/meta-networking/recipes-support/ntp/ntp_4.2.8p18.bb
+++ b/meta-networking/recipes-support/ntp/ntp_4.2.8p18.bb
@@ -55,6 +55,11 @@ CVE_STATUS_NTP =3D " \
=20
 inherit autotools update-rc.d useradd systemd pkgconfig
=20
+# For some reason this recipe reconfigures the nested configure.ac files=
 in
+# do_compile because libtool.m4 is newer than aclocal.m4, and that then
+# doesn't know about the site configuration.
+do_compile[prefuncs] +=3D "autotools_sitefiles"
+
 # The ac_cv_header_readline_history is to stop ntpdc depending on either
 # readline or curses
 EXTRA_OECONF +=3D "--with-net-snmp-config=3Dno \
--=20
2.43.0


