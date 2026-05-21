Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37411CD4F3D
	for <webhook@archiver.kernel.org>; Thu, 21 May 2026 20:14:09 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3122.1779394448416530546
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 May 2026 13:14:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Iy5Z1hCA;
 spf=pass (domain: gmail.com, ip: 209.85.215.175, mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-c7980c060cfso2948899a12.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 21 May 2026 13:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779394448; x=1779999248; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RGwKDzUrprBTvGpXNsDWK3haPz3aBKgloPJ4AcKL59A=;
        b=Iy5Z1hCADw3W3PB7fwKu/uLtBuNLwASTzm1bQUxOXi0Otsu7vBP26B5aCN9jIBEXoa
         2BczAbPIIC1lzJ5SX8vLT6HeIKvBY0mKOC4BPEnuKoiQn1dXEr89Ut7P+URnq+Ux7ZKn
         m+eVIS1eljW5O2zCYlvJ5QAW4P7ovqWm+MePXjH/JzC12bZl94Th3HdO1izv9eCrUjRg
         0fH0GZ6ETWr+zoFl8cgIhnKVvCAP8aP7cm4yo8yMcOvpFzdIHcmx4QQXkZLcpHmRvk5T
         9CrcQEukmXfYUuE1Lh2nJprspgVKxjSiVM+xybGahaevuKv/wlYF4hkgrPqlNsbfnocF
         AAqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779394448; x=1779999248;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RGwKDzUrprBTvGpXNsDWK3haPz3aBKgloPJ4AcKL59A=;
        b=BxJuS8KZ/U1rf96FWx7dAe/T6srq0Lha2Q0e+sKdB1chpfkEBchVAm2vTIUodjg16n
         kR15VZ049V+4hDjKcThLE1Zng/dF7SKEDhQgZD3PuiyhK7y70FK2E01ObdFGNU1sxY0H
         c4TJypPOuYAhD6YPvpVXUXAKXEvT2XNbzGuyxtAhdsPhN6z2z7Wo3SWwlVmKE8BHPqgo
         /CbJbRhQYgx/apGUrNfjgyWYuInQGhHVFa21BKiFyGwJ9sl4vwQz2bmf2XPFkcCjFqgt
         sNkPjQZJQZy0PnmXLZ8u1R6PLCYgrDK6ZrGiQbq1lAWUEFd9uvq98xbNO/IRVkRQ/2W+
         edOA==
X-Gm-Message-State: AOJu0YzRU2nNw7qwlkOAruQgm52T4xnsF0mwSfGdOJZHduYX8njHfr8b
	5I2X8FRqY5XlCr4Ci1PCFK4vvz15ApgOQCWvTPxswf9DN/SBwipQyLNMDF5M4xzO
X-Gm-Gg: Acq92OEkgXD5H9OXL0dXvmHTOOftCEAmOGwxBnaNpV8PmhZWQULzuLz21RE6y9VjiAz
	969w6FTQlklBaPchVm4dzTmOJnIU86zmrtSyJw6bmpD5GdwMjuNWL3D5FimHMqi+lefMcrQSn4H
	O0PCtDwwt0eGh7DE+7Jv1A0c/EBnAx3ovXc5plpN1upANoRzWA4v4v5vZv321jdZ3w04xLYYelS
	RhaFCugcKHADnasqIwwCofBoc8lRbAfT+OPOwNxyaNv9sRZjwP5tyVQYKwAzMTmPChEV17uE4Gj
	KyG3rb7Bz9/ZbrStmPJYzfHO0v0NkWmFBgM1aGblKJ6bSU0cP9V3JyWtBjVwFW/5ScynwMafYWD
	3Slv7p3MUfLoaWFnHLanKqjklfcivnFFRyBemFXSeXx9DdZwz+VgBvVfykqiteSoXt/zG3Crl2G
	UROVGukE4myPB1m9vK8urlE/+f4xMbLbeH3Cpk1WT/CEOzm8k652+JRyrtpFRmzDwoHRvtYrnBv
	oWI5WTlnLotuqAALjURLsBCW4ZQI7mmLg==
X-Received: by 2002:a05:6a21:710b:b0:3b3:1c7b:ffb with SMTP id adf61e73a8af0-3b328ed8088mr444278637.34.1779394447749;
        Thu, 21 May 2026 13:14:07 -0700 (PDT)
Received: from localhost.localdomain (c-98-232-159-17.hsd1.or.comcast.net. [98.232.159.17])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84154e1fc86sm2829241b3a.44.2026.05.21.13.14.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 21 May 2026 13:14:06 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH 1/2] nodejs-oe-cache-native: upgrade to version 24.16
Date: Thu, 21 May 2026 13:13:59 -0700
Message-ID: <20260521201400.63576-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 May 2026 20:14:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127138

Add oe-cache recipe for Node.js 24.16, replacing the existing 22.22
version. This provides the npm cache helper used during SDK builds.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../{nodejs-oe-cache-22.22 => nodejs-oe-cache-24.16}/oe-npm-cache | 0
 ...s-oe-cache-native_22.22.bb => nodejs-oe-cache-native_24.16.bb} | 0
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-22.22 => nodejs-oe-cache-24.16}/oe-npm-cache (100%)
 rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-native_22.22.bb => nodejs-oe-cache-native_24.16.bb} (100%)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-22.22/oe-npm-cache b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-24.16/oe-npm-cache
similarity index 100%
rename from meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-22.22/oe-npm-cache
rename to meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-24.16/oe-npm-cache
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_22.22.bb b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_24.16.bb
similarity index 100%
rename from meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_22.22.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_24.16.bb
-- 
2.54.0


