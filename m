Return-Path: <ninette@thehoodiefirm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC302C27C6E
	for <webhook@archiver.kernel.org>; Fri, 14 Jun 2024 12:13:49 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.web11.10080.1718367226369665137
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Jun 2024 05:13:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@thehoodiefirm-com.20230601.gappssmtp.com header.s=20230601 header.b=DM3sqf1u;
 spf=neutral (domain: thehoodiefirm.com, ip: 209.85.160.173, mailfrom: ninette@thehoodiefirm.com)
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-44056295c8cso10997911cf.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Jun 2024 05:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thehoodiefirm-com.20230601.gappssmtp.com; s=20230601; t=1718367225; x=1718972025; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=b/itwZMYxnMN8kspqLaIdH2gBfAu+EuYM+XFU83uJQs=;
        b=DM3sqf1u6sASIE7EJMKi8Mfi2X49SSGyj3o5WQd+dbYEoRgy3JUl8T1EJ81IPZerXW
         82GClAtUXQn+FkPItHiPcGfH4izfc+zK349yxj9s/aL++wFQb8puH3aRpe8AZPsGL1C8
         TRdxdE0nYmm9aLVrmH/lo2ylMCEvx/tNQLF7ZrncwcnZFVyJeaL3csT6gfakdsXhSU9h
         aRJllo/3t9Y4X2ye9aFc/iRIDLCqaoH20+3Nl2ov+tgniCeYcb6YVbkpc9UJJcR5or3p
         i1tBNVQklYGmwA49DM+RLMOZWeGow8MuMdWAKNBHXBtuCh3zF8gOcJOLrNe8bo3wZiWT
         V3eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718367225; x=1718972025;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b/itwZMYxnMN8kspqLaIdH2gBfAu+EuYM+XFU83uJQs=;
        b=OxlBpM5zko/vrNFT3k3hsneO1sT7azR+oJpm2E2Pw4pzLPY8qV9O1vrgQH8AV88MBc
         rFR7Lo68eJMZIN7lz1jnL2VA5nwE+fhfOcINrB7pVdS6dkdcI+OIEODsUCasLhUUPg9O
         CLvr4rjmwFqi7xkvhsJFlQ8lI6cI1AgLovlPHd1XUcdca9CEfcDaz6TT7kPL6AJYm7AI
         8bsxwrfm6/Q0SvZab6yt8wfxAz9m/mAW3VSxF/lQNC+t66TssdvVEffYDE/5duco+K45
         6OxK5y/Qp3IfPvWSfKWLGcqcSEzEkmweT7qEAHO7NtPgEclS0DvAZ6WRappTDC9kGya3
         86Rw==
X-Gm-Message-State: AOJu0YxGnnVUt8LkdXMfaTF4y6kRjL1U+phuL4ocb7p99t8XiAIxYuYS
	TCSuF+9HiZTB5zQKGdYXSpQ35Jrspyjplv5TKTByIoqa4TSSOzEiIQChkk6r3UyPRmoehyG86t5
	Gauh/Hg==
X-Google-Smtp-Source: AGHT+IE9aKxYstJryupUI7rUwdNQSN/8EDy9z+8F71C98t1si42rPeO8EaFJirAkSWf7+FglK4aZ6g==
X-Received: by 2002:ac8:7dd3:0:b0:440:5b49:2d63 with SMTP id d75a77b69052e-44216bc2565mr26044541cf.66.1718367225170;
        Fri, 14 Jun 2024 05:13:45 -0700 (PDT)
Received: from Ninettes-MBP.home ([174.89.68.185])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-441ef3d8fafsm15604071cf.8.2024.06.14.05.13.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 05:13:44 -0700 (PDT)
From: Ninette Adhikari <ninette@thehoodiefirm.com>
To: openembedded-devel@lists.openembedded.org
Cc: engineering@neighbourhood.ie,
	Ninette Adhikari <ninette@thehoodiefirm.com>
Subject: [PATCH 0/1] imagemagick: Update status for CVE
Date: Fri, 14 Jun 2024 08:13:30 -0400
Message-ID: <20240614121331.27514-1-ninette@thehoodiefirm.com>
X-Mailer: git-send-email 2.44.0
Reply-To: engineering@neighbourhood.ie
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Jun 2024 12:13:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110906

Update status for:
CVE-2014-9804, CVE-2014-9805, CVE-2014-9806, CVE-2014-9807, CVE-2014-9808, CVE-2014-9809, CVE-2014-9810, CVE-2014-9811, CVE-2014-9812, CVE-2014-9813, CVE-2014-9814, CVE-2014-9815, CVE-2014-9816, CVE-2014-9817, CVE-2014-9818, CVE-2014-9819, CVE-2014-9820, CVE-2014-9821, CVE-2016-7531

CPE is incorrect, the current version (7.1.1) is not affected.

Ninette Adhikari (1):
  imagemagick: Update status for CVE

 .../imagemagick/imagemagick_7.1.1.bb          | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

--
2.44.0


