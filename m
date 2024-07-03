Return-Path: <ninette@thehoodiefirm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A8A1C2BD09
	for <webhook@archiver.kernel.org>; Wed,  3 Jul 2024 16:40:57 +0000 (UTC)
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
 by mx.groups.io with SMTP id smtpd.web11.55974.1720024847891822469
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Jul 2024 09:40:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@thehoodiefirm-com.20230601.gappssmtp.com header.s=20230601 header.b=EuE4QexS;
 spf=neutral (domain: thehoodiefirm.com, ip: 209.85.160.53, mailfrom: ninette@thehoodiefirm.com)
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-25cb15eed97so2487522fac.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 03 Jul 2024 09:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thehoodiefirm-com.20230601.gappssmtp.com; s=20230601; t=1720024847; x=1720629647; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vnlON9gg/2Op2MzcniaZwaQWehu9iN+zHy+wHzli+e0=;
        b=EuE4QexScWkWiPKbxqjYD9J3kc4HRpNhYTu+s31oXqeYBDmAPPfEXncaqj2ydr1nQT
         um8swox19LB7wHmrVzEgI9HZ8OmmdQ43AD7Bbnu9wWa1ORjnB951yPi7LMfvFKCfO42v
         ipZX4eNVhHXcXkJyeXI634kteId7XMdzG/86orJiCZ2v3NDzTImIE+Lm8kpnJ/3sfcuS
         6uoe8N91G/vmQoQX5dnWc7Ek00Ara3N7eFhJD5j1hnH78KwS3fF+5aU6cQ4l9QZq2s62
         tkFTwpn3ZTdY2LYthzcG9WZN+OC2EEmj16AzRnnuqcATbxnBJYXqizBQuIRbitS0EbBy
         chJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720024847; x=1720629647;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vnlON9gg/2Op2MzcniaZwaQWehu9iN+zHy+wHzli+e0=;
        b=EeUXMveI/dox3gftglFr3j8Tk46t+V44P99POIll0ja2TiFlUsBkCXOyQKIOPnntjM
         zTdAezOItgBHRO3dUFqDlgUNwpAHrGmbojZOOHZ4GjruSVchkDaK1drpPwr2YI4haad1
         NMp6G5mOBG66Ceam4P+gikJCudfwWRC7gu7+WeWqtRQ/y/bj6YBUE0E0WSIE0Lg1zptk
         pZTE58JlLFwouG/UhCpSdrjbY51PvHu0qF27V3XolOtncREngEc8Vt+iyVuKm+k5U7e5
         ZqRPrCIu2q4cZOz7sUnFAQ2VDfnyaJIvNCOIMAZ4cruV25kCmYxQb/hDaDd5Fx1TFaVn
         hViA==
X-Gm-Message-State: AOJu0Yx8/xsaWexYcNgzn8psOGU3jg4taTAyhK/Ed3pgcSssx8owUxhh
	GJ5rEiLf+ueMr/GDJKXvhehEBwFx66WMeiVQQBFQne5WuZgqxk+jUIpuowdTkUkYG/zsqvMfKjO
	C
X-Google-Smtp-Source: AGHT+IExUCofmbn5x3EWp085IXcHJCI9w1KROX7W4dEa1eBrHPqFY7zW1WaarLmfF8gH1GHpBbWcnw==
X-Received: by 2002:a05:6870:1608:b0:254:a217:f8b5 with SMTP id 586e51a60fabf-25db36c832emr9007242fac.39.1720024847041;
        Wed, 03 Jul 2024 09:40:47 -0700 (PDT)
Received: from localhost.localdomain ([50.54.151.77])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7084d7061a0sm10356982b3a.219.2024.07.03.09.40.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 09:40:46 -0700 (PDT)
From: Ninette Adhikari <ninette@thehoodiefirm.com>
To: openembedded-devel@lists.openembedded.org
Cc: engineering@neighbourhood.ie,
	Ninette Adhikari <ninette@thehoodiefirm.com>
Subject: [PATCH 1/1] apache2:apache2-native: CVE status update
Date: Wed,  3 Jul 2024 09:40:42 -0700
Message-ID: <20240703164042.20929-2-ninette@thehoodiefirm.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240703164042.20929-1-ninette@thehoodiefirm.com>
References: <20240703164042.20929-1-ninette@thehoodiefirm.com>
Reply-To: engineering@neighbourhood.ie
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Jul 2024 16:40:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111230

Update status for: CVE-2007-0450, CVE-2010-0425

The current version (2.4.59) is not affected. It only applies for Windows.

Signed-off-by: Ninette Adhikari <ninette@thehoodiefirm.com>
---
 meta-webserver/recipes-httpd/apache2/apache2_2.4.59.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.59.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.59.bb
index 6dfecef8d..b08ad8b8f 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.59.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.59.bb
@@ -41,6 +41,8 @@ CVE_STATUS[CVE-2007-6421] = "cpe-incorrect: The current version (2.4.59) is not
 CVE_STATUS[CVE-2007-6422] = "cpe-incorrect: The current version (2.4.59) is not affected by the CVE which affects versions from 2.2 (incl.) to 2.2.8 (excl.)"
 CVE_STATUS[CVE-2007-6423] = "cpe-incorrect: The current version (2.4.59) is not affected by the CVE which affects versions from 2.2.x to 2.2.7-dev"
 CVE_STATUS[CVE-2008-2168] = "cpe-incorrect: The current version (2.4.59) is not affected by the CVE which affects versions up to 2.2.6 (excl.)"
+CVE_STATUS[CVE-2007-0450] = "not-applicable-platform: The current version (2.4.59) is not affected. It also only applies for Windows."
+CVE_STATUS[CVE-2010-0425] = "not-applicable-platform: The current version (2.4.59) is not affected. It also only applies for Windows."
 
 SSTATE_SCAN_FILES += "apxs config_vars.mk config.nice"
 
-- 
2.44.0


