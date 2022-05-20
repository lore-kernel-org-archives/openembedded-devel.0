Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BE6DC433EF
	for <webhook@archiver.kernel.org>; Fri, 20 May 2022 08:59:01 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net
 (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.web10.6633.1653037139903367463
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 May 2022 01:59:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=StzbJhWy;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226,
 mailfrom: fm-256628-20220520085856b9dd99b5db11354058-b2kds0@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id
 20220520085856b9dd99b5db11354058
        for <openembedded-devel@lists.openembedded.org>;
        Fri, 20 May 2022 10:58:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=OHyGq0MzfpEdTiy2F1ekyqCrhKcBpSf1bIaZJ2keyZI=;
 b=StzbJhWy9sxnx+2//Z/Sfz+x2op8LEW/JCSmA4HxnRTMA8lQGavSEUs6mkKjPUKREe6gmZ
 5xDbU285po8i8Mv61liiRv4UtGjPN+79Jp2EQWY3k+N/CbH3q1I2YO6lYsyLLIfzoEJVawIE
 k3x/4VWlgW92Pfq/LOIqfHc86aBAc=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: brgl@bgdev.pl,
	Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][master][kirkstone][PATCH] libgpiod: move test dependencies
 to ptest package
Date: Fri, 20 May 2022 10:58:43 +0200
Message-Id: <20220520085843.11735-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 20 May 2022 08:59:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97210

This reverts and reworks commit e75cc87c4f944dff766c426fafafd48c378544fe

These tools are needed by test-suites, not the package itself.
I do not want bash (gpl3) or python (big/lot of dependencies)
in my release image when I have ptest enabled in my distro for
sdk/testing image.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb b/meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb
index 35e68b7e2..2cccf93bd 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb
+++ b/meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb
@@ -14,7 +14,7 @@ SRC_URI[sha256sum] = "841be9d788f00bab08ef22c4be5c39866f0e46cb100a3ae49ed816ac9c
 
 inherit autotools pkgconfig python3native ptest
 
-PACKAGECONFIG[tests] = "--enable-tests,--disable-tests,kmod udev glib-2.0 catch2,bats python3-packaging"
+PACKAGECONFIG[tests] = "--enable-tests,--disable-tests,kmod udev glib-2.0 catch2"
 PACKAGECONFIG[cxx] = "--enable-bindings-cxx,--disable-bindings-cxx"
 PACKAGECONFIG[python3] = "--enable-bindings-python,--disable-bindings-python,python3"
 
@@ -54,6 +54,7 @@ RRECOMMENDS:${PN}-ptest += " \
     coreutils \
     ${@bb.utils.contains('PACKAGECONFIG', 'python3', 'python3-unittest', '', d)} \
 "
+RDEPENDS:${PN}-ptest += "bats python3-packaging"
 
 PACKAGECONFIG:append = " ${@bb.utils.contains('DISTRO_FEATURES', 'ptest', 'tests', '', d)}"
 
-- 
2.30.2


