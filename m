Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25C52C7EE2C
	for <webhook@archiver.kernel.org>; Sun,  7 May 2023 16:33:23 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
 by mx.groups.io with SMTP id smtpd.web11.69130.1683477198588097835
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 May 2023 09:33:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=lQQYbwWb;
 spf=pass (domain: gmail.com, ip: 209.85.128.175, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-559ded5e170so53755517b3.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 May 2023 09:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683477197; x=1686069197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4BR/eSmBCNhUjDP9Y/J/Qtv/A2LenuKtH71OTagcYgg=;
        b=lQQYbwWbWWEaaM0OAm3Fj8XU2tJU6JtibXbVwlg0AYAavqbcoGMkBjvL1TQtYMZzOf
         Tbfcx8XynlRBT1EXoXcGFcbVm9EdcusJCFH0zZ4gekGTnuD94hGLb8NxqfOj5MrAkzvH
         SsRrqK7qKzqKh1C/pxloW3FgktCfG5/cJzxyKc1FFKcdyJs2S1ECcjdIUoySJfJ7uHHy
         rTIv98DSqeZubjnE45YsrHugtTmImVTvvvCT4cOmY3PJe2qbABsUxWCYiKW8pedWLeNR
         ZtyOzSZTFbo0Sn+zVBobQfj7pR+8m72XrkSrp+9692qJcdgS4PbHsvCDRMlpl/IqnQWb
         iF7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683477197; x=1686069197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4BR/eSmBCNhUjDP9Y/J/Qtv/A2LenuKtH71OTagcYgg=;
        b=NY/xv12I/xkZ/R2ytln7tnJ+K5jg1sjPSNlP6PUjSIjaHL8ZYHY1628BQlaUYJiyCV
         jfmRjmlYZ+Qk59SPPLCcECggjxz07VZpiM3VljwUsmBeR69o2dZfzk81I85Qy9PT/rdv
         jvdbK2PSCSKebkv+az1yLMO3S+qCQAVtezM9dfuw2cG90xO1x0kpBuWhdcOOYLLr/rSS
         AqGW/ZqlxJKdEMrSp7xjDU07Db/P81iM/mUuMeT/o5HVawAKaHSedIQLtJx6rsG8U90O
         2hHCJLTROArJxgO0XGK55z6QviphJKv/irTHcM0mj5HbkkLum+w06ZQsjMDhKvQQq7VV
         KOWg==
X-Gm-Message-State: AC+VfDyI6vjnZ4bscslXYzpodWmS1iyH3dGjEkNW/uws2vZYMvZ5xAfr
	bGfD5jgetn9q18IRxoRIcMKRh24r5TQ=
X-Google-Smtp-Source: ACHHUZ4Ab18DkK7lt2/x6JPsF6Ffth5I+UH/T6Z5kdNX4zRbXTX0ScVMQcI9Wm7bCiwNV8KgB2GcSw==
X-Received: by 2002:a81:9e01:0:b0:55a:9b89:4eff with SMTP id m1-20020a819e01000000b0055a9b894effmr8426985ywj.13.1683477197576;
        Sun, 07 May 2023 09:33:17 -0700 (PDT)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:b2f5:e641:5b7c:2972])
        by smtp.gmail.com with ESMTPSA id q82-20020a817555000000b0055dbeb68f7asm1113524ywc.69.2023.05.07.09.33.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 May 2023 09:33:16 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][mickledore][PATCH 11/29] unixODBC: Update SRC_URI to use updated location of tarball
Date: Sun,  7 May 2023 12:32:47 -0400
Message-Id: <20230507163305.3261044-11-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230507163305.3261044-1-akuster808@gmail.com>
References: <20230507163305.3261044-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 07 May 2023 16:33:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102341

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit ebe7f26911d76182c3bce1f336c86153436b0dfb)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-support/unixodbc/unixodbc_2.3.11.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/unixodbc/unixodbc_2.3.11.bb b/meta-oe/recipes-support/unixodbc/unixodbc_2.3.11.bb
index 39112587ed..3a9e390a2b 100644
--- a/meta-oe/recipes-support/unixodbc/unixodbc_2.3.11.bb
+++ b/meta-oe/recipes-support/unixodbc/unixodbc_2.3.11.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d7b37bf80a3df5a65b355433ae36d206"
 
 DEPENDS = "libtool readline"
 
-SRC_URI = "http://ftp.unixodbc.org/unixODBC-${PV}.tar.gz \
+SRC_URI = "https://www.unixodbc.org/unixODBC-${PV}.tar.gz \
            file://do-not-use-libltdl-source-directory.patch \
 "
 SRC_URI[sha256sum] = "d9e55c8e7118347e3c66c87338856dad1516b490fb7c756c1562a2c267c73b5c"
-- 
2.25.1


