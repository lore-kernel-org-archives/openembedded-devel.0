Received: from mail-ee0-f50.google.com ([74.125.83.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1UWAE4-0004Yn-4r
	for openembedded-devel@lists.openembedded.org;
	Sat, 27 Apr 2013 20:52:02 +0200
Received: by mail-ee0-f50.google.com with SMTP id b15so1047399eek.9
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Apr 2013 11:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=z5sIc6+Exo/UtNM56urpIubg3+AX+Kru5vH1k0Hu/ts=;
	b=EJf3Wk8Xr8PyRgqY9Q5jln/1m6gpzes+vPvLi96vZWb0y4DDD3Uo/5DILhIyqc5SQQ
	firCZuN2u4DYzF84L5Ie1v9Nv+3qifb+SnnlmYg2WeecnvfBNuzliQlk0lm2JM6A7EB1
	vesYPFBEVBpAQ5KTKtlgxYHo82GyP4pEiuF4MhDHBTAvDTJyL+5ZCGE7/LOXhAGazB5C
	tS1NMtL+zsfWUDyVy2FDGqVqGl3RlQsYiofNLhsAfWMbk+e7DJMkMjMtXGNOVIiyu9RV
	thjAzOHjAJ//86OWDi3BwPikCk2/uD4D/WpPeFV+h6WMBGMnjDP0fxoLWzkkeysRjclz
	2YyQ==
X-Received: by 10.15.23.69 with SMTP id g45mr8362373eeu.25.1367087653816;
	Sat, 27 Apr 2013 11:34:13 -0700 (PDT)
Received: from localhost.localdomain (p5B0A212D.dip0.t-ipconnect.de.
	[91.10.33.45])
	by mx.google.com with ESMTPSA id f9sm23175879eeu.11.2013.04.27.11.34.13
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Sat, 27 Apr 2013 11:34:13 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 27 Apr 2013 20:34:00 +0200
Message-Id: <1367087640-4264-5-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1367087640-4264-1-git-send-email-schnitzeltony@googlemail.com>
References: <1367087640-4264-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-gnome/meta-xfce 4/4] xfce4-session: remove unconditional consolekit RDEPENDS and use PACKAGECONFIG
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
X-List-Received-Date: Sat, 27 Apr 2013 18:52:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../xfce4-session/xfce4-session_4.10.0.bb          |    9 ++++++---
 1 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.10.0.bb b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.10.0.bb
index 8de95ee..bbe92e8 100644
--- a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.10.0.bb
+++ b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.10.0.bb
@@ -3,9 +3,8 @@ SECTION = "x11"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=9ac2e7cff1ddaf48b6eab6028f23ef88"
 DEPENDS = "virtual/libx11 libsm libxfce4util libxfce4ui gtk+ libwnck dbus dbus-glib xfconf"
-DEPENDS += "${@base_contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
-RDEPENDS_${PN} = "netbase xinit dbus-x11 iceauth consolekit upower"
-PR = "r6"
+RDEPENDS_${PN} = "netbase xinit dbus-x11 iceauth upower"
+PR = "r7"
 
 inherit xfce update-alternatives
 
@@ -25,6 +24,10 @@ pkg_postinst_${PN} () {
     echo 127.0.0.1    ${MACHINE} >> /etc/hosts
 }
 
+PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES','systemd','systemd','consolekit',d)}"
+PACKAGECONFIG[systemd] = "--enable-systemd, --disable-systemd, polkit, systemd"
+PACKAGECONFIG[consolekit] = ",,,consolekit"
+
 FILES_${PN} += "${libdir}/xfce4/*/*/*.so \
                 ${libdir}/xfce4/session/*-*-* \
                 ${datadir}/xsessions \
-- 
1.7.4.4



