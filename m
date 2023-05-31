Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE2A0C77B7C
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 11:13:22 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.web11.11440.1685531597311599381
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 04:13:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=VramFZJM;
 spf=pass (domain: gmail.com, ip: 209.85.128.170, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-568f9caff33so4093337b3.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 04:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685531596; x=1688123596;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hBkMiFf3hMR/UA3YQxG4sLc3czLzwHQVVc+OY/UmWRU=;
        b=VramFZJM4a9YcPNoAvx6fHeHkYYZXksrAepCQujn3DzfEFQD4c/oqkLCMKBcPnXTDg
         yFKpkiF9cQiexinAlNScdNZXl5igwbJUOWi+kcOQ2fy3Shje0pzNPWEoZu3C2Vt5T0+Y
         gYtmtraou1E+gJ4wV49q4dsMyyFifsz3XbPKTg4bjy3bddeFDwi1a1cG9fMKqW1JkCiD
         BIsZuE+eHe3RniZSiPyIA9glOR+/3hcJtT1jSbGtHt6f3EYiDZCjSVWUiT+q5BsHRvos
         f6noTep4QDBTcwvDvJv5hh2dAyvHeMiGUkulbxFthU9rZu+415fcaNuJDVc+ebdsigro
         8N2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685531596; x=1688123596;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hBkMiFf3hMR/UA3YQxG4sLc3czLzwHQVVc+OY/UmWRU=;
        b=NWCP/FRthZqff9ZjNhlRi6u3RV2qRu7Qu9BmUg+dO3155Qz/vYKqoDsalI7I0I6WMx
         YW2vBK3uXNxHTut/+ZEMyNUDpqM2uhi7c/eN+mWqrSe9rpyNk91NHQq2DYdbw6014Hq4
         cwxe58gMsMgqY5DpbdqkuaufZsLgy2JLcu//0p9AX44tXYiG1S87n3E9s/yncA/KbGM/
         qOsluUWAEGGmwJtK/Z6vZCtBuEjO3lBBNYcR4hg63f8+gSBF82fe9SKQkkWalvRJisl+
         180LKX76wK3G8r0L0Qrfp69HZUMA4HDsa2uHLo76zfVUm3NlCUCDcOyqPNVaTqvLCDq7
         aGhw==
X-Gm-Message-State: AC+VfDz7hVtTy01fWEBVcMFF2ex7M3pKvHoVPxO3yRL4OrMELqy97bIC
	SibfrTMP30J6X9Cy7pJoiLlTgPsDANQ=
X-Google-Smtp-Source: ACHHUZ5EMrNulOR6Q6Tyq8XqnwxHUnqAversvCeP5cedmZVpOWZyKFLl3wMixkFnHSIIvZZhtRzN5g==
X-Received: by 2002:a0d:d58d:0:b0:565:9fc5:f0a1 with SMTP id x135-20020a0dd58d000000b005659fc5f0a1mr5452458ywd.36.1685531596114;
        Wed, 31 May 2023 04:13:16 -0700 (PDT)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:a3c5:f403:52db:88cf])
        by smtp.gmail.com with ESMTPSA id t129-20020a814687000000b00545a08184fdsm5246897ywa.141.2023.05.31.04.13.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 04:13:15 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Amelkin <alexander@amelkin.msk.ru>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][mickledore][PATCH 08/36] ipmitool: Update links
Date: Wed, 31 May 2023 07:12:41 -0400
Message-Id: <20230531111309.2454603-8-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230531111309.2454603-1-akuster808@gmail.com>
References: <20230531111309.2454603-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 11:13:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103037

From: Alexander Amelkin <alexander@amelkin.msk.ru>

The project has been moved to CodeBerg.org.
Update the links in the recipe and also bump to the
latest revision (1.8.19.13).

Additionally fix the link to the IANA PEN registry as IANA
has changed their URL scheme some time ago and the old link
started pointing to the HTML page instead of the text file.

Signed-off-by: Alexander Amelkin <alexander@amelkin.msk.ru>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 05acb8d0661d7dd42c760075e623e3ee7b0a37f6)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-kernel/ipmitool/ipmitool_1.8.19.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-kernel/ipmitool/ipmitool_1.8.19.bb b/meta-oe/recipes-kernel/ipmitool/ipmitool_1.8.19.bb
index 0340901c22..ab9074bba5 100644
--- a/meta-oe/recipes-kernel/ipmitool/ipmitool_1.8.19.bb
+++ b/meta-oe/recipes-kernel/ipmitool/ipmitool_1.8.19.bb
@@ -14,7 +14,7 @@ Log (SEL), printing Field Replaceable Unit (FRU) information, reading and \
 setting LAN configuration, and chassis power control. \
 "
 
-HOMEPAGE = "http://ipmitool.sourceforge.net/"
+HOMEPAGE = "http://codeberg.org/IPMITool/ipmitool"
 SECTION = "kernel/userland"
 
 LICENSE = "BSD-3-Clause"
@@ -22,14 +22,14 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=9aa91e13d644326bf281924212862184"
 
 DEPENDS = "openssl readline ncurses"
 SRCREV = "19d78782d795d0cf4ceefe655f616210c9143e62"
-SRC_URI = "git://github.com/ipmitool/ipmitool;protocol=https;branch=master \
+SRC_URI = "git://codeberg.org/ipmitool/ipmitool;protocol=https;branch=master \
            ${IANA_ENTERPRISE_NUMBERS} \
            file://0001-configure-Remove-the-logic-to-download-IANA-PEN-data.patch \
            "
 IANA_ENTERPRISE_NUMBERS ?= ""
 
 # Add these via bbappend if this database is needed by the system
-#IANA_ENTERPRISE_NUMBERS = "http://www.iana.org/assignments/enterprise-numbers;name=iana-enterprise-numbers;downloadfilename=iana-enterprise-numbers"
+#IANA_ENTERPRISE_NUMBERS = "http://www.iana.org/assignments/enterprise-numbers.txt;name=iana-enterprise-numbers;downloadfilename=iana-enterprise-numbers"
 #SRC_URI[iana-enterprise-numbers.sha256sum] = "cdd97fc08325667434b805eb589104ae63f7a9eb720ecea73cb55110b383934c"
 
 S = "${WORKDIR}/git"
-- 
2.25.1


