Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.48041.1795411871213319665
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Nov 2026 21:31:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=d09eyxUN;
 spf=pass (domain: gmail.com, ip: 74.125.82.176, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-3863db981d4so3799405eec.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 22 Nov 2026 21:31:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795411871; x=1796016671; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VP6BX+EtDYtJ1U4mF5kF1nKGBqGNNHqOsMzxdZELxcQ=;
        b=d09eyxUNGTA5QYklFHbzrlFf1zKI2zxIdRnF4K1IdbeDemJdqaMi3/8K7YQSqFIaex
         /vIaty/2k/hbLU1y9ikfK5TzUQNrQQI5CnvyECrrkAy7v2OmaIZJl1/oXfnRFsEKyFNd
         4gBBVmvDAPM5ah8XMUvTWJkHvKU4bd29BoxBWLb4x90k6WkQUK+IR9Ks+91L8SIBxzA8
         /5fwvm1mSGEa1uNEFffqG37dBno5f4RVNoPmCJNz1mUDf9yKB43sx05C2DjIn6OPeD93
         6zgfm9uRHtRr8OJffPKddDLJ6uluMRFP1O9KykHylruqcGDGinKNVNiW4s6RnpJXhFZa
         B9Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795411871; x=1796016671;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VP6BX+EtDYtJ1U4mF5kF1nKGBqGNNHqOsMzxdZELxcQ=;
        b=d40kW3xgkmQP7T0BRwuwVK7f7iNACc3xToupcrYUqWyT6ZZ+vKqEo1Eqoc1RU15ina
         C1ahLF79goIDQ6tcYIOCuYnXsBQhpRB3b4dPJkhJrSLDMBJVMWnYNpPJyxLVZVbwmuMe
         JvZ+4DRkhOwWp8l39ff4t41IGexudeFQKKostDLWyjwYGAVLMovGqGxH5Ivj8oYfY/2V
         36tFKrc6h/XBstCKN24jsojcIOwhiiGNsMFSi/xEdgYeyyvoFtkqRKkr/nshP2VvcO+c
         y7bp1U6xMVvBZZpzwg/98J0TWlN+ZpYUsM8stxFJf5JM7mPZOacbVtEbL9q66DH5paWR
         b0eQ==
X-Gm-Message-State: APuU4Z9T7eFw2eoe32qwNNg6dtFV2pBuH8qRZV3uZC7YW9z3QBqQlPlY
	BNjtubZRhg3Bh4LlOgmoJcmcg/NZlWTedCk4QXWTeX8v256xSP54MPb2GLd2oTHUj9k=
X-Gm-Gg: AZFdTZfBwY+0+fe2Gbsxs0UA586020w+CeKULhG97smvxNFe5kDhcRcmshm3MP2csC3
	PpNnRqHl1qIzkBWgpeDZiLDvvBXFilnft0KeZRHfTbjtp1STTeod+sHpLeH0zceLykTS5lmkRN5
	mZCJc+K4VohMJbbJfKNVguGiD8LqspkB41J36MwNX+/GSEk6dIRU2Wxd0d84Za6oTJsHFJq4BEb
	8wEBqRiInduo/azkqlOSgjiLF2rub5jMXMIcLhkUMq90/c18xFZupxhBISDY0LMNiNd3TfdTtrn
	U2CIpX3th6StOlRlZQCs4kTUsUsq8j45eNpveWatZ12aiJqL4AkIJKpKk7WOWPdCCE1fzEyLE0n
	Nt4AqwJSk0wWy6tFBF8LQJZZ1jgGc6oW0f8/ka+ANIKCfVtBj+h75k+VozKf/nR6tUmTAXKrKSd
	nHWRdGCmGjdnrAZ1hVq+kp+KXX82skkv6sv52sfNc6PD3KCy83jz3VGfwzzlMdWGl1DVz/Udwdu
	7JjFo0dg1GY8P3f+9IMWDIkJAGYGEyhlIBzJt1X65tkNo3qYBToUYA64l9aepUPjj/RnZUoGrLS
	zCidpY89gGODJs59okBaleID9GXNKCAlp36UHE3H+3A6AYnXLNxWt+qah8tJHFEVyt0B2f8JUBs
	pS6Y6x5AHGDHCuDvf1//ynHBmBpgOBnlCFuU0vnzd5JgiNPmn9pKQXNEVFIpYTo0QZMt1gM8vm9
	+4Onk4gCNmQ3qplnn7WTojfcQO4eIQP1VeWbXlx2HDppMKSQWOSvtDQ60vFKBrMaMlYn9YCl/+z
	yzxKZMKsN9NBCZSGI2vxnFSy2MphSrch+WwwQNQVvogZojAkMg+PgyBhDqJLhXkTN07QvSoFjwv
	basB
X-Received: by 2002:a05:693c:60d7:b0:386:a01f:a31e with SMTP id 5a478bee46e88-386a01fa8a5mr6582762eec.29.1795411870595;
        Sun, 22 Nov 2026 21:31:10 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm36573136eec.26.2026.11.22.21.31.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:31:09 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 33/42] smarty: upgrade 5.8.5 -> 5.9.0
Date: Sun, 22 Nov 2026 21:29:17 -0800
Message-ID: <20261123052953.3658549-61-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
References: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2026 05:31:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132848
Content-Type: text/plain; charset="utf-8"

Adds PHP 8.6 support and fixes PHP 8.6 deprecation notices in the
replace modifier and escape:'mail' (which also failed without the
mbstring extension).

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../recipes-support/smarty/{smarty_5.8.5.bb => smarty_5.9.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/smarty/{smarty_5.8.5.bb => smarty_5.9.0.bb} (95%)

diff --git a/meta-oe/recipes-support/smarty/smarty_5.8.5.bb b/meta-oe/recipes-support/smarty/smarty_5.9.0.bb
similarity index 95%
rename from meta-oe/recipes-support/smarty/smarty_5.8.5.bb
rename to meta-oe/recipes-support/smarty/smarty_5.9.0.bb
index c700ed5d93..4e2a340877 100644
--- a/meta-oe/recipes-support/smarty/smarty_5.8.5.bb
+++ b/meta-oe/recipes-support/smarty/smarty_5.9.0.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2c0f216b2120ffc367e20f2b56df51b3"
 
 SRC_URI = "git://github.com/smarty-php/smarty.git;protocol=https;branch=master;tag=v${PV}"
 
-SRCREV = "0ae663525dcbc9e996feb2a867e43bc85f960938"
+SRCREV = "d37716def381e7b0450ed1608f24045c18f67eba"
 
 
 INHIBIT_DEFAULT_DEPS = "1"
