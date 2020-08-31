Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com [209.85.216.65])
 by mx.groups.io with SMTP id smtpd.web12.47289.1598851868390361286
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Aug 2020 22:31:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=BQARm1U7;
 spf=pass (domain: gmail.com, ip: 209.85.216.65, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f65.google.com with SMTP id i13so2540204pjv.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 30 Aug 2020 22:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qgw/MyMOt/+XLfzRCm1Z/YSd9RZpMJCIho2Q6Kl+a9s=;
        b=BQARm1U7tlH6s/ObXDE8yNlEPizG5cZ4wPVRdKPZXvMCEOM6iR6svDv+ffa4PJfrMi
         pkojvJsjznkqtdhazX30W3+1Hkf8JTQPFAD4WIZIYACDHkcwffgrRje54egZKhA15r/9
         Xd77MmflJQ/6EiL+kJ3kAeJDMNYk7dJ5+pbROQMpgB7JMLk7BqYIM2O9RaH59O9UJAKt
         70w4ZF+0qFAWzOuW6WcrqrYVWxLxFYpl2pkyDPBzgfbHDoI5jcBekB02X8lefIRiz4XK
         +exuh1ttFHPoTH6Er3mE2ZEi29QGLtYDNe7+qU6oc3SuQKCNJEdQ/KTk/E6YPrRU3aGO
         +JlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qgw/MyMOt/+XLfzRCm1Z/YSd9RZpMJCIho2Q6Kl+a9s=;
        b=Glb2Xil3WKsiFwgUNKpAUK59uVOv3HZQ91XahCI+nb756blB6piSdUk/xpcLGMpnvr
         f1kd+7SdQzUDJnqiZh2ooJsO4AwhcobscxMTQYbtDvBH0GplRGab0S9s165WxULpx+p6
         Bq4R7qDqGkwI3Wod9gBCaQwiqbze1aAGZpAlWSdWWbjOwMYSHp9ad/eyrudWXJ8JRWKI
         5QDtNsV/pl7kdeT7vOsvU/27G9pPj/GdfstRJhB/ECF5lOe+jXZ6ju51miVTzBlB6ihV
         DWByBGCe4ds9TsKA4jbCt9oUhQ/FTtwFXhlh750m6eNsgQlPeStq8vPYo6ySLVgx7IoV
         7Gwg==
X-Gm-Message-State: AOAM531csg84Zv/N2ZgsZef3R7fxbk+yFvAb7Mvk9NQZ+YufEAoxjzJ4
	dvTJZu/VaMF48LzB0O6I3KdMofs80sXWRQ==
X-Google-Smtp-Source: ABdhPJxBBik9ZfphvtYeWhRS6geCja2o+NbqwadxiicIc0th3yoDN51AIoa1F8WaoaZyUbwiZMjx9A==
X-Received: by 2002:a17:90a:9503:: with SMTP id t3mr78840pjo.171.1598851867677;
        Sun, 30 Aug 2020 22:31:07 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e89d])
        by smtp.gmail.com with ESMTPSA id y9sm1568350pfn.85.2020.08.30.22.31.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2020 22:31:07 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 5/8] ttf-liberation-sans-narrow: Do not install normal liberation fonts
Date: Sun, 30 Aug 2020 22:30:54 -0700
Message-Id: <20200831053057.1541321-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200831053057.1541321-1-raj.khem@gmail.com>
References: <20200831053057.1541321-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

They are provided by ttf-liberation recipe, this avoids install time
conflicts

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../ttf-fonts/ttf-liberation-sans-narrow_1.07.4.bb              | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-liberation-sans-narrow_1.07.4.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-liberation-sans-narrow_1.07.4.bb
index 5b406bc653..57efea86ae 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-liberation-sans-narrow_1.07.4.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-liberation-sans-narrow_1.07.4.bb
@@ -24,6 +24,8 @@ do_install_append () {
     install -m 0644 LiberationSansNarrow*.ttf ${D}${datadir}/fonts/TTF/
     install -D -m 0644 ${WORKDIR}/30-0-liberation-sans-narrow.conf ${D}${sysconfdir}/conf.avail/30-${PN}-sans.conf
     install -D -m 0644 ${S}/License.txt ${D}${datadir}/licenses/${PN}/LICENSE
+    # normal liberation fonts come from ttf-liberation recipe so delete here
+    rm -rf ${D}${datadir}/fonts/truetype
 }
 
 PACKAGES = "${PN}"
-- 
2.28.0

