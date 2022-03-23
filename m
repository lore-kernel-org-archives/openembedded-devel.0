Return-Path: <scott.murray@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7AC2C433FE
	for <webhook@archiver.kernel.org>; Wed, 23 Mar 2022 23:28:16 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
 [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web11.4480.1648078095441550739
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Mar 2022 16:28:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=cVyM8dAF;
 spf=pass (domain: konsulko.com, ip: 209.85.160.171,
 mailfrom: scott.murray@konsulko.com)
Received: by mail-qt1-f171.google.com with SMTP id t2so2556469qtw.9
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Mar 2022 16:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Jc+NgREsnnXeCL5OV7h/UqxDtotoLMxkoZno/QifKDc=;
        b=cVyM8dAFI7EMNxmsHFmMHZUjsLVirDK9Xg5MOR9mtzKnAXCevz0PKIVbxQJlc3zRDP
         IkXrh0vhsIZkaDQgZuFSzxpfVqsblCx69oxc5TSJkLJn7UxAMmB8O77MUYWI6Hus7HBr
         nQVIP2BhAjdf1qbnaOjvpgaj2A8J7bSz67Gf0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Jc+NgREsnnXeCL5OV7h/UqxDtotoLMxkoZno/QifKDc=;
        b=e1sU6k2TwEf0T+IdqyLpmYeSyRzpxhckYrJR37U+3MC3zzXVfe5ohgU5+wNiRKbmQa
         THFWHRY0oKJGyeIW3JM7YyjAjV6+NzEzAi1ENqYxiAEXWtgU+1lezb09d6gABTZ4cdr/
         d+BC5EgpVFpWtIEUc8CCrC67UZOqD+rRwgAhWjxy7D3CgzayggLIyP/LCaaF7RzoMIgr
         YsIXLjfBe86SCHLWICbeWLHx3ggPI51zXw4Y7mPliuzv3lsaIV/jddBL03DApnsD+/47
         exUgamzX41P7keHEwBl5gks5WCd54yrkvLZaMpdJUcCda4ClDXF2Z+CPUeL30jNB6BdJ
         swgg==
X-Gm-Message-State: AOAM531c4zbSamWE6hLi/IvHk8rOvLDHnevoiT2CzoDmIdf/GcD4SYVV
	FOiBdzWK/BOn8cdhrjh/H4qG3p7zyUIvKw==
X-Google-Smtp-Source: 
 ABdhPJzd7BYVBa6W5sEMOB+zEoQ/5MlO7OwIyiPTVnsZT0VLnMIYHkNTApnrwxKwg4CR1EMw3om1vA==
X-Received: by 2002:a05:622a:1742:b0:2e1:ecf4:900c with SMTP id
 l2-20020a05622a174200b002e1ecf4900cmr2051882qtk.473.1648078094309;
        Wed, 23 Mar 2022 16:28:14 -0700 (PDT)
Received: from ghidorah.spiteful.org (192-0-174-222.cpe.teksavvy.com.
 [192.0.174.222])
        by smtp.gmail.com with ESMTPSA id
 c10-20020ac87dca000000b002e1db1b7b10sm1102411qte.25.2022.03.23.16.28.13
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Mar 2022 16:28:13 -0700 (PDT)
From: Scott Murray <scott.murray@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 3/4] mpc: upgrade to 0.34
Date: Wed, 23 Mar 2022 19:28:03 -0400
Message-Id: 
 <de7b88aab9a7d975a8cf8b9e67a881e871174835.1648078003.git.scott.murray@konsulko.com>
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
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Mar 2022 23:28:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96171

Changelog (from NEWS file):

0.34 (2021/11/30)
* add commands "albumart", "readpicture"
* don't print status after error
* custom status format
* support grouping "list" results
* meson: auto-build libmpdclient if not available
* require libmpdclient 2.16 or newer
* require MPD 0.21 or newer

Signed-off-by: Scott Murray <scott.murray@konsulko.com>
---
 .../recipes-multimedia/musicpd/{mpc_0.33.bb => mpc_0.34.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/musicpd/{mpc_0.33.bb => mpc_0.34.bb} (87%)

diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpc_0.33.bb b/meta-multimedia/recipes-multimedia/musicpd/mpc_0.34.bb
similarity index 87%
rename from meta-multimedia/recipes-multimedia/musicpd/mpc_0.33.bb
rename to meta-multimedia/recipes-multimedia/musicpd/mpc_0.34.bb
index b3178ea81..93df25ee2 100644
--- a/meta-multimedia/recipes-multimedia/musicpd/mpc_0.33.bb
+++ b/meta-multimedia/recipes-multimedia/musicpd/mpc_0.34.bb
@@ -8,6 +8,6 @@ inherit meson pkgconfig
 DEPENDS += "libmpdclient"
 
 SRC_URI = "git://github.com/MusicPlayerDaemon/mpc;branch=master;protocol=https"
-SRCREV = "ef16b280052ef0320cb80f79d74c8ce0324005ed"
+SRCREV = "31c900b79b3a1cd7f2944e92f24223d12589fdaa"
 
 S = "${WORKDIR}/git"
-- 
2.35.1


