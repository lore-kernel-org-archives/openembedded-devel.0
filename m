Return-Path: <scott.murray@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB2F5C433EF
	for <webhook@archiver.kernel.org>; Wed, 23 Mar 2022 23:28:15 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com
 [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.web12.4313.1648078094650359937
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Mar 2022 16:28:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=clo6Fn3p;
 spf=pass (domain: konsulko.com, ip: 209.85.222.175,
 mailfrom: scott.murray@konsulko.com)
Received: by mail-qk1-f175.google.com with SMTP id b189so2341997qkf.11
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Mar 2022 16:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=MkTOPqnDhQiHpPHPlhVf9ipVgF7qTP/X3GewEUBp6kE=;
        b=clo6Fn3pB/NpoxsTLqG3EoQ+0Rbs1tNj9nW5abKPSrfwxn/DxeimbAOyGbGzVW6qbE
         5404AzFJHKZXbj67pnkrwNZ6QIV1Woo8WSIN/5cX8VRdPQ/uB7oJeNdaN28eXh/aCSM8
         FYN8fODGZ67GmzY5yDrkm+xtjlYLhnulTk+lI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MkTOPqnDhQiHpPHPlhVf9ipVgF7qTP/X3GewEUBp6kE=;
        b=UteCBwfE0gsJkjVo3PwVjH70fgbBSwuOMT2cRr0dVMy2Zc3ex/JRltbQK/ktDvAVvO
         qA04QDNoWjXb/oiacFrVwOWjHrdDKap1m3hO0sm7ou+uMGnDNTh2DeaF3DFkafdg1Cgu
         ablOnjw5je2fUNg/8hOTicK/aOtXG+7BlU/CpkXo4xDuPSc8nEYsSxqqKYwjy0xBhEaH
         JRJ+abZjcNVu8ThisCCpHNSkpSLE2/ZElxb5VKMsBW1vQzc0/oacr+0uX2ifEehs3KjH
         Ootu9CvnaqGpO2vOTzy4fdmYDvqJMYyFBIcsHUA8iPgLIRbBqUyVuEAOJ/mcxyhgCi5y
         KTxQ==
X-Gm-Message-State: AOAM532LunHvy+BWd5rvfjyxrYHdFixhLeG7iUq20lso5xU+7RnFEs7R
	yNbDxk/lQtyBSKesXHdBCEsVEciGvBCN2Q==
X-Google-Smtp-Source: 
 ABdhPJyqPr4h7gvy/O+CkOVuvBAS0EeyZjAosDVWzZXNevrLIupkjXZ8FYLWuTDPhDyXEngwdCJZNQ==
X-Received: by 2002:a05:620a:25ca:b0:67a:fa0b:c34c with SMTP id
 y10-20020a05620a25ca00b0067afa0bc34cmr1702119qko.226.1648078093373;
        Wed, 23 Mar 2022 16:28:13 -0700 (PDT)
Received: from ghidorah.spiteful.org (192-0-174-222.cpe.teksavvy.com.
 [192.0.174.222])
        by smtp.gmail.com with ESMTPSA id
 c10-20020ac87dca000000b002e1db1b7b10sm1102411qte.25.2022.03.23.16.28.12
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Mar 2022 16:28:12 -0700 (PDT)
From: Scott Murray <scott.murray@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 2/4] libmpdclient: upgrade to 2.20
Date: Wed, 23 Mar 2022 19:28:02 -0400
Message-Id: 
 <95f1c4491a1194fa288e8f637c0b5e7b81f6865c.1648078003.git.scott.murray@konsulko.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: 
 <bbba1edd71e7dca7686382e1fca4246874a9d2aa.1648078003.git.scott.murray@konsulko.com>
References: 
 <bbba1edd71e7dca7686382e1fca4246874a9d2aa.1648078003.git.scott.murray@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Mar 2022 23:28:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96170

Changelog (from NEWS file):

libmpdclient 2.20 (2021/11/23)
* support MPD protocol 0.23
  - getvol
  - position argument for searchadd, findadd, load and playlistadd
  - whence argument for addid and add
  - range argument for playlistdelete
* support MPD protocol 0.22.4
  - binarylimit
* support MPD protocol 0.22.0
  - readpicture
* support MPD protocol 0.21.0
  - albumart
* support tags "ComposerSort", "Ensemble", "Movement",
  "MovementNumber", "Location"
* queue: make "priority" parameter unsigned

Signed-off-by: Scott Murray <scott.murray@konsulko.com>
---
 .../musicpd/{libmpdclient_2.19.bb => libmpdclient_2.20.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/musicpd/{libmpdclient_2.19.bb => libmpdclient_2.20.bb} (92%)

diff --git a/meta-multimedia/recipes-multimedia/musicpd/libmpdclient_2.19.bb b/meta-multimedia/recipes-multimedia/musicpd/libmpdclient_2.20.bb
similarity index 92%
rename from meta-multimedia/recipes-multimedia/musicpd/libmpdclient_2.19.bb
rename to meta-multimedia/recipes-multimedia/musicpd/libmpdclient_2.20.bb
index 6cff3c404..2746c6bb8 100644
--- a/meta-multimedia/recipes-multimedia/musicpd/libmpdclient_2.19.bb
+++ b/meta-multimedia/recipes-multimedia/musicpd/libmpdclient_2.20.bb
@@ -8,7 +8,7 @@ inherit meson
 SRC_URI = " \
     git://github.com/MusicPlayerDaemon/libmpdclient;branch=master;protocol=https \
 "
-SRCREV = "27767959442ef390aabb16790494ba93fed962ef"
+SRCREV = "7124a0ad4841a44db084bb785a6e7120bc8f0139"
 S = "${WORKDIR}/git"
 
 PACKAGECONFIG ??= "tcp"
-- 
2.35.1


