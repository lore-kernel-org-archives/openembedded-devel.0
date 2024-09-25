Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BA8FCCFA0B
	for <webhook@archiver.kernel.org>; Wed, 25 Sep 2024 23:32:42 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web11.30760.1727307158161133098
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Sep 2024 16:32:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=G6jumGx+;
 spf=pass (domain: gmail.com, ip: 209.85.215.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-6e7b121be30so232610a12.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Sep 2024 16:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727307157; x=1727911957; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xUZAixrCNjIoel0EQiIgP3zBjN73Z5p9LNs+2uti/AQ=;
        b=G6jumGx+UROON4a6YAXGSReKRB3sqEfi30z11kYVyUSrukZpih+FayAMZvMzYJ0V+K
         QoYCE38jNG46DSAum6BUl2pbyagdC882dB+JDFGL7q7Nu5wN1R4BPSVcVpYrJm3eyjWz
         BtUvXWA85T+dRJ95179elI0p8RxuqNigfMh3yAVQLXrtJ8sl6BhxFtTr6d6IE3WWhZS0
         28y9TG24EEwI4++JJMnluaqqw4fiNNy8SPTap0n7W+DzA2B0j9KQK5LUsl+LFGpFwy8A
         KG6OkBUbJ4lqNjYllXnuDKl2NNXY/pU+3/iKPDFyjNEiUM5jUoukSbApPxQhHSmLIWS9
         KqFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727307157; x=1727911957;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xUZAixrCNjIoel0EQiIgP3zBjN73Z5p9LNs+2uti/AQ=;
        b=u2IFM3yh8eKUSIh017hcbHsPkJbiXeauskusZr+Rmcvncov+28La+0OJ2kjSn24ZKk
         k9KyGQnTbGvhjxFPLMAYOMf7JkbolNurlqLAkao5QGsRkgMCMtTrA+5vI8QrltRZToEd
         rIconFOUWZS3Rzza6UGIVMkTneUz3UmBQzY51N9UpJHqknXgnLxcRnijrkhz95ae0+YF
         DE1dUBMNnxZVWC5UY26KggqDBZwIT1NMP90b40+IuXBVhqp629ureyzeVW0XQMTkUuXv
         wWggpHDC49VNVpyfR93a1669itOYWPciyW8FouZJBcTpXoOunQ26BF7qJyjJc+Y/as3C
         wuqA==
X-Gm-Message-State: AOJu0Yzhfz5Y3qFWuFSZMW5h0gs1FWTt/O/YxZTwuGFMgun4eW8xSOvN
	ZA7zBV7eWNzEt0jrMEcanhJ71sLZZrrtw8ErAbPd2KvtCHaCVnYWsFrYbRYD
X-Google-Smtp-Source: AGHT+IF00WXyPoJ21wTKWosDM0f63Ig0n+/9sFhTFXygJ41H7jf6vC8C4IIYgQsWnrmsbVtXyiz1jA==
X-Received: by 2002:a05:6a20:e13:b0:1d4:e4c0:58fa with SMTP id adf61e73a8af0-1d4e4c0c53cmr3513067637.2.1727307157341;
        Wed, 25 Sep 2024 16:32:37 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::eea4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71afc939046sm3243550b3a.107.2024.09.25.16.32.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 16:32:37 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 2/5] python3-ujson: Add python misc modules to ptest rdeps
Date: Wed, 25 Sep 2024 16:32:31 -0700
Message-ID: <20240925233234.1685606-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20240925233234.1685606-1-raj.khem@gmail.com>
References: <20240925233234.1685606-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Sep 2024 23:32:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112503

Its needed for

ModuleNotFoundError: No module named 'tracemalloc'

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python3-ujson/run-ptest | 2 +-
 meta-python/recipes-devtools/python/python3-ujson_5.10.0.bb | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-ujson/run-ptest b/meta-python/recipes-devtools/python/python3-ujson/run-ptest
index 8d2017d39c..4863c5e5a3 100644
--- a/meta-python/recipes-devtools/python/python3-ujson/run-ptest
+++ b/meta-python/recipes-devtools/python/python3-ujson/run-ptest
@@ -1,3 +1,3 @@
 #!/bin/sh
 
-pytest --automake
+FORCE_COLOR=1 pytest --automake --capture=no
diff --git a/meta-python/recipes-devtools/python/python3-ujson_5.10.0.bb b/meta-python/recipes-devtools/python/python3-ujson_5.10.0.bb
index 18ce5cc301..5f4439c4c3 100644
--- a/meta-python/recipes-devtools/python/python3-ujson_5.10.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ujson_5.10.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=e0039a83d8a99726b5
 
 SRC_URI[sha256sum] = "b3cd8f3c5d8c7738257f1018880444f7b7d9b66232c64649f562d7ba86ad4bc1"
 
-inherit pypi ptest setuptools3
+inherit pypi ptest python_setuptools_build_meta
 
 # let OE do the strip operation
 export UJSON_BUILD_NO_STRIP = "1"
@@ -24,6 +24,7 @@ RDEPENDS:${PN} += "\
 
 RDEPENDS:${PN}-ptest += " \
     python3-json \
+    python3-misc \
     python3-pytest \
     python3-pytz \
     python3-unittest-automake-output \

