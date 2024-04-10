Return-Path: <ninette@thehoodiefirm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30CE0CD129A
	for <webhook@archiver.kernel.org>; Wed, 10 Apr 2024 14:38:50 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web11.1520.1712759928215196920
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Apr 2024 07:38:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@thehoodiefirm-com.20230601.gappssmtp.com header.s=20230601 header.b=ZgMvDylU;
 spf=neutral (domain: thehoodiefirm.com, ip: 209.85.218.48, mailfrom: ninette@thehoodiefirm.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a450bedffdfso950510066b.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Apr 2024 07:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thehoodiefirm-com.20230601.gappssmtp.com; s=20230601; t=1712759926; x=1713364726; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rm3+iFROmgSXfrDCvfHP8vTfBsBgCt+aOVvV1smJzYw=;
        b=ZgMvDylUmqkcNNmVdja1o9SEZFjj6tKbrZLoByZAiwi5gtmnqi2KL8XoIx0DnMS+gU
         hiPwbZ12skORQMWI2aJPUDnGKMrNRuzKgz36GiP7XevX61jgrVk3/rQ7oNFGrThmZJci
         j+s078kIcUcdEQ9OhxT5H5uoLK4ZTh0b+4KTIlZ8Q2wAiD0KiOkO91f+UiuF/TmiHVQ+
         9JaSnAgfBSPTmVhORJRTiKiJBm0/5LM9FOS32Uo1jvvYS+HWZW43s14CHUShAS432rIZ
         74vyXrnJMe9Es1dXVqNs7aUphfDHIO9xZRXwaeXaIULrUrwRZI2F0IOJreryo9U+GiVq
         JFhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712759926; x=1713364726;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rm3+iFROmgSXfrDCvfHP8vTfBsBgCt+aOVvV1smJzYw=;
        b=fwECQDNC+2rlD634KptSowtFpCWcww9rdqHXGYMJ3271WIcjGYMOFldU4NqPBe360N
         XfWtWNqiePIPO4RdV38HuFQQICsr1Q4mxfuB/rJuwAjmiOxFRb0NVIeWWJENGgAxBWc7
         qhKeDtVhNfVLwrqE5+nBd1pbAQYBGxIHTfowes6M5Sb9aKNAJ2WT6RBxLrbmMn40x7o2
         Wd9xwunntWISd8cy/VeFs6scqSkQwTCGdtA4IbRAya5D8JsMH6PCFE/x9BSDePok+aaB
         KrI6J7XUBPnltJAAnjfsbyatLuUKiSi7U9XPFduk9SEi33S8/irYT+AzXdD9gLr4TUDL
         q1Xw==
X-Gm-Message-State: AOJu0YzALWzP41xgWGPzItIOs/1HSOW0KoXuV2dgWLkl3+aEdp0McT2f
	Dvg1pFDyRiI9vyKmENGnFSsYCDsnzSF3rMwjT1RsWB7hEuuPCSY9wWiSYU5oGmubMtpcynSrwSc
	K
X-Google-Smtp-Source: AGHT+IGahe1IawRW67vdhVFnuII5SaZIDPz/hqq5J6S01H8pSHyA4AmxjahKIJEjMVocxDiXLr4itA==
X-Received: by 2002:a17:906:4c4f:b0:a52:10c9:661f with SMTP id d15-20020a1709064c4f00b00a5210c9661fmr1226769ejw.62.1712759926662;
        Wed, 10 Apr 2024 07:38:46 -0700 (PDT)
Received: from localhost.localdomain ([62.72.77.226])
        by smtp.gmail.com with ESMTPSA id en19-20020a17090728d300b00a51a74409dcsm6873416ejc.221.2024.04.10.07.38.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 07:38:46 -0700 (PDT)
From: Ninette Adhikari <ninette@thehoodiefirm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ninette Adhikari <ninette@thehoodiefirm.com>
Subject: [PATCH 1/1] memcached: Update CVE-2022-26635 status
Date: Wed, 10 Apr 2024 16:38:43 +0200
Message-ID: <20240410143843.77108-2-ninette@thehoodiefirm.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240410143843.77108-1-ninette@thehoodiefirm.com>
References: <20240410143843.77108-1-ninette@thehoodiefirm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Apr 2024 14:38:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109900

This issue is for php-memcached and this is not relevant for meta-openembedded.

Signed-off-by: Ninette Adhikari <ninette@thehoodiefirm.com>
---
 meta-networking/recipes-support/memcached/memcached_1.6.17.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-support/memcached/memcached_1.6.17.bb b/meta-networking/recipes-support/memcached/memcached_1.6.17.bb
index 270ad5486..c63f530e0 100644
--- a/meta-networking/recipes-support/memcached/memcached_1.6.17.bb
+++ b/meta-networking/recipes-support/memcached/memcached_1.6.17.bb
@@ -25,6 +25,8 @@ SRC_URI = "http://www.memcached.org/files/${BP}.tar.gz \
            "
 SRC_URI[sha256sum] = "2055e373613d8fc21529aff9f0adce3e23b9ce01ba0478d30e7941d9f2bd1224"
 
+CVE_STATUS[CVE-2022-26635] = "cpe-incorrect: This issue is for php-memcached and this is not relevant for meta-openembedded."
+
 # set the same COMPATIBLE_HOST as libhugetlbfs
 COMPATIBLE_HOST = "(i.86|x86_64|powerpc|powerpc64|aarch64|arm).*-linux*"
 
-- 
2.44.0


