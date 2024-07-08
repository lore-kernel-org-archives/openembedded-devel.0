Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 733C8C3271E
	for <webhook@archiver.kernel.org>; Mon,  8 Jul 2024 17:29:59 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.85985.1720459787495420865
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Jul 2024 10:29:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=ZGcpyOHJ;
 spf=pass (domain: smile.fr, ip: 209.85.221.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-367940c57ddso2741799f8f.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 08 Jul 2024 10:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1720459785; x=1721064585; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=E17dd/FM7li7BFXfXe1X/Mnxe97SZJYlaYoKeL7EDJU=;
        b=ZGcpyOHJay3SnlIk7/7TES5afSwmWY4Xbi4iPk3PBll2fHIhvLoYXBmvFl7iEtbGg+
         cCfgwT0m/eajmxvDZ2wx2JEsowIUtKgG7GjeS7+OLefN+WCeQ+SqLI5u3dYk7eek6cpO
         INZY6a4TwcFI1ggmyvxujjsWLXTZCHsDDcHjA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720459785; x=1721064585;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E17dd/FM7li7BFXfXe1X/Mnxe97SZJYlaYoKeL7EDJU=;
        b=hzadFSxomo4izwDhPcxQqCrXNx2tv9WfWMWrXnchpjAfUNeAuReKYnOQ4954r2vRFd
         V9GduT0AOp+mnc2jO9Re28RHLefsnlM2FuY9V/VMNZ8Put3sbi99NYH4a9i2dU8NzKNh
         ILrT+vhkQ8reLgQSiaWRYEDlXKImmvpwM8NUjcsKPjlMtCGdERFcvJY+wVzq9EwoV+MK
         H7DWDclM2FnRLcRwQxuHrybdW9Z9op3ohl5LcOd5slKjhLv76MAg+9pKSrREX4c+oySi
         HYKvhKIEVb/CnBCTjQrMSzhTbQOoveJsG3Hs9ITgeqrdNZT0vQacpSG4Mwkbxsbs1WBM
         BRzw==
X-Gm-Message-State: AOJu0Yy3631yktYZimpZVqSbJjscoztGIdPl4HE+kfy4dfWvbGXqiKMv
	OeaKDH4nBIxP0A2jw5yGnjybqC+Bzl1XAxy3IBpaeO6rxUqGwYuXVP6PKCRNJ75oloiWjl7D3PF
	i
X-Google-Smtp-Source: AGHT+IEEohT78Z45ae035fNMm/IzWuHoLNrtnKIvyCoHLcSk0Zr+EGGPpOETpJlqD3zRqeknGPvu3w==
X-Received: by 2002:adf:f288:0:b0:367:9851:4f22 with SMTP id ffacd0b85a97d-367ceadb1bamr145016f8f.58.1720459784942;
        Mon, 08 Jul 2024 10:29:44 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.numericable.fr ([89.159.1.53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367cdfab748sm309834f8f.111.2024.07.08.10.29.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jul 2024 10:29:44 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-python][PATCH] python3-redis: add an archive prefix to avoid clashing with redis
Date: Mon,  8 Jul 2024 19:29:30 +0200
Message-Id: <20240708172930.525707-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Jul 2024 17:29:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111268

From: Yoann Congal <yoann.congal@smile.fr>

The new python3-redis_5.0.7 archive "redis-5.0.7.tar.gz" may clash with
a very old redis-5.0.7 archive. It does on the autobuilder which kept
its DL_DIR from this era and triggers a mirroring error[0].

To fix this, add a "pypi-" prefix to the archive name of python3-redis.

[0]:https://autobuilder.yoctoproject.org/typhoon/#/builders/156/builds/420/steps/17/logs/errors

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta-python/recipes-devtools/python/python3-redis_5.0.7.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-redis_5.0.7.bb b/meta-python/recipes-devtools/python/python3-redis_5.0.7.bb
index 8eb176c09e..950200ec5e 100644
--- a/meta-python/recipes-devtools/python/python3-redis_5.0.7.bb
+++ b/meta-python/recipes-devtools/python/python3-redis_5.0.7.bb
@@ -4,6 +4,9 @@ HOMEPAGE = "http://github.com/andymccurdy/redis-py"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=609ded3add9111c4c6e102f1d421d3f8"
 
+# Prefix archive to avoid clashing with the main redis archives
+PYPI_ARCHIVE_NAME_PREFIX="pypi-"
+
 SRC_URI[sha256sum] = "8f611490b93c8109b50adc317b31bfd84fff31def3475b92e7e80bf39f48175b"
 
 inherit pypi setuptools3

