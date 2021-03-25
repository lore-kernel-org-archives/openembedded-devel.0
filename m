Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.7256.1616675638396716125
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Mar 2021 05:33:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20150623.gappssmtp.com header.s=20150623 header.b=1HewumJt;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.54, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f54.google.com with SMTP id j7so2136989wrd.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 25 Mar 2021 05:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vyJsb5XLbzlSlOnlAKgJfQYRiY1B9+C7ze3EMkqWKZI=;
        b=1HewumJtUXqf/rkw2FY7S9HTjd2u0OAJDH9Cy9L3Jm+Cam0fRhkSKwCc1bmsRUb2Ii
         ua01YDcmkrW/gLowC1xXv/cfAuNXjKjousZaXl80nSmfb/b/+mvROOHL4YTfVLtFy/vx
         Fdy0yOBBpGIbEFi+1Rbt0NNSc67krb6dTXC+AEMEr9awLFf7+PQNUj8hhCkpKHOpL9Rb
         1ykn+cMDghi3ld7Gd+ygxhvfA6tM8/ahr7ZgzD4YP/UHfWMZqLKYqPf05qDQcG294M5/
         D7GWWUrF6p1xbJAGSTjZX1R8F5G7F58nZjmcns245Q+HD37iqP/uhtLieoeniPIGshZK
         1hjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vyJsb5XLbzlSlOnlAKgJfQYRiY1B9+C7ze3EMkqWKZI=;
        b=Jnq2BKqkcdx6YjjJICtegMMQI1iK3+i7cXtYj5pczAkk1tZgnwBD40/5T/CQ6qLy5F
         UqjZdMeg/dYlNB73NfnkWGNKVeFczUM94cc79qKz8ZUQB2wRHYcX43QRvM6ucLsZjDZc
         P1CmnpgvMMVtsw1a6bDLkbFxbUhyKDUnd/oFEnOGGPbf3nJtE+SsI1GMkas2nQ9bWRzq
         /wSyLE7WibwPxuuasKWhDCSMlYTWppyBLY+NjIMDQM5RnFfD6Dpdb3r44/eEiEiz7vrC
         pjTiS3x/nVhubs4TnwK+bTxnyRnvDGvQAfBdyjr0Orp8uv+ky0BPQ5VW+/BG0acB5deM
         +dPA==
X-Gm-Message-State: AOAM531QhBdWaS5/IDJKR6XVvLQ5Xv6DWVQ27ggPPd7b/dWP3Mwdq39y
	DWW9CUIw8BpDi5wyMpHLslWYZQ==
X-Google-Smtp-Source: ABdhPJxDJjqmfMlv8KXRewFL3i9NNI/xxXV60y4Mp9AaFqxKlP/1Iea5dGPgIGGA8BF9EqwvuUw53w==
X-Received: by 2002:a5d:638a:: with SMTP id p10mr9040329wru.286.1616675636749;
        Thu, 25 Mar 2021 05:33:56 -0700 (PDT)
Return-Path: <brgl@bgdev.pl>
Received: from debian-brgl.home (lfbn-nic-1-149-6.w2-15.abo.wanadoo.fr. [2.15.231.6])
        by smtp.gmail.com with ESMTPSA id p10sm7672045wrw.33.2021.03.25.05.33.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Mar 2021 05:33:56 -0700 (PDT)
From: "Bartosz Golaszewski" <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Armin Kuster <akuster808@gmail.com>,
	Tim moto-timo Orling <TicoTimo@gmail.com>,
	Derek Straka <derek@asterius.io>,
	Trevor Gamblin <trevor.gamblin@windriver.com>
Cc: openembedded-devel@lists.openembedded.org,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [meta-python][PATCH] python3-jmespath: new package
Date: Thu, 25 Mar 2021 13:33:53 +0100
Message-Id: <20210325123353.6625-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a recipe for jmespath: a python module implementing a query
language for JSON.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 .../packagegroups/packagegroup-meta-python.bb        |  1 +
 .../python/python3-jmespath_0.10.0.bb                | 12 ++++++++++++
 2 files changed, 13 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-jmespath_0.10.0.bb

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index e4e67221f..936053c69 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -188,6 +188,7 @@ RDEPENDS_packagegroup-meta-python3 = "\
     python3-jdatetime \
     python3-jdcal \
     python3-jedi \
+    python3-jmespath \
     python3-jsmin \
     python3-jsonpatch \
     python3-jsonpath-rw \
diff --git a/meta-python/recipes-devtools/python/python3-jmespath_0.10.0.bb b/meta-python/recipes-devtools/python/python3-jmespath_0.10.0.bb
new file mode 100644
index 000000000..46976d19b
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-jmespath_0.10.0.bb
@@ -0,0 +1,12 @@
+SUMMARY = "JMESPath (pronounced 'james path') allows you to declaratively specify how to extract elements from a JSON document."
+HOMEPAGE = "https://pypi.org/project/jmespath/"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2683790f5fabb41a3f75b70558799eb4"
+
+SRC_URI[md5sum] = "65bdcb5fa5bcf1cc710ffa508e78e408"
+SRC_URI[sha256sum] = "b85d0567b8666149a93172712e68920734333c0ce7e89b78b3e987f71e5ed4f9"
+
+inherit pypi setuptools3
+
+RDEPENDS_${PN} += "python3-math python3-json python3-numbers"
-- 
2.30.1

