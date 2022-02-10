Return-Path: <sam.van.den.berge@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E6E5C433EF
	for <webhook@archiver.kernel.org>; Thu, 10 Feb 2022 14:15:25 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web10.10526.1644502524480030351
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Feb 2022 06:15:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BeUD2Qbb;
 spf=pass (domain: gmail.com, ip: 209.85.218.51,
 mailfrom: sam.van.den.berge@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id p24so15737689ejo.1
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Feb 2022 06:15:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Hgmja+2E4Oy8zyT6p09VuOZAu5WtwW302FrVXBmU9rw=;
        b=BeUD2QbbhW7QGllv7vOGpF45FU5RK930gJpuY9KCswE3xml2aZV61H6h8vdZPzsUwl
         4/KuIkHjNs5xguNS1Jm4znfSzo3mXlwf05Rp9zDzokev5PcFvks59MYPDbHvPYmKML4U
         pzfzCbNFHrEMxWg9kfWSnk/0zobPIzwzVoAeO7SDKZpE8cG7pchPuG6vwV/GIPcqeSpb
         AkcEjJ4lbOZw2IRX6HTZ95bJCIjiBlIyU3N4Uqnlrz/DIZ4XHk14Is7N1G01AhLzIHEX
         zq7++KJqpa5WfGYrwgvGXRQhuH/8yOD8LOKDh/0ECTMdhKcoUMsYsYzTjkVomTVntU3w
         ELiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Hgmja+2E4Oy8zyT6p09VuOZAu5WtwW302FrVXBmU9rw=;
        b=G8xI6LSohBwVw0/ENQkryqmU06wIj1xabTxeF+4j12mc5mHYreVpwWh86q6D/1xYtF
         W+KjmTYjDM9xppqcoL7LFT6XfUOQjGMGvtaxDSvf2dJplAKUWWTJAzdTzBGk+MyDHgNF
         4nZ1klMcb3dBepZQiuHT5kcXp5j67s3ZoTD6uLWmCKXekbyaZJ159QJCufW4LHxnQQRN
         GZuyUpVZAw73ziy3fiwu6KfmmZ9pacQAZSMIWxi9yRfXJ8v2vtLkDnrN1UcKnF3l+QdX
         LRGGvaP9FRsFtoH1ExMEEnEHAwpkKrw5BCxDNaorOBDk3kD8UmXpaluYSFP5RoUAvp16
         ymzQ==
X-Gm-Message-State: AOAM532VqYMpmjPXXJzx1NoAPe0lCeU7ImL+mZFvrAkkY47slVSOtprV
	XHhO0EvxVrsozSSwb6J+9uUmUDYKPw==
X-Google-Smtp-Source: 
 ABdhPJz1CGdp1FS6wXTdX8YqSqyr6SFnrpA4d7DUyIvGR1bwWhUDZ+VZipFMrcLzJKkConZjnUgrDA==
X-Received: by 2002:a17:907:96a6:: with SMTP id
 hd38mr6659517ejc.38.1644502522515;
        Thu, 10 Feb 2022 06:15:22 -0800 (PST)
Received: from OP01518NB.WTSOUT.OIP.LOCAL (mail.oip.be. [81.246.50.154])
        by smtp.gmail.com with ESMTPSA id
 h17sm4831904ejy.191.2022.02.10.06.15.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Feb 2022 06:15:22 -0800 (PST)
From: Sam Van Den Berge <sam.van.den.berge@gmail.com>
X-Google-Original-From: Sam Van Den Berge <sam.van.den.berge@oip.be>
To: openembedded-devel@lists.openembedded.org
Cc: Sam Van Den Berge <sam.van.den.berge@gmail.com>
Subject: [meta-oe][PATCH] libiio: use setuptools functions instead of
 distutils
Date: Thu, 10 Feb 2022 15:15:20 +0100
Message-Id: <20220210141520.5348-1-sam.van.den.berge@oip.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Feb 2022 14:15:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95287

From: Sam Van Den Berge <sam.van.den.berge@gmail.com>

Since ca73393a36c4144662ea8570f904154188e9815a in oe-core, setuptools
does not inherit from distutils3 anymore. Therefore replace the
distutils functions and variables by their setuptools counterparts which
are now available.

Signed-off-by: Sam Van Den Berge <sam.van.den.berge@gmail.com>
---
 meta-oe/recipes-support/libiio/libiio_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-support/libiio/libiio_git.bb b/meta-oe/recipes-support/libiio/libiio_git.bb
index 6632f7e64..f33fc0c1c 100644
--- a/meta-oe/recipes-support/libiio/libiio_git.bb
+++ b/meta-oe/recipes-support/libiio/libiio_git.bb
@@ -14,7 +14,7 @@ UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
 
-DISTUTILS_SETUP_PATH ?= "${B}/bindings/python/"
+SETUPTOOLS_SETUP_PATH ?= "${B}/bindings/python/"
 
 DEPENDS = " \
     flex-native bison-native libaio \
@@ -65,14 +65,14 @@ do_configure() {
 
 do_compile() {
     if ${@bb.utils.contains('PACKAGECONFIG', 'libiio-python3', 'true', 'false', d)}; then
-        distutils3_do_compile
+        setuptools3_do_compile
     fi
     cmake_do_compile
 }
 
 do_install() {
     if ${@bb.utils.contains('PACKAGECONFIG', 'libiio-python3', 'true', 'false', d)}; then
-        distutils3_do_install
+        setuptools3_do_install
     fi
     cmake_do_install
 }
-- 
2.25.1


