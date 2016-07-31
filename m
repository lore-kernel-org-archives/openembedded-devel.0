Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id DA73260132
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 31 Jul 2016 02:15:28 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id x83so21109795wma.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Jul 2016 19:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=4f787TV+WaThkJzinW8V626GwkOYZm7NRYClKDrMsx4=;
	b=Q0kgpf4Yj3dBJzAxoWCtSActP0O/tSKbyxxwnhxzcAL67TW6I7R8ARMjfFTrEbHy3q
	VFTJN3boGUxBxxZgGe/nHGbD07+mM/04hhqpoX9f/fNuB1TRufKnYOl1CDMOpymtDCzx
	AE3kXpWjtb2W3PhAaVMKNisPLt3ycfDtmLZZYtt3R2ZAeXtANd2erSQgdcrsGEnBhdY7
	cO1wdXZTt6Hm2Y1EpXzS+bJcltUswPm1q7TWuG+0Ezg/pyZhx4f7DGYb7n/WSwEDFqKg
	jBtVmdoEoXStYvbu+l/ZCCpDut1CQSohGEXWjDFFxNFYiYPwhuxBs78GR4styTQiLG2c
	QPGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=4f787TV+WaThkJzinW8V626GwkOYZm7NRYClKDrMsx4=;
	b=V0ycOxRGINOQqTwCtcbE354ea2r3RDdTXBxHE5b2ZQO342DHEeDdhw7Cnp2j+f+e66
	DseayRlkgvymFvvsRv5L2A8cXrubhcIVK64W/KknldNm1qxMzxl9sCqsLf1XRlIyTgpI
	zREqUMAz5/6RWIXtG4DrBW5+fxYzZ35/Fd12Hl5KnBhqwUd0BvclABESesStclIuqoU9
	hqOtCTpdraAmvfYL2dbtsXNPHF+cxQL7jJ08lj7W1r8BLYYEWhKvOuLRdqQ4/KmLd1mO
	/epSWpOELr/5Icf/B/7ftcLJ8ujP7YBEAKnRo1y+PDn5ENLyjMcp+8uRHiCJEXpCeqkl
	yOzg==
X-Gm-Message-State: AEkoouvoInsvsDEaimYy1meMLEE+4ZlOmwofZIglO7jRz4YtPdZyKLDLZ2KR3us8y4LfBg==
X-Received: by 10.28.51.210 with SMTP id z201mr7573912wmz.98.1469931328675;
	Sat, 30 Jul 2016 19:15:28 -0700 (PDT)
Received: from localhost.localdomain (p5B0A0B1C.dip0.t-ipconnect.de.
	[91.10.11.28]) by smtp.googlemail.com with ESMTPSA id
	r16sm10078788wme.16.2016.07.30.19.15.27
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 30 Jul 2016 19:15:28 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 31 Jul 2016 04:15:03 +0200
Message-Id: <1469931304-13906-4-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1469931304-13906-1-git-send-email-schnitzeltony@googlemail.com>
References: <1469931304-13906-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 4/5] modemmanager: update to 1.6.0 and unblacklist - libqmi was fixed
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
X-List-Received-Date: Sun, 31 Jul 2016 02:15:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../{modemmanager_1.4.12.bb => modemmanager_1.6.0.bb}          | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)
 rename meta-oe/recipes-connectivity/modemmanager/{modemmanager_1.4.12.bb => modemmanager_1.6.0.bb} (83%)

diff --git a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.4.12.bb b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.6.0.bb
similarity index 83%
rename from meta-oe/recipes-connectivity/modemmanager/modemmanager_1.4.12.bb
rename to meta-oe/recipes-connectivity/modemmanager/modemmanager_1.6.0.bb
index 00b85ff..e26c227 100644
--- a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.4.12.bb
+++ b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.6.0.bb
@@ -7,18 +7,16 @@ LIC_FILES_CHKSUM = " \
     file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c \
 "
 
-inherit gnomebase gettext systemd vala gobject-introspection
+inherit gnomebase gettext systemd vala gobject-introspection bash-completion
 
-DEPENDS = "glib-2.0 libgudev dbus-glib"
+DEPENDS = "glib-2.0 libgudev dbus-glib intltool-native"
 
 SRC_URI = "http://www.freedesktop.org/software/ModemManager/ModemManager-${PV}.tar.xz"
-SRC_URI[md5sum] = "66cc7266b15525cb366253e6639fc564"
-SRC_URI[sha256sum] = "7ef5035375a953b285a742591df0a65fd442f4641ce4d8f4392a41d6d6bc70b3"
+SRC_URI[md5sum] = "d9d93d2961ee35b4cd8a75a6a8631cb4"
+SRC_URI[sha256sum] = "a94f4657a8fa6835e2734fcc6edf20aa8c8d452f62299d7748541021c3eb2445"
 
 S = "${WORKDIR}/ModemManager-${PV}"
 
-PNBLACKLIST[modemmanager] ?= "Depends on broken libqmi"
-
 PACKAGECONFIG ??= "mbim qmi polkit \
     ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} \
 "
-- 
2.5.5


