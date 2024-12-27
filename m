Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32C50E7718B
	for <webhook@archiver.kernel.org>; Fri, 27 Dec 2024 10:57:50 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.web10.10951.1735297069531031930
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Dec 2024 02:57:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=ISlK3LRb;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-202412271057477adc4d10ead4b6d897-lzd0qc@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 202412271057477adc4d10ead4b6d897
        for <openembedded-devel@lists.openembedded.org>;
        Fri, 27 Dec 2024 11:57:47 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=8fieD5laCA548MeQn953LxnabUAgJZ9Xoo/mcCEMKFg=;
 b=ISlK3LRbl8eW2W+6OU7hnVmdvyHH4tg5rWlokdAndNx/dRL8Xt3Nz6nbETB5LOi4TLwuWX
 9tNnxBzbMIjYDEtQxUmHL0J38BqkgdvkG/jo2KXwlGuarOf6KX6lNUa804aXGeSaCbSTzxT/
 mVe7xFFRzBzvpIATadoZZy2G1ix/MrN3A1T3qdFBQE7Ep2agRdK/lAaQGcZek3lPxVymc/kf
 oRjoCJxykKLR1kSucj+/Mk8RWySuiPKiyG5fEwvO55GgptLOlYoT5Wr5i8nRC+bY7U5BBq8E
 GLtyw0HkKOYg+Rvt+8zFsu9SlyTe13IygBYtTTeVXffNvaWk45XYRKVw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH 06/15] imagemagick: refactor so devtool upgrade works
Date: Fri, 27 Dec 2024 11:56:06 +0100
Message-Id: <20241227105615.3303193-7-peter.marko@siemens.com>
In-Reply-To: <20241227105615.3303193-1-peter.marko@siemens.com>
References: <20241227105615.3303193-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Dec 2024 10:57:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114564

From: Peter Marko <peter.marko@siemens.com>

* move version part after dash to PV
* set git tag regex

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../{imagemagick_7.1.1.bb => imagemagick_7.1.1-26.bb}        | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/imagemagick/{imagemagick_7.1.1.bb => imagemagick_7.1.1-26.bb} (99%)

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1-26.bb
similarity index 99%
rename from meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb
rename to meta-oe/recipes-support/imagemagick/imagemagick_7.1.1-26.bb
index 5407c4e400..78cbb9ddea 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1-26.bb
@@ -9,8 +9,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2f9de66264141265b203cde9902819ea \
 # FIXME: There are many more checked libraries. All should be added or explicitly disabled to get consistent results.
 DEPENDS = "lcms bzip2 jpeg libpng tiff zlib fftw freetype libtool"
 
-BASE_PV := "${PV}"
-PV .= "-26"
+BASE_PV = "${@d.getVar('PV').split('-')[0]}"
+UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>([0-9][\.|_|-]?)+)"
+
 SRC_URI = "git://github.com/ImageMagick/ImageMagick.git;branch=main;protocol=https"
 SRCREV = "570a9a048bb0e3a5c221ca87be9408ae35f711e2"
 
-- 
2.30.2


