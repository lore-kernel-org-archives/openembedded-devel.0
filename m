Return-Path: <omkarpatil10.93@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E6C4C433FE
	for <webhook@archiver.kernel.org>; Thu, 17 Nov 2022 08:24:52 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web10.10823.1668673488173940887
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Nov 2022 00:24:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PvOuMdOj;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: omkarpatil10.93@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id g62so1067080pfb.10
        for <openembedded-devel@lists.openembedded.org>; Thu, 17 Nov 2022 00:24:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=etXic8+htlm8EbwHS6qdCNCxrJKG/lbQspFFYwvCIO0=;
        b=PvOuMdOj5yU0VE5kOQCWXHrbA0UR2szCEfd4tDMtK0tZU9Ee0vrVLvxPAiOHazOk50
         mUtoG3wPYlBn0GRRJjhj+gFmC7SERS6aMToG6nTguRMKqNGfFp3fUFkDP87UBEWF7F0x
         F0EZn/5l9oNlf04OeSkYAgHKbiaousWunfCShIAIGIfYlSRxF95AVxJXw0Kc37DIjDB8
         pTGhnY3NMbHwZiVToF/3/goer6GpJ2+U3Bc38kub8n/KC4Ig4phGH6PBEcfv9gwxnf8n
         IJCn5vUKeT9O9+46DmH+rNB99BTIHRHOBS5XzvTi23/CijVTdZ4E/0xgjPGjk0XFzKBE
         tmzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=etXic8+htlm8EbwHS6qdCNCxrJKG/lbQspFFYwvCIO0=;
        b=Eou3dIIhTQSvqWb01jJAtn3TK755XrYapJSgAVglxMvukwUcVDXo6naI/3bUKf2D7E
         NCXisruYI7om0ZX4jCTrWs32YW2X8rPIZPepHwXcmO+tmSm1ZW9lGL7ran3Ig1bCZ4Bd
         7s6F16wwWRSAQeFOuLZZKJ4lmVaBXjCZHv3FosZ3Mos+uY4KQEyGC/3oJf8utD7mBAwo
         g7wzzulIhC1Gcfk6m3EHMXuOA87wO//JK4UmECvoPqx4aNDpdc4nLjCVlEvNnG6tlONJ
         1Z2H/R4lrWUklvTheuyH5QR34OYXMWGP7AZOkZ57wdrfzCAmMGfuR+KgWc49vB20EDmy
         sqZw==
X-Gm-Message-State: ANoB5plWyHWac8NTVzVFARWHyjyLcbH9oVdAmfZWZOXRtl1oTrNdIUL6
	kdCrF7YixxL3inl9h5d8cd75agvCvxqacA==
X-Google-Smtp-Source: AA0mqf4ZeEw4NwA7XeZa8OkiD8Uu3fTaaKgtwI8VLHOOcJNUH4v1yesn5b0ZRUSE/cLQrVCE78Viig==
X-Received: by 2002:a63:d407:0:b0:476:e0fc:8d8a with SMTP id a7-20020a63d407000000b00476e0fc8d8amr1150413pgh.145.1668673487375;
        Thu, 17 Nov 2022 00:24:47 -0800 (PST)
Received: from localhost.localdomain ([2409:4042:4e02:b7cf:7864:cc87:c985:cfd1])
        by smtp.gmail.com with ESMTPSA id h19-20020a656393000000b0044ed37dbca8sm493675pgv.2.2022.11.17.00.24.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Nov 2022 00:24:47 -0800 (PST)
From: Omkar Patil <omkarpatil10.93@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	omkar.patil@kpit.com
Cc: ranjitsinh.rathod@kpit.com
Subject: [oe][meta-filesystems][master][PATCH] ntfs-3g-ntfsprogs: Upgrade 2022.5.17 to 2022.10.3
Date: Thu, 17 Nov 2022 13:54:39 +0530
Message-Id: <20221117082439.19512-1-omkarpatil10.93@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 17 Nov 2022 08:24:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99603

From: Omkar Patil <omkar.patil@kpit.com>

Changes:
Rejected zero-sized runs
Avoided merging runlists with no runs

Fix CVE-2022-40284

Signed-off-by: Omkar Patil <omkarpatil10.93@gmail.com>
---
 ...3g-ntfsprogs_2022.5.17.bb => ntfs-3g-ntfsprogs_2022.10.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/{ntfs-3g-ntfsprogs_2022.5.17.bb => ntfs-3g-ntfsprogs_2022.10.3.bb} (95%)

diff --git a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2022.5.17.bb b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2022.10.3.bb
similarity index 95%
rename from meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2022.5.17.bb
rename to meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2022.10.3.bb
index cb52c5567..efb331d7b 100644
--- a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2022.5.17.bb
+++ b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2022.10.3.bb
@@ -10,7 +10,7 @@ SRC_URI = "http://tuxera.com/opensource/ntfs-3g_ntfsprogs-${PV}.tgz \
            file://0001-libntfs-3g-Makefile.am-fix-install-failed-while-host.patch \
 "
 S = "${WORKDIR}/ntfs-3g_ntfsprogs-${PV}"
-SRC_URI[sha256sum] = "0489fbb6972581e1b417ab578d543f6ae522e7fa648c3c9b49c789510fd5eb93"
+SRC_URI[sha256sum] = "f20e36ee68074b845e3629e6bced4706ad053804cbaf062fbae60738f854170c"
 
 UPSTREAM_CHECK_URI = "https://www.tuxera.com/community/open-source-ntfs-3g/"
 UPSTREAM_CHECK_REGEX = "ntfs-3g_ntfsprogs-(?P<pver>\d+(\.\d+)+)\.tgz"
-- 
2.17.1


