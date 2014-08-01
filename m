Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wg0-f48.google.com (mail-wg0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 4FB927091E
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Aug 2014 13:35:07 +0000 (UTC)
Received: by mail-wg0-f48.google.com with SMTP id x13so4311250wgg.31
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Aug 2014 06:35:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=+gUHdw1D9G0QPfzIusfSkoAcXRdhDQ1zCUASVXGYUdw=;
	b=XvaRziXbMVViRVl5S3vnJN2Yii5lh6odmIqBgbAgCfp9mm+LsvHJhr/3EP630XCE8E
	tvfJ+gcJiRplOoju/zHqIsq1OgkZnb439Sv41tM6UbQWGpnmFRZBd9OwK4eVcQHQ43wh
	20Ce0XN+aEf5iLsIbYTESw7TocF1fT74qwUnHUO9BMKKRHu1Xg6pdrEw38MorBebvF7I
	0GzOayW+gS8BYzoAZCkluODj5dfgE9S3sjvMwCuywczDzf5MOnVus752e8x1Rc8uZ6Xe
	eRz1T4hQ1Y9bzSNt+YnxTPblKjbsZqCHl+nN60TXfZndKOAAVKTd2XlHWC2k/1Ehr5Qx
	q9xw==
X-Gm-Message-State: ALoCoQkTPUzKsnyJ8Z9Sdqh0RgVTjENuXhiC8Zy38wtOXhAb1QuHW8pOwquZUHp56beap9ryYNdy
X-Received: by 10.180.211.101 with SMTP id nb5mr6956316wic.53.1406900106159;
	Fri, 01 Aug 2014 06:35:06 -0700 (PDT)
Received: from localhost ([2001:610:612:0:beee:7bff:fe9e:ae56])
	by mx.google.com with ESMTPSA id o2sm8754980wij.24.2014.08.01.06.35.05
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 01 Aug 2014 06:35:05 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  1 Aug 2014 15:34:48 +0200
Message-Id: <1406900096-31368-2-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <1406900096-31368-1-git-send-email-koen@dominion.thruhere.net>
References: <1406900096-31368-1-git-send-email-koen@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-gnome][PATCH 02/10] gnome-settings-daemon: remove blacklist, libgnomekbd has been fixed
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 01 Aug 2014 13:35:12 -0000

Also fix S!=B and dependency issues.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 .../gnome-settings-daemon/gnome-settings-daemon_2.32.1.bb           | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_2.32.1.bb b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_2.32.1.bb
index 2482732..fc7321e 100644
--- a/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_2.32.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_2.32.1.bb
@@ -4,9 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
 PR = "r7"
 
-PNBLACKLIST[gnome-settings-daemon] = "BROKEN: depends on broken libgnomekbd"
-
-DEPENDS = "libxxf86misc libsndfile1 libxtst glib-2.0 polkit gtk+ gconf dbus-glib libnotify libgnomekbd libxklavier gnome-doc-utils gnome-desktop"
+DEPENDS = "intltool libxxf86misc libsndfile1 libxtst glib-2.0 polkit gtk+ gconf dbus-glib libnotify libgnomekbd libxklavier gnome-doc-utils gnome-desktop"
 
 inherit gnome
 
@@ -25,7 +23,7 @@ EXTRA_OECONF = "--disable-esd \
 "
 
 do_configure_prepend() {
-    sed -i -e 's:-L$libdir::g' -e 's:-I$includedir::g' configure.ac
+    sed -i -e 's:-L$libdir::g' -e 's:-I$includedir::g' ${S}/configure.ac
 }
 
 FILES_${PN} += "${libdir}/gnome-settings-daemon-2.0/*.so ${libdir}/gnome-settings-daemon-2.0/*plugin \
-- 
1.9.0


