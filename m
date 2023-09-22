Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A8CDE8180B
	for <webhook@archiver.kernel.org>; Fri, 22 Sep 2023 19:37:46 +0000 (UTC)
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
 by mx.groups.io with SMTP id smtpd.web11.6673.1695411464695057551
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Sep 2023 12:37:44 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.179, mailfrom: straka.derek@gmail.com)
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-34fc2773fa4so8186695ab.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 22 Sep 2023 12:37:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695411463; x=1696016263;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KXzQkLL+jNi2evd7xaLaKpeldQY721l7jk6eo4Vztgg=;
        b=GrNSYCcvHC0Yxln/8iqZNfFcyqCEXKLQR4lhGxAW6PMurBWf6gUhvsutbEoK2bkV/2
         CqCA6QSnW4dzPqzCVRXmqspiUbXhvBhRKKVxCM+0bsahZ3UgdH4AE8SRUkOKxI5766px
         MsF/+SRMSsrHBCSJ9D9lnHQYX6dtLNsO/SCkXbD+FhsvXp6ir8U6hfeiUps4wdnjigc+
         OAsqz6yxy26/sr1Us4iZKYxMz36n7WWs8DTGHWiTaVjz8tQbu/W+PlN6xK+k2rstHP3g
         0pNSTFBQ11pmHuy5ccPkEsPwDhovvCyAgaCdQKA9qYdhYALan108wSGGHN1q9rUcHU4p
         gJSA==
X-Gm-Message-State: AOJu0YwDpfTR0Ka2nQC/QMjmucZY9sSD6EOpgoDLt/ZKdkbEdIuRtM+m
	QRVVuJTzC3sfcx7x3EZSrB4CmqOjQB+nCw==
X-Google-Smtp-Source: AGHT+IEQnNE0EhCcLWLB9r9p61eD+jESOCnDWFhLMHu4RCJKPqKM1DZhrOVPd1tAwF//T/p5RTvcYQ==
X-Received: by 2002:a05:6e02:14d:b0:34f:379c:d58e with SMTP id j13-20020a056e02014d00b0034f379cd58emr587843ilr.20.1695411463414;
        Fri, 22 Sep 2023 12:37:43 -0700 (PDT)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id o18-20020a92c052000000b00348c7e5e915sm1266099ilf.5.2023.09.22.12.37.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Sep 2023 12:37:42 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python3-netaddr: Update version 0.8.0 -> 0.9.0
Date: Fri, 22 Sep 2023 19:37:31 +0000
Message-Id: <20230922193731.3060662-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Sep 2023 19:37:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105074

Changelog
=========
Added:
Add hash capabilities to OUI (#225, amitmi704)

Fixed:
Backwards incompatible: Handle RFC 6164 IPv6 addresses (don't reserve first IP
address in point-to-point subnets) ($267, Damien Claisse)
Technically backwards incompatible: Fix for is_loopback behaviour – consider
IPNetwork('::1/128') to be loopback (#222, #223, niels)
Include tutorials in source distributions (#215, Louis Sautier)
Fix a documentation typo (#242, Wouter)
Fix print syntax in the documentation to be Python 3 compatible (#221, François Magimel)
Fix the Sphinx syntax in the documentation (#220, François Magimel)

Other:
Update the databases (#266, Jakub Stasiak)
Deprecate Python 3.6 (#263, Jakub Stasiak)
Eliminate unnecessary evals (#228, KOLANICH)

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../{python3-netaddr_0.8.0.bb => python3-netaddr_0.9.0.bb}     | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-netaddr_0.8.0.bb => python3-netaddr_0.9.0.bb} (65%)

diff --git a/meta-python/recipes-devtools/python/python3-netaddr_0.8.0.bb b/meta-python/recipes-devtools/python/python3-netaddr_0.9.0.bb
similarity index 65%
rename from meta-python/recipes-devtools/python/python3-netaddr_0.8.0.bb
rename to meta-python/recipes-devtools/python/python3-netaddr_0.9.0.bb
index 5ba006691..471d939a8 100644
--- a/meta-python/recipes-devtools/python/python3-netaddr_0.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-netaddr_0.9.0.bb
@@ -2,8 +2,7 @@ SUMMARY = "A network address manipulation library for Python."
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e6345d695ffe3776f68a56fe7962db44"
 
-SRC_URI[md5sum] = "34cad578473b66ad77bc3b2a7613ed4a"
-SRC_URI[sha256sum] = "d6cc57c7a07b1d9d2e917aa8b36ae8ce61c35ba3fcd1b83ca31c5a0ee2b5a243"
+SRC_URI[sha256sum] = "7b46fa9b1a2d71fd5de9e4a3784ef339700a53a08c8040f08baf5f1194da0128"
 
 inherit pypi setuptools3
 
-- 
2.34.1


