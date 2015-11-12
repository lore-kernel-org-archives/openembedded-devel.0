Return-Path: <mbc@koumoul.net>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 70198771CF
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Nov 2015 05:11:21 +0000 (UTC)
Received: by wmww144 with SMTP id w144so72308005wmw.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Nov 2015 21:11:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=koumoul.net; s=dkim;
	h=sender:from:to:cc:subject:date:message-id;
	bh=RCZ2jATWdrRb686r7q3+D/6VuWqAt7O/hu5V2e+36aU=;
	b=BYM1F0h/csbZUwHiJcjMfqyS1JaoDd0GJnKOv79Df99iMExjHWzk7ScRsIRU0aur62
	ETwLOTgxltDuR7t5A4semZXxs+5tAZscN++ifrotK9vY/86pW9J+bxd3EG2HNY9jbP6L
	gqvBPPJCG92r3CCgLhXXVCICioKUnSh3Y4gLo=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=iot_bzh.20150623.gappssmtp.com; s=20150623;
	h=sender:from:to:cc:subject:date:message-id;
	bh=RCZ2jATWdrRb686r7q3+D/6VuWqAt7O/hu5V2e+36aU=;
	b=Hb8x2M7j5D0DAdFnrCEjgnbsCK9zFCwz5uhUvd4xhnloTPzO13X0LQ/9gIeKf7BzHP
	RGv6smn77VkFqt+npc7iu6Wm/91Q8JhoKWGoHZ3oCn0Ga7ZXjxJeDIyWdFcjtnbkiBMk
	95/qHYRwxibBPRECFx46BBUEhScBrewAHXqGRbszpnbcdCLj4xI+vrMYByn5YNQXQae+
	cdemT4He8waWOgOZ+dZDAD0yxkp+mgvLwV7lrhwvtp79qHhIZ8xueRgEy2hGO3twKk2l
	jcifAiyC4Jl8IkqcP8/Om8YOMd8vg4CzMUndDVwgPn+kIjdk2AJj6e+No2vC7EL4uqd0
	uTfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=RCZ2jATWdrRb686r7q3+D/6VuWqAt7O/hu5V2e+36aU=;
	b=NIUZXZaHuCXQkayVT7BZRRJXDFWXJ++1gTObXycxo5NqtQsPg08fvBrnp6tOapijOI
	2wcF1Cdaqa4tgny/pLcUlK2SRBiSdyYpjr51SS1nEKtv0zDxZrAU20MIl0syTp/J8Gbh
	9k7azdxOOqlLkfgCAiR62/jhFU9rwBrNnSuzQvQuRjhKG8AJ+BVxxIkLG6ROoghpO9T5
	pe4YiQkJZZEhz531u+rAsNPbdMpNbh1epS4d+TVFQ+zr1ITxZOcqJUfZOEMD8Yn2eCq8
	E/BgiLZ0Z8VjziDhzkiCnfzzeoarJ/otJJ0foGLDSqoKpxq+TH7DZmhnl8hUFRScfQTB
	ZuLA==
X-Gm-Message-State: ALoCoQng2DnT77imY4yuc2MVtpz3WG9QH+SSeJW8rRnTlAxkhEHfqwzYZXRRzpUR7iGtv5nZvyVj
X-Received: by 10.194.92.170 with SMTP id cn10mr15353543wjb.12.1447305081601; 
	Wed, 11 Nov 2015 21:11:21 -0800 (PST)
Received: from localhost.localdomain
	(ARennes-655-1-234-219.w86-214.abo.wanadoo.fr. [86.214.17.219])
	by smtp.gmail.com with ESMTPSA id
	jh4sm12351402wjb.33.2015.11.11.21.11.20
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 11 Nov 2015 21:11:21 -0800 (PST)
Sender: "Manuel Bachmann [ IoT.bzh ]" <mbc@koumoul.net>
From: Manuel Bachmann <manuel.bachmann@iot.bzh>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Nov 2015 06:15:07 +0100
Message-Id: <1447305307-4789-1-git-send-email-manuel.bachmann@iot.bzh>
X-Mailer: git-send-email 1.8.3.1
Subject: [meta-multimedia][PATCH 2/4] dleyna-connector-dbus: Add recipe
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
X-List-Received-Date: Thu, 12 Nov 2015 05:11:22 -0000

dleyna-connector-dbus is a D-Bus connector library
depending on "dleyna-core", and needed by dLeyna
implementations (most notably "dleyna-server" and
"dleyna-renderer"). It allows them to discover D-Bus
buses, and to be started via D-Bus services files.

Signed-off-by: Manuel Bachmann <manuel.bachmann@iot.bzh>
---
 .../dleyna/dleyna-connector-dbus_0.3.0.bb              | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/dleyna/dleyna-connector-dbus_0.3.0.bb

diff --git a/meta-multimedia/recipes-multimedia/dleyna/dleyna-connector-dbus_0.3.0.bb b/meta-multimedia/recipes-multimedia/dleyna/dleyna-connector-dbus_0.3.0.bb
new file mode 100644
index 0000000..f23bc6c
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/dleyna/dleyna-connector-dbus_0.3.0.bb
@@ -0,0 +1,18 @@
+SUMMARY = "D-Bus connector for dLeyna libraries"
+HOMEPAGE = "https://01.org/dleyna/"
+
+LICENSE = "LGPLv2.1+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
+                    file://src/connector-dbus.c;endline=21;md5=0a1695cef53beefc36651de439f643b5"
+
+DEPENDS = "glib-2.0 dbus dleyna-core"
+
+SRC_URI = "git://github.com/01org/${BPN}.git"
+SRCREV = "de913c35e5c936e2d40ddbd276ee902cd802bd3a"
+S = "${WORKDIR}/git"
+
+inherit autotools pkgconfig
+
+FILES_${PN} += "${libdir}/dleyna-1.0/connectors/*.so"
+FILES_${PN}-dev += "${libdir}/dleyna-1.0/connectors/*.la"
+FILES_${PN}-dbg += "${libdir}/dleyna-1.0/connectors/.debug/*.so"
-- 
1.8.3.1


