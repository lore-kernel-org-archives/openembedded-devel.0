Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web09.16500.1608945665293485664
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Dec 2020 17:21:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=u+jG7ifY;
 spf=pass (domain: linaro.org, ip: 209.85.167.44, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lf1-f44.google.com with SMTP id b26so12253211lff.9
        for <openembedded-devel@lists.openembedded.org>; Fri, 25 Dec 2020 17:21:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=l1N/CBKbEtrrgdLZFLO59iQinD60lzbIw+oUx6k/0B0=;
        b=u+jG7ifYbcA9KZmWxAIvws6fG+ftOVbxMZhZ9h9qg9RcXx290Fcjd32EdNyEXrLgQh
         4AFbfLIHlHYqjStr30Psm8meV7xSMjBDUO9mIWpj+3JFp0e8lrEzgiQrmKc+wbSS+FM4
         vbigUtI6cnzJnMD0IdQiTFaV5ENwAW0Vhd2qI2TOlAPdUzYEQTEB7xU5Hi9cvtv5Lmfh
         5PYZmNl4iIVb5KQs6c/i000Kql5Ht2JdPclddDF21qHfYyRKuswmL/nr43JSUGRDAAe8
         mM0Mo46LEEgMxtXBNYo6VjLiKy16yaWaEA3lAjku3VaW3kf1wDPjv/6FbX+D7xQiqkmo
         /FXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=l1N/CBKbEtrrgdLZFLO59iQinD60lzbIw+oUx6k/0B0=;
        b=tpby7m5G47+LtYKLTweTYQzYEeoIw23J1xZb5XvbnHE6ljoKXr7FG5WpH/jzmjT7BV
         wMbOUeUE5LSXNVOvJCdkUSTwctvbj2gkWrDUdcG5N8ODcM5AV/8W9CwlvB9GG1F0WMet
         dZpboGcXk+dPuTIyX3Z+423zbJG0TsT2GVhHqYw4BBXUbIfUad+jJnJfeQsDNr/d+8T7
         jiAtzuSbPKwBKqnqwnwB207AH9JWIjX7Ph6+6xP2uNT/XHB4vbdqTllQ7CqrXlS5qaPv
         Cn8+DD6Ek35d4Ubrhw+MkxmhAYdnmZi7JKyM8cbWn9Wbs7x3bRl4x8HzIB1aeYZhcRYY
         hrcA==
X-Gm-Message-State: AOAM533cBgM8zTNr9HXRW1jxR9MtbPdQw2W9/MnmXZfwotpfpoj1hfYr
	k99ThhlEl5l1f63O6bwLNhm9lvtkYupk6Q==
X-Google-Smtp-Source: ABdhPJz78+Pv5+sAaOBS96xM5a+XMTP3D+IKVH58p3g00dai0DpfKQSK6K6W73iu91/inLV+Z224Jg==
X-Received: by 2002:a19:ac06:: with SMTP id g6mr9734134lfc.611.1608945663275;
        Fri, 25 Dec 2020 17:21:03 -0800 (PST)
Return-Path: <dmitry.baryshkov@linaro.org>
Received: from umbar.lan ([94.25.228.59])
        by smtp.gmail.com with ESMTPSA id a15sm4306317lfg.27.2020.12.25.17.21.02
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Dec 2020 17:21:02 -0800 (PST)
From: "Dmitry Baryshkov" <dbaryshkov@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 7/7] xterm: update to version 362
Date: Sat, 26 Dec 2020 04:20:54 +0300
Message-Id: <20201226012054.3689086-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201226012054.3689086-1-dmitry.baryshkov@linaro.org>
References: <20201226012054.3689086-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Bump xterm version to 362 instead of old 353.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../recipes-graphics/xorg-app/{xterm_353.bb => xterm_362.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/xorg-app/{xterm_353.bb => xterm_362.bb} (91%)

diff --git a/meta-oe/recipes-graphics/xorg-app/xterm_353.bb b/meta-oe/recipes-graphics/xorg-app/xterm_362.bb
similarity index 91%
rename from meta-oe/recipes-graphics/xorg-app/xterm_353.bb
rename to meta-oe/recipes-graphics/xorg-app/xterm_362.bb
index d1885988054c..5608330f96d2 100644
--- a/meta-oe/recipes-graphics/xorg-app/xterm_353.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xterm_362.bb
@@ -8,8 +8,8 @@ SRC_URI = "http://invisible-mirror.net/archives/${BPN}/${BP}.tgz \
            file://0001-Add-configure-time-check-for-setsid.patch \
           "
 
-SRC_URI[md5sum] = "247c30ebfa44623f3a2d100e0cae5c7f"
-SRC_URI[sha256sum] = "e521d3ee9def61f5d5c911afc74dd5c3a56ce147c7071c74023ea24cac9bb768"
+SRC_URI[md5sum] = "ee6710bbbe18000236c6e6d7b55b54d5"
+SRC_URI[sha256sum] = "1d4ffe226fa8f021859bbc3007788ff63a46a31242d9bd9a7bd7ebe24e81aca2"
 PACKAGECONFIG ?= ""
 PACKAGECONFIG[xft] = "--enable-freetype,--disable-freetype,libxft fontconfig freetype-native"
 
-- 
2.29.2

