Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8057.1795739679781277857
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 16:34:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=m54lPfgz;
 spf=pass (domain: gmail.com, ip: 74.125.82.47, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1a3c08d6928so11211919c88.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 16:34:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795739679; x=1796344479; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=azIYNAgGjWFXuVG2FcbNpmQrn6R33LrGtTWvLJPCGho=;
        b=m54lPfgzR3wPz1D7zORHJRTeRc+XLrBKb+0v8TnA0l5sCGNPLk+zWQYYSVOTTPxmZi
         MuPbu7/V88zZOfEYzBJKKUOH5khFErFUDSL4EPxU8MgrTMyPKMICw1Mv0FyMOBdOz9VY
         I0PpvChLcJ7gVVR+tMDOEZN5hkiE8jrm4DfD0LVpkQT88PJ+3hkkItpd37Dy/ymnbM65
         KwfLQasO8XOWBuXHP02p91sPp0GL5mho+JvFEYFHLI8Spa+FgHFpcUJJtkAuRlqaeYQ8
         DNcnU01f2sxswGZ12pRTS07S2WFhEblVADcvDZGtrWTj7wBIrLMePfbvvb7pqu0zOwy1
         q8iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795739679; x=1796344479;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=azIYNAgGjWFXuVG2FcbNpmQrn6R33LrGtTWvLJPCGho=;
        b=KSgeOY7xLDy7jo452W5LPzKrmCeQKJfEMBKUrynAHIIm1xy1cwpAnlFzI4OCqweYd8
         ku2t98HsavcNc5bzLaKnt5veqttAOXkBYkann2W9QCnMZpN45iXT+eHOnJ0+la+Yyv6Y
         W9E+2JB8TKimzP+qCYS2NX1i7WcyrF4eTY1PM1litgRyMLfl/GEGkj+VlSW3Ffxbpq5N
         yYuDq8Vq7ITzQfglZJLHSHKaxe4EriVkTYtfejZ01m+nvtVTjc1CLVqbvR6iZFF5pgqu
         UsZyW2soqPXEjclZRQavE6fvk8qxXFdYEszrqsTHGLWCIHiBY4vHPrrlhAI/7pdCGZSa
         PvAg==
X-Gm-Message-State: APuU4Z/ZKzgAhfznAPopQMFdL3Q9ClVImzrFshdFbzMpJ9KnFC5b2Jn/
	393hreqg/wcGPcx7DQU+tsk9bPh7sZttui+5x8ivoYFa+yNBjTrgk4yHJvqHQ5Qu
X-Gm-Gg: AZFdTZefkMrgyFESq7mamHU1m1ix37qG41uNv1f2Xmfv8dz50s4GvRPY3OcURcrUJLT
	E7c0EpNp5SqSqGEJJsE/8tkb5pnxdXyBiFsQzvhnaM7kccQaOhnr5upkJG5RAjXHEiHvNZsxNeR
	9MzbDSmBsyHXeaAScVBB3fFKGBe4VkD7OoPkEIAxOHv1K1dHc/SM7dhfib3xoWn64WZtdJpsWMv
	UOQyhERMXouB4REoes8BwZvukcO8qyl8MezUOLg769hfpaHA8hqX/hqAmZTUB7WFQuy1lJFD8Zt
	JTCeQO6pHwDv72FlHFBmWWUPxacadmADgfVBcruvgyzOIcaRtdQHQmWOiNkbkwnMcgxXRha8RW7
	HelwsIRlpuimuelBiVVJBXUcXRpU333fptWlZ/0teuBN66pH/43B2+FVJyXbXYkKGQXJzoinskf
	TflYkrw+fZcBlLofPFMs+9Q7wPujDcpe7FEFrkiGNNn2LCIgjRDbN55p3S1mpEEUr+dTtdfOl2i
	1txqXHlEi6gTO4vc6NVH+/I5Kj1ufwo/41z9w1vrOLYnLB/UZfT52XIcwbJDdiRyiFzX3Snt2G5
	7L+dgi9oY/ZM1lS6q08kxAO21fhsHD0Cvrv/5QEWSl990Qy3EssSCfkH+6F7INbuPDtNbCnWtKu
	A+Oa01BJs7S5bAVoCIJDWEyUMkYciIybo68EpuKY76dB6vFIqQ4MltY55lS/gD4AJ7qTxVGcdOx
	2CBHeRGgkWwA2DX5SPUyGtM8dHbXCCk6psJbjiOn5OP/W1kLVO0BgajDmHJ7RlFg1BiV8q+XPNj
	f3koCnc9LELw5bdMaIhJrAbGhWxEfYGzjb8ZrEAWFG2GHW+75mOFKhIgbMU57EH7eeAieauBfYZ
	aKIZ
X-Received: by 2002:a05:7300:e91e:b0:384:2780:8757 with SMTP id 5a478bee46e88-38570a3e793mr25360986eec.22.1795739679056;
        Thu, 26 Nov 2026 16:34:39 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672ce402sm63029314eec.16.2026.11.26.16.34.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 16:34:38 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 08/69] tmux: Fix upstream version check
Date: Thu, 26 Nov 2026 16:33:24 -0800
Message-ID: <20261127003425.2166632-9-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127003425.2166632-1-khem.raj@oss.qualcomm.com>
References: <20261127003425.2166632-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 00:34:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133108
Content-Type: text/plain; charset="utf-8"

The unanchored regex matched any number on the GitHub releases page
and reported 11.28 from page markup. Match only the release tag links.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-extended/tmux/tmux_3.8.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/tmux/tmux_3.8.bb b/meta-oe/recipes-extended/tmux/tmux_3.8.bb
index 2f567e6a47..963a452e3e 100644
--- a/meta-oe/recipes-extended/tmux/tmux_3.8.bb
+++ b/meta-oe/recipes-extended/tmux/tmux_3.8.bb
@@ -11,7 +11,7 @@ SRC_URI = "https://github.com/tmux/tmux/releases/download/${PV}/tmux-${PV}.tar.g
 SRC_URI[sha256sum] = "e79c699c7e949dccd0a4a125e17b8d1261e311b16979dbc8eb34542f3966d82e"
 
 UPSTREAM_CHECK_URI = "https://github.com/tmux/tmux/releases"
-UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+[a-z]?)"
+UPSTREAM_CHECK_REGEX = "releases/tag/(?P<pver>\d+(\.\d+)+[a-z]?)$"
 
 inherit autotools pkgconfig
 
