Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.22643.1628514937623445681
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Aug 2021 06:15:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gJ+Qg+T/;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: aj.bagwell@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id u1so581471wmm.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 09 Aug 2021 06:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QJiuPsgg28wRBfrDjGWkS81S+6Ace9sP5ISJ1nxaPYE=;
        b=gJ+Qg+T/I2mv4wn7kbTLurYVXGbg2i4VLw/YGyEsZ2wXLWEyMsFA/UBKFu/a0V66wC
         e8dFSnhwHsStlNJxeEDehiOTsKZQsKsf5Tdl6PZTYIQelUALERLN3FIyKYu39F2t311T
         N6ttsV69a54x3ZSn4g+tuTrPdvp5qXyt7lt3J2sVSk6OhOJZAn7Oavp9/VL2uTLAtvMp
         ikMwMmOBi+GNPrIU1CSvUPWwJpa7yDT/OmMfXZZAs/V7uqaHT8IFPcIx8AAjO3RrTw2t
         J6zmVdgGkoqkrNe3StwDDcRHunQkCOsXj5twYnXohUW7DcrGThpFbVr67WexJl34/32L
         eUow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QJiuPsgg28wRBfrDjGWkS81S+6Ace9sP5ISJ1nxaPYE=;
        b=mSf6FsKBqQFHz3szu+i5UaVk13ZjxS4NSn0XXkTsQ32MFecqfkOxXJwlKVwnPiJeAo
         kTiv5YVojQuLOvqFdhPEk7kZXCDLemaEORGU4YbwwtzdnbZqDJHbZSfdi+U/0odIKjlB
         6V1lXat5c0YbWq2YO0NQA2CxJsk9s4NboWbncNJHt31pNQ2rRdv1VapE/m/UYuycwueF
         6FDRNl7OqlgeS314fHMdoJphDsGYFAaV/6H7HPFTBrBT9ZxmEUUTYtOKL/cAE9LgoAn3
         qxIgz1pdXOkXr09Dbk5MG+FKIVSTD+cXcx4SLI8OCyHU0cYl1KiZ/n7MZWM2v9HQsHAR
         Rxcw==
X-Gm-Message-State: AOAM533wZo1IL915baAKsNXeLs4nvbqFfGa+XIT0zYqd61uWsyK3Mjx5
	DWfmn6bibQ70T/FNejvLpwSsovSlLXg=
X-Google-Smtp-Source: ABdhPJzvwYxkl0eXZhZAjVH6ymnyZnc3kY78KAXHKdJp1g2fuvrtRBh3F11SSBmgHnX0nod0Kb2ZhQ==
X-Received: by 2002:a7b:c85a:: with SMTP id c26mr16520511wml.44.1628514935788;
        Mon, 09 Aug 2021 06:15:35 -0700 (PDT)
Return-Path: <aj.bagwell@gmail.com>
Received: from localhost.localdomain (cpc108959-cmbg20-2-0-cust309.5-4.cable.virginm.net. [80.0.21.54])
        by smtp.gmail.com with ESMTPSA id w5sm22866523wro.45.2021.08.09.06.15.35
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 09 Aug 2021 06:15:35 -0700 (PDT)
From: "Anthony Bagwell" <aj.bagwell@gmail.com>
X-Google-Original-From: AJ Bagwell <anthony.bagwell@hivehome.com>
To: openembedded-devel@lists.openembedded.org
Cc: AJ Bagwell <anthony.bagwell@hivehome.com>
Subject: [meta-java][PATCH 0/2] Update to new override syntax
Date: Mon,  9 Aug 2021 14:09:36 +0100
Message-Id: <20210809130938.12027-1-anthony.bagwell@hivehome.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This consists of two commits, the first is the result of running the
automatic migration script, the second is cleaning up some places
where it was over zealous.

I also had to rename the do_remove* tasks to do_delete* as the _remove
trips up the old syntax checker

AJ Bagwell (2):
  all: run convert-overrides (0.9.3) script to convert to new override
    format
  all: manual fixes for new override syntax

 classes/java-library.bbclass                  | 10 +--
 classes/openjdk-build-helper.bbclass          |  4 +-
 classes/openjdk-test-image.bbclass            |  2 +-
 classes/openjre-test-image.bbclass            |  2 +-
 recipes-core/ant/ant-native_1.8.1.bb          |  6 +-
 recipes-core/antlr/antlr_2.7.7.bb             |  6 +-
 .../ca-certificates-java_20180516.bb          | 12 +--
 .../cacao/cacao-initial-native_0.98.bb        |  2 +-
 recipes-core/cacao/cacao_git.bb               | 24 +++---
 .../classpath-initial-native_0.93.bb          |  2 +-
 .../classpath/classpath-native_0.99.bb        |  2 +-
 recipes-core/classpath/classpath.inc          | 38 +++++-----
 recipes-core/cup/cup_0.10k.bb                 |  8 +-
 recipes-core/fastjar/fastjar.inc              |  6 +-
 recipes-core/icedtea/icedtea7-native.inc      | 20 ++---
 .../icedtea/openjdk-7-release-03b147.inc      |  4 +-
 .../commons-beanutils_1.8.0.bb                |  2 +-
 .../commons-configuration_1.5.bb              |  2 +-
 .../jakarta-commons/commons-digester_1.8.bb   |  2 +-
 .../jakarta-commons/commons-discovery_0.4.bb  |  2 +-
 .../jakarta-commons/commons-el_1.0.bb         |  2 +-
 .../commons-fileupload_1.2.1.bb               |  2 +-
 .../jakarta-commons/commons-httpclient_3.1.bb |  4 +-
 .../jakarta-commons/commons-jxpath_1.3.bb     |  2 +-
 .../jakarta-commons/commons-net_1.4.1.bb      |  4 +-
 .../jamvm/jamvm-initial-native_1.4.5.bb       |  2 +-
 recipes-core/jamvm/jamvm.inc                  | 28 +++----
 recipes-core/jamvm/jamvm_git.bb               |  2 +-
 .../javasqlite/javasqlite_20150419.bb         | 10 +--
 recipes-core/jcraft/jsch_0.1.40.bb            |  4 +-
 recipes-core/jikes/jikes_1.22.bb              | 10 +--
 recipes-core/jlex/jlex_1.2.6.bb               |  8 +-
 recipes-core/junit/junit_3.8.2.bb             |  4 +-
 recipes-core/libmatthew/libmatthew.inc        | 22 +++---
 recipes-core/openjdk/openjdk-7-common.inc     | 76 +++++++++----------
 recipes-core/openjdk/openjdk-7_99b00-2.6.5.bb |  2 +-
 recipes-core/openjdk/openjdk-8-common.inc     | 16 ++--
 recipes-core/openjdk/openjdk-8-cross.inc      | 14 ++--
 recipes-core/openjdk/openjdk-8-native.inc     | 18 ++---
 .../openjdk/openjdk-8-release-aarch32.inc     | 30 ++++----
 .../openjdk/openjdk-8-release-aarch64.inc     | 16 ++--
 .../openjdk/openjdk-8-release-common.inc      | 53 ++++++-------
 recipes-core/openjdk/openjdk-8-release.inc    |  4 +-
 recipes-core/openjdk/openjdk-8_272.bb         | 24 +++---
 recipes-core/openjdk/openjre-8_272.bb         | 16 ++--
 recipes-core/rhino/rhino_1.7r4.bb             | 10 +--
 recipes-core/servlet-api/jsp2.0_5.5.26.bb     |  2 +-
 recipes-core/xalan-j/xalan-j_2.7.1.bb         |  4 +-
 recipes-core/xerces-j/xerces-j_2.11.0.bb      |  4 +-
 recipes-core/xml-commons/jaxme_0.5.2.bb       |  2 +-
 recipes-core/xml-commons/xom_1.2.10.bb        |  2 +-
 recipes-core/xml-commons/xpp3_1.1.3.4.O.bb    |  4 +-
 recipes-extended/dbus/dbus-java_2.7.bb        | 14 ++--
 recipes-extended/rxtx/rxtx_2.2.0.bb           | 18 ++---
 recipes-images/images/openjdk-7-test-image.bb |  2 +-
 recipes-images/images/openjdk-8-test-image.bb |  2 +-
 recipes-images/images/openjre-7-test-image.bb |  2 +-
 recipes-images/images/openjre-8-test-image.bb |  2 +-
 58 files changed, 299 insertions(+), 298 deletions(-)

-- 
2.17.1

