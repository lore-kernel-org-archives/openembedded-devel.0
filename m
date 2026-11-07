Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12013.1794070348010612667
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 07 Nov 2026 08:52:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=ltBlgzsG;
 spf=pass (domain: konsulko.com, ip: 209.85.128.45, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a60f9474c4so20002645e9.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 07 Nov 2026 08:52:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1794070346; x=1794675146; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l0idCO04uKNor3F+P9d7W4StlC5R/MGzbshvTwvC8vI=;
        b=ltBlgzsGW1tZKi4NFFpmKJQ48qvfLzRjJsCZkRm7LdhBXB6Bmt7LoDLQhbvBnCrfEq
         mByo5d+gDuaexhOcJIedGmf6HdHwuT6Ubo0xz4gI5bXeQghf7iE1dkzHl0wr0B5sDF/x
         MyMxdTRwSaMKh2MJUmb/SGGk4tA37OwBhJklM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794070346; x=1794675146;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=l0idCO04uKNor3F+P9d7W4StlC5R/MGzbshvTwvC8vI=;
        b=x9x9Up7yDrW4vbIZzfN5UdrRYDyeUWQJfuIK771GXwbcv3TRy/Gy9vLHd6WwsfiRoo
         daPI49ZJcemz54ttHgfBuwLSZ5EpG5vPd4+UPhkNlQR7sswSvEzWErwal1JaZ1AqHlIe
         ftYdLMybODuG9uq5AMWKsSohzHpBJnai+wLAgZiUlPaYQei1M5PacosIQ1ns1xdSF1Lo
         7SpmazlCn8b1SR6S9dP9nlglkwbD9OwboqZgLoh5GTwndgOategbHBJ0zq407gUcMW/j
         SL4L8iLWT9vjBcmZjhUt9qyyo0lzYLBYceibbKdsmGuxJiNtC+Ce+Zt76R+V0Zgv8VYd
         uq6w==
X-Gm-Message-State: APuU4Z/UkIH3ZLymcmm6t2YaPoOZEUo19X3m0XByLpZuGylHuGa1S/Rm
	BWIv4YiY+3MuhBsJ3kEQU6R+JpJm6aObcisqrv1IORs7BC+5Mwm1InxeXC3oY7ndSoHTUwa9jQq
	q/Dpf
X-Gm-Gg: AYBFou2hB4geRnKKxb7PkDpOd0xh3Kh6rUJwVnPkojT3rFdGo86qbJGDxirCDdHlcqZ
	nbYODfFE+7b5JD9zhl92au1ZDMlpr2Bx1pOrXiH8FowtRWqwlo7VM8BMwqueAmDJS/Bjq+l5Z1r
	7GkOH3xh4koVlbX3LOgiUo0HbVp4dLPDXYgeNIpe53TY8DjvNIAj1dl0uAc/DU0uIQy0o56pPWY
	1IjD4vRuMU4ymnwymJInbKP20csK0krGpqmTp+kdUCZcKvKOpaMwJ9PSLtlQjsUalk5mMM9QwRm
	OU59D9a5zYXIVWRhs5dc91omC6LovumXSLmge34vkRCP+w53ZuRQyuPE5inJ82uN4zaxNz7Snrj
	6MQ20iM2VoWXqmE1/3B2bQfwfDUHRRftMm7zJmEUFOc6XP/4BqDCp4Pj9uTDBDdkAX7f29t1LQc
	JW+sCQC1LivIT1waFfHwFUY2dqaawOsKf5ZZ2p83nZf0u3wPRDrtVGCs36yYlBzFPYGBxX2SC+T
	cZlybPXb1EmK4llpkn9nmoS1uIIxZqNSETjtrJ0OXMSt48Koxy2FnwxrJVrCvmIcsG210znyeJe
	OB2E8wDLBor32sjyNVhpDGayfKQVbN7pVQXPBHyCG6GLNvaYgX/mVYfVHM4TGat1Bi8FTZdBAWS
	1ahmRsFFfj6m0Q+uwIXSoFgxJre7OEMcxd3TSQ3e4m3cr3CVqvrgUyQ==
X-Received: by 2002:a05:6000:2dc9:b0:48e:4300:c70e with SMTP id ffacd0b85a97d-492778d2094mr11846968f8f.46.1794070346001;
        Sat, 07 Nov 2026 08:52:26 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4948a99b9b0sm4127090f8f.4.2026.11.07.08.52.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 08:52:25 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-oe][PATCH 03/22] bubblewrap: Upgrade 0.11.2 -> 0.13.1
Date: Sat,  7 Nov 2026 18:52:02 +0200
Message-ID: <20261107165221.122340-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261107165221.122340-1-leon.anavi@konsulko.com>
References: <20261107165221.122340-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sat, 07 Nov 2026 16:52:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131988
Content-Type: text/plain; charset="utf-8"

Upgrade to release 0.13.1:

Enhancements:

  - bwrap now accepts multiple --sync-fd arguments and will handle
    all of the fds.

Bug fixes:

  - O_PATH is used when opening parent directories in the new root,
    fixing an error when read permission is missing.

License-Update: Change from LGPL-2.0-or-later to LGPL-2.1-or-later

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{bubblewrap_0.11.2.bb => bubblewrap_0.13.1.bb}          | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-security/bubblewrap/{bubblewrap_0.11.2.bb => bubblewrap_0.13.1.bb} (79%)

diff --git a/meta-oe/recipes-security/bubblewrap/bubblewrap_0.11.2.bb b/meta-oe/recipes-security/bubblewrap/bubblewrap_0.13.1.bb
similarity index 79%
rename from meta-oe/recipes-security/bubblewrap/bubblewrap_0.11.2.bb
rename to meta-oe/recipes-security/bubblewrap/bubblewrap_0.13.1.bb
index 7e63435e90..b0bee4ff76 100644
--- a/meta-oe/recipes-security/bubblewrap/bubblewrap_0.11.2.bb
+++ b/meta-oe/recipes-security/bubblewrap/bubblewrap_0.13.1.bb
@@ -1,14 +1,14 @@
 DESCRIPTION = "Unprivileged sandboxing tool"
 HOMEPAGE = "https://github.com/containers/bubblewrap"
-LICENSE = "LGPL-2.0-or-later"
-LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2"
+LICENSE = "LGPL-2.1-or-later"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 DEPENDS = "libcap"
 
 SRC_URI = " \
     https://github.com/containers/${BPN}/releases/download/v${PV}/${BP}.tar.xz \
 "
-SRC_URI[sha256sum] = "69abc30005d2186baf7737feacd8da35633b93cf5af38838ecff17c5f8e924f6"
+SRC_URI[sha256sum] = "0e85c8702248b8dd64144f594147553650cdd0e4c951690345faace79c217c4d"
 
 inherit meson bash-completion github-releases manpages pkgconfig
 
-- 
2.47.3

