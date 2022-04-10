Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EF26C38161
	for <webhook@archiver.kernel.org>; Mon, 11 Apr 2022 17:17:58 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web11.21910.1649623271228469433
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 10 Apr 2022 13:41:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=fp0FX3uX;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.54, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f54.google.com with SMTP id o2so1726199lfu.13
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 10 Apr 2022 13:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ettN1lpICKpyMeSOlj2q4t9Zb8On/qdW9kILkWnC+8M=;
        b=fp0FX3uXzTJiFhIbwLJ/XEEr6gj2omsChe3g48CYjwY5shoIRwTZJgIVfkEa+SNafO
         hXXO/xOpLP3/n2oQx98xrLCAFarsRqaDtmhM38aTuLd0UsZ8SNQJaYNzdulmWIgH8rxr
         Q4VSB2zfVMBmHPZWT5mRohikL8DFSO5YCcXMgxOuc+7rlTCcSpiOSTU7c+dNftvxgb/s
         ck2wfU07r8+Del7Tfy6HgsKPzKrFQC3pTp88MOfh1WWisnO7/zwR11VOXJOOkZ2Ysrl2
         62/kxQrn7DtH6NysuVzapkp2IW5WvEVF39P9LNevblQ6rn9zt97iyFhfY8wm4NaIwa4+
         wcAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ettN1lpICKpyMeSOlj2q4t9Zb8On/qdW9kILkWnC+8M=;
        b=Eck4hLYPHxLgnSR+3eq/pi4ymr8q4huVWvmc0znSz69Gsgbr0jZejWJ9ShmSIITl7Z
         X0CvoixPZDE3dhkc6HPwX2GpyfA36tOipDGtN4JPvJvcbIUyLK7l6uq0/DVSB3bXjnQH
         DQ1q5IVaie6okc+dhzjU8j02y/KCQBFZ6dlA/sasFOgllYyEUtfCxxWOJBQm/zKhkzAj
         gh8axnmIvSz442tqgRGswz22ysyXU9LFf3tALFjMsY3+aZrWSXwl8IctZwlEQw7iOycw
         oymoR2/l3afwUl6jr8vpUzpNFr/ccTLQ5AI0Bfs84pDProKTug8x+IXiu+ocKYO0Bqny
         IEHw==
X-Gm-Message-State: AOAM532yUV/Sa1Jsrp3c271BXG/Jv86giKEaoA51/Y25b2/le3YqdFrq
	jZlGChKvGXl9X5oeJDL/reoC5J76wukQME/0
X-Google-Smtp-Source: 
 ABdhPJxuskPh61X8QnXpGp1js/TB9tgqDD+x7V8bd36yHE3IApcgFk1y5Hudq0mk7Vo4MWQ71kP7Bg==
X-Received: by 2002:a05:6512:3d24:b0:46b:9f95:9e57 with SMTP id
 d36-20020a0565123d2400b0046b9f959e57mr3590501lfv.246.1649623269075;
        Sun, 10 Apr 2022 13:41:09 -0700 (PDT)
Received: from localhost.localdomain
 (c-7918524e.023-160-67626725.bbcust.telenor.se. [78.82.24.121])
        by smtp.gmail.com with ESMTPSA id
 s15-20020a19770f000000b0046b9d3796c5sm412967lfc.226.2022.04.10.13.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Apr 2022 13:41:08 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-python][PATCH] python3-pyscaffold: update to 4.2.1
Date: Sun, 10 Apr 2022 22:41:07 +0200
Message-Id: <20220410204107.4044450-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 11 Apr 2022 17:17:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96516

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 ...{python3-pyscaffold_4.1.5.bb => python3-pyscaffold_4.2.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyscaffold_4.1.5.bb => python3-pyscaffold_4.2.1.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-pyscaffold_4.1.5.bb b/meta-python/recipes-devtools/python/python3-pyscaffold_4.2.1.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-pyscaffold_4.1.5.bb
rename to meta-python/recipes-devtools/python/python3-pyscaffold_4.2.1.bb
index 7826d89ad..724bbd7f7 100644
--- a/meta-python/recipes-devtools/python/python3-pyscaffold_4.1.5.bb
+++ b/meta-python/recipes-devtools/python/python3-pyscaffold_4.2.1.bb
@@ -9,7 +9,7 @@ LICENSE = "0BSD & MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=14a49c74a1d91829908ac756c07e6b91"
 DEPENDS += "python3-setuptools-scm-native"
 
-SRC_URI[sha256sum] = "55f6532fd6d62b3b698d604257f7a7eda6a87557bbec22760f8c0d9549454802"
+SRC_URI[sha256sum] = "c8cfa9983503f31b301f4b0bec0a8f41518f9a3a3853471ce94f9f9dc770a3e2"
 
 inherit pypi python_setuptools_build_meta
 PYPI_PACKAGE = "PyScaffold"
-- 
2.25.1


