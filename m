Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 195F2C52D7C
	for <webhook@archiver.kernel.org>; Sat, 10 Aug 2024 15:38:40 +0000 (UTC)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
 by mx.groups.io with SMTP id smtpd.web10.7843.1723304312617249761
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 10 Aug 2024 08:38:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mKuK74i2;
 spf=pass (domain: gmail.com, ip: 209.85.219.170, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-dff17fd97b3so2924574276.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 10 Aug 2024 08:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723304311; x=1723909111; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iqTq4hozs4cfEi8vCsTvmSZpov5qCU0nGMbUAz4lnHQ=;
        b=mKuK74i2l8k7+UcV3K+ECBudpgW18epXKe0nDoHUPdOKO2jqrIeIsGraJY0c1SnpfU
         YysKSTFRNZZR9vhgSDRmaAmB4oDgpozOHNPpeVcVnL9Hodq3tU98C/3HQiqXu8N+W0oQ
         inHn3gXG5tgXLKP7g8RCQXj6VP/pVanAIfOMy86d7WP9eNQuWHgKaxrfP7nzeHMY7bIE
         oMOZfLbiTxlXmNB4pFodglj8F9FLuTCqy1Cp4FavI0/92T5TIV9J0IChCcPUG7fh4dPn
         nnHiqrNc+3mtlCF9IATPZjDzHcdHZk2heOtr9Z7dbAPli0yddvvLWhmmvmZcK+atZwqp
         vTEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723304311; x=1723909111;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iqTq4hozs4cfEi8vCsTvmSZpov5qCU0nGMbUAz4lnHQ=;
        b=p2yqHUalnL8r1H9WXXXem4UmsOGpAwNJunOvGtbH5EEtdHHD+nx/pALLAJwNsK8xn+
         ONxvgYu7cvClscI+KkDo0SqjTCWrmORcCgLYTAntzxPhKdLZsFwLDh2UQn+uk12/2C9r
         ImNUft48pLSRfAtVF1d4onvAKwwUKmAvhIDvIofut7yAXyuuIBAdqhbhsVkoZl2Ereiw
         J0z75JVkP9NM7uhK0lT7rqNfdcSga3Egv1ZdJRYztsOfE1Eb0c5+2RHtKLe0NW4KoZMc
         6iQYIYSfm/rinp7Zjw77xNixxJfhfBXjtLJpRDlQ1yQyMoymFhawW7PQt0wPvDyQJ3PQ
         2OEQ==
X-Gm-Message-State: AOJu0YwH6CsdCo8Pisef6Z9cneSyd+RF9PAMT1D3YW7ZYPRjk5UOrU9Q
	nADKl0e6JaDDkdtQ5PQ7IpGIkI7U+9lqC/T5hpAZpYHRfvz3+/AIypUeig==
X-Google-Smtp-Source: AGHT+IHZ3AEgXEXfA8vK5hPncY9aZRT3Nr0E3qy3N6F56MeJC0cD8dCislf8FYgdVhYmK1HLupqpUA==
X-Received: by 2002:a05:6902:248a:b0:e0b:c297:8a1c with SMTP id 3f1490d57ef6-e0eb99436eemr5128611276.15.1723304311505;
        Sat, 10 Aug 2024 08:38:31 -0700 (PDT)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000:ad:eb2b:7538:7504])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e0ec8c0726bsm382526276.39.2024.08.10.08.38.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Aug 2024 08:38:31 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ninette Adhikari <ninette@thehoodiefirm.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][scarthgap][PATCH 2/5] imagemagick: Update status for CVE
Date: Sat, 10 Aug 2024 11:38:27 -0400
Message-Id: <20240810153830.900538-2-akuster808@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240810153830.900538-1-akuster808@gmail.com>
References: <20240810153830.900538-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 10 Aug 2024 15:38:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111746

From: Ninette Adhikari <ninette@thehoodiefirm.com>

Update status for:
CVE-2016-7534, CVE-2016-7535, CVE-2016-7536, CVE-2016-7537, CVE-2016-7538, CVE-2017-5506, CVE-2017-5509, CVE-2017-5510, CVE-2017-5511, CVE-2007-1667

CPE is incorrect, the current version (7.1.1) is not affected.

Signed-off-by: Ninette Adhikari <ninette@thehoodiefirm.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 9f2e9daef1891d373792d5b1bcc36719349ba843)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-support/imagemagick/imagemagick_7.1.1.bb   | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb
index 61dc1b795e..8dc3cb267b 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb
@@ -119,3 +119,13 @@ CVE_STATUS[CVE-2014-9819] = "cpe-incorrect: The current version (7.1.1) is not a
 CVE_STATUS[CVE-2014-9820] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
 CVE_STATUS[CVE-2014-9821] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
 CVE_STATUS[CVE-2016-7531] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 7.0.1-0"
+CVE_STATUS[CVE-2016-7534] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
+CVE_STATUS[CVE-2016-7535] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
+CVE_STATUS[CVE-2016-7536] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
+CVE_STATUS[CVE-2016-7537] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
+CVE_STATUS[CVE-2016-7538] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
+CVE_STATUS[CVE-2017-5506] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 7.0.4-4"
+CVE_STATUS[CVE-2017-5509] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 7.0.4-4"
+CVE_STATUS[CVE-2017-5510] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 7.0.4-4"
+CVE_STATUS[CVE-2017-5511] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 7.0.4-3"
+CVE_STATUS[CVE-2007-1667] = "cpe-incorrect: CVE should not include a CPE for imagemagick"
-- 
2.34.1


