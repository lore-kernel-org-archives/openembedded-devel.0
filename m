Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.703.1794955424394269075
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Nov 2026 14:43:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=e60tnqZl;
 spf=pass (domain: konsulko.com, ip: 209.85.221.45, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-490c3ae81d3so168964f8f.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 17 Nov 2026 14:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1794955422; x=1795560222; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=n/PaLyO8Jpp2V8AlKtgiu+r1nlA/VFwnH6x8wDD5lbk=;
        b=e60tnqZlWaZE3Ih3Q+c3tQfW0H2R9i/3nF4mFlICl0irpXJ2KaMix/rs39ttC+5X7r
         g6jXDOhptf4wFULncAgViYyPNQrBoMiL5iqhvvMgP8jHsmqs3i1DWomkpGoGO9djx5i6
         omv2j35vhW6NFfEwJcCRvgtmf92J6Tre9tWLU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794955422; x=1795560222;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n/PaLyO8Jpp2V8AlKtgiu+r1nlA/VFwnH6x8wDD5lbk=;
        b=WjCpQ6n5g+b9SM8w5LdJiU9jYYvZF935zg3oIlXKvXx4TySupvXHTDyEDyaxPkPArJ
         Cepe1Ty0WOdOSuScIIsAkkaCJ9pWRi3W7THK6+BCrPn5hLw2rdywp5hUCcTWCZFGMLeL
         y3qzg2WhrOBnJAaBiTRCaIIksXTC7KalJIEZOv/Ak8s11bsj5gVOkenqNmz05gHQ+Ga4
         /AnbAeDSdN8kiZKHktSo+hcpyOhp/Z3xRLa++9G0tjmOs9NPGN3LGCcmUlDwySGV5wY0
         Vn1B+iMcwB9I/4I3ot2lSdZXdUj3NERK8uHfTBPX0bzjOmwMBthbzEbp0qPv26glJTex
         zuaA==
X-Gm-Message-State: APuU4Z8eG0wIz4eP2mzr1L4j1kbTHuSCIGRrehFw6Ay0NXh1yzQW/XqA
	VCpSb2HggFa3TA0ZVBIGvdM85r6ZckwuDglb+CL+TfeH7mvIhzS12PuoGcNAs8ylpQV2h52Xmg8
	AvFLq
X-Gm-Gg: AYBFou0IE3K3stV0yRfvlKRlS9L8KUAoTNmejeXH6yOA/79ezdihdlb2kTV9m9laczs
	GxgLk2KXwXJ0qaagrX2bhr8s9DPwhH43QjoD/z0By2gCbNQKp/lM6qZ2YVIOm6cH3RP8yKT3gWr
	eAWirCQvph66Yb1B072JTH91E+wi0bap20U16LMBwzrg50DF6o3tdBLG9LJ8qf+PG9UIL+uS7Bs
	dE7f70eDUQeU3kerHzJ3kRXqR1srr3q9ncIgzyqBptRNLbD55FVqqs04+X/Bk5iVPUStfa+ouNq
	jD1w9zptWoXJ50slmZlaswRiR7sS4+O3R8qMXi3qdcvpnlIwaQQQWKc0xIxYDueZvzAoM6//Wey
	srMeyWY/NEliYcAM8dzXRnXmYchTebsxWwlqTfX4P1df4hxVFxF9oH5vxNayaU1W+ffxmWL/cVG
	bcWt64QcC9OMl4CLJThCJ45fjmnuaJuKPHq+ob+3mZAILwCaYTUY/p29V9Sk7OPSjj7MOhQYLqw
	bJhV1V18zeuQJOPcM9O6UaruWAqqLF1oaB4hf4Sqh70fZEKYK3e78Uza0SdphyRabHhWaRINqsZ
	dh5x6Nm0Ha3v0T0RRhJC3sCPLsc6U+Cd58hQsnZ+HxWyUS1MlE+yNYNlRG18GJZTHhVoSS1aOSU
	H7CSkenkpbmHtZMexZvgAX3XOebntOhqOcEQ+ZbTab7LIb3tT+WJOOQ==
X-Received: by 2002:a05:600c:8b58:b0:4bb:5dbf:af08 with SMTP id 5b1f17b1804b1-4bb7da1b574mr11172395e9.19.1794955421705;
        Tue, 17 Nov 2026 14:43:41 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7d2c3c93sm25012915e9.13.2026.11.17.14.43.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 14:43:41 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-oe][PATCH 03/11] gst-editing-services: Upgrade 1.28.8 -> 1.28.9
Date: Wed, 18 Nov 2026 00:43:29 +0200
Message-ID: <20261117224337.4181772-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261117224337.4181772-1-leon.anavi@konsulko.com>
References: <20261117224337.4181772-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 17 Nov 2026 22:43:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132593
Content-Type: text/plain; charset="utf-8"

Upgrade to release 1.28.9:

- Various [security fixes][security] and playback fixes
- decodebin3, playbin3: fix assertion that would crash music
  players with certain files and sources
- qtdemux: fix seeking beyond the end of file in push mode
- flvdemux: don’t prematurely EOS on AVC/audio sequence end
- rtspsrc: Reuse non-compliant URL fallback across tracks
- H.264 and H.265 RTP depayloader header extension tracking fixes
- level: Add 24 bits support
- gtk4paintablesink: Mark EGL display as foreign to not terminate
  it
- amfcodec: fix rate_control (H.265, AV1) and gop_size (H.265)
  properties
- asio: fix stopping asio element causing crashes
- cuda: Correctly save alpha and blend on property change
- HLS: fix awss3hlssink EXT-X-PROGRAM-DATE-TIME moving at twice the
  speed of the target duration
- hlssink3: Fix stream writing regression for CMAF and WebVTT sinks
- isobmff: Fix NTP seconds roll-over past 2036
- Fix gap event regression in MPEG-PS demuxer with certain subtitle
  streams
- qsv, d3d11, d3d12: Build fixes on latest msys2 environment
- va: do not advertise unsupported formats in encoder caps
- v4l2 video decoder fixes including delay negotiation for H.264
  and H.265 for better decodebin2 compatibility
- wayland: output hotplug fixes
- webrtcsink: add support of mpph264enc encoder (rockchip)
- Rust plugins: enable cross-compilation with sysroot in Meson
  build
- cerbero: update ca-certificates and pip, and fix issue with
  rolling distro versions
- Various bug fixes, build fixes, memory leak fixes, and other
  stability and reliability improvements

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...diting-services_1.28.8.bb => gst-editing-services_1.28.9.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/gst-editing-services/{gst-editing-services_1.28.8.bb => gst-editing-services_1.28.9.bb} (92%)

diff --git a/meta-oe/recipes-devtools/gst-editing-services/gst-editing-services_1.28.8.bb b/meta-oe/recipes-devtools/gst-editing-services/gst-editing-services_1.28.9.bb
similarity index 92%
rename from meta-oe/recipes-devtools/gst-editing-services/gst-editing-services_1.28.8.bb
rename to meta-oe/recipes-devtools/gst-editing-services/gst-editing-services_1.28.9.bb
index cadd228915..d90169639c 100644
--- a/meta-oe/recipes-devtools/gst-editing-services/gst-editing-services_1.28.8.bb
+++ b/meta-oe/recipes-devtools/gst-editing-services/gst-editing-services_1.28.9.bb
@@ -18,7 +18,7 @@ inherit meson pkgconfig upstream-version-is-even gobject-introspection features_
 EXTRA_OEMESON = "-Dvalidate=disabled"
 
 SRC_URI = "http://gstreamer.freedesktop.org/src/gst-editing-services/gst-editing-services-${PV}.tar.xz"
-SRC_URI[sha256sum] = "4d93d2309b7d01529cd5e3375f99bf7e69c2e32cf59ce4533b31a5c7119b9b58"
+SRC_URI[sha256sum] = "23caf8439ba063091da226e7a1774915848105ff47ebdbe7773fffa21a094692"
 
 PACKAGES += "gst-validate-launcher libges"
 
-- 
2.47.3

