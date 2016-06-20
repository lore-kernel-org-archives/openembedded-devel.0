Return-Path: <koen.kooi@linaro.org>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id D562B6FFAB
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Jun 2016 09:27:37 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id 187so5575531wmz.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Jun 2016 02:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=UGC7YwrE68xxY6siVGFwVyfb2RbE1EwZJQCWjnNF+YI=;
	b=fNz6AYd9ShghKPyXSuDzT7YYeUW6Cm/lK3YfiYBIrCT++T6cAN2uBVTP+/f4dV46gN
	+rxccML/l0Q5l0eo8kuY/wI/fTYgkiak+cmxCokC40pVeMT2PehJcIrG2C5sXjc9prlJ
	L+Nsx0cPJDpf3dKJGoeZGj1HnT8uj9k/Jl/TM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=UGC7YwrE68xxY6siVGFwVyfb2RbE1EwZJQCWjnNF+YI=;
	b=DvRFFPbyVkXclvcVOjILS1b6ecavgjL69p8iUJ2Jv+Mn0cJ8hcByV7HnO/Ss1+ioYz
	8dJwCBUiu8oVsikS/yHUK/FcaFGC1LUtuOqL3tnzHjDu9KDvE7wl5zgSiF2uNXJPCld6
	zOPXGmeBc9AYs7tuf3f6B9T5agxtsnP3X9bvJUoSJObWXa1W3Me82qrMznUvSN2bS9cG
	2/AS3uvviBfT3U0G3LsATalq+wyFLga9s6b6Nok/hIbFIxy2UplFJAZ7qrvsMm88eMQP
	fn1cuU/y3R9NKdoXeB/YnGYkcmm6DOZPnungbhEGDpWSppdBKUwhoSWzgik4cJOtfXuI
	thcw==
X-Gm-Message-State: ALyK8tL0kAJSzz/ABFoBYrli6mBfqHZ2cPw7c3zLkp4iluTLg0OC92W9pl1bFNC3MZs34Asj
X-Received: by 10.28.152.202 with SMTP id a193mr10329655wme.98.1466414857410; 
	Mon, 20 Jun 2016 02:27:37 -0700 (PDT)
Received: from thinkpad.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174]) by smtp.gmail.com with ESMTPSA id
	g10sm40712405wjl.25.2016.06.20.02.27.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Jun 2016 02:27:36 -0700 (PDT)
From: Koen Kooi <koen.kooi@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Jun 2016 11:27:32 +0200
Message-Id: <1466414852-20393-1-git-send-email-koen.kooi@linaro.org>
X-Mailer: git-send-email 2.4.3
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: [meta-oe][PATCH] fwts: update to latest git and fix build with gcc 5
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
X-List-Received-Date: Mon, 20 Jun 2016 09:27:38 -0000

License checksum change due to 2014->2016 changes. Fix build with gcc 5 by removing -Wno-werror:

	cc1: error: -Werror=misleading-indentation: no option -Wmisleading-indentation

Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
---
 meta-oe/recipes-test/fwts/fwts_git.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-test/fwts/fwts_git.bb b/meta-oe/recipes-test/fwts/fwts_git.bb
index 197fe20..cbc33d3 100644
--- a/meta-oe/recipes-test/fwts/fwts_git.bb
+++ b/meta-oe/recipes-test/fwts/fwts_git.bb
@@ -3,11 +3,11 @@ DESCRIPTION = "The tool fwts comprises of over fifty tests that are designed to
 HOMEPAGE = "https://wiki.ubuntu.com/Kernel/Reference/fwts"
 
 LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://src/main.c;beginline=1;endline=16;md5=deb8af5388e838d133eaa036f4d1496f"
+LIC_FILES_CHKSUM = "file://src/main.c;beginline=1;endline=16;md5=31da590f3e9f3bd34dcdb9e4db568519"
 
-PV = "14.12.00"
+PV = "16.05.01"
 
-SRCREV = "efc18d16294f492b7f72bba64344b2eed50e6a69"
+SRCREV = "4d9500d1fb119e2136e07c0cc2844f51b5e5b97a"
 SRC_URI = "git://kernel.ubuntu.com/hwe/fwts.git"
 
 S = "${WORKDIR}/git"
@@ -16,7 +16,7 @@ DEPENDS = "libpcre json-c glib-2.0"
 
 inherit autotools-brokensep
 
-CFLAGS += "-I${STAGING_INCDIR}/json-c -Wno-error=misleading-indentation"
+CFLAGS += "-I${STAGING_INCDIR}/json-c"
 
 FILES_${PN} += "${libdir}/fwts/lib*${SOLIBS}"
 FILES_${PN}-dev += "${libdir}/fwts/lib*${SOLIBSDEV} ${libdir}/fwts/lib*.la"
-- 
2.4.3


