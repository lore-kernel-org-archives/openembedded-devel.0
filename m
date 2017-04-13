Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 95E6377E26
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Apr 2017 12:43:49 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id q125so12340082wmd.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Apr 2017 05:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=LfUhoRZL5wLkGRw+uxNFNels07fKXfxTHMSuYjZyjYI=;
	b=K5IzIRuIl23/RUGK7DDk6fU/us2XRaetyl5ouFghcZWetmo5kTsyLJYeiahJTZGziR
	vFkp0o7a0KERR7CJ4qG/x0F+wfPmYjG6uNi/J2riqna2QCRO+cyXGop6qloOHLWkvNXt
	jpWKFMvxFOKdommWtgqB3psmS68MhYD0vEXoN8GRb7PpUB3EcUuhqWsHE/g4kIOAKzbL
	L7SizMM/zUtBSeVIFIUmslJHAjmPDrxqtqLwcOj1VaFGnovskxZPSYKK4nwuKqjbpo/I
	U2v6ngc4EKpVYkYZs1t+/dYnYW8VHVJNAYz6D4kVSXdJGXMpAQCmlIejrTjGB58C2sEq
	aNzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=LfUhoRZL5wLkGRw+uxNFNels07fKXfxTHMSuYjZyjYI=;
	b=XbZZnNZZgce6KotZpzqglkca08OjbxwSsdb2a490+Ardk9cr4iIMRe4JbHTDnPAnEc
	0C0XMlJxSOuNuATaQb8Db40+mvkFjNJbdrCIdaRXRs+I1V3jRaldcI7zEYxJe9YjCaor
	IO4APf0DpnfZqLCE1dpMN/XQ95UW0IgQLHDVx4pFia+8XhMGfF/9Lk6YIiU/4ozd4SX8
	FydFMow3fvGUlXl62yngb0HPK6dYHhhC89N8hOE4KZw0YDPyOsKQE5KNKSuSwt+nDFYV
	vfAyjRCLinPP46u2pdyu7NvWig7EstLu9RB7aiaHiJEDQJiHnOyBm+S8QUbAUuWPcoR2
	erPg==
X-Gm-Message-State: AN3rC/5ZPbKEN6V68gpNy14LyHU5oVyZEs0WiYzLh9K6AmeE6ODIGTm5
	OZpQ3bFDvLnT7o2N
X-Received: by 10.28.19.6 with SMTP id 6mr24241154wmt.96.1492087430395;
	Thu, 13 Apr 2017 05:43:50 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	([2003:46:e911:f105:1e6f:65ff:fe3e:7f61])
	by smtp.googlemail.com with ESMTPSA id
	t24sm1842834wra.44.2017.04.13.05.43.49
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 13 Apr 2017 05:43:49 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Apr 2017 14:43:23 +0200
Message-Id: <20170413124323.22507-3-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170413124323.22507-1-schnitzeltony@googlemail.com>
References: <20170413124323.22507-1-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] mpv: fix typo in wayland PACKAGECONFIG
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

Thanks to Andrey Konovalov for pointer

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-multimedia/mplayer/mpv_0.24.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-multimedia/mplayer/mpv_0.24.0.bb b/meta-oe/recipes-multimedia/mplayer/mpv_0.24.0.bb
index 60f653a..ce7b3d1 100644
--- a/meta-oe/recipes-multimedia/mplayer/mpv_0.24.0.bb
+++ b/meta-oe/recipes-multimedia/mplayer/mpv_0.24.0.bb
@@ -37,7 +37,7 @@ PACKAGECONFIG[libarchive] = "--enable-libarchive,--disable-libarchive,libarchive
 PACKAGECONFIG[jack] = "--enable-jack, --disable-jack, jack"
 PACKAGECONFIG[vaapi] = "--enable-vaapi, --disable-vaapi,libva"
 PACKAGECONFIG[vdpau] = "--enable-vdpau, --disable-vdpau,libvdpau"
-PACKAGECONFIG[wayland] = "--enable-wayland, --enable-wayland,wayland"
+PACKAGECONFIG[wayland] = "--enable-wayland, --disable-wayland,wayland"
 
 SIMPLE_TARGET_SYS = "${@'${TARGET_SYS}'.replace('${TARGET_VENDOR}', '')}"
 
-- 
2.9.3


