Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B59FC47074
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 07:37:08 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web11.8235.1700033823954431970
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Nov 2023 23:37:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bJo8w8Oa;
 spf=pass (domain: gmail.com, ip: 209.85.215.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-5aa481d53e5so4494978a12.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Nov 2023 23:37:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700033823; x=1700638623; darn=lists.openembedded.org;
        h=to:content-transfer-encoding:mime-version:message-id:date:subject
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=A11w3AGo7zgWVq7Ag5jZghYoBoNNPdfTFe5k5xKcRMQ=;
        b=bJo8w8OayY7uTwXt7aDtH0KOJ45cZeMt2IigLd9DoKsNVsM0KtTqgO2I/tKQ3k/rbq
         CzI3KdRi112OPd65E7dTRCJYqGkCSNoy8SgxDTkzUY0XEdz4hk/RDD0PNshAu7A35r0x
         0Yjdq/CsQ9VXhBfGC8/xcrT5k2cg4loJMFwfh/PFhclBoXGz2tTuxH/xdbRxwqF52gBw
         I5jpsT9ky73vcEFMVg5P1iyfdle17hj/902xXDbKc8g4TmoyIG1x0AXpYF8ro2KiD8WZ
         Rh0hokYKOXOEa+et14ABmH7OFDXRq7WSCTuorrGzkEQWKI5VOOqWU/hzPYE8uR80+kee
         eNYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700033823; x=1700638623;
        h=to:content-transfer-encoding:mime-version:message-id:date:subject
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A11w3AGo7zgWVq7Ag5jZghYoBoNNPdfTFe5k5xKcRMQ=;
        b=CJytYhk3rT7NsfrCWmVFRKWveUlvEcfcvqgvNLrYRXk6Dzu65/eRCkWTGd7LmnW0cL
         uJA6yUxGdGTeQMvbzqj9pQmKaS9p+jF5pSk24owSG4bL52CKv5k+UdMPK4fGdaNVbRgi
         QIJcVhTfq9rmriHk3MXMYzczp8CP9A642WZigZEzZKwLX1fOAy7EwDKwp5aTIRChT6Zz
         esPzpPNOBXFUsYpHyjEhcbQ7QX5Y4WLsW40WkGdLa5atuQWF9vAcWMIcMymS6n4e1RtJ
         fY/YZlgk043gW8q8tL6l7X5KgHV9oqC1ArhApQg1GOHbtbWchhm+U4AyyK63slO4RfoS
         FlZQ==
X-Gm-Message-State: AOJu0YyO+pqLk27y8+6Wu1RQFXbntlTeD0KHjsFrh0SJHN3gJEjMohBv
	hRpKQdeHrKdEquHOmDGlvih0aR3F5uZpXA==
X-Google-Smtp-Source: AGHT+IGKi73i9HnNxReizhXpE1YHSBNBF1dUhV6dIHSQP6+eB+HHppL+UNWAjLqPXYP5z3wKGcqcmw==
X-Received: by 2002:a17:90b:1bc2:b0:281:5550:ce3d with SMTP id oa2-20020a17090b1bc200b002815550ce3dmr10271434pjb.31.1700033822630;
        Tue, 14 Nov 2023 23:37:02 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::62f8])
        by smtp.gmail.com with ESMTPSA id l23-20020a17090a599700b00274922d4b38sm6312074pji.27.2023.11.14.23.37.02
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 23:37:02 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 0/3] Delete vte9 recipe
Date: Tue, 14 Nov 2023 23:36:51 -0800
Message-Id: <20231114-remove-vte9-v1-0-720f287a1da3@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABN1VGUC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI2NDQ0MT3aLU3PyyVN2yklRLXaNUs7TklJQ0A0uTFCWgjoKi1LTMCrBp0bG
 1tQCHMGYzXQAAAA==
To: openembedded-devel@lists.openembedded.org
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Nov 2023 07:37:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106745

Use gnomebase in libxml++5 recipe

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
Khem Raj (3):
      gnome-console,gnome-terminal: Depend on vte from core layer
      vte9: Drop recipe
      libxml++-5.0: Make use of gnomebase bbclass

 .../gnome-console/gnome-console_45.0.bb            |   2 +-
 .../gnome-terminal/gnome-terminal_3.50.1.bb        |   2 +-
 meta-oe/recipes-core/libxml/libxml++-5.0_5.0.1.bb  |  13 +-
 .../packagegroups/packagegroup-meta-oe.bb          |   1 -
 .../recipes-gnome/vte9/vte9/cve-2012-2738.patch    | 136 ---------------------
 .../vte9/vte9/obsolete_automake_macros.patch       |  14 ---
 meta-oe/recipes-gnome/vte9/vte9_0.74.1.bb          |  30 -----
 7 files changed, 8 insertions(+), 190 deletions(-)
---
base-commit: 5f344ed2dd36f43b8d7fa59b774f29b08313e7f4
change-id: 20231114-remove-vte9-2e6fcddf094d

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


