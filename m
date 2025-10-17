Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09E1FCCD1A4
	for <webhook@archiver.kernel.org>; Fri, 17 Oct 2025 10:58:40 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web11.11763.1760694851875681308
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Oct 2025 02:54:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OZ14Vtkk;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: ghidoliemanuele@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-63994113841so3010326a12.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 17 Oct 2025 02:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760694850; x=1761299650; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XRUjkrQOzPQUu/+JuOOI5c7QWQyFUoRL3ceveOzLD7E=;
        b=OZ14VtkkDj2oHpUn0CLSJCCWMWQ/WiZb2v48IkaV5XCXuyapONGyX91v2ijZNeVdhn
         6XU7V3Jtqp4/53tsqM3gEQrfQzb+hb/PcxDa2J0JAb9K6T4XHfyUpzFsZxKPjn6LpqJY
         mu4V83J10CWvh8WKV2NvpLIvK6BWOq/zHKTDAEWFWMigD9jMk+v3dGFyTfRFg4o+32bm
         NTZamWXTdO3RSY2PrEP7kvAVAGU1yx119tF2v0hvUIylDjkmzrkrPV8F/wgAXdkOTZzs
         52iG5wZlB48IugPYjFSvDjdniZ1mM2J9Gh0xepIGx9FTPkUND0aN8wwVMFNxR8ttYngd
         XaaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760694850; x=1761299650;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XRUjkrQOzPQUu/+JuOOI5c7QWQyFUoRL3ceveOzLD7E=;
        b=R+LYX+98rMF5/aZY57FL3vbuZ9+l+44iuuWtZ5g7rCNWY8XjsEmdkBv01133qCc/VA
         aIIuoJeuunJGUlHWr7WI09SCDyJYXFYdOwKtTRzE+3G98FD9px82xR13YeaVsrxGkxj0
         hPEVguRUbZrHPX6GwkFLwUrJTfQK8/mEG0pF/6rBjcGjREB8j2PgpTAAruuxc0+An4Sv
         g+muzwF3NAP6ILdAdKSTs4PNBUrxtYgyvIw1gyrdpe0iqHhV+eGfXEXvoljtppPugzGe
         41OCkZc5gu3QbQulcCpYbLWFQpLqtrYtSMcZ8eEewH90qAeFkDvsxiahf3ys+F2QRfcH
         0rHw==
X-Gm-Message-State: AOJu0YwyiMpKYskDiI/7OjCP1iqjzUIVf4GDHz3SYMPiSIdrYtcivgRI
	aSttWJXxMKIg7WpPPvCladN6JnihxnR/qUIQBGwol9z9TCI0U4YkllePxm4T6lOO
X-Gm-Gg: ASbGnctSLz8On3UJmC6TioIzy/TbFHf6i/Mmtp8r/n2/2KtKkAVU0su8uZFQyXzAMeV
	7PYgMGKLmCQDVdHjEEukQbBGFs45rdbufeYPZa+nk39CbRxH8d3uAjV8rkgRcqyEAQ/b8iPJWlt
	PWhhcLnHtcWO4UII1zlXhzYhM0Tt29C74eq/2x0WRLvzXazsxJ+akPGYTSynrO7gHS8OR0FcuHn
	q2xlfSB9H/VlRSJSbhN2uKOZp5C8ioCib3jWvgbjBoI1Z4VgA0QkAM4JBArnwAO2oPmnSoVtGxP
	Aca42hXZSHFZFIHG5RVeX+rOOJXa0lZeYm1dMJPWMuiNFgZOMc4x5xwZfwLUU8Udh/ka5WsfntO
	nO/S0UB/arR0K+1+PY7a6zKWHNEG2AhN3EmAtCKW+Ccm0dWoVtb2ev63n85XK5YbjZ65TBBKSvn
	7vcnYFoN4fTrPfL5ixKUnQr+efrhpeHkg=
X-Google-Smtp-Source: AGHT+IFU4/OX72Wt1lN11sKZDyctvwkPX750Gvs7aGeRrISZXu9lNdTz9s4Tomn4U5LOL7QsANvV9Q==
X-Received: by 2002:a05:600c:4e93:b0:471:1435:b0ea with SMTP id 5b1f17b1804b1-471179121ffmr17976615e9.24.1760694413437;
        Fri, 17 Oct 2025 02:46:53 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:aac:705d:ae36:2eb:35ce:6a7b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4711442dbaesm75368995e9.8.2025.10.17.02.46.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 02:46:52 -0700 (PDT)
From: Emanuele Ghidoli <ghidoliemanuele@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
Subject: [meta-oe][master][PATCH 0/2] linux-serial-test: fix returned error code and potential hang in while loop
Date: Fri, 17 Oct 2025 11:46:31 +0200
Message-ID: <20251017094636.2976738-1-ghidoliemanuele@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Oct 2025 10:58:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120753

From: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>

This series includes two patches for linux-serial-test to fix two regressions
introduced after commit 392f0f0ea76d ("linux-serial-test: Bump SRCREV to allow CMake 4+ compatibility").

Emanuele

Emanuele Ghidoli (2):
  linux-serial-test: add patch to fix returned error code
  linux-serial-test: add patch to fix potential hang in while loop

 ...erial-test.c-fix-returned-error-code.patch | 62 +++++++++++++++++++
 ...t.c-fix-potential-hang-in-while-loop.patch | 60 ++++++++++++++++++
 .../linux-serial-test_git.bb                  |  5 +-
 3 files changed, 126 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-test/linux-serial-test/files/0001-linux-serial-test.c-fix-returned-error-code.patch
 create mode 100644 meta-oe/recipes-test/linux-serial-test/files/0002-linux-serial-test.c-fix-potential-hang-in-while-loop.patch

-- 
2.43.0


