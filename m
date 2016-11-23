Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 341B471AB8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Nov 2016 09:22:26 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id x23so663723pgx.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Nov 2016 01:22:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=aGYn92IobpcaHdbiHMTA2GuZCb7f1/A2Bx5400RBGZQ=;
	b=Z7Nw62MmfZNA+CSw2w9wGJe6wdKraggcFxWJC8kOaX7nRWN+blJeP+91uSmxD6ZOjD
	kxt7Q6cp5DMh0zxRFo7apgaDgrHVXlWR2JiB89A0XrY4iHaoGMCmfYnqmqEez6qPBuAo
	yuIL6xB/Eyah9jUFnLg+2P/8LoJmSEoMvkGXJf4Pt0fpRZlCMmNHJEbt5TxzxFN05SNb
	kn7MptH663JX+z9qeXeths4qps3fgIEsaq5Z81dhXVAiVZUnJ2fWv6m4XKk7dpekA18a
	DgheWrQvv/3bupgFgbpfB+Ep7UQHRImCST7ra8rfHPaDTyqFDNq1uPtx6c6KOTAuIYlm
	kssA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=aGYn92IobpcaHdbiHMTA2GuZCb7f1/A2Bx5400RBGZQ=;
	b=b1iW1r5j5Z6N7rsiz55ziJp6daFS/Chn++cCcnLcB+kL/V38d+fHdZCAV2o/3FBham
	o8AS4igjMd3kstcH77Fm4ufopHkQfajThXArSUntYAwZhiFXEToHdFPBeJ2q2OObCz/J
	RNznL+NUmXFxni13LKhfPD+wSjiQ782PDimvyRg3xVVkan1YbmHBol+Vj7jVKRv6+1kl
	XbYVpJZfo7ybV5wWLH4H31GrGilziz1l1KaznhsW2D9CQ472G6upQro0kRhvWmMOBGlA
	+wBfcUYOF1iMPwTAnhPGww9HmVT/tkP5wlvoguzsVznRLKIHTeP6xZY3RaHDrMkKsya8
	mYcQ==
X-Gm-Message-State: AKaTC00ZE0mZ7z6O+lKYAGmwNT16QnqDsrMP0ciyjfCItfyg5GyfuMvSjr8Yiz/TnyPyhA==
X-Received: by 10.84.213.144 with SMTP id g16mr4642220pli.134.1479892947774;
	Wed, 23 Nov 2016 01:22:27 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	u23sm51056087pfg.86.2016.11.23.01.22.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Nov 2016 01:22:27 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 23 Nov 2016 01:21:34 -0800
Message-Id: <20161123092209.23699-14-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20161123092209.23699-1-raj.khem@gmail.com>
References: <20161123092209.23699-1-raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH 14/49] kodi-17: Add packageconfig for lcms support
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
X-List-Received-Date: Wed, 23 Nov 2016 09:22:26 -0000

Keep it disabled by default, makes builds more
deterministic

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-multimedia/recipes-mediacenter/kodi/kodi_17.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-multimedia/recipes-mediacenter/kodi/kodi_17.bb b/meta-multimedia/recipes-mediacenter/kodi/kodi_17.bb
index 22b23c6..05d9975 100644
--- a/meta-multimedia/recipes-mediacenter/kodi/kodi_17.bb
+++ b/meta-multimedia/recipes-mediacenter/kodi/kodi_17.bb
@@ -95,6 +95,7 @@ PACKAGECONFIG[vdpau] = "--enable-vdpau,--disable-vdpau,libvdpau"
 PACKAGECONFIG[mysql] = "--enable-mysql,--disable-mysql,mysql5"
 PACKAGECONFIG[x11] = "--enable-x11,--disable-x11,libxinerama libxmu libxrandr libxtst"
 PACKAGECONFIG[pulseaudio] = "--enable-pulse,--disable-pulse,pulseaudio"
+PACKAGECONFIG[lcms] = "--enable-lcms2,--disable-lcms2,lcms"
 
 EXTRA_OECONF_append_rpi = " --disable-openmax --enable-player=omxplayer --with-platform=raspberry-pi2"
 LDFLAGS_append_rpi = " -lvchostif "
-- 
2.10.2


