Return-Path: <olani@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA99CC4332F
	for <webhook@archiver.kernel.org>; Tue, 22 Nov 2022 16:00:50 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web11.23308.1669132842209777212
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Nov 2022 08:00:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=nkaDHU0j;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: ola.x.nilsson@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1669132843;
  x=1700668843;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=E84eK2CGVlaIt6UmMmXekAimEv8eyYA/Wy7k3nOQ7xY=;
  b=nkaDHU0jew37uA1TtJf0+JVVdk3X6i0yA0nA8jGpi/wEs0S7kP9ojzGG
   ThEoC0KC/Fubh96UXo2HwJVpJs5kSYeC+20XXTMvlfYkpX3ohao7leW5n
   TMb3uUXSfzCxd2Y8OWIlrkjP8A9ZhwefukK1L9S6BrJItQIN/5CfABOKE
   R6eaGaTeZAXX7Gw5f36Cr+vVG3RpiwG5o+bVUl1TX3PKIYvkpSDzS01G9
   UKz6hS6rryBEI5Q97FWW0QWX57yjqF4FtcSaza7xpXH1Vy6lEwSzPkScH
   PZNQgLgPv3XWoLwWUfcAWKomrGI+Jh2JqR8gDsSI9RcdMAoOxY8qyl8mB
   g==;
From: Ola x Nilsson <olani@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [PATCH] kbd: DEPEND on bison-native and don't build tests
Date: Tue, 22 Nov 2022 17:00:39 +0100
Message-ID: <20221122160039.3693939-1-olani@axis.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Nov 2022 16:00:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99688

bison-native is required if any .y-file is changed.

Add --disable-tests to EXTRA_OECONF as the tests are not usable in
ptest - they can only run in-situ - and fails when building with
-D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64.

Signed-off-by: Ola x Nilsson <olani@axis.com>
---
 meta/recipes-core/kbd/kbd_2.5.1.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/kbd/kbd_2.5.1.bb b/meta/recipes-core/kbd/kbd_2.5.1.bb
index aa3ab6e121..75b3c2765a 100644
--- a/meta/recipes-core/kbd/kbd_2.5.1.bb
+++ b/meta/recipes-core/kbd/kbd_2.5.1.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 inherit autotools gettext pkgconfig
 
-DEPENDS += "flex-native"
+DEPENDS += "bison-native flex-native"
 
 RREPLACES:${PN} = "console-tools"
 RPROVIDES:${PN} = "console-tools"
@@ -18,6 +18,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/${BPN}/${BP}.tar.xz \
 
 SRC_URI[sha256sum] = "ccdf452387a6380973d2927363e9cbb939fa2068915a6f937ff9d24522024683"
 
+EXTRA_OECONF = "--disable-tests"
 PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)} \
                   "
 
-- 
2.30.2


