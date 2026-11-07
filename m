Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11966.1794070359457372899
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 07 Nov 2026 08:52:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=NGCY9u1h;
 spf=pass (domain: konsulko.com, ip: 209.85.128.42, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso17638665e9.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 07 Nov 2026 08:52:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1794070358; x=1794675158; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E4JzDdpxhG4SR5KnThTVY/hPQxLuiRp5xmDrEDQH1vE=;
        b=NGCY9u1h+j4/+/u6WyeFrncWwVceoZh6kV9Azjtfrl/6xBR+1T0QjswL1IZf61og1Q
         jvc7HfkRmGZ/OGARa7uRzS08n0UYkhHgkXGrgRkxfq65Z3PX3YwQIl7DYoluwGMW/hRT
         0ycBSAKsuTzJCfdN9tDjusTnmrzevDxlN37sw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794070358; x=1794675158;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=E4JzDdpxhG4SR5KnThTVY/hPQxLuiRp5xmDrEDQH1vE=;
        b=Y3T/3KznW+i0JFZaIoT9qkBGFv5oFxk1PfVQjI9ZDFrQt/siXjKVJbD2F7dLGu6XJy
         umRwzM/1DsJx52i1K68gC30oUhAeU1hVpUxnH9z4jhOTdAy3J1oeOSBQrzPvgEjFIhxp
         327OwTAfAoy9ssIlXRA8OfbUfb8RngjjB1IxJBXInq6G8i7nC1XXIviUC+Yg20Og07wY
         sbNcejwNdwRTGpxEm4D0FjC3VBEVQE4ykzmv8jD82vtUpe/a/SPUkBbKTyWrRHATi1F8
         QL62vq6bOVd3ZG3YHj9sqPaYHaVTTslLBdxlZSOFleUgcct2Ocl8DffU4LNRxweOhI+u
         p42g==
X-Gm-Message-State: APuU4Z86hSLiXGju29GlOFDv1Zot7tM43RSryfZJhojSXjqpSGwBWkhg
	9RLsI/T5FCXRoJONhRxiKglZVwBp5L51dwnAlDTyO83uYhgGnbIKulu8b6efVin2w2F4fVj7qzk
	4a51K
X-Gm-Gg: AYBFou1tqpYNm+NiE3oAnbhqE5CkkuH+dMuc3owB7mFFz4LpE7XVR86gUvYRWSLsNao
	YL0vucAnLQzbliPPMVvROTLxm31/EQlGTp3banUr3/5D7Qnc4Yd2Owurdp8RfXhLTtKFdxxJUOS
	hKa/MyjV/P/VPSP3JiO/bBVJAi3MjISFD02dBmVXY2pKWzxaxgZP1IRDiIzY+VBG3TlH0W6DZru
	mpwbxgrYDInE0i/G6wBvWHvAocIlxJf4GA8Kio1UYT0heHzL3/Gs+RoLW1+3mD8F+UVrjCN9pSp
	xF8RRrrJYpGFkPQjEbtHVUG2Aq35Qcc23JlPNd3YQzVBWbjsBgBWiBjyknF+z9vArcFVJHJ/5b0
	oRWbfRYlFtsinER1RSfvXKUC1YqTrLdUfo3fWULGS2d0KrQCLW4isoGH74J1NftEr0MZREQVTb5
	E321GG/DzdYVYEMr0GOeNZnF8Kj4ZFRBZtkjVdMfD3t9GBENDDlIws1/ZWG3uu5jAyDBemY0Vji
	qVFtZFdwzK+bsVs4Dv59zf0n5yQgibFqg6KGX0nFA7/YoKK9B/6HHuHVioAydIfV1PtS4x1Wheq
	+ur0X7eUDoUXmqST6okGAUUStUNcC4Tpa1f8hpbsIBNbv/UlKRXy1bg4NbXIOP8NEFbkbFZPhdU
	1gbaVh7SlejG0zER4fdQi7c5/+TDvEXI8lTX168TgzCEPvRrV3UGzjJA=
X-Received: by 2002:a05:600c:621b:b0:4a2:190f:cf6a with SMTP id 5b1f17b1804b1-4b6dfbab213mr98231855e9.35.1794070357790;
        Sat, 07 Nov 2026 08:52:37 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4948a99b9b0sm4127090f8f.4.2026.11.07.08.52.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 08:52:37 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-oe][PATCH 14/22] libmikmod: Upgrade 3.3.15 -> 3.3.16
Date: Sat,  7 Nov 2026 18:52:13 +0200
Message-ID: <20261107165221.122340-14-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261107165221.122340-1-leon.anavi@konsulko.com>
References: <20261107165221.122340-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sat, 07 Nov 2026 16:52:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131999
Content-Type: text/plain; charset="utf-8"

Upgrade to release 3.3.16:

- Fix out-of-bounds reads in MTM loader (CVE-2026-111165.)
- Fix out-of-bounds reads in IMF loader (CVE-2026-111166.)

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../mikmod/{libmikmod_3.3.15.bb => libmikmod_3.3.16.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-multimedia/mikmod/{libmikmod_3.3.15.bb => libmikmod_3.3.16.bb} (90%)

diff --git a/meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.15.bb b/meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.16.bb
similarity index 90%
rename from meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.15.bb
rename to meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.16.bb
index bfd15cabe1..54e92721a8 100644
--- a/meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.15.bb
+++ b/meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.16.bb
@@ -8,7 +8,7 @@ DEPENDS = "alsa-lib texinfo"
 SRC_URI = "\
     ${SOURCEFORGE_MIRROR}/project/mikmod/${BPN}/${PV}/${BPN}-${PV}.tar.gz \
 "
-SRC_URI[sha256sum] = "dc27b338154b8f88dc9e6317196d42c6abc13bf63c4e055257a18d4e38e1afa2"
+SRC_URI[sha256sum] = "7b24e41468b0dfe7fae1104ae6a0d7c52e04a65e1851b268c7074e4d06685a53"
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/mikmod/files/libmikmod/"
 UPSTREAM_CHECK_REGEX = "/(?P<pver>\d+(\.\d+)+)/"
 
-- 
2.47.3

