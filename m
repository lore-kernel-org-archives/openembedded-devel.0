Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AE84C369B7
	for <webhook@archiver.kernel.org>; Sat, 12 Apr 2025 15:30:38 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web11.12746.1744471833655478902
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 12 Apr 2025 08:30:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=L9SHIN+g;
 spf=pass (domain: gmail.com, ip: 209.85.215.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-b03bc416962so2108524a12.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 12 Apr 2025 08:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744471833; x=1745076633; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gsjHwSs0AAcsWFpdNF/n9cCaR2EdQ088butQndBa0sw=;
        b=L9SHIN+g/56ljkorTBkcQt4UHGcIUh+409CafPPXEWPixZZyeqZXcykrCb57o0Rvtm
         zRxN29UxgDTlqm0QpwbQmdtbm3DO9XdxqfFLY2t9d6H+Kp49WCOdDmgIHqecj36J/dQ/
         gtRlLqz4NWHlprf1+BD7eT5++U/FBWe328TyMc++nT1wUJIs4avQMda96P7NZEiEd5e8
         Ak6+cvSqbkuwUxdDJehq+HObAj4/CAzLylhXFab4YZBPaMSBF7ksVejY3I6eWcAhhmws
         /AzNTuS6o83ziBHrrTvmY0YknEFKAn3GZ4DtggMErUdv2CpK5Y7jr21E2itaF+l6uEHc
         tP3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744471833; x=1745076633;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gsjHwSs0AAcsWFpdNF/n9cCaR2EdQ088butQndBa0sw=;
        b=GG7M8alS3PZ8RLJoMym/J81jGYx7Tii8yVWtwbW7OSulDMUnr9Mg/C3YEKNLNdQELv
         4rSTTHn4O/2T0YdKObqCRKTTtVVdt5mdXZpb+9UiiFBlTSHRpXTv3QhEGIfj6YcaVSty
         o7pjRMgGHUqFXsqYOyQ4quIio5xrEoTP5NtJE7nY/GcZMu21obIFbc6qX8+zZKz5VIxh
         iPCRjUP86wjEZi7qOytdvHVhVaHQmrhlyGJOlo16ZifbSyqZLE5lLvg3WEv63eGUP0lu
         sY1i6j71dJ2NIXbaAiyGzZb+rbTLaU2MSDAwOcR+N0xlop0YUFYhvFo2OagMl4dMuf5s
         zCew==
X-Gm-Message-State: AOJu0YycyWd9IsnGYFAiCSLZ86ABL2wgXYwMwkVKo+W7tw1iFQGAl6vv
	VfxK0XHemTIxVaucsOuZh2byhShgcIrQ3O/caOnLI3RhT5or51m3/a2uiDPp
X-Gm-Gg: ASbGncsST0eFzYe4eq9dEIcQU+E0pXe1O8kxbnb5kiYMI6jsSS1th/Vaj1pZ6qfvBn8
	aBGTZd2mXAUNGNGoVh4A6Uar7Hvma6emh+W2qNpFrFZQWjCUsTP/KizopQJcFWxEQ2I1u9gCuwm
	7tNaNpB1UUlpQz3hFsvY4kLIlORarMCDcQvvGjhjPmjnSR++uBGECodFTUFSRGqUZtafwmefHI1
	L5xAXZv/C2KcLNUbp/ijBZZW0dQVXs2JzlnSZbfuudvKAi/nLKVFpGS3i7tdzkVP4E6qRyL7xb2
	OFPkFsq7rEGpooyQ586nhjwOvphFLgfl
X-Google-Smtp-Source: AGHT+IHYcHzTFMSzrhvnTTPqSe43jDRJWh97/fRjMKglqwU1ifn9AI9oy9xp6YPEzwMEMRx1Rt/VIQ==
X-Received: by 2002:a17:90b:2804:b0:2ee:e518:c1cb with SMTP id 98e67ed59e1d1-3082365a847mr11335943a91.7.1744471832750;
        Sat, 12 Apr 2025 08:30:32 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::7ceb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306df400ab7sm7686659a91.47.2025.04.12.08.30.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Apr 2025 08:30:32 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-perl][PATCH 7/8] meta-perl-image-ptest-all: Do not run PTESTS_PROBLEMS_META_PERL
Date: Sat, 12 Apr 2025 08:30:21 -0700
Message-ID: <20250412153022.2343322-7-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250412153022.2343322-1-raj.khem@gmail.com>
References: <20250412153022.2343322-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 12 Apr 2025 15:30:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116819

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-perl/recipes-core/images/meta-perl-image-ptest-all.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-perl/recipes-core/images/meta-perl-image-ptest-all.bb b/meta-perl/recipes-core/images/meta-perl-image-ptest-all.bb
index 9efe5087f0..e2cafa98a5 100644
--- a/meta-perl/recipes-core/images/meta-perl-image-ptest-all.bb
+++ b/meta-perl/recipes-core/images/meta-perl-image-ptest-all.bb
@@ -9,7 +9,7 @@ REQUIRED_DISTRO_FEATURES = "ptest"
 require conf/include/ptest-packagelists-meta-perl.inc
 
 # Include the full set of ptests
-PTESTS_META_PERL = "${PTESTS_FAST_META_PERL} ${PTESTS_SLOW_META_PERL} ${PTESTS_PROBLEMS_META_PERL}"
+PTESTS_META_PERL = "${PTESTS_FAST_META_PERL} ${PTESTS_SLOW_META_PERL}"
 
 do_testimage[noexec] = "1"
 do_testimage[depends] = "${@' '.join(['meta-perl-image-ptest-'+x+':do_testimage' for x in d.getVar('PTESTS_META_PERL').split()])}"

