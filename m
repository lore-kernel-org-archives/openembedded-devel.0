Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6336.1792499559138462991
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Oct 2026 05:32:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=j7GONyLn;
 spf=pass (domain: konsulko.com, ip: 209.85.128.51, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a1cef0439aso35050565e9.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 20 Oct 2026 05:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1792499557; x=1793104357; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zYszvGqNAfTF8gpYkWM6UV3UHOTnJio1ErOfkmSHyrI=;
        b=j7GONyLnK0YKALaIWtfLSPp/dnbFA1yjucSsx0ub354c5sHiYUUqY82CtDK1O3AeKz
         u9vxyWKOLEzE5JZcZBuOGAIAGrqOM/jsLQwk0fzgR4BPPv4dgSm77Ta1noa870vQyo1Q
         kFJ3Qcc9T4MdMxiqSoigJDwwtSHqRduuLAWlE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792499557; x=1793104357;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zYszvGqNAfTF8gpYkWM6UV3UHOTnJio1ErOfkmSHyrI=;
        b=xQeEnBYHrOFcvBg7RRoUIiQwcxfNLAYfNpAIB7AAWbaA6Dawo21Wy9VRk/TxuvNrID
         6S6dZCKgXMDm41umHjnW75JHmPBGPhJw/t44PaMQyRhRi/NbEJKv7AXtqlVOOOCw8W9M
         0F6cr4MaXeNGNN+fGaYEt7hLFQcngVkoNUUtst8w8IF2MXaPOCaOiF2Kx/sYHnGgUqYh
         9NsPGdOHV378yk1cN0KOEWFhvwz5uE32ojioREVqhlHPHOK/iHTMa40tav5tV3AB0LUj
         ssvgawXXgQhGN2j9VT/8VvLm3bcjMtNi/72iFkrajrTmvoxIaiSKOAu9l2mQlFRFLpLa
         r0ug==
X-Gm-Message-State: AFq9FYI0xpAloQaKTdOuI6ZXiUPQpTSldwkoCTzJsPR6Lw7hO6r4t1Mz
	kHiy5cY5dhsymsek036VEx0k1T0JAhi2dQseWNTSVXdIbMfMBiIkIO3wObqASe8nHs2CfmDDoW3
	zp7A+
X-Gm-Gg: AYBFou0kDH3Zi0mIfjM1MwXtV8afKbSAoMAMji0kVMYsdVP9Ih6oWoJSJNkMF3MQHMp
	whvGsFVrmR83br8NG7Wdc2fG2GVKQHZhau0dx383t5rgz+L70c24A+hE92Sri7UrYfs02FN+cYJ
	N5LR1Fe5bvRT0EPT3GoNhzFGl+zHLG7I5/YxZLQxxzRuGpTaRKMiZx+gb2y8xytnDPWDukNmIvU
	QF55AWotLf6Yw06HQhVGZhVFUqEr9OmLsb4tooVjqrrIaaR191qCizOXWpZZS2m8S0m7kKHCCDU
	DNM8chud4GTAiSn7dcUMqfO2S3SCshFgRAQMEPU1V9RE5fPTOjnrp6RehcmA008n0nvjEm6XU64
	PsNDlt/S+xkDeA9haTFEpLGlhdz8y49dliU70AnRQrPxnqmg0moYjjbRvvgBzvMnFUI+QlMeGwx
	OEiInyrs1/6lBHpTVZhzp+90gQVM+HBuhdb/7D2hHtR3SCZHsLIttxHDMIBdZZwonWvwWcqvaEN
	pbGSb2F6qQF+HauiLa2xbSzFzC9KGONWgg9D0OZyf+b/H6gN1bgSNh5CEI7sGYNYimROwFWN2nE
	26UiaarRKwpECNd/mEvUc08=
X-Received: by 2002:a05:600c:3508:b0:49f:e772:6ddf with SMTP id 5b1f17b1804b1-4a1d762251bmr236113495e9.32.1792499557342;
        Tue, 20 Oct 2026 05:32:37 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2cdc342sm75422675e9.13.2026.10.20.05.32.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 05:32:36 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 09/14] python3-faker: Upgrade 40.37.0 -> 40.43.0
Date: Tue, 20 Oct 2026 15:32:21 +0300
Message-ID: <20261020123226.4033600-9-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261020123226.4033600-1-leon.anavi@konsulko.com>
References: <20261020123226.4033600-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 20 Oct 2026 12:32:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131167
Content-Type: text/plain; charset="utf-8"

Upgrade to release 40.43.0:

- Add es_CO bank provider
- Add es_CO internet provider

Extend RDEPENDS with the missing runtime dependency python3-stdnum.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-faker_40.37.0.bb => python3-faker_40.43.0.bb}     | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-faker_40.37.0.bb => python3-faker_40.43.0.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-faker_40.37.0.bb b/meta-python/recipes-devtools/python/python3-faker_40.43.0.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-faker_40.37.0.bb
rename to meta-python/recipes-devtools/python/python3-faker_40.43.0.bb
index 60c999900b..505ac3fcdd 100644
--- a/meta-python/recipes-devtools/python/python3-faker_40.37.0.bb
+++ b/meta-python/recipes-devtools/python/python3-faker_40.43.0.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "https://github.com/joke2k/faker"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=53360c4126f7d03b63cb79b0dab9e9e1"
 
-SRC_URI[sha256sum] = "a92dff7f310e61fb544c61720e15edb2e7448bc33d15a321a99e9ab7b94abf54"
+SRC_URI[sha256sum] = "02fae4327c03a4a6315e1b428a3878f435bfc276c93435ea349b95c0c9372361"
 
 inherit pypi setuptools3 ptest-python-pytest
 
@@ -33,6 +33,7 @@ RDEPENDS:${PN} += "\
     python3-unittest \
     python3-xml \
     python3-zoneinfo \
+    python3-stdnum \
     "
 
 RDEPENDS:${PN}-ptest += "\
-- 
2.47.3

