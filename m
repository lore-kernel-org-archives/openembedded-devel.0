Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web09.41028.1609122863220049460
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Dec 2020 18:34:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=caT0UvPP;
 spf=pass (domain: linaro.org, ip: 209.85.167.44, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lf1-f44.google.com with SMTP id y19so20847082lfa.13
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Dec 2020 18:34:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=l/uyX73fXJUK/23g2I5u2hTTFNKnyYHBp3Ixr6eUMbY=;
        b=caT0UvPPp8TLq+SIuBaoHJ1mH9L5183q8V8bxfiL5cinBxCi/AIKWPAeyqvarEzEwx
         14TqO/86PCXdclbF2F73x3IthdNwm602FMBpEF1wGvQxeCWLpD7dcvWgO+UqpDnRCY3J
         PNLu+qE46by7oARyQKpjMoNvEulnBOJueQ7SsotDqoSwE63Q5cwhmgAu7DBHRIWaB8dN
         jQnD5RP9wNBAoDkBNjlNcI0zN9Yop7a7UxCcGAxxGxbwgkcSB7lfbsxwe0BN+qLnIxB7
         CKZLWjSFnv95DxB4p0ao7SIddytxwyiXzqYdpTuC3OgIgEOrv+ns65IqygJ73CgtRZ7i
         MpJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=l/uyX73fXJUK/23g2I5u2hTTFNKnyYHBp3Ixr6eUMbY=;
        b=Pv5pqO+u+rqYDmXoCrSjamq+zSw/luI5w/uXvS+RXMSRfAksHOXqZLo31d0+gajYKR
         762rtPScIcTBn/rZq2Cnj1+TDcurvVF9CotCKyaV809/+5ffIYlBM37p6+7TQKYNaHTy
         47EiIvfg08oKQFD4Vl3XZb9+omEKjSaCNQzTJm3JhwNNxr06WgJc4NY9vYK5Dciuy0cQ
         lQChP6U/1PecQpbITNgqP/SCOdVY7Lh3Sonf9iz2OC0/oHyLXczKEaElTQ2Y74LNXniV
         uq+syi8AGSH/uoECavMk2kJHjsvz1JQx+vS/6Pqtzub+WjAZpkB15u7U5Qh87nA1BQGx
         Fuhw==
X-Gm-Message-State: AOAM530TGg2tRAmwvNMgwPNxffgifQ59vv39qpCn5haAYgYOvLRFrhM6
	//a8VoQjG4W65o/AfDZGRGyznr1xZ3BzIGut
X-Google-Smtp-Source: ABdhPJzfhx5ZipsReEYiaSV8fu/cm3GP72dGVxaXddFxqFW5x/NTC//1G/K+Ok/Sjfm7gglMimMnAA==
X-Received: by 2002:a05:651c:2005:: with SMTP id s5mr20013262ljo.152.1609122861253;
        Sun, 27 Dec 2020 18:34:21 -0800 (PST)
Return-Path: <dmitry.baryshkov@linaro.org>
Received: from umbar.lan ([94.25.228.115])
        by smtp.gmail.com with ESMTPSA id t15sm5194248lfl.33.2020.12.27.18.34.20
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Dec 2020 18:34:20 -0800 (PST)
From: "Dmitry Baryshkov" <dbaryshkov@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH v2 5/8] xterm: update to version 362
Date: Mon, 28 Dec 2020 05:34:04 +0300
Message-Id: <20201228023407.3498609-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201228023407.3498609-1-dmitry.baryshkov@linaro.org>
References: <20201228023407.3498609-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Bump xterm version to 362 instead of old 353.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../recipes-graphics/xorg-app/{xterm_353.bb => xterm_362.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/xorg-app/{xterm_353.bb => xterm_362.bb} (90%)

diff --git a/meta-oe/recipes-graphics/xorg-app/xterm_353.bb b/meta-oe/recipes-graphics/xorg-app/xterm_362.bb
similarity index 90%
rename from meta-oe/recipes-graphics/xorg-app/xterm_353.bb
rename to meta-oe/recipes-graphics/xorg-app/xterm_362.bb
index 6376388c2757..34000342421c 100644
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

