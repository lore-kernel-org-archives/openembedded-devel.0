Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4722D5B85D
	for <webhook@archiver.kernel.org>; Mon, 28 Oct 2024 22:15:16 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.web11.127.1730140091904648172
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Oct 2024 11:28:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PKxlCouF;
 spf=pass (domain: gmail.com, ip: 209.85.128.170, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-6ea07d119b7so10531007b3.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 28 Oct 2024 11:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730140091; x=1730744891; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yCPYUak2ZZLxtrjbftNLlxMv+HNEamP3RgKotzN+mec=;
        b=PKxlCouFO+oknAoFQ8M//b6DLPW73R6VaEPfvUzPDzZBA/ef4Hjr76IplC9Z7i5O/7
         G68Ri2+0VQ3pTOWxI+QevIfZsjaMP8VmWbwkB6EZw3r+553M2I53C3E/auDvz6JUSrsH
         xODs1NDryezhXK9IQ7XpTp5M3t+h9ZjwMixZZ1Y3AwLK9mgY/zE2xkYgkzjzkfJqiiW7
         +8nLX1sw6i3CoL2uOh8GpvwQoT6/n3Y2uAGS6csQL/qSirTTtYQRx0OZ45E6bDwTs1Om
         9hIOJQXQvulZtx/sn21DLIDQkQWQhjoChi80EnKkmI4UPxnTyyjgwARIBMBX93WD+ywG
         yXZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730140091; x=1730744891;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yCPYUak2ZZLxtrjbftNLlxMv+HNEamP3RgKotzN+mec=;
        b=R+whtkyAADZotU38kknmxqXCphtrKIYBel7OzvSBNRxji0QN7k2hWZcEbsdvpFZ0+N
         OL+2Lzh3Xh3QMjvW6vVd+aOvK6ZhnN/MIFfxLIRWDCoX6Dw/YgcGjaJDXCIF1iphjMzz
         AZwwD6IxdyNG0MkHOLhPFU/9z5NHPP5NC09ghqhQKkyn6zIW2xVnlQbzH3nW3DPc45mq
         zpV8H55OhlzPNn4h3LK271pBmO51j7G2OxgNTWl8vPUXw8Jokt+BxdZrX2x//mJ+zCQt
         nqIBqJQSohdtBg0D2slANneBKF7cO+ENAUvXYrSZkpVKkjknvex/sNl5Tc9kc6r1DyPt
         bdUg==
X-Gm-Message-State: AOJu0Ywf7KMz/wbMRjMqtI/IgMXA+OJKZXanym+5qS462okZCZzhPqvy
	lSf8V4FibxBtl3GsMjmV5CUqWDF1yT95Ni04/pNvgiel1dE94pYCkkyWBw==
X-Google-Smtp-Source: AGHT+IEwI9kKmoKor+5CROn/B67uJco+hpH/xvXN6xqOP+W8eWEyCb0HvB/7xe3ifBg/N3RdcRiz2g==
X-Received: by 2002:a05:690c:d8b:b0:6e9:ea86:9669 with SMTP id 00721157ae682-6e9ea8697f9mr61084067b3.11.1730140090500;
        Mon, 28 Oct 2024 11:28:10 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e9c6c770cfsm15493397b3.99.2024.10.28.11.28.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 11:28:10 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schonm@gmail.com
Subject: [meta-perl][PATCH 0/22] ${CPAN_MIRROR}
Date: Mon, 28 Oct 2024 14:20:16 -0400
Message-ID: <20241028182749.5058-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Oct 2024 22:15:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113268

In this purely mechanical patch set we bring more uniformity to
the recipes by replacing

http[s]://cpan.metacpan.org  ==> ${CPAN_MIRROR}

The definition for ${CPAN_MIRROR} is found in the global mirrors.bbclass file.

Thanks,
Jason Schonberg 

