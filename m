Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wg0-f49.google.com (mail-wg0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 177126CE09
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Jan 2014 19:32:41 +0000 (UTC)
Received: by mail-wg0-f49.google.com with SMTP id a1so8273434wgh.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Jan 2014 11:32:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=bfPQEHbIdFu1tw2NH42Nge4+6g9J5FKnUB5fiwUTPvQ=;
	b=TUeXXHl8wvwbm7VvbJ+5gvvHRlX24rZ5QexTmixDkOxRqyD1yiyzei7BaUkD3gRouk
	KGNVa06lGf2APG7H00hTWqkDJwWd82fjzIHXf7AhafyrPx8p89I1ivWUr0I5mDvfQGjG
	kCZgbpATeLRCV0v76Q5wT2xYshOWzZmlRiq0C8fEKsrROM8WeNm2hxI+A0pi8gMwDn+/
	rzH8Lyi2pTLTXfSlRDFiIS9grIq3V7aOQeuFMpHgN3xwTjV1RTVrV02n9FFyDJFX7ezD
	jlqm8TmDsHLwsxmt8FmCiDQVjY+H/itkpegBnU6XoQuYWXKmcF9NDHLzEqCo6W52CssW
	4HWw==
X-Gm-Message-State: ALoCoQnJjQlH+asSc09DmGqBEJvQ36pKQJNjzuBYBV/8kq2vM5J+DUpX/hEO/C/KDxJ107BMlhuK
X-Received: by 10.180.85.6 with SMTP id d6mr16172369wiz.48.1390332762508;
	Tue, 21 Jan 2014 11:32:42 -0800 (PST)
Received: from localhost ([2001:610:612:0:21f:c6ff:feaa:c5fb])
	by mx.google.com with ESMTPSA id fz5sm502501wic.11.2014.01.21.11.32.40
	for <multiple recipients>
	(version=TLSv1.1 cipher=RC4-SHA bits=128/128);
	Tue, 21 Jan 2014 11:32:41 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 21 Jan 2014 20:32:28 +0100
Message-Id: <1390332748-31444-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][PATCH] xf86-video-ati: recommend linux-firmware
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
X-List-Received-Date: Tue, 21 Jan 2014 19:32:42 -0000

Technically it won't work without, but it's possible to build the firmware into the kernel, so use RRECOMMENDS.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-oe/recipes-graphics/xorg-driver/xf86-video-ati_7.2.0.bb |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-video-ati_7.2.0.bb b/meta-oe/recipes-graphics/xorg-driver/xf86-video-ati_7.2.0.bb
index a453f90..d4d9591 100644
--- a/meta-oe/recipes-graphics/xorg-driver/xf86-video-ati_7.2.0.bb
+++ b/meta-oe/recipes-graphics/xorg-driver/xf86-video-ati_7.2.0.bb
@@ -9,6 +9,7 @@ DESCRIPTION = "Open-source X.org graphics driver for ATI Radeon graphics"
 DEPENDS += "virtual/libx11 libxvmc drm xf86driproto glproto \
             virtual/libgl xineramaproto libpciaccess"
 RDEPENDS_${PN} += "xserver-xorg-module-exa"
+RRECOMMENDS_${PN} += "linux-firmware"
 
 COMPATIBLE_HOST = '(i.86|x86_64).*-linux'
 
-- 
1.7.10


