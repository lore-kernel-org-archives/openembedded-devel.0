Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F2B1C4332F
	for <webhook@archiver.kernel.org>; Sun, 12 Nov 2023 20:17:54 +0000 (UTC)
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
 by mx.groups.io with SMTP id smtpd.web10.22513.1699820271686615638
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Nov 2023 12:17:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mMFv9/sd;
 spf=pass (domain: gmail.com, ip: 209.85.167.171, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-3b6cb515917so1868368b6e.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 12 Nov 2023 12:17:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699820271; x=1700425071; darn=lists.openembedded.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xvFqZ/N83grGycEbOxUN2X9vUBoqQCQqaU8UEAbVhas=;
        b=mMFv9/sdSZ7Ru3Bt9WlMr1y8fbyXyt8fKczY4xUmqP0MNOW/efZZx5mlAuD5wfF0vf
         3HeZNHmaZmZXtYsOv0+SsfF9LsayyXiuRcDF9w4OXcBMa41xi+54u9xsVf+zdsBqVS6p
         qKKmk0oqnCm0Ph3Sk3OKvhRJR5qZDQvwbvb3aiKjyFMlHg+jHN+8m7J4DVr6dsD0w1oC
         7BbDLGAi4DW7k41On/pzQ3crrEYYpTsrIABSxoG9LCe5/O4GRRPMai8ICq2j2JlJ1qdD
         N3hBNfVsmp2F6X+wT3p6PfmZONVR1PxBNMNP+EISl7dAYEP6fMGOqPMWYBmcuQxOOi64
         CnBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699820271; x=1700425071;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xvFqZ/N83grGycEbOxUN2X9vUBoqQCQqaU8UEAbVhas=;
        b=haD30jj6Y1GcsBlYbY7gBGn9f1bXPJh3/WACRsvBtXmZ8tjJtktWEs3dY9kfdlJt19
         FLm0d5om/xmDAa8jljS4MxptzZV1PMweXMdijZ8kVMxCC/++xaHo+ezXlleaLBtwJa2g
         278vzxTPwuLJQ8JG5uRtjTzJG9jRzw4qBGkLsuTwQxMEB/+nr9vt65x7fE/U1mpmI/0/
         FwH6/FoAQc6YU+HPdR/1+lR/ed0Kkc8+QmzO/WKMjKGlayvoaFL3ooIvI497cilHb0Cs
         6sfgIc73lrLEbNmTDpqTGMXL8f2qev4OZVFzgeiL6c4Pvh0PxJN+dJ5h2T3eOGR7ouDN
         JywA==
X-Gm-Message-State: AOJu0YzsvdiwR8zNB6lEM8TlNP8U9Skx75kKQhZYSaADviI1Y72L72T5
	Ge4tTSJ134+v2Nxc0YG7Cj0=
X-Google-Smtp-Source: AGHT+IG0VnboeVJDqNA1u98GnF1UvcRp5Z0R6v/mwJtruQX2NwRPpmCKCjqBnux5jNytxnuTI6uZ6A==
X-Received: by 2002:aca:1a14:0:b0:3b6:cfe1:50f9 with SMTP id a20-20020aca1a14000000b003b6cfe150f9mr6031129oia.56.1699820270752;
        Sun, 12 Nov 2023 12:17:50 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::62f8])
        by smtp.gmail.com with ESMTPSA id u8-20020a63df08000000b005ac384b71cbsm2954892pgg.60.2023.11.12.12.17.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Nov 2023 12:17:50 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2 0/5] Adjust for switching default build system for
 gnomebase
Date: Sun, 12 Nov 2023 12:17:47 -0800
Message-Id: <20231112-kraj-pu-v2-0-f38d4f960d44@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOsyUWUC/2XMSw6CMBSF4a2QO7amj0iLI/ZhGLR4gatCSauNh
 nTvVqYO/5OTb4OIgTDCudogYKJIfikhDxX0k11GZHQtDZJLJYSQ7B7sja0vplxjnZbGcaOhvNe
 AA7136dKVnig+ffjscBK/9d9IgnFWN2iNqvVpUNiOs6XHsfczdDnnL37wVPqeAAAA
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>, 
 Otavio Salvador <otavio@ossystems.com.br>
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 12 Nov 2023 20:17:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106604

Its changing from autools -> meson in gnomebase class in core, however
not all recipes can/have migrated to meson therefore demand autotools
explicitly when needed

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
Changes in v2:
- toscoterm: Delete recipe.
- Link to v1: https://lore.kernel.org/r/20231112-kraj-pu-v1-0-69ea83675f3e@gmail.com

---
Khem Raj (5):
      meta-networking: Use autotools make system
      meta-oe: Use autotools make system
      toscoterm: Skip recipe, slated for removal
      loudmouth: Upgrade to 1.5.4
      toscoterm: Delete recipe

 .../networkmanager-fortisslvpn_1.4.0.bb            |  1 +
 .../networkmanager-openconnect_1.2.8.bb            |  1 +
 .../networkmanager-openvpn_1.10.2.bb               |  1 +
 .../04-use-pkg-config-for-gnutls.patch             | 25 -------------------
 .../loudmouth/loudmouth-1.4.3/glib-2.32.patch      | 12 ---------
 .../loudmouth/loudmouth_1.4.3.bb                   | 21 ----------------
 .../loudmouth/loudmouth_1.5.4.bb                   | 16 ++++++++++++
 .../packagegroups/packagegroup-meta-oe.bb          |  1 -
 meta-oe/recipes-devtools/glade/glade_3.22.2.bb     |  2 +-
 meta-oe/recipes-gnome/gtk+/gtkmm_2.24.5.bb         |  1 +
 meta-oe/recipes-support/toscoterm/toscoterm_git.bb | 29 ----------------------
 11 files changed, 21 insertions(+), 89 deletions(-)
---
base-commit: 6f26ff340bc9d07e7bdf6f4f75b2c81935230069
change-id: 20231112-kraj-pu-3b9ab728b087

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


