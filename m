Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9127AC369C1
	for <webhook@archiver.kernel.org>; Tue, 15 Apr 2025 18:38:07 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web10.960.1744737301548651097
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Apr 2025 10:15:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cXAH45hT;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: nguyenthaithuanalg@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-736aaeed234so4748093b3a.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 15 Apr 2025 10:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744737300; x=1745342100; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qCuY6zXNSc6PLmNxK3rMYhIloueMJWOrTuQcxHUAJyM=;
        b=cXAH45hTJmRKvrVfycbgz4lBxEWL30sqN+V1oNnz4FXR5q+ygKy4i0/Znc+kA/qsce
         mI63T2AOVdDBJMdGE35kt5Pi6b9gHdVB5Clm8cEF+aA2aK0NtiHg36AIeQrlCE8Fo6WN
         ATRzhBcEB5y3D6fC1Aa569YRvqSX6NUAO0btY+1gorTbGLiOkvMKjh14iHXOIe0OVOx3
         wV/ITsxpY/lItTy/MVPtX0b2kerrcUkhKn7lISEIFww80VX/I7IlbKvavqgk8X0yqHrC
         RquPjuIn8WbsLylTxJJxbG3Lo8gNDa/23gR/5UqrunF2HdhuORsDZ8o7/3H+GZQGRISc
         1O3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744737300; x=1745342100;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qCuY6zXNSc6PLmNxK3rMYhIloueMJWOrTuQcxHUAJyM=;
        b=HQRUJ2FI9EYqH0B8Szr+YehsC9o8kTfjhgjl+JGiJzE/WFoiyhwVWPYUZ9Iz1nXBFa
         JtI3lmmBhqCOEyHFR2HFWbJASVhpKRJ6HD3LQyRFJCqw4O2HrnioOsildO88tHcfkVMb
         bTtjtbLUVursGueHVa+ORozAd7wl5EIjkgR0DjUvgCbTdmhRmrSIRTxp/nvhLlOACHNE
         KR64WgsFKQEiYQI2G+0ihWf20EC7TLXT/XTXxJsKK1AICQB6Y79zA+OplQfIVrW3jrHS
         OTC/Ogfp23rfyrs1T7k3Wwx5DVbhmbW+7s/XvVQjTENgfhkIUtbr/rXaExgUO8FkRsNO
         S5BQ==
X-Gm-Message-State: AOJu0YzfpIF3tWPDjG2pQrgN+F2Y7ENM40v98VsQMfJT0HOSC4yMUjBK
	gbsGikBKAoKCthCpwSxKYfUqcKArlQn+xz6W0QOOrnZzM06by+2A3R+eQrWD
X-Gm-Gg: ASbGncuNV6gIpiQxHJ2K9sVKgKXzu79JssT3YxixNTlledv/8tp8HHQlMeMFdzyTk3P
	sAag+8rH0mgJT9YDf2jL6txbCH2q7wfgPxhPZyOO4HvZmBelU+YJW2RSYth3OJZTbzyi+pGV56z
	5Hdj8QEcaMJLlyGC4wLhLn7oSc9/TYxGXzOfFnrDwL8jWIjc1VKiSYXixXpvZw4v3DYuIwZWWNy
	smGViZyhv6t8pIsyRJJvcknwFOxZIBQ/9wTxKhVRiOoqeY+y4GIJb6kcIsdHIy1xmbfjfBhJD8N
	1xCzPseLVVBzAtFty391OJGuSkT/sSE8tpnAkMSGpfu7fzgyg1oToWVClumXAZXLRpSv
X-Google-Smtp-Source: AGHT+IGmJrbLVpgYar3sa83UWGgYBHU2q2swV7Q4U4SrqHSgNEZf9Z2lJ4Zq0kMRFRDw8fv8iw0raA==
X-Received: by 2002:a17:90b:524d:b0:2fe:b9be:216 with SMTP id 98e67ed59e1d1-308237ce203mr24028872a91.31.1744737300154;
        Tue, 15 Apr 2025 10:15:00 -0700 (PDT)
Received: from localhost.localdomain ([2405:4802:90d4:ea0:76d4:35ff:fe85:dd7a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306df09083esm13413580a91.27.2025.04.15.10.14.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 10:14:59 -0700 (PDT)
From: =?UTF-8?B?VGh14bqtbiBOZ3V54buFbi1UaMOhaQ==?= <nguyenthaithuanalg@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Thuan Nguyen Thai <nguyenthaithuanalg@gmail.com>
Subject: [meta-oe][PATCH] libsimplelog: A new logging library for C89-C++20
Date: Wed, 16 Apr 2025 00:14:46 +0700
Message-ID: <20250415171446.21770-1-nguyenthaithuanalg@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 15 Apr 2025 18:38:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116867

- Edit released version: 1.0.3

Signed-off-by: Thuan Nguyen Thai <nguyenthaithuanalg@gmail.com>
---
 .../recipes-libsimplelog/libsimplelog/libsimplelog_git.bb    | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-libsimplelog/libsimplelog/libsimplelog_git.bb b/meta-oe/recipes-libsimplelog/libsimplelog/libsimplelog_git.bb
index 0415bf485..749085710 100644
--- a/meta-oe/recipes-libsimplelog/libsimplelog/libsimplelog_git.bb
+++ b/meta-oe/recipes-libsimplelog/libsimplelog/libsimplelog_git.bb
@@ -7,9 +7,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=22cdd382a6275cb4c2e75c517952ac7c"
 
 SRC_URI = "git://github.com/thuanalg/simplelog-topic.git;branch=main;protocol=https"
 
-# Modify these as desired
-PV = "1.0+git"
-SRCREV = "ff30ba71807db1d7e1962dd014c2bb0a060572a3"
+PV = "1.0.3+git"
+SRCREV = "c8d0155601522e53b62b09cbe2e5c635717ad068"
 
 S = "${WORKDIR}/git"
 
-- 
2.47.1


