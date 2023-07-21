Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F8D9C3DA40
	for <webhook@archiver.kernel.org>; Fri, 21 Jul 2023 19:25:42 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.web11.15579.1689967534305770189
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Jul 2023 12:25:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=f+uRA+Ia;
 spf=pass (domain: baylibre.com, ip: 209.85.222.171, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-76571dae5feso213197685a.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 21 Jul 2023 12:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1689967533; x=1690572333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zHynL72XSUWtar0oMlYXX2Mi3E52Z7WLBuR0DFO6HF0=;
        b=f+uRA+IaaNX878AlislFxfG1hi1Awc0dGPxsEVEYvykQxPo6I0L4a3unMfxAgGxn8x
         5p8zmZ6fuJq65L+CW3mLuvk7kSofvWEatdhZBDg5RKOd2DhM54uuHr5K+2ER6Zx4u6O0
         /nFbhqQh66DlI7a3dmFs6E2Y/wXlVWdu+6+9RgfXcmpYpGyE4QbuqLGw1/anGa1QfVwc
         EmOcUotfqHA5Gb2HOIEGV63yP4aj+e45Z79PHrbSfaDabupACRnjagXDqAd4BJ9eaF3S
         N6ipj9F4VjL6bI+COQvUYY1qLePfoKXM97stcqp4S7eNpwpRhkylkdrW5ZjhWnBFrMmL
         gf6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689967533; x=1690572333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zHynL72XSUWtar0oMlYXX2Mi3E52Z7WLBuR0DFO6HF0=;
        b=fphBvw30sqoSkvn3KqkFNiUrpF/7vGlST9yWoS39uwHkO7n2o47NWzt/s2AlTMbRJ7
         C842y6s6Xiifrxc7M8jL7yGCkTaH1vW9y06kTWr70LlJkTBsPmlyZLiuqt03BmXfRrqo
         yUnftS9r6ZNvhcvlTJCEgIAYJkNk6juekJF0CZZ8F7nrDLkw7W5HUBGa+QMFGR8Q+9UJ
         788IBrEi/6mnMuzKcpu7wj3wMPVaHkP/st64pN/KrOzUVZwus5V7KcKcnrdQat5YEGez
         Rwatp+nLHcjERGKnrIKTioHTwLJdMfrmMNjOGeXmJPmVDCKH0aWD4HnoRRXNtSzQmICc
         sdlg==
X-Gm-Message-State: ABy/qLaAFwi0GWJPWFYyHK4dK81I1qEgzw09D//HPQUB3s/GIbfdqxh6
	CJslp84JOR/bB93ozpE/7n2TSTtRusIW+oUl11s=
X-Google-Smtp-Source: APBJJlHFvx5yFuZJB3J2iTrV5upP/9Zj+N6FrC4xOdHnjnrQTVHgvfMMupQ97zi1p4pJ3fC/stRbng==
X-Received: by 2002:a0c:8dc9:0:b0:635:edca:8a5c with SMTP id u9-20020a0c8dc9000000b00635edca8a5cmr949992qvb.26.1689967533114;
        Fri, 21 Jul 2023 12:25:33 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id k30-20020a0cb25e000000b0063cdcd5699csm676669qve.118.2023.07.21.12.25.32
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jul 2023 12:25:32 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 3/9] python3-bitstring: upgrade 3.1.9 -> 4.0.2
Date: Fri, 21 Jul 2023 15:25:24 -0400
Message-ID: <20230721192530.2515633-3-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230721192530.2515633-1-tgamblin@baylibre.com>
References: <20230721192530.2515633-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 21 Jul 2023 19:25:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103976

Changelog: https://github.com/scott-griffiths/bitstring/releases

The LICENSE checksum changed but this is because of a difference in line
endings; the content is the same.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 ...ython3-bitstring_3.1.9.bb => python3-bitstring_4.0.2.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-bitstring_3.1.9.bb => python3-bitstring_4.0.2.bb} (65%)

diff --git a/meta-python/recipes-devtools/python/python3-bitstring_3.1.9.bb b/meta-python/recipes-devtools/python/python3-bitstring_4.0.2.bb
similarity index 65%
rename from meta-python/recipes-devtools/python/python3-bitstring_3.1.9.bb
rename to meta-python/recipes-devtools/python/python3-bitstring_4.0.2.bb
index 94dbae2afc..243504b666 100644
--- a/meta-python/recipes-devtools/python/python3-bitstring_3.1.9.bb
+++ b/meta-python/recipes-devtools/python/python3-bitstring_4.0.2.bb
@@ -2,13 +2,13 @@ SUMMARY = "Simple construction, analysis and modification of binary data."
 HOMEPAGE = "https://github.com/scott-griffiths/bitstring"
 AUTHOR = "Scott Griffiths <dr.scottgriffiths@gmail.com>"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=f7f2fd3f1cd52b5ccd39d76fb3568d3f"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=661f450e2c0aef39b4b15597333444a7"
 
-SRC_URI[sha256sum] = "a5848a3f63111785224dca8bb4c0a75b62ecdef56a042c8d6be74b16f7e860e7"
+SRC_URI[sha256sum] = "a391db8828ac4485dd5ce72c80b27ebac3e7b989631359959e310cd9729723b2"
 
 PYPI_PACKAGE = "bitstring"
 
-inherit pypi setuptools3
+inherit pypi python_poetry_core
 
 RDEPENDS:${PN} = "\
     ${PYTHON_PN}-core \
-- 
2.41.0


