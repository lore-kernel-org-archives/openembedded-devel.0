Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id 9B3EE6011A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Feb 2017 21:30:25 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id b16so4118995qte.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Feb 2017 13:30:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=deFxRLlSWGM74nu98J2lWXgPR2+79Y4V8/N0GymPvC4=;
	b=uJbr3q5ve9Vi7KXX6wdXSveGW7e0g5wSDOfrIa7/97AlLvN6ravIYmThtwTYBZdfPq
	pVt0pt4moPX8dNqjnbQH44IuzHp0dTklrG42jkMVRhlz8bvwy9tJ8vrX3+vjVtyOLmX6
	fdfe0K586qBZAv+aGotdacaDwzeiTkkHP2+c9CNeIyhCd1xJCcyGeMT9MLk/2tGt1R0x
	+44LggNxkDXpFTjCJ+9Ut5bfTmYFpYBf44K2Ms4B6IM2gLiPEysu3ztMUHdJkIbzVM8Y
	4SUmiKyhW/fBekd7oQ+DSQuGOxsD97wV8d+j9BVh+/q9gNs6K3MtX6UFe8ascqh/38fy
	9CuQ==
X-Gm-Message-State: AMke39lzvVOCgz6eePGQ+dVJ3W6uKe+DfMrHIFahiRgZd5TBx538OnCVH3FNyt70+LrOtw==
X-Received: by 10.200.40.151 with SMTP id i23mr5480689qti.72.1487971827170;
	Fri, 24 Feb 2017 13:30:27 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-435561e0.dyn.optonline.net.
	[67.85.97.224]) by smtp.gmail.com with ESMTPSA id
	f25sm3197525qki.63.2017.02.24.13.30.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 24 Feb 2017 13:30:26 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 24 Feb 2017 16:30:20 -0500
Message-Id: <1487971820-29444-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][PATCH] usb-modeswitch: update inherit to work correctly with RSS
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
X-List-Received-Date: Fri, 24 Feb 2017 21:30:27 -0000

Resolves build issues exposed by RSS
http://errors.yoctoproject.org/Errors/Details/130620/

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-support/usb-modeswitch/usb-modeswitch-data_20140529.bb    | 4 ----
 meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.2.0.bb        | 4 ++--
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20140529.bb b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20140529.bb
index 434f68a..a265411 100644
--- a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20140529.bb
+++ b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20140529.bb
@@ -15,7 +15,3 @@ do_install() {
 RDEPENDS_${PN} = "usb-modeswitch (>= 2.2.0)"
 FILES_${PN} += "${base_libdir}/udev/rules.d/ \
                 ${datadir}/usb_modeswitch"
-
-PNBLACKLIST[usb-modeswitch-data] ?= "Runtime depends on blacklisted usb-modeswitch"
-
-PNBLACKLIST[usb-modeswitch-data] ?= "Runtime depends on blacklisted usb-modeswitch-data"
diff --git a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.2.0.bb b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.2.0.bb
index 5211d7b..0c548d8 100644
--- a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.2.0.bb
+++ b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.2.0.bb
@@ -8,6 +8,8 @@ SRC_URI = "http://www.draisberghof.de/usb_modeswitch/${BP}.tar.bz2"
 SRC_URI[md5sum] = "f323fe700edd6ea404c40934ddf32b22"
 SRC_URI[sha256sum] = "2752103de171ed5f6c8d6a6e3e73e16c9ee3e8e394dd39c5991f7680eb908a3a"
 
+inherit pkgconfig
+
 EXTRA_OEMAKE = "TCL=${bindir}/tclsh"
 
 FILES_${PN} = "${bindir} ${sysconfdir} ${nonarch_base_libdir}/udev/usb_modeswitch ${sbindir} ${localstatedir}/lib/usb_modeswitch"
@@ -17,5 +19,3 @@ RRECOMMENDS_${PN} = "usb-modeswitch-data"
 do_install() {
     oe_runmake DESTDIR=${D} install
 }
-
-PNBLACKLIST[usb-modeswitch] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130620/"
-- 
2.7.4


