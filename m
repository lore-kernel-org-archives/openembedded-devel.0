Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
	[209.85.128.50])
	by mail.openembedded.org (Postfix) with ESMTP id 60D7E7CED3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Dec 2019 21:31:41 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id p17so9333429wma.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Dec 2019 13:31:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=wfbAoVhnEhOybVK1xqvVLF66Lso0ja1lve7xITZ5mSI=;
	b=D0yX66ejTbVj9n0tpQoK9WyH0faIFw+pS7xz+VFMKeid2atv1S2T7q2f0MDQh+hKxG
	xcqZK0YFgK7G9xl/lvE2MUGetqRgTbLV9W4gKh9TeHVgifNJqLCQoI9v9aGnGYKdPHJp
	T+vPj/VbW9HPHnGCvYk4ojxOuPaeoABJX0LEY1wRB+etCjINFA1AOlOzFsbQVNF8Yc9k
	//TEUJ9M+g4HGxieLpzvqVHDYCtDg6D2pOs+/FJ120ENkXFekQPX/GBBu6G/tNyMNDSg
	In/Vg+Qn1eTiG0qNHshtjHtH5PRKddzpXnTbIS3odRVGfD1aGg8Ywj+uaTTGI+TvAJBU
	ykpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=wfbAoVhnEhOybVK1xqvVLF66Lso0ja1lve7xITZ5mSI=;
	b=iOrHfOuVKjx8aX2+k9uTnA4tbImdOkBXgOZ8BmjO1a/3O+tbjUVVZlVbZ2kFYXex+g
	FgiHRtYsDJepLX0tAPN8R/r6FmFsYw7Kop4ImkyrEKEuyGjBqNAgbwobazMHAcOyLsDt
	K6gH7bjW1+bSYg6LojUcCE3Q8Vt0lr145FUsDCdzE0lII4bzIGDrxfaObNc9FRJr3eAS
	yHxo01FCptqtb7oTzvdj9TlZeOi6g9/mNIT8oUW0Yy3HefySb1bxi+CJGDsHIFbdZ7np
	kIWOx4Qwv/0B7BAg1SC4VMuW/xP/7WWOmhhEurcW5GTnOhCDVvWubtWLGJG0cgO7lddG
	ZWRQ==
X-Gm-Message-State: APjAAAWxmBnC8LB2qPA/lAYNKw4DAT5DMCMVAs3XNjTgbkzXcz0ZqJb8
	pxpBJHi8N7/1I4DnLwv+q7NCBlJ43z4=
X-Google-Smtp-Source: APXvYqxxQO9dZZVSUAto8O/FAVq+aCk4/Bb7ZM0wfgAu1x9wp0kobx+nzOkfoNanka/XIp+xhxxHdw==
X-Received: by 2002:a7b:c3d2:: with SMTP id t18mr21462225wmj.90.1577482301738; 
	Fri, 27 Dec 2019 13:31:41 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F052B8722A751F738295925.dip0.t-ipconnect.de.
	[2003:f0:7f05:2b87:22a7:51f7:3829:5925])
	by smtp.gmail.com with ESMTPSA id
	m7sm11915929wma.39.2019.12.27.13.31.40
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 27 Dec 2019 13:31:41 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 27 Dec 2019 22:31:15 +0100
Message-Id: <20191227213120.3930-18-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191227213120.3930-1-schnitzeltony@gmail.com>
References: <20191227213120.3930-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 18/23] gnome-shell: upgrade 3.34.1 -> 3.34.2
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 27 Dec 2019 21:31:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From [1]:

3.34.2
======
* Fix unredirection after cancelled animations [Florian; #1788]
* Use cached coordinates for window sorting in overview [Andrew; !763]
* Include shadow in window screenshots [Robert; !762]
* Use correct timezones for events [Milan, Florian; !806, #1895]
* Adjust style of system menu action buttons [monday; !802]
* Fix windows getting stuck on screen if closed while animating [Florian; !815]
* Hide stopped spinner in top bar [Joonas; !834]
* Reuse existing icons when updating the app picker grid [Georges; !841]
* Fix not-responding dialog size when using geometry scaling [Jonas; !783]
* Fix battery icon glitch in "100% but charging" case [Philip; !814]
* Update window titles in app menu [Florian; #1830]
* Improve modifier-less keyboard navigation of switcher popups [Florian; #1883]
* Use better OSK layout fallback for unsupported variants [Florian; #1907]
* Fix creating app folders with no pre-existing folders [Jonas; #1652]
* Improve DND page switching in app picker [Florian, Jonas; #1693]
* Show polkit confirmation dialog for users with no password [Joaquim; !829]
* Fix interacting with applications when magnifier is enabled [Jonas; !754]
* Tweak styling of notifications/media constrols [Joonas; !855, !865]
* Fix disable command of gnome-extensions tool [Florian; #1946]
* Enable clean session shutdown after gnome-shell failure [Benjamin; !858]
* Also remove scaled keys when texture cache is cleared [Daniel; !567]
* Don't show overflow indicator in switchers that fit screen [Florian; #1834]
* Place launched applications into a systemd scope [Benjamin; !863]
* Fix weather forecasts for automatic location when Weather is not sandboxed
  [Florian; #1823]
* Dismiss switcher popups when a system modal dialogs opens [Florian; #1536]
* Misc. bug fixes and cleanups [Marco, Philip, Florian, cunidev, Jonas, Joonas;
  !758, !749, !777, !811, #1884, !823, !840, !782, !847, #1836, !852, !851,
  !788, #1916, !866, !884]

Contributors:
  Marco Trevisan (TreviÃ±o), Benjamin Berg, Philip Chimento, Milan Crha,
  Jonas DreÃŸler, Joonas Henriksson, Robert Mader, Daniel GarcÃ­a Moreno,
  Florian MÃ¼llner, Georges Basile Stavracas Neto, Joaquim Rocha, Andrew Watson,
  cunidev, monday

Translators:
  Stas Solovey [ru], Ricardo Silva Veloso [pt_BR], Yi-Jyun Pan [zh_TW],
  Umarzuki Bin Mochlis Moktar [ms]

[1] http://ftp.gnome.org/pub/gnome/sources/gnome-shell/3.34/gnome-shell-3.34.2.news

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../{gnome-shell_3.34.1.bb => gnome-shell_3.34.2.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/gnome-shell/{gnome-shell_3.34.1.bb => gnome-shell_3.34.2.bb} (91%)

diff --git a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_3.34.1.bb b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_3.34.2.bb
similarity index 91%
rename from meta-gnome/recipes-gnome/gnome-shell/gnome-shell_3.34.1.bb
rename to meta-gnome/recipes-gnome/gnome-shell/gnome-shell_3.34.2.bb
index d0b3af83d..cd8b3ad0a 100644
--- a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_3.34.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_3.34.2.bb
@@ -30,8 +30,8 @@ GTKDOC_MESON_OPTION = "gtk_doc"
 REQUIRED_DISTRO_FEATURES += "gobject-introspection-data"
 UNKNOWN_CONFIGURE_WHITELIST_append = " introspection"
 
-SRC_URI[archive.md5sum] = "2e00c22673d069d6b919b2ca1b225d89"
-SRC_URI[archive.sha256sum] = "ccd86559b9c897c219d2d2ebfdb8413efa4c1bee846427c750cb8a301b3f6d1e"
+SRC_URI[archive.md5sum] = "b01d6772917148c81d472584f6b36c83"
+SRC_URI[archive.sha256sum] = "703264db2fafe02d1db53d701cb99a4a757c46e7569e7b9d690dda009fc03b4d"
 
 PACKAGECONFIG ??= "bluetooth nm ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
 PACKAGECONFIG[bluetooth] = ",,gnome-bluetooth"
-- 
2.21.0


