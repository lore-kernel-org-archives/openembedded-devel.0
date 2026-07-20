Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ED02C44524
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 23:39:12 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11407.1784590743284591552
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Jul 2026 16:39:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=rAXR1pp8;
 spf=pass (domain: gmail.com, ip: 209.85.215.170, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-caf707e3a70so2600042a12.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jul 2026 16:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784590743; x=1785195543; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/jBtTMoTFyVFMQ6kOQmCzdoNMuXjLri9anYrSa/Uc0E=;
        b=rAXR1pp8ikgnCu/lnMTcksYfeC9kU+6AdpWO3fEwGvQzIjA+I938p/Um5DqA7RBcZw
         cxqwOh55lpsmQegVb84Sy0M/FxoFMJV+9F2dr8nhOY36fWrVUbts4xqMJy3XzuNNPxad
         64O13fzj3AGoPraRooIBqgtiaf9Mv2fPbrq/6Unb2MDKLnFPoCiM110KSip7cGeUbbOt
         g7LUUNx6Va7E/TO50x7dsvx3/1ex/4z66Q6nzVKXpUiGxfPB6O1Mfl3BzjaQT+5p5xuc
         wwzg4XiS/KqWXFA80K3vQ01T3+WvJX9sTqKo0Hhd5aXxEYgFKUl5/9yGphhKBpiO0HsC
         TPJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784590743; x=1785195543;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/jBtTMoTFyVFMQ6kOQmCzdoNMuXjLri9anYrSa/Uc0E=;
        b=kxTTlrwykw0I8hDmKaj5G//WiYI9i3RKAIwxpzS2HU28EFsuwmgqM8rW+nOF+zqhuV
         +o5JGez8Fo2NgiDVP/+5EKMAkapNtW0FL6fLgDXWIejOSUKyxlr1XgL2+5EFHg43YDH9
         QxhONSzDGGNIDKw+KSDZDM0RiC2tQ1PCxyenh5N9MmAi0QW97leTAn5O0zzkQ5d4IjyM
         /DJbu9gdO5JYftj1kCTRyCrDOjk3czsLVfs6N6naqPjsI1bGf4q4o8yfYkn+P4gqysAQ
         7Rhg+CC9Ls81UvTf6RO53neoaaHoH6QeAhd0+KAmEYLlElWOAB0a3BXH8inEIBxraJFq
         IaKg==
X-Gm-Message-State: AOJu0YyovirvQh3AIN31jpGTAkJdn8Reez+uRvenWl3+EmRwZ/BIJaAX
	AT7msPDJVC7zHmdiRzSOOB1CTRHe9vVxDB/z6iI9BKvPdbtJCXdEubFO2szkYw==
X-Gm-Gg: AfdE7ckeIgDPhYU/DMpJIHdCOlEpq9qK6IP3umPxCVDZEG3pIkVHnYO7NwCNWJvOMDv
	WwlQk7GUA4+zc7qPVRAzsocbShW5trAQIkpYkuRGzZMaWwjqTnLfqtGzXZTaBfuCcSRF2IFosPe
	hULcKZtJYkPfbxaP68xueMbk8/BdNfNrO29g8ZVyBHrr0QogO/jeDd17lNpu/4wRHdbN8702uuZ
	TVw8gmvDvhQNEu3pxiThFY42hsFr8QbDjfEvq9jt3de/f/zopclzXS+wVofbAMjtKgGoem7Fz5l
	3V4uOMugg5mFMeWMuOp04RQTx5wzc6b+VsaKQh+j/BIuilvgd0PJCHVQNhwvBGJuQl4iK+mi/LH
	wUk5QMzott5VUFEnXOVyn+ZEaOXUZA+gkTpHkVDJxVnNl3rZj216IhaUbUv0WNdyfaxGXbkPEPe
	20eEvZTQZI2wpu9Q0=
X-Received: by 2002:a05:6a20:e293:b0:3b4:6af4:bdd5 with SMTP id adf61e73a8af0-3c38d90e685mr22553921637.15.1784590742620;
        Mon, 20 Jul 2026 16:39:02 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31429fe4677sm36926061eec.11.2026.07.20.16.39.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 16:39:02 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][wrynose][PATCH 15/30] python3-sqlalchemy: upgrade 2.0.50 -> 2.0.51
Date: Tue, 21 Jul 2026 11:37:56 +1200
Message-ID: <20260720233811.2324493-15-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260720233811.2324493-1-ankur.tyagi85@gmail.com>
References: <20260720233811.2324493-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Jul 2026 23:39:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128316

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 1b4d3a76176eecf6e1b0ec98ee5b5475159311b5)

Changelog:
https://docs.sqlalchemy.org/en/21/changelog/changelog_20.html#change-2.0.51

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...ython3-sqlalchemy_2.0.50.bb => python3-sqlalchemy_2.0.51.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sqlalchemy_2.0.50.bb => python3-sqlalchemy_2.0.51.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.50.bb b/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.51.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.50.bb
rename to meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.51.bb
index aa14e1570b..42ed5e341c 100644
--- a/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.50.bb
+++ b/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.51.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://www.sqlalchemy.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=53a9111717b305b0fae0d704a24925c3"
 
-SRC_URI[sha256sum] = "af5607d11ef90fd6a5c0549fe0045dce1663d427426bcfb506dcb5346a85a3b9"
+SRC_URI[sha256sum] = "804dccd8a4a6242c4e30ad961e540e18a588f6527202f2d6791b01845d59fdc9"
 
 inherit pypi python_setuptools_build_meta cython
 

