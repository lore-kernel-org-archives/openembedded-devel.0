Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web10.25628.1605712099390368170
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Nov 2020 07:08:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=UTg3Uii7;
 spf=pass (domain: gmail.com, ip: 209.85.215.171, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id 62so1362478pgg.12
        for <openembedded-devel@lists.openembedded.org>; Wed, 18 Nov 2020 07:08:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=TAU6k5rDufblOrRDhH1+GZp/SXdM84wTftDIT1oa7Dc=;
        b=UTg3Uii7TBi17fW6BrHT4wt1uCKh1hhlg3TozDA9ty+Cqvo+VNH44P7925Au4Ke3Fu
         NmvIsyN7J/vcDL5LI2ZAFFIwBec4tsx6CcDyGloePGXb8xCvcjePFVWjOUdC+ERrPbbf
         Fkx/Dbr562y0d53iIvmQ2BRZglu1/HtpRe3Oh3DsRHrI3td0H0CvA8/2DUi4s+IB/D8S
         D9ec1ZBTgMX8TPilsCb3jnJFre54gfFeWYUP7RPtYRT0FUH23ghkeTNE/GiU8C6Vo1xp
         Qj81WJuLBqvCwCogv94ENjlbWVgNWkkJzj+EeKZpUp/iPmeIlIQX29PJ7OQq46vIcJc8
         0AIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=TAU6k5rDufblOrRDhH1+GZp/SXdM84wTftDIT1oa7Dc=;
        b=Cdc7eMvl3JD+jGjH6vGiMFe67D77b0hSOtZHxQFfvgHPU7q288FGYTl+CFazm1MSP+
         EU64RWby68B8WFPhnNnmJqBAvgomO8dTfLkap4EhumuO63ui46WGBt7vseYCSk+nIzVT
         +8WWl/VGUJcL6xx8ibQnZwlWU0gKgdarsTBf/nthuna6pjfrkRyODdi48n8T2FQJfww4
         1PnInqZ7YM8KbAoiiK+GQBItm9A/z9KRDYWR39kRA5SIOOLGPGz7aRDEvA1nZasH5ADU
         mjzOoGxXP2IjfsEKXdEmJEfBd36xBlaWnaIIZFd++nzWOTjle4DeOjyk9YbIM0OOtIWf
         Tc+w==
X-Gm-Message-State: AOAM533Edjyq8LGqIZHR8fn90e/8Zzl48qL1xqKqrcbDNvrm6sOiuyLV
	/7XpH/my7hqWJa/Lik8ximp7tBNWEQ4=
X-Google-Smtp-Source: ABdhPJwKc6VZ0mTVv/ZpP1M666AB6xIfLoLYdL82MZJt3aTQJIJhjqhD47lCQF1gvJSZSXcAWYmfpg==
X-Received: by 2002:aa7:854d:0:b029:197:9168:80fb with SMTP id y13-20020aa7854d0000b0290197916880fbmr1892365pfn.38.1605712098670;
        Wed, 18 Nov 2020 07:08:18 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:98b0:7a07:4094:f249])
        by smtp.gmail.com with ESMTPSA id g1sm2823005pjt.40.2020.11.18.07.08.17
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2020 07:08:17 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 15/17] Add missing dependencies for rsnapshot.
Date: Wed, 18 Nov 2020 07:07:55 -0800
Message-Id: <e944a811d39040e9fa453b08fc572aafe1e24ccb.1605711982.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1605711982.git.akuster808@gmail.com>
References: <cover.1605711982.git.akuster808@gmail.com>

From: Gianluca Pacchiella <gp@ktln2.org>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit dfd5685ca7fc5688a8b808e6784d1ab22ec12b47)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-support/rsnapshot/rsnapshot_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/rsnapshot/rsnapshot_git.bb b/meta-oe/recipes-support/rsnapshot/rsnapshot_git.bb
index dcadede0ed2..33f5dccca21 100644
--- a/meta-oe/recipes-support/rsnapshot/rsnapshot_git.bb
+++ b/meta-oe/recipes-support/rsnapshot/rsnapshot_git.bb
@@ -13,11 +13,13 @@ RDEPENDS_${PN} = "rsync \
                   perl-module-getopt-std \
                   perl-module-file-path \
                   perl-module-file-stat \
+                  perl-module-file-spec \
                   perl-module-posix \
                   perl-module-fcntl \
                   perl-module-io-file \
                   perl-module-constant \
                   perl-module-overloading \
+                  perl-module-ipc-open3 \
                  "
 
 SRCREV = "a9e29850fc33c503c289e245c7bad350eed746d9"
-- 
2.17.1

