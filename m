Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCB0FCA1007
	for <webhook@archiver.kernel.org>; Mon,  1 Sep 2025 17:22:51 +0000 (UTC)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
 by mx.groups.io with SMTP id smtpd.web11.54093.1756739375259113680
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Sep 2025 08:09:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bxf0TcRD;
 spf=pass (domain: gmail.com, ip: 209.85.210.52, mailfrom: logan.grosz@gmail.com)
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-74382048b8cso2776327a34.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 01 Sep 2025 08:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756739374; x=1757344174; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=bNGpAUhKOLrJowVKhm9b92K1rJMbjJ5Y1g/W2ma9oCA=;
        b=bxf0TcRDWVyZYFNrV0zhPFhb8OY8CunuqynL1MDtwA2okAkcF6WRrvgppzRxcLHwuM
         aJaj9/L4ZXJkElltmfItVKOGauu4mvLwZC8HROMasEjRtUJ3gYwZFS2c8vaA2vlkIUMU
         r+eW1kkj97IdJhDbc82SKurMY46iXXN2IbOBuEe+rxwRPAAhpsfbLUMnRgz8xZESNZCN
         AXrMtEQFdBpV/dKZQ+U8pO2Cz397wELEABL/PVy9rjc5lVSeitHIgdPZhVV5aQEohQz0
         x/2o+vmd6z5eCRr5FtGarFOQ7sKF82jsn+qo97Ozg+/N7kk7ywcAMfDBJPPJZ20A0vQp
         f1Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756739374; x=1757344174;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bNGpAUhKOLrJowVKhm9b92K1rJMbjJ5Y1g/W2ma9oCA=;
        b=qDfiEA0Po2xS4xWe7zLyPpVBUiP8C8QrXlbadFA4PV/NGOE8HsWldPJuNcXayGGvi3
         Ri3LELF1FwEda2wtgwUeJipT/ghmwpLqHhzMsDN4FuxaNa+b8sev8SVcJ2egcSlQXA4B
         ETwtIqB60Oa8UD/yftYXCneBCWdQCHlGQyykMI87aTcNMbgehuYfko/46LiRyMMDTtpB
         SVdabVnbB5QQeq0ojnM7RccQ1+AkH3K/E8cgf1lfCnfcxuK2D94FnqxWHCFAbWxw+7H9
         tPcjI5Kr6/DFiMknJW+GVdFC5AU8bQVggXn8sW1S2DBj8Qw7ezhTZAmqXdlzfxcrjmKg
         K/3A==
X-Gm-Message-State: AOJu0YyEuBQBeIqBR8bHBwfHpW916J3tCnPRG8kJKUL0Pe/mrYHtFJw+
	7cPjHo3PozjRfIvpcr97yEbnEJ7saChIBAYRD/ybdmgGgLRPwt0z41gXh/8d2Q==
X-Gm-Gg: ASbGnctdtoy7ziEG54XtCQLw6qpfXomjzEyNcPRBjidFX/yQcp+lQgRRlbcTH+RqryE
	eM++hHks2JJ8HicFggmjbqF+z4c6rjG19eV23oJUJ2/ok1eBaLpD/MJGmLAE3JNYOG0F8vc9h4Q
	S7wHH8TQSMJa68c1MJ448beoU2sZxML+hIH/U4WAL6bmS49K7X7Bq4ZSu25Rdvd8x48h+qRuwp2
	CAOnerwbuRhWYCDnYPWtYv4/He8V3NKn0cNKKsuyQzlsA58q0zIHG29tnm/Kqx5rmds4fTw5PfR
	xC+Ihkeljy4VxVlRCu/jQctt/MjzdGoERxngu+ruQoGxjOgUdfnmGxImkDE2otk1e6rhO78KXDj
	qEHWDfKkAO5Vx4//qwI2t8t4bHbZChUygj/7qtSHAClYIP2Ip1S8ylah1S6o=
X-Google-Smtp-Source: AGHT+IGpsdpim0gyAq5WDCUBmXxf6T67/u0/QgvTNqrHlrLA6K+PZjIpyZRkX/kMI2XxChsXeIMhCQ==
X-Received: by 2002:a05:6830:6a15:b0:745:434d:6283 with SMTP id 46e09a7af769-74569d94ccdmr5903370a34.3.1756739373902;
        Mon, 01 Sep 2025 08:09:33 -0700 (PDT)
Received: from localhost.localdomain ([209.159.212.33])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-745742a4faasm1068477a34.10.2025.09.01.08.09.32
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 01 Sep 2025 08:09:32 -0700 (PDT)
From: "Logan Grosz" <logan.grosz@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [kirkstone] [PATCH] packagegroup-meta-filesystems: fix build issue
Date: Mon,  1 Sep 2025 09:07:21 -0600
Message-ID: <20250901150805.97615-1-logan.grosz@gmail.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Sep 2025 17:22:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119159

I think this is needed for Kirkstone as there is no workaround.
`PACKAGE_ARCH` must be set _before_ inheriting `packagegroup.bbclass`,
otherwise there will still be the mentioned build issue.


