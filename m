Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8206.1795739705907146501
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 16:35:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=ce6yWhcD;
 spf=pass (domain: gmail.com, ip: 74.125.82.180, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso15984599eec.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 16:35:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795739705; x=1796344505; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vzt1wGN7vGejoVIWfkjDREsVV8O6+8AiybtoDaqKavo=;
        b=ce6yWhcD82QcQdQ9ymxUxQrx+QOqUDYdqmxnCo5Ok4Q+FypgYJosEOD2QiDTqVEcbq
         bpHnHIaBmThUj3f3Ihh0O6pwdZpScpMyH/67EII2kF9GHKtP9tZSXXSPBeyGF4EbbI42
         OGD4CzENKBN9hvB6ZzEXcgdgWaJhuzI2nl5NbWuVApn0vwTffTldALyW9szLXOsYwqbx
         Mi48Oz41ebYHkmhQE33gvTk8V74bDSX9St+OVFXj0C0amRkyaIxs4UGW4DlShr+o65Kt
         P8dRysfe5LY+YNkShYEl1vE7IpF4WsfecvHpphlYDzZJaE5uIVkZ+GZjNZpkF0WD9Cwn
         JmUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795739705; x=1796344505;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vzt1wGN7vGejoVIWfkjDREsVV8O6+8AiybtoDaqKavo=;
        b=iFv2T9LispbD7+PJ0YSAEXa9VSdsWLwGAtEVTPStRWlOUdLtdq0TGInOWB8iyx2U3t
         uAQ5xwStkJJZc+4spCOE3yIcO8YGMfdg2aeyA1nQWUw+bN41EuHCoAnrOINo5biMqHW3
         NsP+njMdHfxbj821MJD8gw2iuAEWCqkh+i3DI/VC0ucd3Bo63O+c9qwjVqrK6L8i1Kyx
         D2sdIEc9tDeleu3nL/++pYKQVr/uWgYffKkjIhWXRux+iDt16+MCs4n4KZwRPJ1YN9xm
         /m9gEFyNMPQIOLOgVkhgZGVpsBNg0jgLdJtU9JNj2TbcIy0XmB7bsUwduiBmHV6OJ3MI
         bfVg==
X-Gm-Message-State: APuU4Z94DYpIFSMKaG3l9VUhWVXqMslNIV+6c9xGULzl8742x/OtKPFC
	ALbax5ypbBRNagMKgDy0gO2uKREHVYM0emRQyaj1jznsI1cT0zx9PSh6AaDo2n1x
X-Gm-Gg: AZFdTZdP8wgMB7dS1ufokcomjLGWu4MYqiZ7sGTNTCtpo0WiSqW6Uxa+V6JR9PgUy0N
	o5cX/hqY+v2QYkCDWMGQ/NVHxj3Ne/HTXxxgrk6lrneVcusuHFkWgI3J8DUO5pj4+H5xTdBPpjh
	v0ex7lKGOZIxLGRkmQ+jra1BlMrZ+d8v6eaI/Z4PZEi42Rm3erfVrv5srOVu6/di6TTX4Fc85AF
	1FBfagxLHAoBugsJxQOT0PQJMpWDRxCIVh6cxB7ewacoteb9ujurCj9x8BJPfnINWQHnLg3Sv1D
	AU0bTtqhstIRB7RoeN6F1Z+WhC5a/z5/hktiUzanSpBC/vgj/55T52c70zcWl+t+BbKO9H4VgOT
	LUAilnC/sf5fjhKs1+sZpSUBNWDmJ19RzsmJd/8WuQfFuqfnmfn2PQePfLlR3iQlpqSuqYhhBfU
	RgrvX7ytM+FdKrfd4ougyq4nUIGaNTF4Zi2GDhmmxpnn82SLRX3lIfObsCaxPAiZItq/HO1dbzV
	ESqIO2oWoct7rs6J81cqbia4Vvr+Hx/XBRFcYj0zRU3lpf8nuuRzoPHyMuiryAYrrBsynlvji6A
	P1mwPzW592dEiUo8A5gvNX4T2EIq2mKDW9xMSGbKFr6pqFtNn5Gy0gb/yCxzk2sNL4UXstbANWG
	XqGrdt1lkClcWiIcD3Xh2u/gwxfKFTlSQWwb2/f/mMz4fNaXNQS5LWJDTWXBg+otQRLNyv7AaCY
	qzk2/uuvZqt2la5GbOOJqoOtjYHWhDUDITAKmyP9OvVn5hwV+ae1o0Ttva6rqkA+U18tSfBTjJy
	kFOs6lKC124TKErlMTffjdDN8I5EEISdCRwAfLrh17gs8AU5piO0VswsW9k4pDN+HD5hTb3UlUM
	L3Qu
X-Received: by 2002:a05:7300:339a:b0:36a:18e2:64c with SMTP id 5a478bee46e88-3856fd5bf6bmr22977190eec.11.1795739705179;
        Thu, 26 Nov 2026 16:35:05 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672ce402sm63029314eec.16.2026.11.26.16.35.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 16:35:04 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 34/69] libsdl-image: Fix upstream version check
Date: Thu, 26 Nov 2026 16:33:50 -0800
Message-ID: <20261127003425.2166632-35-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127003425.2166632-1-khem.raj@oss.qualcomm.com>
References: <20261127003425.2166632-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 00:35:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133134
Content-Type: text/plain; charset="utf-8"

The default regex matched the binary RPMs and reported 1.2.12-1. Only
match the SDL_image source tarballs.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-graphics/libsdl/libsdl-image_1.2.12.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-graphics/libsdl/libsdl-image_1.2.12.bb b/meta-oe/recipes-graphics/libsdl/libsdl-image_1.2.12.bb
index 4b4cf4e62d..b4b5047d73 100644
--- a/meta-oe/recipes-graphics/libsdl/libsdl-image_1.2.12.bb
+++ b/meta-oe/recipes-graphics/libsdl/libsdl-image_1.2.12.bb
@@ -11,6 +11,8 @@ SRC_URI = "http://www.libsdl.org/projects/SDL_image/release/SDL_image-${PV}.tar.
            file://configure.patch"
 SRC_URI[sha256sum] = "0b90722984561004de84847744d566809dbb9daf732a9e503b91a1b5a84e5699"
 
+UPSTREAM_CHECK_REGEX = "SDL_image-(?P<pver>\d+(\.\d+)+)\.tar"
+
 S = "${UNPACKDIR}/SDL_image-${PV}"
 
 inherit autotools pkgconfig
