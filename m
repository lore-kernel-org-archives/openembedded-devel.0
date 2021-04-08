Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
 by mx.groups.io with SMTP id smtpd.web12.250.1617899819048340502
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Apr 2021 09:36:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=DngYVhFO;
 spf=pass (domain: gmail.com, ip: 209.85.167.177, mailfrom: akuster808@gmail.com)
Received: by mail-oi1-f177.google.com with SMTP id i81so2791155oif.6
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Apr 2021 09:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=6AT9vl6Kw247Vl55TdHXpY7nGVHMCvNyo7Fr7oq6Pkg=;
        b=DngYVhFOwj31Nf+6xMStFueaZkT23Ssts2qePVs6YJiU9xeKuYUACb5wCjovEloX7O
         y7E8D2fNfywmaJcCFbLbdArv2mFboFP5yBE2kzWNil4SXLUsdntDigldSALzONtB3/39
         /xhl6R1QzXsUQhx7DlUySrvvNnPE3l79U3JeoIUGPwm0rfWiAAwVOPfWVapW9UhU8CJd
         WIHutMHqdCfkJrZFYDebf8FaKLtKv0BOMIdf4SkVzkMsoUxlfhnfwmunHSRqyscZ8w5v
         k6P5SgwEfNZGk5fLsF8hKTaC2Rlns7u5LM9Ecg316FmkQW0rLYtEdYKNXKHQuKJ4M2Wq
         vwvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=6AT9vl6Kw247Vl55TdHXpY7nGVHMCvNyo7Fr7oq6Pkg=;
        b=uOOttCJivvg+vOWUoeClqBWM4JJ4njwsgExWiZQQ2Dc4jGPNDp26/MV9E4Sh31q97K
         xlIxWyzAzrtwenFjHhEm5wzmH2e61/fqHewRoSTPN2TGw76wAFgZyqkhLM5c/W9xDRE8
         FQuQXEDmGkv46UYqn1W5vS0SJGm49JMZRt708AkdRncQfTHJs12eZYZL4kz+HTqjFEoy
         FD64jLJbwIyckxSx69xfA+mHVUXeRHYqD1w1Tz+zWILndi33RCiNWr54/LbYtIwMrVpi
         c2p2nsK+RzSsK1GxORjqbc2Yxj41URoQZLGVZkMgPVlV0HW8WqEUJfji5yE2IMD3FwtY
         AWzg==
X-Gm-Message-State: AOAM531P+CJMqUO5B3SY4XZzok8zwY03sJxIwf1VsTDARaaBykl6y8py
	O1RxkpPHpopCfVm9UhILSWswLOZHqi0=
X-Google-Smtp-Source: ABdhPJw887BuowU4I4sRhgLLvgv1kEYnX94x8s1Xdo72OHJGfohISNl01LdvT3ZgfIgj3ae/QcR1YA==
X-Received: by 2002:aca:5ec6:: with SMTP id s189mr6848420oib.112.1617899818198;
        Thu, 08 Apr 2021 09:36:58 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:8533:6d3:7a8:8272])
        by smtp.gmail.com with ESMTPSA id s131sm4977838oib.14.2021.04.08.09.36.57
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 09:36:57 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 49/64] python3-regex: Upgrade 2021.3.17 -> 2021.4.4
Date: Thu,  8 Apr 2021 09:35:56 -0700
Message-Id: <fb0bbfdbbb6f969a51d0502d183893e73ce1419e.1617899100.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1617899100.git.akuster808@gmail.com>
References: <cover.1617899100.git.akuster808@gmail.com>

From: Leon Anavi <leon.anavi@konsulko.com>

Upgrade to release 2021.4.4 with the following bug fixes:

- regex fails with a quantified backreference but succeeds with
  repeated backref
- API is not a drop-in replacement for python's re when it comes
  to typing

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
(cherry picked from commit ad0df8ff6f2c5e3aa8cf11cabd616f3352a22144)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../{python3-regex_2021.3.17.bb => python3-regex_2021.4.4.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-regex_2021.3.17.bb => python3-regex_2021.4.4.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-regex_2021.3.17.bb b/meta-python/recipes-devtools/python/python3-regex_2021.4.4.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-regex_2021.3.17.bb
rename to meta-python/recipes-devtools/python/python3-regex_2021.4.4.bb
index a3cb8041331..177b06b97c8 100644
--- a/meta-python/recipes-devtools/python/python3-regex_2021.3.17.bb
+++ b/meta-python/recipes-devtools/python/python3-regex_2021.4.4.bb
@@ -5,6 +5,6 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=f0a3e4a2554ebb89c0
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "4b8a1fb724904139149a43e172850f35aa6ea97fb0545244dc0b805e0154ed68"
+SRC_URI[sha256sum] = "52ba3d3f9b942c49d7e4bc105bb28551c44065f139a65062ab7912bef10c9afb"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

