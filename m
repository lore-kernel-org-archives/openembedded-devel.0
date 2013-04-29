Received: from mail-ea0-f170.google.com ([209.85.215.170])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1UWnYZ-0001lV-GJ
	for openembedded-devel@lists.openembedded.org;
	Mon, 29 Apr 2013 14:52:08 +0200
Received: by mail-ea0-f170.google.com with SMTP id z7so2516232eaf.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Apr 2013 05:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=vsByzgEMtMJ9a2xWi9PR0SCughu37fMEt5GMETeQKTA=;
	b=AhZUaHUoM6jzAm4kE0zs+eSwg+v+rZnq+IPy307q2Lkth12gnlH5tIbCO06a0q3HHb
	MoxNCEjGrvhSJZ0uykX9OZGR2kkZR0Do4Tv1Tqa8MOsoOFiKnS27G3TAbEsHN1cp8vd0
	mBDbS2La4lbwqXOiA84Mt63rqeRY/eRx2LMoOGrSCv93MF81WKlOa05o8/Jzt7sdH04k
	MFjDrSEepDpr0spz5ghSBTTG/Gtlo/LQi5Z27ViP5rkD8UXA0W8WaBDaqsRXXfvg9au0
	nSjhq0X9vR9Eex+SwW/Qh8KRVetGDvujNvnTqs/1zce+X88IytHxuRKaHkRzqKduY7nL
	4dvQ==
X-Received: by 10.14.109.131 with SMTP id s3mr9259649eeg.26.1367238832137;
	Mon, 29 Apr 2013 05:33:52 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-160-204.unitymediagroup.de.
	[95.222.160.204]) by mx.google.com with ESMTPSA id
	r10sm14784232eez.10.2013.04.29.05.33.50
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 29 Apr 2013 05:33:51 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 29 Apr 2013 14:31:23 +0200
Message-Id: <1367238685-16855-4-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1367238685-16855-1-git-send-email-schnitzeltony@googlemail.com>
References: <1367238685-16855-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-gnome 3/5] gnome-power-manager: fix configure
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
X-List-Received-Date: Mon, 29 Apr 2013 12:52:14 -0000
X-List-Received-Date: Mon, 29 Apr 2013 12:52:14 -0000
X-List-Received-Date: Mon, 29 Apr 2013 12:52:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* configure looks for libgnome-keyring (there is no option --disable-keyring)
* to have a daemon put gnome-keyring to RRECOMMENDS.

Error message was:
| Package gnome-keyring-1 was not found in the pkg-config search path.
| Perhaps you should add the directory containing `gnome-keyring-1.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'gnome-keyring-1' found
| configure:13934: $? = 1
| configure:13952: result: no
| No package 'gnome-keyring-1' found
| configure:13978: error: Package requirements (

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../gnome-power-manager_2.32.0.bb                  |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-gnome/recipes-gnome/gnome-power-manager/gnome-power-manager_2.32.0.bb b/meta-gnome/recipes-gnome/gnome-power-manager/gnome-power-manager_2.32.0.bb
index cc4c0c4..c11d6ea 100644
--- a/meta-gnome/recipes-gnome/gnome-power-manager/gnome-power-manager_2.32.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-power-manager/gnome-power-manager_2.32.0.bb
@@ -2,9 +2,10 @@ DESCRIPTION = "Power management daemon"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
-PR = "r2"
+PR = "r3"
 
-DEPENDS = "glib-2.0 gtk+ gconf gnome-keyring dbus dbus-glib libnotify libwnck cairo libunique xrandr virtual/libx11 libxrender libcanberra upower"
+DEPENDS = "glib-2.0 gtk+ gconf libgnome-keyring dbus dbus-glib libnotify libwnck cairo libunique xrandr virtual/libx11 libxrender libcanberra upower"
+RRECOMMENDS_${PN} += "gnome-keyring"
 
 inherit gnome
 
@@ -14,7 +15,6 @@ SRC_URI[archive.md5sum] = "9a08e85dce3ffb90775f15e3bda4adda"
 SRC_URI[archive.sha256sum] = "17fa301bf7e133285c0e054ae3be2b0f690c48f59b09f67e04d6ed339b330476"
 
 EXTRA_OECONF = " --disable-scrollkeeper \
-                 --disable-keyring \
                  --disable-applets \
                  --x-includes=${STAGING_INCDIR} \
                  --x-libraries=${STAGING_LIBDIR} \
-- 
1.7.6.5



