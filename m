Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37DA1E77192
	for <webhook@archiver.kernel.org>; Fri, 27 Dec 2024 10:58:10 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.web10.10960.1735297085211053054
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Dec 2024 02:58:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=traqacAG;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-202412271058035de38042c297ddc18c-ici6im@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 202412271058035de38042c297ddc18c
        for <openembedded-devel@lists.openembedded.org>;
        Fri, 27 Dec 2024 11:58:03 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=2blbZ6/WHoJxL00O9Ezhcu3vpGqkc2G/iGXwVGpab8A=;
 b=traqacAGIEfwbacLbUxuU6XG+1nYFfU78nbZRHoTa54zQzWtsY7xI3cnrzC4+t1EfZl2iH
 1AVwwhCur8RZMmdYH4KPV0aRbp2tVRL3FT9SF6MGTAE0RJXj2Asi3blfPZlRdEJHlKx73gAs
 E4jMTqQCjs/p30mEl7EUi71KByaxAFnZZPPApk3wXsvdwj1V3cjP20RzGcjL4UXrWnh4N5WL
 SlPUvVo9veV5bDWzdvoYNp/c0j8tHkIioslI9H3gIZXrnCbJ7vZU9wjd3Nj83iCYu5LOU7zl
 wj56kJ0GW3+kwnukzUNe3HTr0YP/gpFrU8Bnd0f6lBAEcyYQcgv5Cpeg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH 09/15] libwmf; switched to unofficial fork
Date: Fri, 27 Dec 2024 11:56:09 +0100
Message-Id: <20241227105615.3303193-10-peter.marko@siemens.com>
In-Reply-To: <20241227105615.3303193-1-peter.marko@siemens.com>
References: <20241227105615.3303193-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Dec 2024 10:58:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114567

From: Peter Marko <peter.marko@siemens.com>

Debian has switched to this fork in Bookworm.
If contains dozens of CVE fixes and other bugfixes.
This should make the maintenance of this package easier.

The sources are identical to those abandoned in 2002:
Only in .../tmp/work/core2-64-poky-linux/libwmf/0.2.8.4/libwmf-0.2.8.4/: autom4te.cache
Only in /tmp/caolanm/libwmf/: .git

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-oe/recipes-extended/libwmf/libwmf_0.2.8.4.bb | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/meta-oe/recipes-extended/libwmf/libwmf_0.2.8.4.bb b/meta-oe/recipes-extended/libwmf/libwmf_0.2.8.4.bb
index 58bfd1f25b..5e530b35de 100644
--- a/meta-oe/recipes-extended/libwmf/libwmf_0.2.8.4.bb
+++ b/meta-oe/recipes-extended/libwmf/libwmf_0.2.8.4.bb
@@ -1,5 +1,6 @@
 SUMMARY = "Library for converting WMF files"
-HOMEPAGE = "http://wvware.sourceforge.net/libwmf.html"
+#HOMEPAGE = "http://wvware.sourceforge.net/libwmf.html"
+HOMEPAGE = "https://github.com/caolanm/libwmf"
 SECTION = "libs"
 
 LICENSE = "GPL-2.0-only"
@@ -15,17 +16,14 @@ inherit features_check autotools pkgconfig
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/wvware/${BPN}/${PV}/${BPN}-${PV}.tar.gz;name=tarball \
+SRC_URI = "git://github.com/caolanm/libwmf.git;protocol=https;branch=master \
            file://libwmf-0.2.8.4-intoverflow.patch \
            file://libwmf-0.2.8.4-useafterfree.patch \
            file://0001-configure-use-pkg-config-for-freetype.patch \
           "
+SRCREV = "27b4aaf8cf653b4cd2ebe14717ffa9e76560485e"
 
-SRC_URI[tarball.md5sum] = "d1177739bf1ceb07f57421f0cee191e0"
-SRC_URI[tarball.sha256sum] = "5b345c69220545d003ad52bfd035d5d6f4f075e65204114a9e875e84895a7cf8"
-
-UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/wvware/files/libwmf/"
-UPSTREAM_CHECK_REGEX = "${BPN}/(?P<pver>\d+(\.\d+)+)"
+S = "${WORKDIR}/git"
 
 do_install:append() {
     sed -i -e 's@${RECIPE_SYSROOT}@@g' ${D}${bindir}/libwmf-config
-- 
2.30.2


