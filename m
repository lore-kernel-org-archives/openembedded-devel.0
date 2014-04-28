Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ee0-f47.google.com (mail-ee0-f47.google.com [74.125.83.47])
	by mail.openembedded.org (Postfix) with ESMTP id 76AB665EC1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Apr 2014 07:38:23 +0000 (UTC)
Received: by mail-ee0-f47.google.com with SMTP id b15so4528843eek.34
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Apr 2014 00:38:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=iwCtlHoWvVyEC2gwCTK6t5teC6yMthftyNY9p+YPRIU=;
	b=BZmULVo7HZ+5x0fCDNN5tyhgmAV8jZ57s7O681AbKbL5R2ib7tnsnjxbuCekyIkZ7M
	VIfvfS7Rqt9H+bWBHwjcYgMSn05pzklWHiJyIQjwQsOzwMuA6gXLUXOuknhX2h5PdLjx
	RIqBhlC5T/RUOig6OKdqiULnkCqGeOCSkuoRNUOXYegDgTy93ZHLZAtYnpA8+rZFTzk+
	vPZ1elTGH9ed7iNfEjSJzS/9GvTJ0UYA5ZyJyQ7db8WOincuA9yyxcwKECOb1bXGBZ3n
	o7TzetNNcRhwGIBXeo3wRCUk48VxjSK+ox5xlKYBeG7+Rb+zxUGLIayrB5lTgEe6zM8e
	73ew==
X-Gm-Message-State: ALoCoQku/3MRYs9oEJYjEKSiKf/Vw72Ta5Mpu+IcW/UziVCNRZ4ooDVrAX750A3I2h5FUV1DSmHx
X-Received: by 10.14.98.69 with SMTP id u45mr361197eef.81.1398670703813;
	Mon, 28 Apr 2014 00:38:23 -0700 (PDT)
Received: from localhost ([2001:610:612:0:beee:7bff:fe9e:ae56])
	by mx.google.com with ESMTPSA id
	bc51sm48032853eeb.22.2014.04.28.00.38.22 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 28 Apr 2014 00:38:23 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 28 Apr 2014 09:38:17 +0200
Message-Id: <1398670697-18323-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.9.0
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][PATCH] jack: move to git
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
X-List-Received-Date: Mon, 28 Apr 2014 07:38:27 -0000

The subversion repository has been closed down.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-oe/recipes-multimedia/jack/jack_0.121.0.bb | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-multimedia/jack/jack_0.121.0.bb b/meta-oe/recipes-multimedia/jack/jack_0.121.0.bb
index b255cef..e7a0ee1 100644
--- a/meta-oe/recipes-multimedia/jack/jack_0.121.0.bb
+++ b/meta-oe/recipes-multimedia/jack/jack_0.121.0.bb
@@ -12,14 +12,13 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c030468238b2cf89925a57f2780396a7 \
 
 DEPENDS = "alsa-lib libsamplerate0 readline"
 
-SVNPV = "${@'${PV}'.replace('.', '_')}"
-SRCREV = "4484"
-SRC_URI = "svn://subversion.jackaudio.org/jack/tags;module=RELEASE_${SVNPV};protocol=http \
+SRCREV = "91a688c602b7ce1711d8ad10fb07ebcf2e530a64"
+SRC_URI = "git://github.com/jackaudio/jack1.git \
            file://remove-wrong-host-test.patch \
            file://jack_fix_TWL4030_alsa_capture.patch \
 "
 
-S = "${WORKDIR}/RELEASE_${SVNPV}"
+S = "${WORKDIR}/git"
 
 inherit autotools
 
-- 
1.9.0


