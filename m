Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5A55C433EF
	for <webhook@archiver.kernel.org>; Thu, 14 Oct 2021 22:33:28 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web11.1908.1634250807409098598
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Oct 2021 15:33:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=1uyN4H90;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.42, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f42.google.com with SMTP id p16so33485257lfa.2
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Oct 2021 15:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kmWWAMDuzT+vF28b/54arQu6d5fdSVSwY96yXR1M7OQ=;
        b=1uyN4H90S9457zEbxoauwaGt0auHhPrQVPeuVt6tKsHZVwOpH32LAV7P7jr+EsTWJI
         ZibZa5bmPsjMkHPra5Fqg2gLImfdsONecb+D2j1CKhG+4KvCSXI/BNwmajxwFM0rmshe
         o45/1a/m+JGNSEMLvkpfrBhKZ+Rmc0LerH+Jb+s+dHwzzoQ5TxNcAsnukEOsGihiif/T
         rza4lenRGXkvlzSdNK9NVz0QHF0iWGZDhGx4Pu0vvvuqSY+SE9sLfKTJCML97nR5EdBe
         qBOsrDaJQx6IPmq/lkkg9ucfNiOIjKfaycebpniKEyuArkE0MEo6oawYC30LpoZ06Jr0
         ClZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kmWWAMDuzT+vF28b/54arQu6d5fdSVSwY96yXR1M7OQ=;
        b=Yk4EtP9ZMhbv0M3ZnR4mQhTsfKq03aVRTh98MnaxIKjKP5dhJjyqYlB6tm6bA+Ih1N
         wFpOviT231Aoc+2Ir/6BcqgobrSR0qu4OlVxqpP8LLzQ+pggs5G+yufL8I4OeHE2ich2
         WCvLX4QeZnSg69/lrs1ZraUgzZCdizEQGkDFeICAIv92JT3unToME53si/hoZiY8uWBS
         hEDFagQ9UnNPph1q1zkcifJ4+2BitOjt0UuQqRYCrPMO09QV6qyppKGgGw/7yUwQ8hM7
         AYnBl5kz9sk27Ra87WniocKJNhyswGTz9EQsdZ2Oqr+e2xOysHBU995QRVDMboUTdHow
         yVAg==
X-Gm-Message-State: AOAM530NbB2rqs30KcEYf/Zk3NmxfE1hW1flA3X2fPssT/YAtkxI9jaG
	gtE+kgXR8HM6BHKZXUYWnRhG2UbYdil5mpxE
X-Google-Smtp-Source: 
 ABdhPJz2Sl7RvBaKgwCT3yM7Ai3QE1DNFL64nCpHkYzDqgVP6G2MkXZvcFQaLoSC+hpxfLPa4nmf6w==
X-Received: by 2002:a2e:b611:: with SMTP id r17mr8937837ljn.336.1634250804670;
        Thu, 14 Oct 2021 15:33:24 -0700 (PDT)
Received: from localhost.localdomain
 (c-7a22524e.023-160-67626725.bbcust.telenor.se. [78.82.34.122])
        by smtp.gmail.com with ESMTPSA id
 f9sm335440lfr.116.2021.10.14.15.33.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Oct 2021 15:33:24 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-oe][PATCH] pmdk: update to 1.11.1
Date: Fri, 15 Oct 2021 00:33:21 +0200
Message-Id: <20211014223321.3933672-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Oct 2021 22:33:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93309

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../recipes-extended/pmdk/{pmdk_1.9.bb => pmdk_1.11.1.bb}    | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-extended/pmdk/{pmdk_1.9.bb => pmdk_1.11.1.bb} (92%)

diff --git a/meta-oe/recipes-extended/pmdk/pmdk_1.9.bb b/meta-oe/recipes-extended/pmdk/pmdk_1.11.1.bb
similarity index 92%
rename from meta-oe/recipes-extended/pmdk/pmdk_1.9.bb
rename to meta-oe/recipes-extended/pmdk/pmdk_1.11.1.bb
index 4325c15c3..e456603c1 100644
--- a/meta-oe/recipes-extended/pmdk/pmdk_1.9.bb
+++ b/meta-oe/recipes-extended/pmdk/pmdk_1.11.1.bb
@@ -11,9 +11,8 @@ DEPENDS:append:libc-musl = " fts"
 
 S = "${WORKDIR}/git"
 
-SRC_URI = "git://github.com/pmem/pmdk.git"
-
-SRCREV = "1926ffb8f3f5f0617b3b3ed32029d437c272f187"
+SRC_URI = "git://github.com/pmem/pmdk.git;branch=stable-1.11"
+SRCREV = "5b21904a257eff47f2e87fcbf2de46111f03ddd8"
 
 inherit autotools-brokensep pkgconfig
 
-- 
2.25.1


