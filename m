Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B231C001DC
	for <webhook@archiver.kernel.org>; Fri, 21 Jul 2023 19:25:42 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.web11.15580.1689967535575219892
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Jul 2023 12:25:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=w4erMhzE;
 spf=pass (domain: baylibre.com, ip: 209.85.219.52, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-63770af327fso15440096d6.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 21 Jul 2023 12:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1689967534; x=1690572334;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8qw4pR//RMtpOuNQ+p8oKSNsZAqJtEujD+JBhyyVyEU=;
        b=w4erMhzEHuuz5LxrMDcDarzywOccilTEE8ZYmneg3A8vLt2WvwHp2GAmxrAThaGAnZ
         XXeIlEIaebROepz6r8CiKyjMja9svCZdlFwsAU1sXdyWzUk/x/rwztd/m5GJanFTxckZ
         R6XAPIJNPYMFeGPDbrrJdJFwE0YVm6dmvRuCvtkdjmedrqo+KjB2OTBali3GnqRXTX9V
         ywYCyG6pJonL6UaJJIrNBSiIr0PAl+t+cnn80eyryxyrjX8uX7NsekpDD+DdaQd+LKJH
         XwBV+Rt+GTPNG6iPJly5uSts00lIYeE6HZqZvE8ZZ8sWH+H12G82SXWw9nsve/VXyajZ
         ffBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689967534; x=1690572334;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8qw4pR//RMtpOuNQ+p8oKSNsZAqJtEujD+JBhyyVyEU=;
        b=g4QaPi/+IngubNO9WSVBN+48CQUcyLkDm+micrqqQOppWRSLd0VsDufOWUyXPepht1
         xaTORXTr28qc7Tsyexmsacmv6QPET5l9O0hvqsBj/1TdRDvIKtKVlp7TeBVxRLYIEKzL
         IBS/xuWeY2X6Krm8at9ysJuGwlYplzzTEMLUJRUi780PiLpvpg7P/DP/8Pe3VDMM7QAx
         71llPS/b2MtdyECAhp41eU6d+wO778cTMDpMQ50VqKMYhv5UZrrP1TWNLKaePJuuOWls
         VlDjX8jQRLJ3l1F0T2EOG3nYfpabmLvSaqpfAlT8DBqIedevD5HErR3xRw7/i2cz1FBd
         /Ydg==
X-Gm-Message-State: ABy/qLZqYd70THjA7xzH695z7Mn6j7Z8epMWzQAR9fQIm0FRqR8CSiKC
	JBCCjbzrHzsD4esx18a7ekpSY5LRFhivovL9Roo=
X-Google-Smtp-Source: APBJJlH4HSNyQqujxZ+OGrREHXQxIUlSenIBosxLbI/FdkIqcxWtQlj9KQKrHwYVVWgr9ExQtUauHA==
X-Received: by 2002:a0c:e788:0:b0:626:1ba1:70ae with SMTP id x8-20020a0ce788000000b006261ba170aemr876839qvn.33.1689967534408;
        Fri, 21 Jul 2023 12:25:34 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id k30-20020a0cb25e000000b0063cdcd5699csm676669qve.118.2023.07.21.12.25.33
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jul 2023 12:25:34 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 5/9] python3-blinker: upgrade 1.5 -> 1.6.2
Date: Fri, 21 Jul 2023 15:25:26 -0400
Message-ID: <20230721192530.2515633-5-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230721192530.2515633-1-tgamblin@baylibre.com>
References: <20230721192530.2515633-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 21 Jul 2023 19:25:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103978

blinker now needs setuptools.build_meta instead of setuptools3.

Changelog (https://github.com/pallets-eco/blinker/blob/main/CHANGES.rst):

Version 1.6.2
Released 2023-04-12

- Type annotations are not evaluated at runtime. typing-extensions is not a runtime dependency. :pr:`94`

Version 1.6.1
Released 2023-04-09

- Ensure that py.typed is present in the distributions (to enable other projects to use blinker's typing).
- Require typing-extensions > 4.2 to ensure it includes ParamSpec. :issue:`90`

Version 1.6
Released 2023-04-02

- Add a muted context manager to temporarily turn off a signal. :pr:`84`
- Allow int senders (alongside existing string senders). :pr:`83`
- Add a send_async method to the Signal to allow signals to send to coroutine receivers. :pr:`76`
- Update and modernise the project structure to match that used by the pallets projects. :pr:`77`
- Add an intial set of type hints for the project.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 .../{python3-blinker_1.5.bb => python3-blinker_1.6.2.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-blinker_1.5.bb => python3-blinker_1.6.2.bb} (72%)

diff --git a/meta-python/recipes-devtools/python/python3-blinker_1.5.bb b/meta-python/recipes-devtools/python/python3-blinker_1.6.2.bb
similarity index 72%
rename from meta-python/recipes-devtools/python/python3-blinker_1.5.bb
rename to meta-python/recipes-devtools/python/python3-blinker_1.6.2.bb
index dae1e39437..8e77df088d 100644
--- a/meta-python/recipes-devtools/python/python3-blinker_1.5.bb
+++ b/meta-python/recipes-devtools/python/python3-blinker_1.6.2.bb
@@ -2,9 +2,9 @@ DESCRIPTION = "Fast, simple object-to-object and broadcast signaling."
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=42cd19c88fc13d1307a4efd64ee90e4e"
 
-SRC_URI[sha256sum] = "923e5e2f69c155f2cc42dafbbd70e16e3fde24d2d4aa2ab72fbe386238892462"
+SRC_URI[sha256sum] = "4afd3de66ef3a9f8067559fb7a1cbe555c17dcbe15971b05d1b625c3e7abe213"
 
-inherit pypi setuptools3 ptest
+inherit pypi python_setuptools_build_meta ptest
 
 SRC_URI += "file://run-ptest"
 
-- 
2.41.0


