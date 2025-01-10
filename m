Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 103FDE7719F
	for <webhook@archiver.kernel.org>; Fri, 10 Jan 2025 14:20:10 +0000 (UTC)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
 by mx.groups.io with SMTP id smtpd.web10.19503.1736518806352614025
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Jan 2025 06:20:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DpbtUsTC;
 spf=pass (domain: gmail.com, ip: 209.85.219.170, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e4419a47887so2884777276.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 10 Jan 2025 06:20:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736518805; x=1737123605; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8XLEVg2Fl9Za4FXJwxCdpAH7PfVfq/pdXkp246s5b4o=;
        b=DpbtUsTC/Kllsr4YNyvCeB/bdQqr9LACXBUqi4B5G9JHBrV4F3/Gg6YFut2YqQQS5P
         VbHOToY/znCPNumqaAxwrR36KJJkJGhY83DPuNKi7TtOFocSotNkUob7cAOqJ4qXt/dl
         Gli38Yzl54Z0EicV/KiGOQWQ+TbNNiuNDl5JTVPdLEO8DKO7IMeNLgdotXU0KkIJOgDF
         tvVIewRt9p5ruZkGLxGOlnvhUNEm6IGRgnhmfHASExq2vj2dV358q8kaQhRhknxxsN4Y
         vXs4nyzaPMIog9sPN0SfyPjlgBbhwORVSN0BzPmxf77aOi2ISJjGl8G/IjIFKdzsLfkq
         m9ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736518805; x=1737123605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8XLEVg2Fl9Za4FXJwxCdpAH7PfVfq/pdXkp246s5b4o=;
        b=s2nV69T9nAlxEVegt/uGgDetDLXeewOvVXYpjIwAr22E/mvH/WxtlQaDT3zV1LNUWE
         weeJa9tJBZiM3TUkGITE6dyyoMV9ZGiX1uMdnvfQd9FcOpxEtHoLNxZUa0rUNysn7iok
         11MN5L2nkZAhbLY1Rc9JqmDKF6BTT7iJBiQ8HakZ40nA26Zhd+mjIqLIyEqWqMS0yX0q
         G0hmbeH9E7/Shz1G+RwcLFaSkFdLtDwc+3c7DhjnnBNxBCJm3i/jtSylL03svC4tNFzd
         kQ7A1Atn5A+D0LwHAMI8FQ9iRAEmv2dTACRLW2KczYA0WKorg+0rqJMQgFvLtwBVDY8x
         b7ng==
X-Gm-Message-State: AOJu0YxUOVKvuZ4eJQGY1oHmIHpTlKJ3W8seIsF/bGJMb88X/U6FnYmQ
	HT0oQBUsxf4dTbFIQQPcMmHY9ZMZLoNt5n4H9Ehn2Gm31CBAHYoO8vD46tFT
X-Gm-Gg: ASbGncs+dZbfCrBKe8i/0s3V0HfgOeCImod0O3kFLmPOkiIFr0wB2nK06vBHkrUU2S7
	FrV58z7Ph7Dz9fr14ahP7V69jarfL2IZGhW5Dxcb2qUV7ErEujOwxt8ygIpTkllQpmEu9bXQGjv
	3PO6TlNlQnJClGkm7R4YXl6ol//wDwXavOoxRHMVfaBylvcT2zQQZZjq6Hhjxl5BMmRKGCetlg6
	cnIx2vcrbGtcbNDq0ZO0Dhf1Bn0sZGwMhw/iPBd8a0Gd89PST6S0mjRCG+EEZxz8m8ZP7A=
X-Google-Smtp-Source: AGHT+IHQQ3kt1i/kbZ8xwDiD0MA7Nm2dlUFRTKqfTxw7LIoeodpQxhH6DSb6nbs7TSIADo2IO5HKSA==
X-Received: by 2002:a05:690c:4d07:b0:6ef:5119:6f28 with SMTP id 00721157ae682-6f5311e3612mr86081027b3.8.1736518805430;
        Fri, 10 Jan 2025 06:20:05 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000:152e:c23f:add0:82a5])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6f546c47200sm6373247b3.53.2025.01.10.06.20.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 06:20:05 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: "J. S." <schonm@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][styhead][PATCH 4/5] libhtml-tree-perl: update HOMEPAGE
Date: Fri, 10 Jan 2025 09:20:01 -0500
Message-ID: <20250110142002.370956-4-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250110142002.370956-1-akuster808@gmail.com>
References: <20250110142002.370956-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Jan 2025 14:20:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114780

From: "J. S." <schonm@gmail.com>

Signed-off-by: Jason Schonberg <schonm@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 6623b2f4eade658d45a0728a3c04ab243b7385de)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-perl/recipes-perl/libhtml/libhtml-tree-perl_5.03.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libhtml/libhtml-tree-perl_5.03.bb b/meta-perl/recipes-perl/libhtml/libhtml-tree-perl_5.03.bb
index 30a8e07811..f070196606 100644
--- a/meta-perl/recipes-perl/libhtml/libhtml-tree-perl_5.03.bb
+++ b/meta-perl/recipes-perl/libhtml/libhtml-tree-perl_5.03.bb
@@ -6,7 +6,7 @@ libwww-perl distribution, but are now unbundled in order to facilitate \
 a separate development track."
 SECTION = "libs"
 
-HOMEPAGE = "http://www.cpan.org/authors/id/C/CJ/CJM/HTML-Tree-${PV}.readme"
+HOMEPAGE = "https://metacpan.org/release/CJM/HTML-Tree-5.03/source/README"
 
 LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3eb57a8958cae73cb65e7d0c26339242"
-- 
2.43.0


