Return-Path: <ninette@thehoodiefirm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87D18C41513
	for <webhook@archiver.kernel.org>; Wed, 26 Jun 2024 14:21:21 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.28145.1719411673214175998
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Jun 2024 07:21:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@thehoodiefirm-com.20230601.gappssmtp.com header.s=20230601 header.b=iZornzTt;
 spf=neutral (domain: thehoodiefirm.com, ip: 209.85.214.170, mailfrom: ninette@thehoodiefirm.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1f6fabe9da3so55187285ad.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 26 Jun 2024 07:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thehoodiefirm-com.20230601.gappssmtp.com; s=20230601; t=1719411673; x=1720016473; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+IR1xmnFUwpavuY06IvxVxXB/I5YO7F+WGdEvd9cHF0=;
        b=iZornzTtr682pqC1DEoO/Vnh9tFxmT1tydPcbxzwuNBv1YZlGqY+0YfWZRztB1cHf1
         cgEvTs9TuuUfiUSBAAGZLe/AH+xqHoXW43Ozt9FbrPjERfgBSOKZu0cQDXI0Tj5kiRMF
         zaikSDaXYcY6aHReSEcNBQRoJnp2+UGxN6fYt7S+Sd63chdzHRJwtHjKisSZ5Q727a+5
         pT/xJXsCASdr2h9nTZ7T62p8KHDbubnhYp96A6crBqGpj8k043RIFUJTSom2umcdDuAt
         NqfEZyVzu54F+SgBTFTBNFcgZtcCJ4fgnhYi342yV9LqaI9zwUsBS8XbJa2SHHKYnTXW
         +Kww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719411673; x=1720016473;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+IR1xmnFUwpavuY06IvxVxXB/I5YO7F+WGdEvd9cHF0=;
        b=MC4g/Squxn8pabDvaCQiXFei3c380tw8nZfVd5EJWwgys9JohVmtvd7TdkhH/gvTyP
         r6hC8moTvz1fIjXv42lvlLcFr5joKsYz3wc/39KqqNBP5KDESnrsmADC1CoxHyllbHXD
         XYzOJ9LLOadQfga0Sh2znQxYkctgNJVJLw6xWIRJT9Mr/8BCejwgHG/YEoXNohXJRH8v
         z5JTxBOBdyOpbOkHVsGXHR1AJFI7/RMvKpGCS8cl8OFnWRscpIuqVRcqPXpZ46BjLOv0
         pghR5upS2gIgZJPZUcVTXIs1CG3hijiwVqQKVEDUjdGdVl9ZkBdKYVnaA+7UvVZupf1d
         moLw==
X-Gm-Message-State: AOJu0YyX6OtslFBoKrUHk9BQMbrAPM5JZg/LVjZYsBnMwemnJU+A9nRw
	qNOST3Zb0jez8QG94j25yUsJq8NlRrr2i9fkPYfTqbPIY+VOHvXYdWjgGfbF8/DNwijFY+YxyPz
	f
X-Google-Smtp-Source: AGHT+IEnSQH7rbHYgGG3vBw0n86ABpYS0mQzSEOzbrMJ1/MQqrvNiF9YIiLMSqHtBR5KkfTcBAr23g==
X-Received: by 2002:a17:902:bb94:b0:1fa:4187:7399 with SMTP id d9443c01a7336-1fa418773femr66821315ad.43.1719411672608;
        Wed, 26 Jun 2024 07:21:12 -0700 (PDT)
Received: from localhost.localdomain ([50.54.151.77])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f9eb32463csm100706375ad.92.2024.06.26.07.21.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 07:21:12 -0700 (PDT)
From: Ninette Adhikari <ninette@thehoodiefirm.com>
To: openembedded-devel@lists.openembedded.org
Cc: engineering@neighbourhood.ie,
	Ninette Adhikari <ninette@thehoodiefirm.com>
Subject: [PATCH 0/1] mercurial: Update CVE status for CVE-2022-43410
Date: Wed, 26 Jun 2024 07:21:08 -0700
Message-ID: <20240626142109.61310-1-ninette@thehoodiefirm.com>
X-Mailer: git-send-email 2.44.0
Reply-To: engineering@neighbourhood.ie
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Jun 2024 14:21:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111097

The recipe used in the `meta-openembedded` is a different mercurial package compared to the one which has the CVE issue.
Package used in `meta-embedded`: https://www.mercurial-scm.org/
Package with CVE issue is a Jenkins plugin: https://plugins.jenkins.io/mercurial/
(This is reflected in the CPE)

Ninette Adhikari (1):
  mercurial: Update CVE status for CVE-2022-43410

 meta-oe/recipes-devtools/mercurial/mercurial_6.6.3.bb | 1 +
 1 file changed, 1 insertion(+)

--
2.44.0


