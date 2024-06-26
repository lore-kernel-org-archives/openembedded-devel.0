Return-Path: <ninette@thehoodiefirm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73BB1C30658
	for <webhook@archiver.kernel.org>; Wed, 26 Jun 2024 13:56:11 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.27410.1719410167127286957
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Jun 2024 06:56:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@thehoodiefirm-com.20230601.gappssmtp.com header.s=20230601 header.b=K9QQhLEU;
 spf=neutral (domain: thehoodiefirm.com, ip: 209.85.214.171, mailfrom: ninette@thehoodiefirm.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1fa2ea1c443so30591875ad.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 26 Jun 2024 06:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thehoodiefirm-com.20230601.gappssmtp.com; s=20230601; t=1719410166; x=1720014966; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iU7jdSqF07rRMty8bBDq5o/muSKp6E+bpYZ7pzTeQaQ=;
        b=K9QQhLEUkoX9Z0VOcRYFiohWzgGiMhvOA1d6ROMDr9RmFGzn1hV2UtgXkAS7wN85YP
         NOuotDrS9S+kLlXO2P96NDuPDJWy7AfPwBjJwadK1736+LauHb7sRCnzhop/IaYjGzgc
         h1kRXmBiF923KRtxrzfoF8gzdyCzSi9ISTC9wl/HD47V8p28bZ3Er/4UbbwxdSTErJaL
         DDQ/Wy6vI+FVbQHGGvKIabhfNK+j3PBOMzm9xgnHUVx3GjUJd3jc+/+YU2pFdU7bkdX2
         8xAeokjJRzzCw+FVbWh3As+WzJp+6ocNFn8a/ej7ZxDJOL8R/ahyOUSRrYEbSw0pzH5y
         TfvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719410166; x=1720014966;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iU7jdSqF07rRMty8bBDq5o/muSKp6E+bpYZ7pzTeQaQ=;
        b=Bxq/TuHajkxwP8FbOU79V799w0kFUtGzXljea2O8os3uTUl4JjNCUvSrl71G61CXbY
         AMkIBl7yLmuA7livcUApRoPZjAVZKYX1WleEW5eSz/tNnftv8szgwP6OGDRqagVpp1oj
         E+JbfBAkdp7xYtoZjCd9efdO5ZZjaiIK6VaJbZ9Vu25tZacV8S9vOR3MrMa2WOOrLVWn
         pqlXMG/uLe/Wwnn1cfea7GTBkvPlPb2lrOPnhEbq+wvPlB6u6YA1zvaPuOkkXOuWgci1
         uTr+D6nNyrm+5nNqptEJxHlmIaWtwU7rdi79iFYEyd1/3mqNpIEMo6AnuZioQT5FiKzT
         UHKw==
X-Gm-Message-State: AOJu0YxM/Pf0aAm6ROMgTUa8NJGju4i7EQgOadUfJUXk7rgz5lU/G+Hk
	akOfUMWtQASAeheHNnB3cO0hyxUWtMFo1PxQD+Em4msljGpX8A+8iNNsjGGk1UAb6Zint5QlbzW
	s
X-Google-Smtp-Source: AGHT+IGRF1uVJEjByOL62fVhn/HIdXT67Rr9Jpr+2DjjdizSLXAAxWAu1SNpBhnI54FVsq8lJsZDLw==
X-Received: by 2002:a17:903:22cd:b0:1f9:9e94:e3ac with SMTP id d9443c01a7336-1fa239e7f68mr136295125ad.16.1719410166165;
        Wed, 26 Jun 2024 06:56:06 -0700 (PDT)
Received: from localhost.localdomain ([50.54.151.77])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fa809dcbfbsm21291625ad.65.2024.06.26.06.56.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 06:56:05 -0700 (PDT)
From: Ninette Adhikari <ninette@thehoodiefirm.com>
To: openembedded-devel@lists.openembedded.org
Cc: engineering@neighbourhood.ie,
	Ninette Adhikari <ninette@thehoodiefirm.com>
Subject: [PATCH 0/1] imagemagick: Update status for CVE
Date: Wed, 26 Jun 2024 06:56:01 -0700
Message-ID: <20240626135602.23435-1-ninette@thehoodiefirm.com>
X-Mailer: git-send-email 2.44.0
Reply-To: engineering@neighbourhood.ie
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Jun 2024 13:56:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111093

Update status for:
CVE-2016-7534, CVE-2016-7535, CVE-2016-7536, CVE-2016-7537, CVE-2016-7538, CVE-2017-5506, CVE-2017-5509, CVE-2017-5510, CVE-2017-5511, CVE-2007-1667

CPE is incorrect, the current version (7.1.1) is not affected.

Ninette Adhikari (1):
  imagemagick: Update status for CVE

 .../recipes-support/imagemagick/imagemagick_7.1.1.bb   | 10 ++++++++++
 1 file changed, 10 insertions(+)

--
2.44.0


