Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 833A571A8B
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  6 Nov 2016 22:07:20 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id a20so2687774wme.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 Nov 2016 14:07:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=LWYGc1V/CmurzdmePTkGM/8Rv2620R8T4o4D+DWU8sE=;
	b=wgyRIaTxccBgo0DGKn9R/pzxaZcjb9ebRQJCHy5x/CMqF10dx7aSG2lysk4BVS4zpb
	ed3Optjjun6MexvKCJpoqsFHTFiW34D+pqbteyRPx+mRCgwJt+DxmwUs+2M1hiWIZgo1
	EZ/FvK/GnyIe6TXjI1ZgP3SsWgF0ZbAF5Bs+fJKjOgkJfRijifdL2xrrqUltItnJ5wyu
	annpMSblJRp0WN0F/hAov6K5uT4qZUvJK3J30SKbgSPsXqqSwYR3IdYQagHa57sZGr3s
	S0dDMBEvT/t9PM9UDcfwqzG9kbHTIYcuwrJ3UxRpuACtOlUkXOKqaumN/w/da/V+JQhF
	sKEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=LWYGc1V/CmurzdmePTkGM/8Rv2620R8T4o4D+DWU8sE=;
	b=mRD0nry8yamm/5XAIxEQGUmTLZbCX1SJgbJvu4/LlIx8XABlmkwlYk+LWqnIZV4HSe
	UNyL5rijaVhqVX+rtkpi//WdK1jOXaUHqLC0GIo/biq5fgrhM9nFOxOsO+clP3TIHygA
	WotF+U7O/vzMingCvSgY0o9XsktkH5qdo6bIZi8j+bWscKWtsi+jFPGYeY4wpEmwje8j
	1u64p7TcfWWbXgwEtsjf25PCJzKqX1NXxsb1iBXV31qS9Hcxa49XCH1ijGuJhdcLsRQl
	+5TSXGlAmi5lGSttYXS01n4ULgWd4p5frMs2M8gLfwhD9FOW+CWZEOTUV9ggljtP0oOv
	Fxuw==
X-Gm-Message-State: ABUngvek4d579g9T3WU+UMgFzhYv11fEm4+KD4Of+cuWYEd5L+z+llWAMai6U3Cz2qvvpA==
X-Received: by 10.28.214.84 with SMTP id n81mr3730414wmg.120.1478470041617;
	Sun, 06 Nov 2016 14:07:21 -0800 (PST)
Received: from localhost.localdomain (p4FDF1D71.dip0.t-ipconnect.de.
	[79.223.29.113]) by smtp.googlemail.com with ESMTPSA id
	k2sm16044363wjv.11.2016.11.06.14.07.20
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 06 Nov 2016 14:07:21 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  6 Nov 2016 23:06:52 +0100
Message-Id: <1478470013-27247-14-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1478470013-27247-1-git-send-email-schnitzeltony@googlemail.com>
References: <1478470013-27247-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 14/15] network-manager-applet: update to 1.4.2
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
X-List-Received-Date: Sun, 06 Nov 2016 22:07:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* optional gnome-bluetooth plugin seems gone
* modemmanager configure option was renamed

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...ger-applet_1.0.10.bb => network-manager-applet_1.4.2.bb} | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)
 rename meta-gnome/recipes-connectivity/network-manager-applet/{network-manager-applet_1.0.10.bb => network-manager-applet_1.4.2.bb} (54%)

diff --git a/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.0.10.bb b/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.4.2.bb
similarity index 54%
rename from meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.0.10.bb
rename to meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.4.2.bb
index 9803a83..e8c3dd6 100644
--- a/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.0.10.bb
+++ b/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.4.2.bb
@@ -11,11 +11,10 @@ inherit gnomebase gsettings gtk-icon-cache gobject-introspection
 
 GNOME_COMPRESS_TYPE = "xz"
 
-SRC_URI[archive.md5sum] = "86b17e1bf1a37c649874883b587c6db6"
-SRC_URI[archive.sha256sum] = "b045ac3eaa68ccbbefe91510ad67b4002a7e09d1e5ce1c4bf9a67619bd2cf0eb"
+SRC_URI[archive.md5sum] = "35684ee788d8d1d6f913c63bb0ada0cf"
+SRC_URI[archive.sha256sum] = "431b7b4876638c6a537c8bf9c91a9250532b3d960b22b056df554695a81e4499"
 
-PACKAGECONFIG[bluetooth] = "--with-bluetooth,--without-bluetooth,gnome-bluetooth,gnome-bluetooth"
-PACKAGECONFIG[modemmanager] = "--with-modem-manager-1,--without-modem-manager-1,modemmanager"
+PACKAGECONFIG[modemmanager] = "--with-wwan,--without-wwan,modemmanager"
 PACKAGECONFIG ??= ""
 
 do_configure_append() {
@@ -31,9 +30,5 @@ FILES_${PN} += " \
     ${datadir}/appdata \
     ${datadir}/nm-applet/ \
     ${datadir}/libnm-gtk/wifi.ui \
+    ${datadir}/libnma/wifi.ui \
 "
-
-FILES_${PN} += "${libdir}/gnome-bluetooth/plugins/*.so"
-FILES_${PN}-dev += "${libdir}/gnome-bluetooth/plugins/libnma.la"
-FILES_${PN}-staticdev += "${libdir}/gnome-bluetooth/plugins/libnma.a"
-FILES_${PN}-dbg += "${libdir}/gnome-bluetooth/plugins/.debug/"
-- 
2.5.5


