Return-Path: <dse@thaumatec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13CF8CD13DA
	for <webhook@archiver.kernel.org>; Mon, 18 Sep 2023 11:03:44 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web10.48404.1695035021157065084
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Sep 2023 04:03:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@thaumatec-com.20230601.gappssmtp.com header.s=20230601 header.b=iiYLmBNC;
 spf=pass (domain: thaumatec.com, ip: 209.85.167.54, mailfrom: dse@thaumatec.com)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-500bbe3ef0eso5149757e87.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 Sep 2023 04:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thaumatec-com.20230601.gappssmtp.com; s=20230601; t=1695035019; x=1695639819; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CR4wR/PYm6U6ihQYvMYyR2X0T0K6EOKOivJ9uI7wZR0=;
        b=iiYLmBNCj03Eyg51/xGbHaVshr1opLZjdBJyOXTRAFVURKla8D8VC/7zpJ9bXupnwk
         9MYZhv9AUcJRKAOFf2eyA/teycM/z8JBDqJUIasQDhP83KhrrCVFY1JDSLtQYwxi+k5o
         x5psd1qdALpory+E+E79FU20TraBpapZs93nuw4QJwKwwS0GnLdrNki4ZvWYuhg3eKUc
         7Zl1QbSjmZkU93uLDl05xl926SDDMRWFzK92VliTbUyFnXNB4trE1CEpPnSBXkyJgV2l
         qc/T4T0L1rTD2jKR5OIsyFu0gaRjbA2EDxGRrMY5C72S/ka3ZCbpKxhQt5SPufwxehmu
         9glQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695035019; x=1695639819;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CR4wR/PYm6U6ihQYvMYyR2X0T0K6EOKOivJ9uI7wZR0=;
        b=XzCJCkZyIML+6OcfyAlqLM6nARfjIcoziPTl9DhXW/Nm7YmfBL7A88P57JPFU2v9//
         ZhWihcRLM7PFHHTEto0UIw4P3eDHtsoJKNX5KpkJ3bw1ExYfu53Gj+lJTA3VNfBDPz4B
         HKZ7v7WfC0C9cfTj4jCij0zZsyH1tsPKjdgOQaHVCZJxAxM8z2r2jkHUXna1STVutiXH
         FvKiT6O9/l1ruVC4hSgTypqyo7uG1NSmbhO/gpSDccKLAYpW7TShDN0AP4iRo0WZcsvQ
         x0/C/u4A8IglaIk0Wg+NYXbtIOPBBrt9up1oT/V4CSGSBJJfwN2pnK4CnYr+xuewPh9s
         aVag==
X-Gm-Message-State: AOJu0YxduA9I+EFJ3ihPxHlE4dGG/b4Up0YdaswMZWQl4eISdg97SVVs
	6MBkpgjaRSboNc5iZa5q+s/6kOYaCZxN7mZ71X+OHg==
X-Google-Smtp-Source: AGHT+IFJZmCaFvH8TS+oJTJskpbFXqp/A7OwwoGCnc7lBSN2a3nbUHfA77vjjGlLV+L3fZtWLyOq8g==
X-Received: by 2002:a05:6512:3e29:b0:4f8:586a:d6ca with SMTP id i41-20020a0565123e2900b004f8586ad6camr4936593lfv.9.1695035019374;
        Mon, 18 Sep 2023 04:03:39 -0700 (PDT)
Received: from localhost.localdomain ([91.90.172.13])
        by smtp.gmail.com with ESMTPSA id p5-20020a056512328500b004fe0fead9e2sm1040226lfe.165.2023.09.18.04.03.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Sep 2023 04:03:38 -0700 (PDT)
From: Daniel Semkowicz <dse@thaumatec.com>
To: openembedded-devel@lists.openembedded.org
Cc: Daniel Semkowicz <dse@thaumatec.com>
Subject: [meta-webserver][PATCH v1 0/2] cockpit: Separate packagekit and apps packages
Date: Mon, 18 Sep 2023 13:03:00 +0200
Message-ID: <20230918110305.38374-1-dse@thaumatec.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Sep 2023 11:03:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104924

"Packagekit" and "apps" Cockpit modules were included in the main ${PN}
package. Move them to a separate packages like all other existing Cockpit
modules. This allows to choose which modules are installed in the system.

Daniel Semkowicz (2):
  cockpit: Move packagekit to a separate package
  cockpit: Move apps to a separate package

 meta-webserver/recipes-webadmin/cockpit/cockpit_298.bb | 5 +++++
 1 file changed, 5 insertions(+)

-- 
2.41.0


