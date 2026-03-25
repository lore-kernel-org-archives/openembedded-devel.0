Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D724106B50D
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 12:21:01 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20822.1774441258557142954
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Mar 2026 05:20:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Zfeodd55;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4870206f73bso28686945e9.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Mar 2026 05:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774441257; x=1775046057; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q3iEOVIZDtNWxl4lc8IW1+lQJZ/rVUU2ntJKG4C812c=;
        b=Zfeodd55xLZF6JAOisWRXU0UB9I5/wJHqt1BToYZB4f6ZQ8IPm0EB9jiV12kNGfI3R
         +nnPaVWkZ96fqXzwNKBOfq0oofVJlZdPOjKUeJ6ufC3U3IqwbwlTCkIBBOBl2wmxQti6
         M11I9Bpidiv/xFQMZGGfDpAFMR5VmhHEyb8cjISznca38Jw+DDGcn4vRUBq1WhlB4GFN
         7gOxSWAMApZxO+QS+yRwTIMeNKdMu4vrJo6PaV6UYmAHP+p8hOKUVYNJxCN24QYFW/sj
         OihIryNrNbHZNCIcImAw4hfOcUozq+iSMMTuuWx8jL5FJbKPBCRG0iwB2Mz5IRZRQr0/
         FhsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774441257; x=1775046057;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q3iEOVIZDtNWxl4lc8IW1+lQJZ/rVUU2ntJKG4C812c=;
        b=UDMAoBLCP/ZWK8Wq5gVQrUhILSVZeEewzyaa/OMLK9LDCYrjj8hfvM63Fy0yINfprG
         opCygNnj10QnanzBy6HAqCEpnKlLwaRYQFm8LXe9i+UeZcBZL4DKDaTwfQZl9VmMOfht
         kTbGH+xdXQT9rOPnu8UfYoCPplDBOw0RjjHpirXKbThj7qSIF7gG/hJZVW99swxiuGy0
         WLsnDdBmYxyg4/83Kb3BVTK4YVcgFRJCtEXhRKmjIl1c6Y3PO/+wTCB6sCQ6DGr8q2L1
         3qPHaQF0d3hBlJtLbN5/6xdQnWwxxcW6uC3EafsmM/sCSKoBEPBkvrrsQQYvqmHnQDfB
         Ih4A==
X-Gm-Message-State: AOJu0Yzxh3fHmwVyastzfxcIrqulHqpqpJdR+tZcIZnwQJ05t7Ug3e46
	HwENyvhOKxAdSLbOehiajyiSd0mJit7w55I8ENNizcr35raeb8Y9VPE9CDTVmQ==
X-Gm-Gg: ATEYQzwyZ8JPmPS7M8eMslLEBL9aQRVyxefs9em9sm2MdmMxgG4xeVsdrsOvbxZLSuT
	T5DKu1np2xT5vZga0I5zdP4WiIks9NUl3cixqsrybCOSvYXnCmoLmtgJ1AtvPp6QTj7xTVpOP1P
	hLQ0AbzzT1ETRC60L/Nlp8a55CeZPsJENyfHEA8M7MN+og2qowBzW1pn9hQHv1kq1jUBKWRl6Z2
	7g/JTyZmIFuylP/9hl2lmi2NJ86K2lxC9PwHChwgKy6NM3ClfLJeyqVBiIGuCQaszAPuto5e4tO
	f0ULWvGffLsBySRgRl61SFUxvClrGSvHrq2WWk8cuOW699S/VJPJ5LSD812rjvBZ4VwK9SDqpjF
	Hhuid3343N/w5bFCRGsQT/aMkkbV54sS62MO6TY/ybBHg3jfeNL5Wi4ru+Ngbe8Lh0JA8VH1/td
	OeCJKe1uKVNDh5eg==
X-Received: by 2002:a05:600d:486:20b0:487:386:3714 with SMTP id 5b1f17b1804b1-48716043919mr36533825e9.17.1774441256537;
        Wed, 25 Mar 2026 05:20:56 -0700 (PDT)
Received: from term011.lan (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487165feea6sm40257885e9.2.2026.03.25.05.20.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 05:20:55 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [RFC][PATCH 00/15] Support Python freethreading
Date: Wed, 25 Mar 2026 13:19:26 +0100
Message-ID: <20260325122046.1211090-1-zboszor@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Mar 2026 12:21:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125607

This is the meta-openembedded counterpart of the series sent
to oe-core. All recipe changes were checked to build against
Python with freethreading enabled.

Best regard,
Zoltán Böszörményi

