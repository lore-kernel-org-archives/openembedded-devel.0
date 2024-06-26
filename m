Return-Path: <ninette@thehoodiefirm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCF4CC27C4F
	for <webhook@archiver.kernel.org>; Wed, 26 Jun 2024 15:06:21 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web11.29431.1719414376132255655
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Jun 2024 08:06:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@thehoodiefirm-com.20230601.gappssmtp.com header.s=20230601 header.b=pU7HYwox;
 spf=neutral (domain: thehoodiefirm.com, ip: 209.85.210.179, mailfrom: ninette@thehoodiefirm.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-706aab1b7ffso479446b3a.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 26 Jun 2024 08:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thehoodiefirm-com.20230601.gappssmtp.com; s=20230601; t=1719414375; x=1720019175; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p/XQ0diYUIoqhyBss3P2pLH+a8VgVpH/7TRKqtuaIsU=;
        b=pU7HYwoxU/xdZN60pb15+mUz5fPJMxLNe0dbdLGQtKI+qBdnKb3Rq7hqflL9y/j2iZ
         37MQaNmJSLilgHCb1TTq1v4YN6W5ISXG7fqN2P4iBfh7F/NWQIFrfb1OMXVnkjoTfvRb
         ydj5o/vy86LlrC93ZuPZmg5n69kBC3yRyUnXhd3xLzsrip6h27HZMufTBxgPd12C78r2
         KOJT3kclFWmInYrpAF2QV1lhRPgTVjbQGzZHn3ji4ahUFVhMvwXiVA8apPrXgE2QbMeU
         MiNIg7/QWtBlX0a7iMZ/BwhSKxKINkC0E6El2NkbmXq4mc2ChMsvNWsK1UZzaLT5M0rW
         XlHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719414375; x=1720019175;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p/XQ0diYUIoqhyBss3P2pLH+a8VgVpH/7TRKqtuaIsU=;
        b=eAtvoybitQkRhZ2yrXWjLxi/tPJH6xABiTWBEG1us1s6vBaSBvRvbKZ1oPMsevstUP
         IBe3v3OzSg5kMbio2gTx07suuaKi8YLxEG52LTV9SZm5TXkCQUbvAZHlxdfWC9vjkkvy
         uY/9dWImsSG0RuyIE+F1uDvzEn8+noziXLdGP/G+nvGeJ4Eg8PYdKtWLzn2pV/53qkWr
         5L26eL4gJKx2v7feohzCYDrjDVdpnooABqKfSEozyfF/LW988AQQWNP5sb7XEz1zgqz8
         OJPeuHulkKVtFKdlzJw4xFLt+X+wlxocdsXDLyL36W1FIzWN0X6pp2ED5B6s0JA05UVf
         xxwQ==
X-Gm-Message-State: AOJu0Yx8bWBGirBjxNfGNE0bdJ1XWxhG7KJVOqfVitSkjkUDTQcHFANy
	cvwkJ2Hb88V1LDl/jBC698gJlHQCHWHgjZL+dwtdAl5px9XK9RzcLQAWKQYKbQ+PQAvRD0MjGz+
	v
X-Google-Smtp-Source: AGHT+IH3cK66S9H02KmYc8IdufOr9WlWo8EK0c2KHvBXJrqO8YIPSr1No6VqpJ3BDNVKrSYA4tNDNg==
X-Received: by 2002:aa7:9d92:0:b0:706:3514:2d6c with SMTP id d2e1a72fcca58-7067471c541mr10469320b3a.29.1719414375391;
        Wed, 26 Jun 2024 08:06:15 -0700 (PDT)
Received: from localhost.localdomain ([50.54.151.77])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7068e088e1esm5015143b3a.213.2024.06.26.08.06.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 08:06:15 -0700 (PDT)
From: Ninette Adhikari <ninette@thehoodiefirm.com>
To: openembedded-devel@lists.openembedded.org
Cc: engineering@neighbourhood.ie,
	Ninette Adhikari <ninette@thehoodiefirm.com>
Subject: [PATCH 0/1] apache2:apache2-native: CVE status update
Date: Wed, 26 Jun 2024 08:06:11 -0700
Message-ID: <20240626150612.29837-1-ninette@thehoodiefirm.com>
X-Mailer: git-send-email 2.44.0
Reply-To: engineering@neighbourhood.ie
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Jun 2024 15:06:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111107

Update status for:
CVE-2007-6421, CVE-2007-6422, CVE-2007-6423, CVE-2008-2168

CPE is incorrect, the current version (2.4.59) is not affected.

Ninette Adhikari (1):
  apache2:apache2-native: CVE status update

 meta-webserver/recipes-httpd/apache2/apache2_2.4.59.bb | 5 +++++
 1 file changed, 5 insertions(+)

--
2.44.0


