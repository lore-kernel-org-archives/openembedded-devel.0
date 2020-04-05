Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.19691.1586101791269064133
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Apr 2020 08:49:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=oceO6LOg;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id c12so4910349plz.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 05 Apr 2020 08:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3ig25zLBVOPbbmLPzDTB9GXuioXOjU3FJ9z+KC9gPaI=;
        b=oceO6LOgnBYqhPa38JVIb/1jZ82+hIFWk+erFEys8nvVu0MTTRmpw1IKlBuRK6MpZu
         08WBcgR/12+FrKbw68/dOMQGKuymU33kePhlP9Tz8t01xnAeKa5BSC1I1yYGRntRB9iU
         thikY7bPUugxAYbNjSXnbhrV9lT9o+OY0V29ApSA6VPiM5awkHExnWC735oFfLFwM+/G
         f094OpgzplE3qnIDvT7QdKTraae2J9LH2tDSpUAb0xgV+546+1LWAaw4azzH9i33pZ2J
         NX7WGW3Spux4YGstCrhVrOk45in73vPR3PTRrre49nXGA96AZFgauuc2CEVjGzQmbRMh
         KvEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3ig25zLBVOPbbmLPzDTB9GXuioXOjU3FJ9z+KC9gPaI=;
        b=Dhyt5YSlkkyu747zP4bRR8EgTNUMh/4/9szvPNoebQMtdW9IZCO3W2BqYaanWcR0yO
         GkZtaCdEOmgDYGRkGsu6FVugRpgwg+6UWozzl8ZYX5XC5beXKzCILZT1yaKBbsVo7NG/
         gxulLMEB+tYiE7w50m57DuElZsYJh1p/eh+sjyOg6lKAzlvh4mWBuyKFPWacjmS2zyqV
         BjFRC3JfTEz7ZDsgLWWFdW6AoKmUU4Uv+SRAto2ZX6rsOPWR3zlSj8ueCQnMnL2VMdE6
         ExS98nM+GDPKnLxS27V0ybk6cebj5xIwanl/HdKDDNKe85KinlBvgwzkJ5mi3gR4+CNO
         yyjw==
X-Gm-Message-State: AGi0PuYUS3W0YfgAX+IMKpb6T2/9XUBDrrcRQXkInkABMS7aGvyXzLXc
	Fb1omPVS7s70y1CnfLZh/EaRFNSpWjQ=
X-Google-Smtp-Source: APiQypLkRN337ZB0JBfHGBIeGJArP1RgzKEBGZss5lSDKuWC4FFzsrAyBj4vnMKNLkATVh3POhAB7Q==
X-Received: by 2002:a17:902:b60d:: with SMTP id b13mr17245943pls.324.1586101790496;
        Sun, 05 Apr 2020 08:49:50 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::3e84])
        by smtp.gmail.com with ESMTPSA id k14sm9692933pfg.15.2020.04.05.08.49.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2020 08:49:49 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 4/4] mraa: Use -fcommon
Date: Sun,  5 Apr 2020 08:50:01 -0700
Message-Id: <20200405155001.1816150-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200405155001.1816150-1-raj.khem@gmail.com>
References: <20200405155001.1816150-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

gcc10 is going to default to -fno-common which is opposite of all
previous gcc version defaults, ideally package should be fixed so it can
work with -fno-common but this is good enough for now, it does not
change default behavious with older compilers

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/mraa/mraa_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-extended/mraa/mraa_git.bb b/meta-oe/recipes-extended/mraa/mraa_git.bb
index e702ce0ba9..403d641ee9 100644
--- a/meta-oe/recipes-extended/mraa/mraa_git.bb
+++ b/meta-oe/recipes-extended/mraa/mraa_git.bb
@@ -27,6 +27,8 @@ EXTRA_OECMAKE_append = " -DINSTALLTOOLS:BOOL=ON -DFIRMATA=ON -DCMAKE_SKIP_RPATH=
                          -DPYTHON_INCLUDE_DIR=${STAGING_INCDIR}/${PYTHON_DIR}${PYTHON_ABI} \
                        "
 
+CFLAGS += "-fcommon"
+
 # Prepend mraa-utils to make sure bindir ends up in there
 PACKAGES =+ "${PN}-utils"
 
-- 
2.26.0

