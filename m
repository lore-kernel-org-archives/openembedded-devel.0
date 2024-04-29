Return-Path: <ninette@thehoodiefirm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D10B5C4345F
	for <webhook@archiver.kernel.org>; Mon, 29 Apr 2024 11:05:07 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web11.17913.1714388706384590527
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Apr 2024 04:05:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@thehoodiefirm-com.20230601.gappssmtp.com header.s=20230601 header.b=T5txLZSE;
 spf=neutral (domain: thehoodiefirm.com, ip: 209.85.218.50, mailfrom: ninette@thehoodiefirm.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a55911bff66so525998266b.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 29 Apr 2024 04:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thehoodiefirm-com.20230601.gappssmtp.com; s=20230601; t=1714388705; x=1714993505; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=M+zn/hpzyP2tIgO4lQFr42AbJD3iikl0zeoYYfdVbME=;
        b=T5txLZSEAvO4QOz4jU15oqHhhATAEpEUZS1ZoAdKWu8JHIgyAWuGAjF/Z05KExVZon
         SJosFoceIVb9co6u705+ZbPPLiwkSF/0M9oWAyLRGjjDxbKqb0qeRb+VBaPQUxS+RXNW
         cZlVRd2Z7XqoNXI+Xb2OiwCitLG0z88pHP3Kzo7js+Hotj/2E7tCTqk8+1uEZ+HkuiCI
         0yTBgQpvCDqPDqiPdJ38EQ6HCvmmZg4F8J7BsK67MwsMj5qMMDT5bRZR0U7jQUUwndpo
         lpX3mO2Bhm0vGk4bZrCOWMrAQkbAPPEtOe0GVr7S36Wn0X4iKZrefliUnD4Phfdt4C3R
         PzXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714388705; x=1714993505;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M+zn/hpzyP2tIgO4lQFr42AbJD3iikl0zeoYYfdVbME=;
        b=w6YI23/oArTS+TdMTAE84u23RF07k/dF+YVd2wFI7N7zfq8ROgjLHpcIvfd+yPnlij
         4gLD7PrtpyJs6hA5AOIuUXWNwbCrpBiUL2tzqvBmQlQ0tPwDijEFZX84cgAtR5yIjPjS
         abB/JUBaZNRKKQNF3YjiRMHtjbG2uD9p5iLghoxcCGEl3N3RI0UQqOikieTHQGJcMzn+
         5iQewcnMFBRnewN5xXsJUH4zeiS6Gq9Q59Uf4wJKI9IOPMWR99cMkil2xVpxqS9vRDMm
         aMRO6gKf4FNJZ5bAOagVGektmWCB5OLpakNsZZd8oiOW7VmSsj90pRlVuChc2czPZLQK
         J4Iw==
X-Gm-Message-State: AOJu0YzcSE3pV3LNduFPw0DhN2FE2qNolkQq7xMGQCVRgDHel6yiWGvR
	X+mdalk3lyylpBqGGwIWR2xF+67NYAhLibjoz0SXTWWS8gWZD0f22y0rOmVPDYEO38unY66099b
	p+9I=
X-Google-Smtp-Source: AGHT+IEhj6BSbUc4juoYT6Vklueqg/4lCS0M/M/DX7e+IgLtnmZmy9ngZ26AkXKTkSPMxusMB6oIHA==
X-Received: by 2002:a17:906:e21a:b0:a55:b27c:1299 with SMTP id gf26-20020a170906e21a00b00a55b27c1299mr4926234ejb.70.1714388704786;
        Mon, 29 Apr 2024 04:05:04 -0700 (PDT)
Received: from Ninettes-MBP.fritz.box (pd9ebc533.dip0.t-ipconnect.de. [217.235.197.51])
        by smtp.gmail.com with ESMTPSA id j25-20020a170906279900b00a58e170f175sm2983452ejc.63.2024.04.29.04.05.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 04:05:04 -0700 (PDT)
From: Ninette Adhikari <ninette@thehoodiefirm.com>
To: openembedded-devel@lists.openembedded.org
Cc: engineering@neighbourhood.ie,
	Ninette Adhikari <ninette@thehoodiefirm.com>
Subject: [PATCH 0/1] procmail: Update status for CVE-1999-0475
Date: Mon, 29 Apr 2024 13:04:58 +0200
Message-ID: <20240429110459.52299-1-ninette@thehoodiefirm.com>
X-Mailer: git-send-email 2.44.0
Reply-To: engineering@neighbourhood.ie
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Apr 2024 11:05:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110170

Current version 3.22 is not affected by the issue.
Affected versions: Up to (excl.) 3.2.1

Ninette Adhikari (1):
  procmail: Update status for CVE-1999-0475

 meta-oe/recipes-support/procmail/procmail_3.22.bb | 2 ++
 1 file changed, 2 insertions(+)

-- 
2.44.0


