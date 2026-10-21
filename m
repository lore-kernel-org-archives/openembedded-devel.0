Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8864.1792580494134540001
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Oct 2026 04:01:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=So38Ov7a;
 spf=pass (domain: konsulko.com, ip: 209.85.221.50, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48c45111bebso386544f8f.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 04:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1792580492; x=1793185292; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OLsifrLo/OclfgtPvqnwxRdX0hAC1dmYupI2Lmu5vHc=;
        b=So38Ov7asl1A9Mn5oBJDTqHYuIHuhAdGn7bR1itdP1Tt/hDBUdEgazTdSWLRuCrDHp
         dS5d+8xLqn2V7BZtd5Lf3bYBlq+9V6e6zqk1U6E/6PkO0KX1iBX2CN/UVgAIl6HrDs5I
         zyCvRydnhsCoBWd9SDuL49pZMNiWkREBgIK9s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792580492; x=1793185292;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OLsifrLo/OclfgtPvqnwxRdX0hAC1dmYupI2Lmu5vHc=;
        b=K0PTIUSrpWYjQHIGokKq3tvcsmK/D/iNl8aw1eqdJGfmpgk2lXKT7hAjaREzUOjMTv
         sodzl4osIN1TsRJ1v9W44G8xaibO4eH1uE2a9BL0DiKXGVMtOBpNRffn5kqve0XrUHh2
         UVl19Kmz3NCnRDEJy/s63PuSL5d/3VhVxM6t/nNX9s2SLcmVrAOwC25AN0lxSE+knj9M
         KVItlz2MoKWjuqI43IvADh55Fw5xF8uvhD2luYw85JrmfkXEEnKmu8xzrn84TSJ+cNEl
         a3VAYqV4HDkopSo4B2HFz0YBYasxiIULJRSosCc5OGmLc1skFQLOi7gurZRJYKMg6apK
         HnNw==
X-Gm-Message-State: AFq9FYKaRGEzS5L4rCSO7i6FNLh13EvLdlAOETFeKjP5NR1fRmQYi4kp
	By9KYoFqi93BA7FNX+LJZD4GT53c5vVKa/ygUMjCg8wsRu8M/eajMfw3IjyPgOqR8U8L9oo0Sgo
	t20Mu
X-Gm-Gg: AYBFou0KtpzsxssnJQ5Ejo+Wunc/QbIPwaa79wbUzZtDCoZv6p2mklI9VKqW9iNxHue
	itiOCE3VnS5c5vjfwlWQb4+6ro6c4SlXlCrlFVIniObxEGcaTWUmI28mmJqExvvYwzFLO9DnkfB
	1m/XE3M9SQpFwe/tfBIdQa+7Fu5BZoYWmN71SDESWdsfgSVKIPO+kmL0LzL6bEgBElRwgeOg6Ke
	GsS/RXxqbcH/OSDVTV5OHOeBfIdw9d7hFzrNIjZA6CxiABWxAAFRO+OgJPuLUCm6VoI32NIt4JM
	oFx+YIvJscpugsqTVShytnUb0gtDc7xMmwRbHdoNdbs5NRQKNFZKqvoOKow5Fq5e1zsB0mxHjsh
	T8x6Rb2xZ73DC7jmqgpFV8e4GLWQWbdNqXlmUDW3NpStvB3JKbN7JuJUpNePz1NkLa0h3FrTR6X
	6BGcGHIj1E3Bntu56L6K7u+6GTbo6pkrqTmnLtem7pNDkFANw5eHx3xPLq5halhr5N+x1QjoMTy
	fPEOUN+rwZOEgyWjpP6HyCDRJQ2ZaFxwtUhHU3oWOSFn9bpCGiDOakug7nUU6KdONd1Ek8hcxOK
	+mgsA+b+AFqDsCYxZjeiM+KP5XtnCeNPo0UqdYe3+nSih/9x65Ao9GgEk8RZq1hd+lnTGnTkPQf
	VEF6heCISoKx/52A8L1wW7Q3ykw==
X-Received: by 2002:a05:6000:4b0f:b0:48d:f7f0:327d with SMTP id ffacd0b85a97d-48e264bdb23mr3403290f8f.29.1792580491986;
        Wed, 21 Oct 2026 04:01:31 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2583e25asm4972423f8f.46.2026.10.21.04.01.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 04:01:29 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 12/36] python3-gmqtt: Upgrade 0.7.0 -> 0.8.0
Date: Wed, 21 Oct 2026 14:00:36 +0300
Message-ID: <20261021110103.1943456-12-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261021110103.1943456-1-leon.anavi@konsulko.com>
References: <20261021110103.1943456-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 11:01:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131271
Content-Type: text/plain; charset="utf-8"

Upgrade to release 0.8.0:

- Remove unnecessary async, fix type definitions
- Multiple logic fixes
- Fix hangs, crashes and mid leaks from the handler split￼

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-gmqtt_0.7.0.bb => python3-gmqtt_0.8.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-gmqtt_0.7.0.bb => python3-gmqtt_0.8.0.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-gmqtt_0.7.0.bb b/meta-python/recipes-devtools/python/python3-gmqtt_0.8.0.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-gmqtt_0.7.0.bb
rename to meta-python/recipes-devtools/python/python3-gmqtt_0.8.0.bb
index f4dfaa345b..cdba352322 100644
--- a/meta-python/recipes-devtools/python/python3-gmqtt_0.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-gmqtt_0.8.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/wialon/gmqtt"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=903f1792621a3b35ee546da75d139177"
 
-SRC_URI[sha256sum] = "bedfec7bac26b6b4ce1f0c4c32cff3d663526a54c882d323d41560fc3b9b44a2"
+SRC_URI[sha256sum] = "61fb7641109f57ca29f73d2d8f2cb487de49d76338ef8c68228db961b6e9696a"
 
 inherit pypi setuptools3
 
-- 
2.47.3

