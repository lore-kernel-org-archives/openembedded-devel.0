Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03FB5C5CFDB
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 20:09:49 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27793.1786651780546302367
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2026 13:09:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=GguvmNem;
 spf=pass (domain: gmail.com, ip: 209.85.215.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cbedf318752so157513a12.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 13:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786651780; x=1787256580; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3lS/vdfgd/v4k2AoaSTFDHbUv23EE5AwiukuBaUboJI=;
        b=GguvmNemcIx7rTG0jfV0AVfeyAPOFrxd8kxMEnRehmAXvp4jlPmoNAo47XjXamoFH1
         ABBRlMH5OrY6+gVVCevwJ4jDKbGVmh6ovJsR/vEE5v+zQaYrO7Mla4NNoJPWK9jIQip6
         JmwOfT2BNKTL9ewEtjJtSfwASNxIYkqreD/0MI3eE+ah8YhR5PFuiUAArOvTC20SvMhc
         wRCnqUmFZ/4Oz+xGhfhw2Mrvy6BbKOZJfiXPy86sep00K9V6sTvI6awXDJ1ekMgiZHlG
         mlJENSEORBHYI76qtoofm+WfPX/zPVRM0HHYC2+lEWABczNPnqMbGwm8vST8pOpUkj+d
         iNSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786651780; x=1787256580;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3lS/vdfgd/v4k2AoaSTFDHbUv23EE5AwiukuBaUboJI=;
        b=mV4EAYr+Hs+czMlmna+jAG7rZj5VP0t7eXINZblEZi7nPA3kpSbp7SAJoZJxXNHy+y
         Nnj0qoL5BeVnhimssplXCBEYM3ubS8H3KaSTxnxBYB+hqL1WD+q/e//p4qHJLZEiXaG1
         Jeg05jgtflWgAW09n/9NxNFYoacklGn/lqmSV3HJ/Hk8bgDlopvKUJLxOtGVNwtSIvOi
         vWa9rpEaREccHlfVwaG90XiF+nd+v94W3/z5+rRGNdFlVhBZLWEyXUswOheylnk8ZjKQ
         03zSgbqhSLhH+/tZgLe2mL48PqloinUUUgOMA9f8HW+Tz7QuH5xpiIuVAgLVfRBpOr8D
         m+Aw==
X-Gm-Message-State: AOJu0YwTVaL3ByDb0Kp6sz731bt1lpHnWuUofsmwFN0j+5WLISntf71Q
	3pM79jizVzYcdKRSfqpFK9/781lBrE4zN96bb1vMni7GSb6xr4COJS/trDedoNFR
X-Gm-Gg: AR+sD12P7DRbE1yRMBlBQBH1rglxo47/EvKY/etHpcD0aIdX8ocHI2KZINXlsJXCEaQ
	m+D+GjkTqQ5/2rQuTkjzW+A91b8U/eUPF7Qa2ktrgSPjTB9lQEinWie1tGq7+zUp2udtzbLj446
	6LS3ulcbc5UQg4w+yfwAGmgA1t8oeT2Caj+eTGRa7bpW7Z8g8bDpgkOX0BDR1L7sHGln/iAXhP9
	UYRSSmr5mv6fgJxsto9Kzi/JpwTOv+ZCZHdRYQ4BQcgGzU2sUdB0JG9BAoDED8h7I9moJJmwHz2
	Bk2LPq2souaf7Iwoxjo3/9njt7ZGNQ163pHuKciMYm/S7o0iWMD7Ki+2Ca6xhFb/Rhcq+EE5TR4
	sxJcOCsoitvDoNks9zJZqOB0ZfekXK+5cb0H4AIhD1i787ofKfLcpzzrBiVF6eDeDzrC9bEkPIO
	W5etv47uRhOKdDfloYulC5W8+yfEp6sYcEWTQp/5VRNZrIrYaPBhVKjlb5R6xMN23idBaXC7Mvg
	dNF9WRRLwv/0sEZu0Ei48CvjpEzUnYjhQv4mYO/lsjs5JIyKp0/WFcX2mq5M2uHUEsygbVPUYsk
	U+bOoTTQ+krfngkI5P5LtaT1TSAhqWNnMG+JLKgbLISKrbyRmEmIk2gdW7J2PxManwvRhlQYST9
	ri5k2DDmxZ9U+MyWSjUGv41BuvrYJ/wNC4zQ5UwY6J2yZSA==
X-Received: by 2002:a05:6a20:6a21:b0:3b5:489c:7bb5 with SMTP id adf61e73a8af0-3cc71d1e1c7mr273001637.28.1786651779716;
        Thu, 13 Aug 2026 13:09:39 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ebfc37202sm10012289eec.20.2026.08.13.13.09.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 13:09:38 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 34/80] python3-iso3166: add python3-wheel-native to DEPENDS
Date: Thu, 13 Aug 2026 13:07:48 -0700
Message-ID: <20260813200834.1302829-34-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
References: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 20:09:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128978

setuptools3.bbclass and python_setuptools_build_meta.bbclass no longer
add python3-wheel-native to DEPENDS by default, following oe-core
commit e546c697b7 ("classes/setuptools3: remove wheel dependency"),
since setuptools >= 70.1.0 no longer needs the external wheel package
to build a wheel.

This recipe's pyproject.toml/setup.py still declares wheel as a build
requirement, so pyproject-build's --no-isolation dependency check now
fails:

  ERROR Unmet dependencies (checked against .../recipe-sysroot-native/usr/bin/nativepython3):
  	wheel
  		wanted: any
  		found: not installed

Add python3-wheel-native to DEPENDS directly to satisfy it.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-python/recipes-devtools/python/python3-iso3166_2.1.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-iso3166_2.1.1.bb b/meta-python/recipes-devtools/python/python3-iso3166_2.1.1.bb
index 6b96f5775c..876a224d90 100644
--- a/meta-python/recipes-devtools/python/python3-iso3166_2.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-iso3166_2.1.1.bb
@@ -7,6 +7,8 @@ SRC_URI[sha256sum] = "fcd551b8dda66b44e9f9e6d6bbbee3a1145a22447c0a556e5d0fb1ad1e
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 
+DEPENDS += "python3-wheel-native"
+
 RDEPENDS:${PN} += "python3-numbers"
 
 BBCLASSEXTEND = "native nativesdk"

