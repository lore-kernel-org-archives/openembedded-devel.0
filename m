Return-Path: <ninette@thehoodiefirm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF39DC4345F
	for <webhook@archiver.kernel.org>; Mon, 29 Apr 2024 15:04:58 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web10.23836.1714403095991111385
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Apr 2024 08:04:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@thehoodiefirm-com.20230601.gappssmtp.com header.s=20230601 header.b=uK01TERY;
 spf=neutral (domain: thehoodiefirm.com, ip: 209.85.208.54, mailfrom: ninette@thehoodiefirm.com)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-571ba432477so4795227a12.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 29 Apr 2024 08:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thehoodiefirm-com.20230601.gappssmtp.com; s=20230601; t=1714403094; x=1715007894; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=h0BxKH23kBsqVa3cOMTFYaAD1p2C6dYtln6zkaE0kB4=;
        b=uK01TERYqON68ZOslyjmHLhxgYUEXIiajyY/R7BRTPdl+0KUnY8xE1tIys1T8Whfan
         VLOT7zpXYyKm6dh5g0pIukF5EqdhinIqIcr8KMXPnGn7YctHbGjoOrqirWiFJiJb/ilY
         CQD2AzdcnEDYkbF/9jf6FAXf50Rfn530rQ/jLK0gWCeRuU2nWVt2+zloqtkq+GDO5AU9
         0LQ9VU24U5SAsAomAA9wpB8H83/gKhgrFGM3xhVEsOjaXX7eGh6e3bBxHYUwMvLQpwp+
         zny088dy1HNl735YVw45AU90g1etH6vvrC8nwAp+CF9/LQDeTMTAPnaELYYaK3Oce6QU
         thZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714403094; x=1715007894;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h0BxKH23kBsqVa3cOMTFYaAD1p2C6dYtln6zkaE0kB4=;
        b=FcxhYAJtuldEJ+UgtEPzOpYehhXWgBWB4AyTF6+x/mIU9esYnGMfbizLHgQDIwc4Ga
         VENzLt6+8a8XVL7rBwgDrwd6lOpHb0yJU5eqCzXYR63f2wfUV9gxCFXz65ZfjYwgHswB
         Nl8L/MypPbFRRXMQg1mPhYAOz3UWr1iFoqewpXvBWQHfUmFgl6F1EK2z2hX0Dtq5XgQQ
         8qN9/x/VQUkFtuokAoQXsXdNoJzs/h63nPndmGxlocrHzTP00r81P0ecaIwueRnwqIyu
         2lQ2eoABTtobBreqwUJUgnoTNH8/e3sklu7+oKU9EpiSLMqfN/7ocU10KKWKMX6dSF3a
         Va/Q==
X-Gm-Message-State: AOJu0YwHLFnrxB3SEg4tzHIv5a2lrCVGS5F5lX8eJfEZMCkjFgdswRnN
	AeHeVQtQNBso7A9S9SCtpyGvoV8BYMfNonzS9sgE6r1IUAaULmDKsIbBzwFfmcf3zuzbUUPMWSI
	YpOg=
X-Google-Smtp-Source: AGHT+IGKa9G+twhgamcws36cMmTOoeiRz/NRCeIfTm3woYDjqhGPviUucSdgy4Lm3epFHtTyk/XYzQ==
X-Received: by 2002:a17:907:7890:b0:a55:b345:63ec with SMTP id ku16-20020a170907789000b00a55b34563ecmr7084598ejc.15.1714403094157;
        Mon, 29 Apr 2024 08:04:54 -0700 (PDT)
Received: from Ninettes-MBP.fritz.box (pd9ebc533.dip0.t-ipconnect.de. [217.235.197.51])
        by smtp.gmail.com with ESMTPSA id gr13-20020a170906e2cd00b00a4e696e613esm8787552ejb.153.2024.04.29.08.04.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 08:04:54 -0700 (PDT)
From: Ninette Adhikari <ninette@thehoodiefirm.com>
To: openembedded-devel@lists.openembedded.org
Cc: engineering@neighbourhood.ie,
	Peter.Marko@siemens.com,
	Ninette Adhikari <ninette@thehoodiefirm.com>
Subject: [PATCH v2] mpd: Update status for CVE-2020-7465 and CVE-2020-7466
Date: Mon, 29 Apr 2024 17:04:50 +0200
Message-ID: <20240429150450.13931-1-ninette@thehoodiefirm.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <AS1PR10MB5697CBD433A5B23B6FA7F0F3FD1B2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <AS1PR10MB5697CBD433A5B23B6FA7F0F3FD1B2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Reply-To: engineering@neighbourhood.ie
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Apr 2024 15:04:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110187

The recipe used in the `meta-openembedded` is a different mpd package compared to the one which has the CVE issue.
Package used in `meta-embedded`: http://www.musicpd.org
Package with CVE issue: https://sourceforge.net/projects/mpd/
No action required.

Signed-off-by: Ninette Adhikari <ninette@thehoodiefirm.com>
---
 meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.14.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.14.bb b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.14.bb
index a762fc832..f30fffebe 100644
--- a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.14.bb
+++ b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.14.bb
@@ -100,3 +100,6 @@ USERADD_PARAM:${PN} = " \
     --home ${localstatedir}/lib/mpd \
     --groups audio \
     --user-group mpd"
+
+CVE_STATUS[CVE-2020-7465] = "cpe-incorrect: The recipe used in the meta-openembedded is a different mpd package compared to the one which has the CVE issue."
+CVE_STATUS[CVE-2020-7466] = "cpe-incorrect: The recipe used in the meta-openembedded is a different mpd package compared to the one which has the CVE issue."
-- 
2.44.0


