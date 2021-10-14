Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CF9AC433F5
	for <webhook@archiver.kernel.org>; Thu, 14 Oct 2021 12:59:11 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web08.9027.1634216350469611949
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Oct 2021 05:59:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=xke5s/WM;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.52, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f52.google.com with SMTP id t9so26365800lfd.1
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Oct 2021 05:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=x02pbevscrL9oM2FRnbKZK7qxocOh75BnlVYc9i4Fv8=;
        b=xke5s/WMetoQ/cqEhAAgiQTdPZJHnhgYd8fy6SaSDSY/XnoOrAVl0fRoYnNvvtwkwv
         sYibuk1eyAno4q9kuSuKS1xlF+tTubuJ73tcp49HY71AQL4DLfPNHk70HmsCgado3+ze
         ztlRUOPhzlG+Ht4No8d4ekUbkKB+S8sIF8mtsaw3n1O1xfgUVO789n7x3i3O51AxZkRx
         XtMC57Sjc4yecwfjE8hW/rCh9QE4mU9qO8M8ri3ektG5ThQdZ3h/cfMPdfPtZhKYJ5Wv
         fELoFwVSqiGwrlCjSfYafzOAX7ol2BHvdUIE1fWYLMMLdjK1tLWkdn+MQjEtRc7V7zSg
         mrQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=x02pbevscrL9oM2FRnbKZK7qxocOh75BnlVYc9i4Fv8=;
        b=rDfAGTbyxfCIFUNxUJ3JP4NtrlqbNkmtNX90XgSgYs+TnRItmcQb7m9jsHl5VHVPX8
         tIPFOoNCa/a8WIGtfp5LbLTWChjaGv3DlAvnVbfRROmR7MVq4W011zSqgc/o6gS1mh46
         iLG2UM3MeHyM2f1lry6rbNsTzNTB/m6AFk/zQN4PABl4eQ89x522VM+8G+Dr391RThXI
         eeUC5FUc39e3kbjgy8Xj0D4vbNZsd85ta6xvx40xXY2nCuTPBqwjJBO9dL8va0lgOoAY
         h2l/QaFsxnzy/4Sxw0WYyNWb5q0469gp4neNHW/xmlC06iel2yHtsuSXCJ7JWkhnztkr
         qmWw==
X-Gm-Message-State: AOAM5314tuCTZxcY12p7PlcrALU3ICUscVaO7bMbWiHklEZAiM+YdYJ7
	KIINSFaqEboK6o7aLu0tRJ8hvPYyiBEg39lm
X-Google-Smtp-Source: 
 ABdhPJwf7VU3W2hR33WrQEoZCzemNL9joWAQ8YhrEI9jzWJetbi8HwQAdRs1mkVTcVqw/mvvIxR/Tg==
X-Received: by 2002:a05:6512:2115:: with SMTP id
 q21mr5160472lfr.659.1634216345558;
        Thu, 14 Oct 2021 05:59:05 -0700 (PDT)
Received: from localhost.localdomain
 (c-7a22524e.023-160-67626725.bbcust.telenor.se. [78.82.34.122])
        by smtp.gmail.com with ESMTPSA id
 o24sm221841lfb.97.2021.10.14.05.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Oct 2021 05:59:05 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-python][PATCH 1/2] python3-anyjson: remove recipe
Date: Thu, 14 Oct 2021 14:59:02 +0200
Message-Id: <20211014125903.1348112-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Oct 2021 12:59:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93293

The package has not been maintained for almost 10 years now and project
page is down.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../python/python3-anyjson_0.3.3.bb           | 27 -------------------
 1 file changed, 27 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-anyjson_0.3.3.bb

diff --git a/meta-python/recipes-devtools/python/python3-anyjson_0.3.3.bb b/meta-python/recipes-devtools/python/python3-anyjson_0.3.3.bb
deleted file mode 100644
index 07cc99860..000000000
--- a/meta-python/recipes-devtools/python/python3-anyjson_0.3.3.bb
+++ /dev/null
@@ -1,27 +0,0 @@
-SUMMARY = "Wraps the best available JSON implementation available in a common interface"
-DESCRIPTION = "Anyjson loads whichever is the fastest JSON module installed and  \
-provides a uniform API regardless of which JSON implementation is used."
-HOMEPAGE = "https://bitbucket.org/runeh/anyjson"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=989aa97e73c912a83a3c873fa11deb08"
-
-inherit pypi setuptools3 ptest
-
-SRC_URI += " \
-	file://run-ptest \
-"
-
-RDEPENDS:${PN}-ptest += " \
-	${PYTHON_PN}-pytest \
-	${PYTHON_PN}-nose \
-"
-
-do_install_ptest() {
-	install -d ${D}${PTEST_PATH}/tests
-	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
-}
-
-SRC_URI[md5sum] = "2ea28d6ec311aeeebaf993cb3008b27c"
-SRC_URI[sha256sum] = "37812d863c9ad3e35c0734c42e0bf0320ce8c3bed82cd20ad54cb34d158157ba"
-
-RDEPENDS:${PN} += "${PYTHON_PN}-simplejson"
-- 
2.25.1


