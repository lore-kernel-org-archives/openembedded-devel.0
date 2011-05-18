Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QMoua-0003Pr-Fq
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 May 2011 00:08:12 +0200
Received: by mail-fx0-f47.google.com with SMTP id 19so1851802fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 May 2011 15:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=dNMvkqDrjee5fN+Hhc594pQg2zoG9trWM9hWl1+U9dE=;
	b=azY4iap1IPIXRTPQfbXnafbcVewSY+RNXckGOmiaO1ksVUupWHBCUtc5Ee+CrlrgLv
	rxzdR9Lsow9BgRK6X1r7KEPtf5g4Cuj+blOlrfDu7RIrYtKsFtMti2ZJMV7ca6Kvt6tR
	TcGJiQK0D1bYn9Vrt/l9Z+3PcMpzbBxrvegjU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	b=SjgV9p75Rt3on4yiluAV8UmaT6hVKyDlAu6A2JRcpwAJLq6un2gT8RhSrcyFROU+pH
	wACqiXUBpluqgihHVo0c4C1mJNpvIxkQ134V5r7mu1cgrjdFw6LCiXfd9Shh7T8Jr9XN
	oObb3XcDm7LWb8EQG6Es2HmhUNRKHTFIO52xo=
Received: by 10.223.17.68 with SMTP id r4mr3007678faa.62.1305756319870;
	Wed, 18 May 2011 15:05:19 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id 14sm809671fas.6.2011.05.18.15.05.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 18 May 2011 15:05:19 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 May 2011 00:05:17 +0200
Message-Id: <9cb1277b5ed2bd227fc05bbfc27e27b2cb7f3756.1305756266.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.5.rc3
In-Reply-To: <cover.1305756266.git.Martin.Jansa@gmail.com>
References: <cover.1305756266.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 1/2] glib-2.0: use PN instead of glib-2.0 in PACKAGES and FILES
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 18 May 2011 22:08:12 -0000

* otherwise notes like this are shown:
  NOTE: multiple providers are available for runtime glib-2.0-utils (glib-2.0-nativesdk, glib-2.0)
  NOTE: consider defining a PREFERRED_PROVIDER entry to match glib-2.0-utils

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-core/glib-2.0/glib.inc |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-core/glib-2.0/glib.inc b/meta-oe/recipes-core/glib-2.0/glib.inc
index 8786fe5..9eafbd8 100644
--- a/meta-oe/recipes-core/glib-2.0/glib.inc
+++ b/meta-oe/recipes-core/glib-2.0/glib.inc
@@ -18,10 +18,10 @@ require glib-2.0.inc
 DEPENDS = "glib-2.0-native gtk-doc-native zip dbus"
 DEPENDS_virtclass-native = "gtk-doc-native pkgconfig-native gettext-native dbus-native"
 DEPENDS_virtclass-nativesdk = "libtool-nativesdk"
-PACKAGES =+ "glib-2.0-utils "
+PACKAGES =+ "${PN}-utils "
 
 LEAD_SONAME = "libglib-2.0.*"
-FILES_glib-2.0-utils = "${bindir}/*"
+FILES_${PN}-utils = "${bindir}/*"
 
 inherit autotools pkgconfig gettext
 
-- 
1.7.5.rc3



