Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web08.11700.1611770542855814893
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Jan 2021 10:02:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LaKcMLwp;
 spf=pass (domain: gmail.com, ip: 209.85.215.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id j2so452891pgl.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 27 Jan 2021 10:02:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=a0VdV7WDbGPW/digpmT4qZnOnzO4OqhjLA8n7EPP2EM=;
        b=LaKcMLwpfL2u1SxSifZCdhI7VJuG336a/trzc8eoNnaPlQhgC4MMl6YZyAk3F7mOfy
         A5dYRUbKMzugfszcgoG/17hbukBj6nuGnw9CxZf7DksdPsIMeJuqe3aBNHZsDGRiomVD
         X5gTvANWM9EdEDyMMhndveVzdigO7XzuO3t5hUcOidCBAo0e6TzWjpZZ2LxkZhdnlRu9
         vKi1Ymdb7E2PfLOvRB+TEHQp/x4Y0sdWpzEPnMtz24BeHnIfwohBiawgKWxqwxrLADgh
         w/9Ju2rzHnf2lqVXfDAzZ2WTwMHyPjysIaJHfYR5TT5mfLzbx1icOVAn+aQ6gS1Ocmcb
         bivA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=a0VdV7WDbGPW/digpmT4qZnOnzO4OqhjLA8n7EPP2EM=;
        b=a7vwJB7mtnb+xbzLlCiM0MQrFYw+cE7Y5wCTHBIeInoYSZqkdrmFhZvdSuuUIx5uRz
         QChLZFO1pu7gyJauZfWdDWKPR3xwGrzpIcFUhlzl9y9sNmF/3pwAM/yCqJ2awcyqr/mB
         jL7IPNIat1yil7lviOGMXgRfS8Q2DXko0dT4rd+AEVREC4DTs24WU4S3+JrmGwuRMylz
         U9IaRQaVMOOE18XvjOZv4oAIFpIn/0OTtdF83+J02E8pBtZrRrIjm2h9nmTvSLKHhwLM
         ojHq23UBo4JQpX9x1ttAiIXktnYN5FAPCSypKQXOgcazbTHqhZZQnqVtArXbzWhW+t+J
         WsnA==
X-Gm-Message-State: AOAM533BCN3JRgxSOGi5KGkSXLEWVaTEb5/vBbCm+g0+MhZFjrnNJ3he
	iYcJFoWin+ivY9c4xOMuPf3VfwpDjxkHNQ==
X-Google-Smtp-Source: ABdhPJz5PKGx5lfXUf5W0rRgGBvr/40xOrXxoDBpZ5VMiuLIpqXbt9MT4gbFSx4tGTARMOlySDBiAQ==
X-Received: by 2002:a62:ea17:0:b029:1ad:4788:7815 with SMTP id t23-20020a62ea170000b02901ad47887815mr12000381pfh.1.1611770541973;
        Wed, 27 Jan 2021 10:02:21 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::9296])
        by smtp.gmail.com with ESMTPSA id 197sm3031321pgg.43.2021.01.27.10.02.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jan 2021 10:02:21 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] autoconf-2.13-native,xserver-xorg-cvt-native: Move inheriting native to the end
Date: Wed, 27 Jan 2021 10:02:19 -0800
Message-Id: <20210127180219.758901-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Should fix
QA Issue: xserver-xorg-cvt-native: native/nativesdk class is not inherited last, this can result in unexpected behaviour.  [native-last]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-devtools/autoconf-2.13/autoconf-2.13-native_2.13.bb | 2 +-
 .../xserver-xorg-cvt/xserver-xorg-cvt-native_1.20.10.bb         | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/autoconf-2.13/autoconf-2.13-native_2.13.bb b/meta-oe/recipes-devtools/autoconf-2.13/autoconf-2.13-native_2.13.bb
index a54a7331df..604135839a 100644
--- a/meta-oe/recipes-devtools/autoconf-2.13/autoconf-2.13-native_2.13.bb
+++ b/meta-oe/recipes-devtools/autoconf-2.13/autoconf-2.13-native_2.13.bb
@@ -19,7 +19,7 @@ S = "${WORKDIR}/${BPN}"
 SRC_URI[md5sum] = "9de56d4a161a723228220b0f425dc711"
 SRC_URI[sha256sum] = "f0611136bee505811e9ca11ca7ac188ef5323a8e2ef19cffd3edb3cf08fd791e"
 
-inherit native texinfo
+inherit texinfo native
 
 DEPENDS += "m4-native gnu-config-native"
 RDEPENDS_${PN} = "m4-native gnu-config-native"
diff --git a/meta-oe/recipes-support/xserver-xorg-cvt/xserver-xorg-cvt-native_1.20.10.bb b/meta-oe/recipes-support/xserver-xorg-cvt/xserver-xorg-cvt-native_1.20.10.bb
index 170e0bf785..becf991488 100644
--- a/meta-oe/recipes-support/xserver-xorg-cvt/xserver-xorg-cvt-native_1.20.10.bb
+++ b/meta-oe/recipes-support/xserver-xorg-cvt/xserver-xorg-cvt-native_1.20.10.bb
@@ -14,7 +14,7 @@ SRC_URI[sha256sum] = "977420c082450dc808de301ef56af4856d653eea71519a973c3490a780
 S = "${WORKDIR}/${XORG_PN}-${PV}"
 B = "${WORKDIR}/build"
 
-inherit native pkgconfig
+inherit pkgconfig native
 
 do_configure[noexec] = "1"
 
-- 
2.30.0

