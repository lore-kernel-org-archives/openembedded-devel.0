Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96BB7C04A94
	for <webhook@archiver.kernel.org>; Mon, 17 Jul 2023 15:20:47 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web11.11197.1689607238336298526
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Jul 2023 08:20:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=jurdLQOo;
 spf=pass (domain: baylibre.com, ip: 209.85.222.174, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7679ea01e16so435753485a.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 17 Jul 2023 08:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1689607237; x=1690212037;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y2ibyVcbkPwx3IoI8U+wavc704/mfh8FjfSPYU9BBcc=;
        b=jurdLQOo9sahC0bRI/GNPhEog3kjZTgzKihsRAqLDVsypZH5K6QJGS9+PWTZ4mLvJ0
         ITwYmqKlR2xyxWrEP4nBU0A/5m+M8ip/jtTzS9aM9EKVmfwXIPfMOLHXCepaKdNMMXI8
         ahFrSx+Zgb91wxCHhaCq3Y/uuUF37dfIzLmiUiLtHIbDaa+bauK11IQbLwQqO3qb2rUN
         rirzEnHvwjOftyeFFRIF9koTLLM6Nv+MFJe6g0oj6VBUbsRZBA32OBRcLqDvB2uUgn4o
         ICnCEzGrQL+w+wH1LuCREcOuz4i72cLeEB938m9ap+mNFiJq7CEwfa1JP/8sC2/++l3K
         4l/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689607237; x=1690212037;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y2ibyVcbkPwx3IoI8U+wavc704/mfh8FjfSPYU9BBcc=;
        b=T/9UkWu/vdbmJBKI4GPH8Polh250KY3J947ahBULvZ1gvNJHEdhr6tpZJvdUPCasD4
         KXYVfokSOYXi9+GBpfZOg+lT8eQPRLViwSYzr8USsVf5NgH6vhRFoXkRS+lE60VcdyMN
         JCZHcA61xEeaigzBzsRR7F/g9U86IcV79ukRVVVGtj+W7S4uCLMKa4g2kIZSXACO4XoZ
         lvrfZzTtP4cRliYVM51matjAOG8O89PUzsDDI0cs9c8khOsI0QAMVNnB/Hr7zTwmr218
         LxvzFOQ3BfuW/dl63iiTDcKxdcEKM29CtoRNPnbuhX0W/8kxxbClWBZYlsO8J4riSnYt
         evNg==
X-Gm-Message-State: ABy/qLZtTx/evYpX2qLneHcHhz/+sCbJH7VRWRUcLNTourYOofiG4OgS
	1Hn0nhoaOQNc394gU/pvMp9z8CoujQvwlRN6WWI=
X-Google-Smtp-Source: APBJJlGOHdOOPQaNzKZ3KzXSE15dS8Advr9QVeizk+noHg/CFxzLpYkS5oRH7gANvrz6xbeVabydRQ==
X-Received: by 2002:a05:620a:244a:b0:767:dd02:e908 with SMTP id h10-20020a05620a244a00b00767dd02e908mr15838383qkn.64.1689607237243;
        Mon, 17 Jul 2023 08:20:37 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id i8-20020a05620a144800b00767d2870e39sm6144226qkl.41.2023.07.17.08.20.36
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jul 2023 08:20:37 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 6/9] python3-autobahn: upgrade 23.6.1 -> 23.6.2
Date: Mon, 17 Jul 2023 11:20:29 -0400
Message-ID: <20230717152032.3161667-6-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230717152032.3161667-1-tgamblin@baylibre.com>
References: <20230717152032.3161667-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 17 Jul 2023 15:20:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103883

Changelog: https://github.com/crossbario/autobahn-python/blob/master/docs/changelog.rst

Changes:

- fix: use regular PyPI bitarray>=2.7.5 rather than from GitHub master

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 .../{python3-autobahn_23.6.1.bb => python3-autobahn_23.6.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-autobahn_23.6.1.bb => python3-autobahn_23.6.2.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-autobahn_23.6.1.bb b/meta-python/recipes-devtools/python/python3-autobahn_23.6.2.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-autobahn_23.6.1.bb
rename to meta-python/recipes-devtools/python/python3-autobahn_23.6.2.bb
index dc11b85dab..54c8f23fc3 100644
--- a/meta-python/recipes-devtools/python/python3-autobahn_23.6.1.bb
+++ b/meta-python/recipes-devtools/python/python3-autobahn_23.6.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://crossbar.io/autobahn"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3e2c2c2cc2915edc5321b0e6b1d3f5f8"
 
-SRC_URI[sha256sum] = "ce6e540402e3524ca46c55a1bc46255225969b5837ca792ea5415d21ac571034"
+SRC_URI[sha256sum] = "ec9421c52a2103364d1ef0468036e6019ee84f71721e86b36fe19ad6966c1181"
 
 inherit pypi setuptools3
 
-- 
2.41.0


