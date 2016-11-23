Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id F0E4071AAB
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Nov 2016 09:22:22 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id x23so663628pgx.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Nov 2016 01:22:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=OsVpkBsRSAOcZ5Td2ses+iweiY8V7s0nlBi1tY47wg8=;
	b=kZc0+M/9eAouU9vk3CBBXiRBSVlWtWVGQ4F4WQFNWSo6YIDfOant65aIdL0QyvrTqa
	XSPtJxpWiGnOKxnUGpIXPUggCR1XIG+nCrWS53OPsn5Kv+0BFBVqsT0xpfkHvaUY+vyn
	QiJW8F8KOOoBRigJAMtB988uTriel8epeo5xgOhxgxovt9pcdrSR56cyO6g8Z7BmanuC
	EWNERKVg/flvum4paBOfOFkn6mUAAUGNYuHyJGcTjaWKfxMblDM8/PW4Yvr1MlmpQTop
	c2EzZ2rPtAD68uNuPHmxLucytICwei9GSBX8XlOS/ww/UAioPoSO9OV+F3slgKwRD95R
	lO5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=OsVpkBsRSAOcZ5Td2ses+iweiY8V7s0nlBi1tY47wg8=;
	b=govknsQOJ+B0HfuTmhZG3+xW3it80PC2PJv9vVypCCKIGrqWz/akM6ZxIMN9Pd4OeC
	5hjqV+Kj0n7o04al/s+lMLsTN1sCpZB5YSGgbkTAfsPVAbsxKGGE112S7gNYgFzY4eDZ
	58eW4MQxIZeDz6LvomuEQsL3YY0I10GME26hOB0Ejupw3gSqhAQGS4aiUtllyzA5sl5t
	2Y93PjYgQcsmCj/VWUU917kUNWbcQENleVWo3LU72wNChLVYZS3KE3TXZQBSDKqM68aK
	G9IORA7X2a+EW460GYQNV04T9M+xsPkV2/fNxUarjfScZ0OV7RxH2BoI+RVCPqp14WUN
	z7Qg==
X-Gm-Message-State: AKaTC02eS/SozhOMs5XtVokIlJeoLz6w18enVYBEoJpQ4lYPGAEo2p68L04Q07DO2ykjeQ==
X-Received: by 10.99.1.132 with SMTP id 126mr3513521pgb.129.1479892944745;
	Wed, 23 Nov 2016 01:22:24 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	u23sm51056087pfg.86.2016.11.23.01.22.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Nov 2016 01:22:24 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 23 Nov 2016 01:21:30 -0800
Message-Id: <20161123092209.23699-10-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20161123092209.23699-1-raj.khem@gmail.com>
References: <20161123092209.23699-1-raj.khem@gmail.com>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][PATCH 10/49] libvdpau: Add recipe
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
X-List-Received-Date: Wed, 23 Nov 2016 09:22:23 -0000

From: Koen Kooi <koen@dominion.thruhere.net>

Needed for x86 machines

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-graphics/vdpau/libvdpau_git.bb | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/vdpau/libvdpau_git.bb

diff --git a/meta-oe/recipes-graphics/vdpau/libvdpau_git.bb b/meta-oe/recipes-graphics/vdpau/libvdpau_git.bb
new file mode 100644
index 0000000..31f4df4
--- /dev/null
+++ b/meta-oe/recipes-graphics/vdpau/libvdpau_git.bb
@@ -0,0 +1,23 @@
+SUMMARY = "Video Decode and Presentation API for UNIX"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=83af8811a28727a13f04132cc33b7f58"
+
+DEPENDS = "virtual/libx11 libxext dri2proto"
+
+PV = "1.1.1+git${SRCPV}"
+
+SRCREV = "a21bf7aa438f5dd40d0a300a3167aa3d6f26dccc"
+SRC_URI = "git://anongit.freedesktop.org/vdpau/libvdpau"
+
+S = "${WORKDIR}/git"
+
+inherit autotools pkgconfig
+
+do_install_append() {
+    rm -f ${D}${libdir}/*/*.la
+}
+
+FILES_${PN}-dbg += "${libdir}/vdpau/.debug"
+FILES_${PN}-dev += "${libdir}/vdpau/lib*${SOLIBSDEV}"
+FILES_${PN} += "${libdir}/vdpau/lib*${SOLIBS}"
-- 
2.10.2


