Return-Path: <ninette@thehoodiefirm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1333DCD1299
	for <webhook@archiver.kernel.org>; Wed, 10 Apr 2024 14:14:30 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web11.850.1712758462473018479
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Apr 2024 07:14:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@thehoodiefirm-com.20230601.gappssmtp.com header.s=20230601 header.b=kguwFkX3;
 spf=neutral (domain: thehoodiefirm.com, ip: 209.85.218.42, mailfrom: ninette@thehoodiefirm.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a51beae2f13so490324566b.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Apr 2024 07:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thehoodiefirm-com.20230601.gappssmtp.com; s=20230601; t=1712758461; x=1713363261; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aW52EvKD3ubqwa1uq/t18Uvzu8TNgXLhVBBDsxzkXrU=;
        b=kguwFkX3GfmuL+86zmUCzoXK/qmSALufWNqRZ9Ul0M/mYyOkY121C6A2y61HFdm+nk
         5ejB1biADs0neitzaAsAF5QNDcPopDZVnfkBBy5lSoXL9ceLnoTn2GUD3ppwi+hfGM8J
         Nh15T+HiJOXm7Lwu0xhy1oBNUDlczhyd1WgnVYodk3sYCFZtt2Nk3WedLBQYtTQ8llBX
         +JSOXAlu6lV+kj8E5eHApOaVIiB8HKFJBbtwHeaNs58Ql2S4jLNeomqV6OzcDQXZ8Lbd
         hFI2c66oJhI7XZolg05EoB3TmJcRXRvujxilIemZeOoC4wkLWffmFbzFuTzs4+gCL5bi
         RhKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712758461; x=1713363261;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aW52EvKD3ubqwa1uq/t18Uvzu8TNgXLhVBBDsxzkXrU=;
        b=xU995awxydaxv9PGiV1+3Y+9zO/rA7S/YIt+1qxhTX9+ftchUmT1NcYP6OnJDWZXkK
         mlSguPDGNrQkTj5/nuGzq8kY+AM9vzxB0IUfJvbfnpcyGIvtc0CfNbBn2d8qZMlSbkPj
         IZ79fIczxAXzogx1uZHG7McX5OAnSBHKTBWmeI2HsXRWXAtjyuQ0eOcWGNJSzeYq4d5R
         /Qbomf+RXVCY/ACxqpW6L3IaV6Hl/R2ee1zea5JeUw8zNpYSUdIzPzbbC4FSNHMwwNri
         Pukqlnhff/HQmMzKLPOk2iUMpv2giEkseBzClHJEYn82AgfHh5IIZyBcoiD8YgeMQmz7
         5ayQ==
X-Gm-Message-State: AOJu0YzHTvtGVwn9hzapHcWBqb4XKE+5TuYfNRjKRyXV5NsxSBljrRuY
	61Z/iTnh5mwOgP2HeFYzkCKXGzB81hxRFfh1poEZFPEvTtwgGRqoC/3ZZ36Jp0NVdz3Ub9DnlEv
	O
X-Google-Smtp-Source: AGHT+IFA0CP2KsJTuQfGREGiTY4UenhaSCj1bT35w5IvgXF8gCnkiCO1dBjfOrzY7aVt/ugZ5KIEoA==
X-Received: by 2002:a17:906:6c9:b0:a51:cde9:d454 with SMTP id v9-20020a17090606c900b00a51cde9d454mr1446316ejb.59.1712758460934;
        Wed, 10 Apr 2024 07:14:20 -0700 (PDT)
Received: from localhost.localdomain ([62.72.77.226])
        by smtp.gmail.com with ESMTPSA id nb33-20020a1709071ca100b00a4628cacad4sm6965662ejc.195.2024.04.10.07.14.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 07:14:20 -0700 (PDT)
From: Ninette Adhikari <ninette@thehoodiefirm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ninette Adhikari <ninette@thehoodiefirm.com>
Subject: [PATCH 1/1] civetweb: Update CVE-2019-3821 status
Date: Wed, 10 Apr 2024 16:14:16 +0200
Message-ID: <20240410141416.44152-2-ninette@thehoodiefirm.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240410141416.44152-1-ninette@thehoodiefirm.com>
References: <20240410141416.44152-1-ninette@thehoodiefirm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Apr 2024 14:14:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109898

None of the affected versions is used by meta-openembedded.
Affected version: 1.12 and below
meta-openembedded version: 1.16
No action required. Remove this issue from the CVE list.

Signed-off-by: Ninette Adhikari <ninette@thehoodiefirm.com>
---
 meta-networking/recipes-connectivity/civetweb/civetweb_1.16.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-connectivity/civetweb/civetweb_1.16.bb b/meta-networking/recipes-connectivity/civetweb/civetweb_1.16.bb
index f5a699d5b..4bcac7e1d 100644
--- a/meta-networking/recipes-connectivity/civetweb/civetweb_1.16.bb
+++ b/meta-networking/recipes-connectivity/civetweb/civetweb_1.16.bb
@@ -10,6 +10,8 @@ SRC_URI = "git://github.com/civetweb/civetweb.git;branch=master;protocol=https \
            file://0001-Unittest-Link-librt-and-libm-using-l-option.patch \
            "
 
+CVE_STATUS[CVE-2019-3821] = "cpe-incorrect: None of the affected versions is used by meta-openembedded"
+
 S = "${WORKDIR}/git"
 
 # civetweb supports building with make or cmake (although cmake lacks few features)
-- 
2.44.0


