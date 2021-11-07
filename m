Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D863AC433EF
	for <webhook@archiver.kernel.org>; Sun,  7 Nov 2021 12:30:56 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web09.30504.1636288255510770649
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Nov 2021 04:30:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=LxqTVSLm;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.49, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f49.google.com with SMTP id bu18so29800944lfb.0
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Nov 2021 04:30:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GiyS1jlbMXYRc6/NpkAu73K5Ndr+RTvFxtSf2UOU1s4=;
        b=LxqTVSLmYqV6VY6ZBa+5KMHn9TGEMiBW77ZTAHb7YG1/P2X5EiIdLV4rE3AqbuizkA
         DAzPCWgKkg146hx7dR/J3xFsORYhhktBybYXJt+zox4Ok5z4PdHHvvK8fuan0WfXTNXL
         dzQ7lVS1HZbfoxarE3lxgGAtwD7Kn23WefWt1/mZ2eoLT0F/kt8rc7NLRstVo73oABEc
         UPqH9kszo4Q2DqP2ItMWQDN6VojLMRVxvdtMVtj2wXKsQ44OwPlNXaTwH9jCZuYu5qGK
         G8gFEyLV572GI+4Zqzl83Fi4OVlMoGZqcPuhbMGp8PsExdLiv8p02SJ7c7NPiOCt10eC
         /AEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GiyS1jlbMXYRc6/NpkAu73K5Ndr+RTvFxtSf2UOU1s4=;
        b=aARMWcN7gP2GbxG9fBg/3tq341Kq1UY6wqv2Vy/2d16CgVsKfcG/e0FRdXu2UeiSOg
         MfapmgELjJi887v10Pu86iC7WiWX3FQ5ToZ6Un7ik9H3wFPbOEVz4EIEf8/zgMB/4S1Z
         CPZlKfsjlwwGex0u7Lbvt1BsydraTZ0HKObbvA/7Cl1P72j1iKQWSnQ+bFlvq1/LB82o
         UNdwrS0NjDGu3XMGgLVLmH2EBu3uAKLA+TNoJwwaQG7hVjti5wO/tmNnUhGm4hlZb7JC
         7r6/KpRJOHuzuDYek3VtOuS4qNI7QaMpUKjTCQk7cqltjHg0RPOR1xqm68Z/VWAajJMF
         awpw==
X-Gm-Message-State: AOAM530shFJX18z4cgn3KHoD+/sL9vhs5ETmax9y84MowBMnfo/ViWhI
	8hBWklMjPmTh4s4mV7Wz3nkV9UaCbkNkE1XP
X-Google-Smtp-Source: 
 ABdhPJziqKwzsRAcUpR+1Eb7vnjxqwLhdTtl3libKh29vtnmUfKrr59YD4bBJKVDh6H2ksDD34d+OQ==
X-Received: by 2002:a05:6512:1056:: with SMTP id
 c22mr68184177lfb.26.1636288252985;
        Sun, 07 Nov 2021 04:30:52 -0800 (PST)
Received: from localhost.localdomain
 (c-7a22524e.023-160-67626725.bbcust.telenor.se. [78.82.34.122])
        by smtp.gmail.com with ESMTPSA id g5sm189176ljj.41.2021.11.07.04.30.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Nov 2021 04:30:52 -0800 (PST)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-networking][PATCH] wolfssl: update to 5.0.0
Date: Sun,  7 Nov 2021 13:30:38 +0100
Message-Id: <20211107123038.1425131-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 07 Nov 2021 12:30:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93864

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../wolfssl/{wolfssl_4.7.1.bb => wolfssl_5.0.0.bb}          | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-networking/recipes-connectivity/wolfssl/{wolfssl_4.7.1.bb => wolfssl_5.0.0.bb} (91%)

diff --git a/meta-networking/recipes-connectivity/wolfssl/wolfssl_4.7.1.bb b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.0.0.bb
similarity index 91%
rename from meta-networking/recipes-connectivity/wolfssl/wolfssl_4.7.1.bb
rename to meta-networking/recipes-connectivity/wolfssl/wolfssl_5.0.0.bb
index bb1fafabe..ba4c774fa 100644
--- a/meta-networking/recipes-connectivity/wolfssl/wolfssl_4.7.1.bb
+++ b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.0.0.bb
@@ -12,9 +12,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 PROVIDES += "cyassl"
 RPROVIDES:${PN} = "cyassl"
 
-SRC_URI = "git://github.com/wolfSSL/wolfssl.git;protocol=https;branch=master \
-"
-SRCREV = "95b91d89133a712a3d0f389442924612c103da24"
+SRC_URI = "git://github.com/wolfSSL/wolfssl.git;protocol=https;branch=master"
+SRCREV = "7e01af012157bc20c840011a018619915380f05c"
+
 S = "${WORKDIR}/git"
 
 inherit autotools
-- 
2.25.1


