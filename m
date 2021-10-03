Return-Path: <daniel@qtec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CCFFC433F5
	for <webhook@archiver.kernel.org>; Sun,  3 Oct 2021 11:02:52 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web11.21267.1633258969198868939
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 03 Oct 2021 04:02:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qtec.com header.s=google header.b=GaPOWYTv;
 spf=pass (domain: qtec.com, ip: 209.85.167.45, mailfrom: daniel@qtec.com)
Received: by mail-lf1-f45.google.com with SMTP id x27so58341919lfa.9
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 03 Oct 2021 04:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=qtec.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uwuotM+VR4/A5yTE1lfWH+2wjhbOSlAMV1spOKlNux4=;
        b=GaPOWYTvivwZaqfva2JD252SWOg5j3msXLsSSe+4LSwpNt6XxJqH75uRvZe6QcEKjz
         YPW3Lu984OciH/HhvZeXLE/4PeV6dJkqJgez/NKvwVwTkVz8kTiPzN/Upuq6OLQtNvxC
         Jz74q/NSuR0UnAeI99pNHElFAjMR5dQ/W/WuHhKne06mCarITbRRHN1gObP1sBZJGNd4
         VUbHuP2/i3RDboDL2t9cVV/LJdg4skvc0eEJFaS/juaZ2fjkPMZMKJkeQ6kZ3NnyQwjg
         iCeHS7oplrN5OG2oUQZ8ENeV2KxD0VyAn2fqhnlKmPeHT1PwUlKNckh5yxd0RZckhJbG
         yPbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uwuotM+VR4/A5yTE1lfWH+2wjhbOSlAMV1spOKlNux4=;
        b=AsiubGdl/XUf3btmiGTf4wmEoEFSR8aZP+XW8aGopS0EQc3KV4CylBKGfnNCSAYvxz
         Erfo6fbi1Y1d8QXqiD+w3u6YRjG4e2WXTu3sir2DVkGeU9DUCyBEYbUyGbckvqHWpRG4
         BOn1GCIGQIDw9x32uNgDP70G0I+Z1vTz4FtlX3UhN+a6MBCco7X9sVTN2Cd7Zm9IxjHC
         XQJXnBS8lSHHHrGd2iCEnSGii1oruLqT5tU9brRDsRSxzGUSNftVhXfDv0JkPAWjy3Z7
         faLQrab/VW6ffjLUeCJgUg8ADXB3svlbJTud6ZWF4W1qtuEjFy/4Gmn0s+yV7DeGMGaM
         t9BQ==
X-Gm-Message-State: AOAM533x9Eqx39OPUtjbHhPdpoFBYUeXFFSySUmTpGPxMr/386CT0YoK
	bumF/JicWNZbVYpyb7ktCsysT7YYMwZMIp1QBQ8cbB4YuE406C+rFpGgysA8BMik/GKmjLHKa7V
	vyfybZ36mZfam6BJB/oBKymTnxhslidzZJi/RaTNULBBdQ0N9M1tLxrulf2Oc4Erg6pgIN7PPW4
	iFMQq/+Yt7LE/7LSfF
X-Google-Smtp-Source: 
 ABdhPJwkcscCXiO23WpB0DBc9cD2XHqu5fqY67/s43gSTgrtdTTQ3/EuJrknUMyXrMnt52bIdQtL7Q==
X-Received: by 2002:a2e:3508:: with SMTP id z8mr7818484ljz.402.1633258966265;
        Sun, 03 Oct 2021 04:02:46 -0700 (PDT)
Received: from localhost (87-52-47-7-cable.dk.customer.tdc.net. [87.52.47.7])
        by smtp.gmail.com with ESMTPSA id
 v138sm1414500lfa.120.2021.10.03.04.02.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 03 Oct 2021 04:02:45 -0700 (PDT)
From: Daniel Gomez <daniel@qtec.com>
To: openembedded-devel@lists.openembedded.org
Cc: dagmcr@gmail.com,
	Daniel Gomez <daniel@qtec.com>
Subject: [meta-java][PATCH] openjdk-7: Replace url wildebeest -> classpath
Date: Sun,  3 Oct 2021 13:02:24 +0200
Message-Id: <20211003110224.524133-1-daniel@qtec.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 03 Oct 2021 11:02:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93194

icedtea.wildebeest.org is down. Replace it with icedtea.classpath.org to
be able to fetch the sources for cacao, icedtea and jamvm.

Signed-off-by: Daniel Gomez <daniel@qtec.com>
---
 recipes-core/icedtea/openjdk-7-release-03b147.inc | 6 +++---
 recipes-core/openjdk/openjdk-7-common.inc         | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-core/icedtea/openjdk-7-release-03b147.inc b/recipes-core/icedtea/openjdk-7-release-03b147.inc
index 627501c..7e0c808 100644
--- a/recipes-core/icedtea/openjdk-7-release-03b147.inc
+++ b/recipes-core/icedtea/openjdk-7-release-03b147.inc
@@ -7,7 +7,7 @@ FILESPATH =. "${FILE_DIRNAME}/openjdk-7-03b147:"
 # Force arm mode for now
 ARM_INSTRUCTION_SET_armv4t = "ARM"

-ICEDTEA_URI = "http://icedtea.wildebeest.org/download/source/${ICEDTEA}.tar.gz;name=iced"
+ICEDTEA_URI = "http://icedtea.classpath.org/download/source/${ICEDTEA}.tar.gz;name=iced"

 ICEDTEA_PREFIX = "icedtea7-forest-2.1"
 ICEDTEA_HG_URL = "http://icedtea.classpath.org/hg/release/${ICEDTEA_PREFIX}"
@@ -64,13 +64,13 @@ SRC_URI[langtools.sha256sum] = "c77dd42d83f06d18fa8aa65c93d137608a2e02cf24b68fc1
 CACAO_VERSION = "a567bcb7f589"
 CACAO_FILE_UPSTREAM = "${CACAO_VERSION}.tar.gz"
 CACAO_FILE_DOWNLOAD = "cacao-${CACAO_VERSION}.tar.gz"
-CACAO_URI = "http://icedtea.wildebeest.org/download/drops/cacao/${CACAO_FILE_UPSTREAM};name=cacao;unpack=false;downloadfilename=${CACAO_FILE_DOWNLOAD}"
+CACAO_URI = "http://icedtea.classpath.org/download/drops/cacao/${CACAO_FILE_UPSTREAM};name=cacao;unpack=false;downloadfilename=${CACAO_FILE_DOWNLOAD}"
 SRC_URI[cacao.md5sum] = "ec1def7f0d3d25e9e7da47c480f26a73"
 SRC_URI[cacao.sha256sum] = "d49f79debc131a5694cae6ab3ba2864e7f3249ee8d9dc09aae8afdd4dc6b09f9"

 JAMVM_VERSION = "4617da717ecb05654ea5bb9572338061106a414d"
 JAMVM_FILE = "jamvm-${JAMVM_VERSION}.tar.gz"
-JAMVM_URI = "http://icedtea.wildebeest.org/download/drops/jamvm/${JAMVM_FILE};name=jamvm;unpack=false"
+JAMVM_URI = "http://icedtea.classpath.org/download/drops/jamvm/${JAMVM_FILE};name=jamvm;unpack=false"
 SRC_URI[jamvm.md5sum] = "740c2587502831cac6797d1233a7e27b"
 SRC_URI[jamvm.sha256sum] = "47fce7bd556c1b1d29a93b8c45497e0d872b48b7f535066b303336f29d0f0d8d"

diff --git a/recipes-core/openjdk/openjdk-7-common.inc b/recipes-core/openjdk/openjdk-7-common.inc
index c87266d..b679f2a 100644
--- a/recipes-core/openjdk/openjdk-7-common.inc
+++ b/recipes-core/openjdk/openjdk-7-common.inc
@@ -332,7 +332,7 @@ BUILD_DIR_ECJ = "openjdk.build-ecj"
 # Force arm mode for now
 ARM_INSTRUCTION_SET_armv4t = "ARM"

-ICEDTEA_URI = "http://icedtea.wildebeest.org/download/source/${ICEDTEA}.tar.gz;name=iced"
+ICEDTEA_URI = "http://icedtea.classpath.org/download/source/${ICEDTEA}.tar.gz;name=iced"

 ICEDTEA_MAJOR = "icedtea7"
 ICEDTEA_DROP_URL = "http://icedtea.classpath.org/download/drops/${ICEDTEA_MAJOR}/${ICEDTEA_VERSION}"
--
2.30.2


