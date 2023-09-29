Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAB95E71D3F
	for <webhook@archiver.kernel.org>; Fri, 29 Sep 2023 14:02:38 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web11.18151.1695996152719085205
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Sep 2023 07:02:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UkAZghVf;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-53639fb0ba4so2607368a12.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 29 Sep 2023 07:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695996151; x=1696600951; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s7/1uG849u012oM6lKQT/Athdht+HxyXexntAMVOPXA=;
        b=UkAZghVf4snH17Y3HbYrCKqp8Y61MV4Zxn7B38COnEYb0sWcgg8Xtb6/C/iVnlsgb0
         ZYmvgrUUWpKEWekAYBE9TxqUzotLV4DMBZZEerdmrycsHyTiSCdD/HKtXbyKPM5r3tNf
         Q9Jt6RuyVN+IcABKa2XyjPyn4QB37oXKofe4yyUMhW7CFNYHdiMIFiyF5YkOfu1RLlTf
         uBxprMz1a56o4PFuE+4LyOtHARj7ZhVFxVIt2sfGy7Pw9+bxsaam49JcHeT9nTSfLQbY
         CGn0Lacgo6KKD/aBo9FQ64i7rxijLm5t/re2jeaHu9cTC3v6jhXXqTSObAGatZ+YzNwX
         pOhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695996151; x=1696600951;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s7/1uG849u012oM6lKQT/Athdht+HxyXexntAMVOPXA=;
        b=w/080XzT7T3JHOHBaPvG8HPR6EH65rh2HwtolEqNt6PnHp/JdKwSzRx0QiLwNLLpY5
         n2eLQKwb5OzAo21XHKdC0M/inJXefEmDMQmfP99avM/ynF9NXfdjR2rUiaGoFnhmsD1u
         5LYZHgclPVAc8bjZb66FbD6IiNKDHcQkqCQpZ0ME7VYFal1pFYjWG7GLVmOvnR707JQS
         jCxsICirxxsG+oim3lSm/O+/Y5/Kw/B/N5IkLrehCro13lEx9jX1drYuYIvEadiCiWLG
         bK/d5XuHxRnxuTr53yCqrGb4MsbfRhW970NnfKOH5hGlfCsjQGV0HLJqPu7IpwJGXPp4
         iXrg==
X-Gm-Message-State: AOJu0YyEo9XEpArcB8go1jiMsI1E9xsewtzzOMwS0DQXDKRxRwY18JA+
	2Jd7+A90tyK+c1cYBTx9ykByQnBV8qY=
X-Google-Smtp-Source: AGHT+IEdtkyBueAU25JYKALruJsb7Btz8u2ckq4+fUCl1EWoMj87DaoyyBUT/pyNQIrXXzJe74/iCw==
X-Received: by 2002:a05:6402:610:b0:522:ca6b:ad7d with SMTP id n16-20020a056402061000b00522ca6bad7dmr3864341edv.9.1695996141771;
        Fri, 29 Sep 2023 07:02:21 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id w5-20020aa7d285000000b00537666d307csm925116edq.32.2023.09.29.07.02.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 07:02:21 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH 2/2] meta-oe/dynamic-layers: add one more missing Upstream-Status and fix one malformed
Date: Fri, 29 Sep 2023 16:02:15 +0200
Message-ID: <20230929140215.522222-2-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230929140215.522222-1-martin.jansa@gmail.com>
References: <20230929140215.522222-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 29 Sep 2023 14:02:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105248

* even openembedded-core/scripts/yocto-check-layer didn't spot missing Upstream-Status in:
  /OE/layers/meta-openembedded/meta-oe/dynamic-layers/gnome-layer/recipes-graphics/openbox/openbox-xdgmenu/7_6.diff

  nor

  Malformed Upstream-Status 'Malformed Upstream-Status in patch
  /OE/layers/meta-openembedded/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc/0001-Unbolt-ubuntu-hack.patch
  Please correct according to https://docs.yoctoproject.org/contributor-guide/recipe-style-guide.html#patch-upstream-status :
  Upstream-Status: Inappropriates [ Cross-compile specific ]' (/OE/layers/meta-openembedded/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc/0001-Unbolt-ubuntu-hack.patch)
  Unknown Upstream-Status value 'inappropriates' (/OE/layers/meta-openembedded/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc/0001-Unbolt-ubuntu-hack.patch)

  those were caught by patchreview.py again, but executed on dynamic-layers/* as:
  openembedded-core# for l in /OE/layers/meta-openembedded/meta-oe/dynamic-layers/*; do ./scripts/contrib/patchreview.py -v $l > $l.qa-patches; done

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 .../recipes-graphics/openbox/openbox-xdgmenu/7_6.diff           | 2 ++
 .../lirc/lirc/0001-Unbolt-ubuntu-hack.patch                     | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/dynamic-layers/gnome-layer/recipes-graphics/openbox/openbox-xdgmenu/7_6.diff b/meta-oe/dynamic-layers/gnome-layer/recipes-graphics/openbox/openbox-xdgmenu/7_6.diff
index 8ab5386dc1..cdb29f24dc 100644
--- a/meta-oe/dynamic-layers/gnome-layer/recipes-graphics/openbox/openbox-xdgmenu/7_6.diff
+++ b/meta-oe/dynamic-layers/gnome-layer/recipes-graphics/openbox/openbox-xdgmenu/7_6.diff
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 === modified file 'openbox-xdgmenu.c'
 --- openbox-xdgmenu.c	2011-09-03 20:13:39 +0000
 +++ openbox-xdgmenu.c	2013-12-28 17:41:04 +0000
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc/0001-Unbolt-ubuntu-hack.patch b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc/0001-Unbolt-ubuntu-hack.patch
index e58a93b6f6..73bacc9139 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc/0001-Unbolt-ubuntu-hack.patch
+++ b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc/0001-Unbolt-ubuntu-hack.patch
@@ -7,7 +7,7 @@ This bites during cross compiling where the target is different than
 build host and build host might be ubuntu but that does not matter in
 cross compilation case. This fails builds when usrmerge feature is used
 
-Upstream-Status: Inappropriates [ Cross-compile specific ]
+Upstream-Status: Inappropriate [ Cross-compile specific ]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  configure.ac | 2 +-
-- 
2.42.0


