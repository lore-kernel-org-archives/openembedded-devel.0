Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 224A977E20
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Apr 2017 12:43:48 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id x75so12354030wma.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Apr 2017 05:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=J6KXaGNE5e7Iro94OIBnrdfE6vuASaWcSfcG3LOWDnM=;
	b=Nkkd3V2GU8hc8pQdq0My/oJqGq3CL8FtFJQ4vvawUAhvZEg86NLbT0Fp28wZQ+LiBS
	KrVmPOjoL1IWlleTqANyDDH8xdE+6LXMcWP5ym+NrxBiteclk6T8/Q7RbKGqYMxaSt4b
	Sl7ARbbUfZHNzIPYaGlXixG/TtpV2N9a/1JXwzg8MTxqRomve7HjuihVg3iEHGA8b/Uh
	bKUvEJ/263gVur5Zup9ulixVZwXRvk0ILjIXO+uFYTaxaWfySAgwuL4CbKCzD7gLHEXf
	IE8E1o3QEjHVq+Nwd8IEsPZCgUlnGD3JdOwIYUONTCD1AKh7zSZKEqRDRPm/ABXla70k
	RTvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=J6KXaGNE5e7Iro94OIBnrdfE6vuASaWcSfcG3LOWDnM=;
	b=IXG5BTnYoGLGKO/hcOqKRb67bjRPTSdRgncZDfWzOXtGri5Bat5+qtIvTSeZrz0rmQ
	qG3+BS07nFb3bbx0UnsP3d69ZLCHgtmb2HiCs/mpl6PFf1mKOPfTmroIkObdlDY0WXsp
	/xftLbKjb8YAI0g/NwC1XoEtLOjScvH1rpZfEBQqdrURguMD7P74zPWJofVLV5ipUN7x
	b8BgGPQpbd18vkSos6CTAKUeDKu5uBFxC+CLyJWhmlH3fn1qI3eC5/WReyDXNIXh72Nj
	LZmMBe7VoYR4HpBZbjXE5fCT9PS117FG18PRaCzW0m2E0UnY/zaDl5dH/USlRQ/an9IH
	qIpg==
X-Gm-Message-State: AN3rC/6JJz9FCbXlMf6Ly4NzqcFAsLq18+3MAFcRdyT0URRWxqpH/OmD
	PzFvD/KGhyU0EcFa
X-Received: by 10.28.107.129 with SMTP id a1mr25567245wmi.47.1492087429692;
	Thu, 13 Apr 2017 05:43:49 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	([2003:46:e911:f105:1e6f:65ff:fe3e:7f61])
	by smtp.googlemail.com with ESMTPSA id
	t24sm1842834wra.44.2017.04.13.05.43.49
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 13 Apr 2017 05:43:49 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Apr 2017 14:43:22 +0200
Message-Id: <20170413124323.22507-2-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170413124323.22507-1-schnitzeltony@googlemail.com>
References: <20170413124323.22507-1-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] openzone: make build and unblacklist
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
X-List-Received-Date: Thu, 13 Apr 2017 12:43:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-xfce/recipes-art/cursor-themes/openzone_1.2.3.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-xfce/recipes-art/cursor-themes/openzone_1.2.3.bb b/meta-xfce/recipes-art/cursor-themes/openzone_1.2.3.bb
index 802b5d4..df0ed50 100644
--- a/meta-xfce/recipes-art/cursor-themes/openzone_1.2.3.bb
+++ b/meta-xfce/recipes-art/cursor-themes/openzone_1.2.3.bb
@@ -3,9 +3,8 @@ HOMEPAGE = "http://xfce-look.org/content/show.php/OpenZone?content=111343"
 SECTION = "x11/wm"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a2f562fb8fb1e138b810d69521c4bcd7"
-DEPENDS = "icon-slicer-native xcursorgen-native"
 
-inherit allarch
+inherit allarch gtk-icon-cache
 
 SRC_URI = "http://xfce-look.org/CONTENT/content-files/111343-OpenZone-${PV}.tar.xz"
 SRC_URI[md5sum] = "4dae968cbd525072664ef7a4fc7c4154"
@@ -13,6 +12,9 @@ SRC_URI[sha256sum] = "dc20f97a49e1ff1becf7853ef5f137ed30a4c27490540e755021d78d33
 
 S = "${WORKDIR}/OpenZone"
 
+do_compile() {
+}
+
 do_install() {
     install -d ${D}${datadir}/icons
     for theme in `find -name '*.tar.xz'`; do
@@ -27,5 +29,3 @@ python populate_packages_prepend () {
 
 PACKAGES_DYNAMIC += "^openzone-.*"
 ALLOW_EMPTY_${PN} = "1"
-
-PNBLACKLIST[openzone] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130682/ - the recipe will be removed on 2017-09-01 unless the issue is fixed"
-- 
2.9.3


