Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 317C5C47DB7
	for <webhook@archiver.kernel.org>; Fri, 19 Jan 2024 08:41:26 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web10.17754.1705653677285717888
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Jan 2024 00:41:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SHbO5CNK;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: alperyasinak1@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-55a38fb45c1so511947a12.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 19 Jan 2024 00:41:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705653675; x=1706258475; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1SzAiqXKVP2P8kbbsmhfz3PInWl6XXiK8WglaoN6yiM=;
        b=SHbO5CNKH8xbcUR+ZqaqB9W2PWWjJ/jzhQqOtEQrCh2vVp0DguiUymMEyJpQDfOv60
         HeylMxVKU5Igk0+DnJEdAhS/bbyOgji4U2rNhLd7FPlZLdSTcQJT9V501l/NztgAIqVI
         BKtmbUzM41zUERqvQu/z/gncZ9WoNVmClZW4/M2pgUogaMfcQwHcvQIhup1Td+E5qkC9
         kRFlikE+891ch+R7jfLBZHub0mc8c5ErZBAgOMGADkm6jPMFedWZTPkmEL1Fkd84nnrb
         3byoQh6CAWozi+kwQ4VPK7YSxLBlofXs0C6tSErvWsSzZDVSpUj+lBwZyL0Ups9qJ7O1
         Mgpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705653675; x=1706258475;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1SzAiqXKVP2P8kbbsmhfz3PInWl6XXiK8WglaoN6yiM=;
        b=s7MWuEWEhTUfFgYf3LMOIHgMf2nNsbRFbAUnG27P85wW/7I5NS9rVYIR+ExKspLQh3
         wMmFm/XQprGilXnrRqPvQ2B1svYPvW6PkHdgKAmM/Pw4eoO/h6pAC5AZuw9i1wIs3s0c
         GKqzDPXgexnw/qnEJPi73sig06X3gyGPEXfLgwWpHdO9CVfZD0OBNfr0RAgq04v9mE/u
         yRXtxCe29uFFR5YaJxl2Z4nwKcf4ChxALsEyJH8CgtaS0q40KVNhwXWVYR70oRX3GMwe
         sosKf7zDXJm8Q796wU5rWni+FVFd1OL/y5MpoHLJ9astLlqQBT1P2iLJbdZWOoT1QrBO
         S5GQ==
X-Gm-Message-State: AOJu0YzigGZKT63GxczNwy6C6UXyfsDU+xyj4dABcnO3PXZCTD7IGtxH
	3C3CxqzYCly5mphNU44tBNZkA+dTh8zEAwLjahANBSwzOj4I8/W8XhIe5A/hB2I=
X-Google-Smtp-Source: AGHT+IERorcLlWeMoz8di4rqWmy602rQCE5y9vgBSS1X02pwvv2EuPCYNxaVGM+zwzI1jpshxf3ykg==
X-Received: by 2002:a05:6402:4309:b0:55a:6fd0:d8ec with SMTP id m9-20020a056402430900b0055a6fd0d8ecmr47321edc.44.1705653674757;
        Fri, 19 Jan 2024 00:41:14 -0800 (PST)
Received: from localhost.localdomain ([176.33.66.82])
        by smtp.gmail.com with ESMTPSA id e16-20020a056402191000b0055a331beecesm1419372edz.72.2024.01.19.00.41.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jan 2024 00:41:14 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-oe][PATCH] libreport: upgrade 2.17.8 -> 2.17.11
Date: Fri, 19 Jan 2024 11:41:09 +0300
Message-Id: <20240119084109.4059076-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 19 Jan 2024 08:41:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108356

Changelog:

================
2.17.11
Fixed

    reporter-bugzilla: Fix NameError exception
    reporter-bugzilla: Adding an attachment is a minor bug update (skip emails)
    reporter-bugzilla: Retry Bugzilla queries with delays, if needed

Added

    Add "XDG_ACTIVATION_TOKEN" to the list of ignored words
================
2.17.10
Fixed

    reporter-upload: Fix use-after-free error
================
2.17.9
Fixed

    reporter-bugzilla: Honor XDG_CONFIG_HOME when accessing user's configuration files
    reporter-bugzilla: Fix reporting when the bug already exists
    reporter-bugzilla: Don't fail if reported_to file doesn't exist
    reporter-bugzilla: Make sure that the creator of a bug is always in CC
    reporter-bugzilla: Don't send emails about each individual attachment
    reporter-bugzilla: Fix string interpolation for duplicate bugs

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../libreport/{libreport_2.17.8.bb => libreport_2.17.11.bb}   | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)
 rename meta-oe/recipes-extended/libreport/{libreport_2.17.8.bb => libreport_2.17.11.bb} (96%)

diff --git a/meta-oe/recipes-extended/libreport/libreport_2.17.8.bb b/meta-oe/recipes-extended/libreport/libreport_2.17.11.bb
similarity index 96%
rename from meta-oe/recipes-extended/libreport/libreport_2.17.8.bb
rename to meta-oe/recipes-extended/libreport/libreport_2.17.11.bb
index 1f2c55c69..322075cd6 100644
--- a/meta-oe/recipes-extended/libreport/libreport_2.17.8.bb
+++ b/meta-oe/recipes-extended/libreport/libreport_2.17.11.bb
@@ -10,7 +10,6 @@ DEPENDS = "xmlrpc-c xmlrpc-c-native intltool-native \
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
-
 SRC_URI = "git://github.com/abrt/libreport.git;protocol=https;branch=master"
 SRC_URI += "file://0001-Makefile.am-remove-doc-and-apidoc.patch \
             file://0002-configure.ac-remove-prog-test-of-xmlto-and-asciidoc.patch \
@@ -18,8 +17,7 @@ SRC_URI += "file://0001-Makefile.am-remove-doc-and-apidoc.patch \
             file://0004-configure.ac-remove-prog-test-of-augparse.patch \
 "
 
-# 2.17.8
-SRCREV = "46a99a14adba7276e5697b7c613d918796792345"
+SRCREV = "d58110e1fc663c92ac3e36b166f114b6904796ff"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
-- 
2.25.1


