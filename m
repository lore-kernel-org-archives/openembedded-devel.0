Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12017.1794070354753957551
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 07 Nov 2026 08:52:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=YRiXYbAE;
 spf=pass (domain: konsulko.com, ip: 209.85.128.49, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49d05d51553so9712645e9.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 07 Nov 2026 08:52:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1794070353; x=1794675153; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wLhmhNxJB5nSv/NwKUY08F/8qa8KHr83DhiUv7PNCAo=;
        b=YRiXYbAEC7PRaAYeidAeInrF63ykCEb62uyy6q063vIHpwnWA77afjRjAQq98kSVl7
         w6J98iwFI0Fz3iz/taVlLZsdUUHNfUhvx0Oi1a9yIlb7Pb3cCOGmPIPLISS15N9Oyvk2
         zoSKt6VrE/ZrW517x3B4FN43VHqbhZfYuvPzQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794070353; x=1794675153;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wLhmhNxJB5nSv/NwKUY08F/8qa8KHr83DhiUv7PNCAo=;
        b=rbHp6NbZC64BacRDm2ZnarAQHzNljByQY1SJ9bFbXEE9vvHI7TaKK4+19pAVXGZvM/
         IoESc7QX+H0D36f5s6aWnmAQhY9tERnxkkgT4cXlLazd4p/G4yKMM+TrqaC1N8HGA9Hs
         j39DS4h1V47F60JtaqULWvUoHLo/Yw0mwhZpwchuTX+sYaYq97sF5WZZbm/Nm3hwttOv
         ZWf4/731PFkwSaL5mpba+5QnmzOzAwVDGjrXozF6vS6/eqYnrUqZNzbgZ+PO9nF4lsol
         LyQ34hRJoUTOK3gPmW105n33XJkdd52v02s4j+s9/CBqy95xeBWwlFBqTNkqSN187d5R
         TZnA==
X-Gm-Message-State: APuU4Z8nqnIaUKsVv83sG0MTJUX0ns2BQDQDwc0bGdT8MvMGFak7bJww
	nX6L109CkrKYzfzAL/HN7yu3R2FSa2st1Ge5x86BuCVF4LBCWME/2lIAcshHwIChV2bIQrPQIin
	VyH67
X-Gm-Gg: AYBFou20OccZ6lEKTS65k8yVHUxyzYWI0QUE9lrJy5nW65ysfWsagYsJRDnG3iHfGnu
	tn1L9XAcM4CyqHFdG39Dl5GSrDhXejrhEpJCERZGBwD6GfrLg0aGsCkcyBI/ZUOJdnrRbImgX1a
	lHYompNyAELx2fr4YHtUbR2PpYJHGha+EwIXGfCZYxqfmvnixL3tHiV+3ElRbu2U8INXKkuEZrz
	qhRtxST7fWRUVqXItZKJpI+nw/3SUBLcVofyDm5WSVIa1casuewn0KSLLLFSvmYitzZUbhvyYNS
	UaSkEanNJLtdxKLppOyGSMescpGv7FStZrSQVeDIzS8FUlOFHQ0VDQ8NhGGgeteTOWkegxdjY/x
	TeLYDoZVNiTczwKMk7sbueJEdYwpn//xGJawWX38eL1dVta+JANVCfNdHmj98SJGAXp8qi4gg0F
	yu6O9Gmlj961TB05eHY2+UbK1xEur4fSL29/Qy6RkIpJwKxm8yNTUji4d6kcqTGntUQZvPzSH0J
	zDTgAnBkop69I44Z9RiIFZT04XZuGoqF0HO1ntXViiadXCsvo19qHdZYi2nRnyB/8cmUnzytqTT
	0J5GDFII+xpiwYBBs4y/bh/3bxns27xzxhIhcii7uo/mYxDfQ8lf/z6mRlySYfiAxR4KV2Tskas
	4vPQ+5k/WvmZstdBn6XF9GZ9CfKSgXFQPoHG8xXCIDBPfFxLAhpQiIQ==
X-Received: by 2002:a05:600c:3104:b0:4a2:1e1:d55 with SMTP id 5b1f17b1804b1-4b6e054955emr117729725e9.28.1794070353026;
        Sat, 07 Nov 2026 08:52:33 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4948a99b9b0sm4127090f8f.4.2026.11.07.08.52.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 08:52:32 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-oe][PATCH 09/22] gst-editing-services: Upgrade 1.28.5 -> 1.28.8
Date: Sat,  7 Nov 2026 18:52:08 +0200
Message-ID: <20261107165221.122340-9-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261107165221.122340-1-leon.anavi@konsulko.com>
References: <20261107165221.122340-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sat, 07 Nov 2026 16:52:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131994
Content-Type: text/plain; charset="utf-8"

Upgrade to release 1.28.8:

- Various security fixes and playback fixes
- Fix adaptivedemux2 HLS and DASH playback regression
- Fix FLAC audio seeking regression
- Various RTP depayloader and RTSP client SDP handling fixes
- MXF demuxer: Added support for reading AAF AIFF-AIFC audio
- VA-API compositor: Fix alpha blending with Intel driver
- Windows media audio/video seeking improvements
- AMD AMF AV1 video encoder force-keyframe fixes
- Fix endless drain in some FFmpeg wrapper audio encoders and
  support dual mono
- hlssink3 improvements
- ISOBMFF dash/iso/fmp4 muxer fixes for timestamp rollover in 2036
- cerbero: Rework checksum verification to allow mirror retries
- Various bug fixes, build fixes, memory leak fixes, and other
  stability and reliability improvements

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...diting-services_1.28.5.bb => gst-editing-services_1.28.8.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/gst-editing-services/{gst-editing-services_1.28.5.bb => gst-editing-services_1.28.8.bb} (92%)

diff --git a/meta-oe/recipes-devtools/gst-editing-services/gst-editing-services_1.28.5.bb b/meta-oe/recipes-devtools/gst-editing-services/gst-editing-services_1.28.8.bb
similarity index 92%
rename from meta-oe/recipes-devtools/gst-editing-services/gst-editing-services_1.28.5.bb
rename to meta-oe/recipes-devtools/gst-editing-services/gst-editing-services_1.28.8.bb
index ba2e6dda00..cadd228915 100644
--- a/meta-oe/recipes-devtools/gst-editing-services/gst-editing-services_1.28.5.bb
+++ b/meta-oe/recipes-devtools/gst-editing-services/gst-editing-services_1.28.8.bb
@@ -18,7 +18,7 @@ inherit meson pkgconfig upstream-version-is-even gobject-introspection features_
 EXTRA_OEMESON = "-Dvalidate=disabled"
 
 SRC_URI = "http://gstreamer.freedesktop.org/src/gst-editing-services/gst-editing-services-${PV}.tar.xz"
-SRC_URI[sha256sum] = "d02f9df7dd74f2a50243a6fa5e327cfbbd5c12129ce7b6e73d70c08532491a88"
+SRC_URI[sha256sum] = "4d93d2309b7d01529cd5e3375f99bf7e69c2e32cf59ce4533b31a5c7119b9b58"
 
 PACKAGES += "gst-validate-launcher libges"
 
-- 
2.47.3

