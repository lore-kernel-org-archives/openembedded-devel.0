Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99B2BC433EF
	for <webhook@archiver.kernel.org>; Fri, 15 Oct 2021 22:57:07 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web12.4333.1634338626263743621
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Oct 2021 15:57:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=M0vt2dEc;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.45, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f45.google.com with SMTP id x192so12710205lff.12
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Oct 2021 15:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=R93/VaBxgpl0s0CD6aMI4lJkQSbe12/lcji6p1vENno=;
        b=M0vt2dEcfgq6bB2xVxD8EFGfTVdHrUFZu4v7GuWQPr2WxxHUtyj6J8TWlGT9ECJO1s
         bckg4X/mx6a9yLOVTVshcGhf6Ed3AGhWdNxxfP3PsOxZfqLs7k/JG1ORXwTpE3ikdPYb
         fetoU+/hZnzYIkUqlMy0e/drxhWDK9sek0g0+vibwQxpXob91rLI8I8LnuVnnxmzJppg
         6XatLaBzqe9GYGaUraOMAgQbw88c4EToKaRo+qen164esYP1QAlGfpCh81oK8FZfGbED
         fyQZlDpK/mW1yYCPSATN4Dwb3viM4d2h1D2TDnvLH7DSpT7u+Kgi0WCp/9Z6K8vKYxyH
         np8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=R93/VaBxgpl0s0CD6aMI4lJkQSbe12/lcji6p1vENno=;
        b=Jo9nosMEnV9Cqi9z+bnu4pKmgix5pq3CQCrDGSF25cIdQ68OyTHktxZ5GtxvdtbeIa
         QZviamhOTFzxslBtpOT2ibLvR2XqfepxmAXU0BXKI7ArrbmNXWH3xoPkTGDA0miRAd4H
         +iC7f7TPmmduKxnesr0KEnnsJzM6gya9cDcfN4mp64/BTTs/a9Sek+gCXBBRHCCNFZR/
         YL3cJv8mcX9bd8JAep3myIV4Mu2pWOWogfPydG285wCoh7TaanRCa9l7hAg/DtnRLM9X
         De8OQCjIFs0w7FjG3uNTDXZAxsb6MOajIJmIcxGELnBqucLa++KkHUIRroTfX7iWIeLU
         D0dg==
X-Gm-Message-State: AOAM532O63ekGzAGNh2df/wiGN+BL0EM7D6H5/k17uZQ2DP9SPqv4bCW
	y4Y4S/oIg4AGHua0MTd+y7Kh3MnvoRLXe6eG
X-Google-Smtp-Source: 
 ABdhPJzBOf0eEPnmgBDRuslR9BpoFtMphKl+xVqs2ITv5GyJ6OGtPsP7J6t4p1zfFxXXwxDDUGrkVg==
X-Received: by 2002:a2e:868e:: with SMTP id
 l14mr15435270lji.230.1634338624318;
        Fri, 15 Oct 2021 15:57:04 -0700 (PDT)
Received: from localhost.localdomain
 (c-7a22524e.023-160-67626725.bbcust.telenor.se. [78.82.34.122])
        by smtp.gmail.com with ESMTPSA id
 b20sm653548lff.121.2021.10.15.15.57.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 15:57:03 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-python][PATCH] python3-joblib: update to 1.1.0
Date: Sat, 16 Oct 2021 00:57:02 +0200
Message-Id: <20211015225702.4163448-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Oct 2021 22:57:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93364

License-Update: copyright years updated.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../{python3-joblib_1.0.1.bb => python3-joblib_1.1.0.bb}     | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-joblib_1.0.1.bb => python3-joblib_1.1.0.bb} (57%)

diff --git a/meta-python/recipes-devtools/python/python3-joblib_1.0.1.bb b/meta-python/recipes-devtools/python/python3-joblib_1.1.0.bb
similarity index 57%
rename from meta-python/recipes-devtools/python/python3-joblib_1.0.1.bb
rename to meta-python/recipes-devtools/python/python3-joblib_1.1.0.bb
index e325ad877..e69cfefd1 100644
--- a/meta-python/recipes-devtools/python/python3-joblib_1.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-joblib_1.1.0.bb
@@ -1,11 +1,10 @@
 SUMMARY = "Joblib is a set of tools to provide lightweight pipelining in Python."
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=32b289008fb813a27c9025f02b59d03d"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2e481820abf0a70a18011a30153df066"
 
 inherit setuptools3 pypi
 
-SRC_URI[md5sum] = "9914b330916395c0a1feca54949867a3"
-SRC_URI[sha256sum] = "9c17567692206d2f3fb9ecf5e991084254fe631665c450b443761c4186a613f7"
+SRC_URI[sha256sum] = "4158fcecd13733f8be669be0683b96ebdbbd38d23559f54dca7205aea1bf1e35"
 
 RDEPENDS:${PN} += " \
     python3-asyncio \
-- 
2.25.1


