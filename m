Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89E6AC54E58
	for <webhook@archiver.kernel.org>; Sun, 24 Mar 2024 03:10:22 +0000 (UTC)
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
 by mx.groups.io with SMTP id smtpd.web10.22749.1711249813506217316
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 23 Mar 2024 20:10:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OheKxBVX;
 spf=pass (domain: gmail.com, ip: 209.85.160.47, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-221ffba5c8bso2143351fac.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 23 Mar 2024 20:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711249812; x=1711854612; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T1Qpoyj9FKfPiuXT00Ua/SsIKpaPovLFAwoLYjhQRoA=;
        b=OheKxBVXdR2F/nRxijSmpgBsnELOOAzuxh6knvPaShlEOiEjJfhX3UzaDqGLlKPJ3A
         2Rq7Ue9WNwVCyvXNGj5C9qP2Pz1zRtiBQYWDM4GzCSbYldflPPKtG0kxMRa3qs8PWq47
         xIJxpfqstL1RVnVyRlnMrJLCaoGmsgWOUY7HalUE0GXE6X8f3UnJm4Z+1L0wYo8rhSIo
         mciEnVJ0jKkCuCKTPgShHtkqkVTO4nU7sm95OMktEVdwZWa4qw1X8QUTqRQypBDBxHoS
         M4Fg30FMsgpY9Rsj8o+mbuv37M4JsNSuFvaPMe+lRCdRRRYr57KvvcSAOBLnQgf8s3EZ
         tobg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711249812; x=1711854612;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T1Qpoyj9FKfPiuXT00Ua/SsIKpaPovLFAwoLYjhQRoA=;
        b=I60y+JtgxHbUwuuNFHa/QVAzpOxCeAO2T9S02rWOXMeg48+IUQzAuybx61cnHHuL06
         S2yutDlAfjfy1Gs81vnB4NYCDrVyEW1YTgyi6G5C342dhxneHu5haLhRxby3bek5lAx8
         8nB4UlVZq2e78rO5l7BnDBOeNrqJmE++EK3KIZsTQlCJ5FiumqixcJdT5UkHHbUtdj5s
         uPc/Dy52WXcdmmZIK6vwyWcsnMzrqjrXQFCSvT0DIgX6YY/65NhzRN3V/0wrxrHg8B0f
         ehKxh90Eq0BxXgJy32ayzSXNbS31PXFvdPMwTfgaPjltJDjecjH2k8GuK3YunF0AdZ+i
         PIUg==
X-Gm-Message-State: AOJu0Yz2jlxzsSbJVc8Q1n28dXz8YBtKVSIe+8HntQxRhlgJ4hyn+qzo
	Ov2sTl2cuX9Mf86wBA4VVYXqhTrK9HQzsNp/QeAKWynU2OJ8juTvnnnmoXL4
X-Google-Smtp-Source: AGHT+IEOQV4tQlnpRefnr6drWVEYqPxPC01U8HNb2XDOXqdtLocisOU9BJ/s3ygcnVO1fotZ5+C3zQ==
X-Received: by 2002:a05:6870:711:b0:229:ed67:ad1a with SMTP id ea17-20020a056870071100b00229ed67ad1amr3027424oab.12.1711249812415;
        Sat, 23 Mar 2024 20:10:12 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::779c])
        by smtp.gmail.com with ESMTPSA id a19-20020a056a0011d300b006e740d23674sm2075521pfu.140.2024.03.23.20.10.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Mar 2024 20:10:11 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-gnome][PATCH 4/4] tracker-miners: Disable seccomp support on musl
Date: Sat, 23 Mar 2024 20:10:06 -0700
Message-ID: <20240324031006.3072120-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240324031006.3072120-1-raj.khem@gmail.com>
References: <20240324031006.3072120-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 24 Mar 2024 03:10:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109563

seccomp support piece needs APIs e.g. tgkill which are
unimplimented in musl [1]

Secondly, remove libseccomp from unconditional dependencies
it will be only added when packageconfig is selected.

[1] https://www.openwall.com/lists/musl/2019/08/02/1

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-gnome/recipes-gnome/tracker/tracker-miners_3.7.0.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/tracker/tracker-miners_3.7.0.bb b/meta-gnome/recipes-gnome/tracker/tracker-miners_3.7.0.bb
index 333bb62674..4f058cf907 100644
--- a/meta-gnome/recipes-gnome/tracker/tracker-miners_3.7.0.bb
+++ b/meta-gnome/recipes-gnome/tracker/tracker-miners_3.7.0.bb
@@ -7,7 +7,6 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS = " \
     intltool-native \
-    libseccomp \
     tracker \
     zlib \
 "
@@ -43,6 +42,9 @@ PACKAGECONFIG ??= " \
     battery \
     networkmanager \
 "
+# Needs tgkill API which musl does not support
+# see https://www.openwall.com/lists/musl/2019/08/02/1
+PACKAGECONFIG:remove:libc-musl = "seccomp"
 
 PACKAGECONFIG[battery]     = "-Dbattery_detection=upower,-Dbattery_detection=none,upower"
 PACKAGECONFIG[cue]     = "-Dcue=enabled,-Dcue=disabled,libcue"
-- 
2.44.0


