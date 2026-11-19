Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1883.1795113442975493562
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Nov 2026 10:37:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=aT/SenNO;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8a070781f63so78521b3a.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 10:37:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795113442; x=1795718242; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Oz7DyYhoI9ypJY2MXIVaA4BVfS34/7+UYTrRtSRrxTo=;
        b=aT/SenNO4KakeANAW3P9phJnpv2ATTqjxfAE5cRPLOxoJBtE6pgRaFrtvnVJn9jCbl
         WinN9SJ2K4gBk9Z/E/PzjlAqwHUCQO4eAMyFnbq43Dt/lrQsFHTXWKpPPtJ4UsWQeHww
         tzQcPf3NeLwwrvxV5b4Ac41Z33odMbZKX5oxJOqozTK9WtGhSiZ3czjkceMJ+4I9WWqF
         sswHkaoHwYds3jvPAPgWUYvh+VMoncHDlHraPCaMIxvZWi1vSgSFSO0jPh0IGb354K63
         3Xs7c18RQ43f0mHzcQTEBG0RfrlirpurSilZy8XCJuWoZ+4R4L325O9ii41yiC+J48/y
         gX/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795113442; x=1795718242;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Oz7DyYhoI9ypJY2MXIVaA4BVfS34/7+UYTrRtSRrxTo=;
        b=EhHL2Id8wM5V3iKGu752hQm85PD7baclMkMvjtaQ8IRBDHE9VIrxNHVJ6ypf1egAsg
         jhMR0AdJb3PWLUbg1uqKl3Wo+H22dMmrjuC5YKqI9JnnJUwfG/q7Hy2EqVuUeSXzqt2/
         V8tH6WD/ITn5OriQ9LWe7XmWwfAflLq4wOXKs/PncbBq9DuoPcKzgdoPBCoYwof8rNNI
         xcjjdmBj2ZZRApHCrEOtr4seiYxiDy4WQrF+EDmuaAD7IYnmJVRdNvmu5YNCf1bBJFfp
         Kms7lo0rQ9u3eR7+VEAWaau3pcbxUnbLdljxC3DNtJNZWeciiOAIhwEQsuD2xrzhfUbu
         3JMg==
X-Gm-Message-State: APuU4Z+XFmzhnuX/fLZ7yLQp1BqElv2VEnzthOd5lpPqHYrfn1R6g3yM
	Z4rIOHZ0zn8rQkrfYJkDsrxVGsHmZIkLZFg3YS7ECyYHzmszn5PY2IffUV7yXA==
X-Gm-Gg: AYBFou2izJuoLAJtX+snSQeLePAq08xsE1AuCX+2vDHE2RGp3UidAoZtn+0za8Hw+IJ
	+oq+i0PWcOpr43rW5Zd9yB/2mV1DQf6uwun2IZqJE1QD6h71ZZmzu7waJ+ZMzh8BQnYq7/h0jUp
	h0Xn4r4OUQi43Ara4ny/7LwLS+5sCvdDp35fSawJ4vzhNLMQaCjXAqw6/5YrcfBq+oy4K/GtoAT
	n6Lzb8tbuVIdiFjMu2IlVk8m/nOOhjFW0OG/JWnwO7RNiEz9pQdZTkSyLfPVPYAHQSYLqnAQABh
	OBSR0hz38/DOA8q8j49KedyKaJNqMqi37OUPtewAG45tzbXX/yrwQZn71BJIjtME7yNnd1IRWve
	A9WyG2HVz5b14EgC3ePW6ryRVsnuepOZUI9F352luNzl+0LwRanGe8ZLumIlYuJnb/MA3cbVWT5
	IrXsduJrZ79YgZ9aw62V5h0L9/WdmrMOti4KppuYfKY9yVBxp6MaVB3g+AxHhuU5yEo45vrkVZy
	+j5vG3FHBDpiHiOqyFNTGBEvqHlImToyHT1889ih0IpJ6cc566tvHUwD6Zo3VabtuoEUTpnGbrQ
	tZchP/at+czKWNNhrmgATi2HRB88JsBtnlDF2du3vLDExn/0Pg7Vhdh0d8PBDw==
X-Received: by 2002:a05:6300:8095:b0:3f9:f95a:7416 with SMTP id adf61e73a8af0-4014c2519a5mr414645637.57.1795113442343;
        Thu, 19 Nov 2026 10:37:22 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e4d7basm294518b3a.21.2026.11.19.10.37.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 10:37:22 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [blacksail][PATCH 34/64] weechat: upgrade 4.10.1 -> 4.10.2
Date: Fri, 20 Nov 2026 07:33:02 +1300
Message-ID: <3167dd1d73e739d88cd4c2e01306619f2d095508.1795112941.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795112941.git.ankur.tyagi85@gmail.com>
References: <cover.1795112941.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 18:37:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132724
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/weechat/weechat/releases/tag/v4.10.2

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 25144ffbd4fbad57f9c78f21158339814640a578)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../weechat/{weechat_4.10.1.bb => weechat_4.10.2.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-irc/weechat/{weechat_4.10.1.bb => weechat_4.10.2.bb} (95%)

diff --git a/meta-networking/recipes-irc/weechat/weechat_4.10.1.bb b/meta-networking/recipes-irc/weechat/weechat_4.10.2.bb
similarity index 95%
rename from meta-networking/recipes-irc/weechat/weechat_4.10.1.bb
rename to meta-networking/recipes-irc/weechat/weechat_4.10.2.bb
index 00030452dc..01565119e4 100644
--- a/meta-networking/recipes-irc/weechat/weechat_4.10.1.bb
+++ b/meta-networking/recipes-irc/weechat/weechat_4.10.2.bb
@@ -8,7 +8,7 @@ DEPENDS = "zlib libgcrypt gnutls curl aspell zstd cjson gettext-native"
 
 SRC_URI = "https://weechat.org/files/src/weechat-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "b8744c6f5dc5543062791f563e0516dbc96a36161e1a03c468b3b7dcc8be5aff"
+SRC_URI[sha256sum] = "6fcd05f350c808a4206d6951af36a9eec11b145b6a1a2a8a2b29dd3502e07022"
 
 inherit cmake pkgconfig python3targetconfig
 
