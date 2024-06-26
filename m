Return-Path: <ninette@thehoodiefirm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70421C27C4F
	for <webhook@archiver.kernel.org>; Wed, 26 Jun 2024 13:56:11 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.27242.1719410169196204211
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Jun 2024 06:56:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@thehoodiefirm-com.20230601.gappssmtp.com header.s=20230601 header.b=1qJlkJT4;
 spf=neutral (domain: thehoodiefirm.com, ip: 209.85.214.170, mailfrom: ninette@thehoodiefirm.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1f6fabe9da3so54930925ad.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 26 Jun 2024 06:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thehoodiefirm-com.20230601.gappssmtp.com; s=20230601; t=1719410169; x=1720014969; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fOrRF7YhRJtscv2yF0Fis6nKPvZ2fshJmSqranuIuP8=;
        b=1qJlkJT4MQMhUxBLoxZSYJq1kj1YDGFtIrq2OeAZfzpY82Nxf5QAFmyTHhJMezDu+N
         HzpQEEYG2y9v8M3Ot5u60FLf7aGjDG7cuARW3DntK0/kYItuPv5g2G7TjuAKWIXiPLhE
         fqg7tnyirhTOqHHyVzL//vyINLaz6VKklwtAOGxDhIAMGjL82AMXd/pZ1TvM5B2/8leL
         rizTePyrq2qlCXDLknsQ1xG6oUOxmofniEuiEQYcuYUdW4Yj9xzdJn/XAkpRm5i9gNqd
         VyKqd6TV1JMXYlygqkb/FK1MDLRGLyomrbdf5FS9OtnnaErgsOZdpqlrkQxPWpu/PfIf
         ShpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719410169; x=1720014969;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fOrRF7YhRJtscv2yF0Fis6nKPvZ2fshJmSqranuIuP8=;
        b=jxxuUNcX8OK/srykUc5VawdiXdQjoi00gytUa/PTnxRt8ffCKycbpArTdQkUrlhHnK
         aYCjntW4ygUGqg/Z9M7pm9/QKgRmYHorpQYHrdgEWBR8rHkmoqBzhy7UL8UsGl9ivDQn
         Fg5VKT6wGg/LX0sYPnzfOU1c/YIxUXdddeT969uK4rwyYVAEyUj0Fq6ZbNP8vcbP2eJI
         jIo2lgKUmuT+4evvszwPveMXPGrHG2rVDakHguQVh4ofZykoS1TAhtBK786/BFsFGbCc
         RPFfRZ6svO/a0M/nTG73vBIMmTysy+X7oKkqWUUNiLLdFnmSy0w+1OWiNXygOnzfLTsV
         mq9Q==
X-Gm-Message-State: AOJu0Yz68l9t41uinmXhoJNAhsoAvTtYx58ILf9wu57/7MyGmjhwwd8R
	R3HP3MEaZZ8w361uuk3WMeo1QD5iexe1DxyNMFIAZeVDnbVYmDPXIYdrIlv3q98GiE5f+OJ2T2T
	K
X-Google-Smtp-Source: AGHT+IF7ad+SE3vdgMg1r/isKaikp4uknDTSd1Up7q4/vjhlfssd9sNpQJ1xl30DHcbPQ0oxKcIJ2Q==
X-Received: by 2002:a17:902:da8b:b0:1fa:81bc:f4cc with SMTP id d9443c01a7336-1fa81bcf71amr31287295ad.68.1719410167713;
        Wed, 26 Jun 2024 06:56:07 -0700 (PDT)
Received: from localhost.localdomain ([50.54.151.77])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fa809dcbfbsm21291625ad.65.2024.06.26.06.56.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 06:56:07 -0700 (PDT)
From: Ninette Adhikari <ninette@thehoodiefirm.com>
To: openembedded-devel@lists.openembedded.org
Cc: engineering@neighbourhood.ie,
	Ninette Adhikari <ninette@thehoodiefirm.com>
Subject: [PATCH 1/1] imagemagick: Update status for CVE
Date: Wed, 26 Jun 2024 06:56:02 -0700
Message-ID: <20240626135602.23435-2-ninette@thehoodiefirm.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240626135602.23435-1-ninette@thehoodiefirm.com>
References: <20240626135602.23435-1-ninette@thehoodiefirm.com>
Reply-To: engineering@neighbourhood.ie
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Jun 2024 13:56:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111094

Update status for:
CVE-2016-7534, CVE-2016-7535, CVE-2016-7536, CVE-2016-7537, CVE-2016-7538, CVE-2017-5506, CVE-2017-5509, CVE-2017-5510, CVE-2017-5511, CVE-2007-1667

CPE is incorrect, the current version (7.1.1) is not affected.

Signed-off-by: Ninette Adhikari <ninette@thehoodiefirm.com>
---
 .../recipes-support/imagemagick/imagemagick_7.1.1.bb   | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb
index 61dc1b795..8dc3cb267 100644
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
2.44.0


