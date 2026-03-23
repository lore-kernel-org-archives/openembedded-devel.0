Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08090D58CDA
	for <webhook@archiver.kernel.org>; Mon, 23 Mar 2026 05:35:22 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11142.1774244112133224548
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Mar 2026 22:35:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Jwtkv3Z2;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4852afd42ceso30052165e9.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 22 Mar 2026 22:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774244110; x=1774848910; darn=lists.openembedded.org;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TlXaP+IFmmVfoKzzKCCSDSX+UdWxoAiPPWpEI6W5CbQ=;
        b=Jwtkv3Z2u3fqiqj+p7YL1z7USs/wGVGuqebSp+7Hv/6qW5nBWJKqPUn0esIXp7bzI6
         cSrL7n5pq+LHUZEGvrZAK49heIQxmXiQ7qlBeuptfZ0ShIs/jnOrqltyrN+OMhZYHv1L
         +5Nq2gUOsir5IdZnuMBTeiKsnddRgn0LMX0PnH8k/kk71LWLCboR4Cy25OanUZ5t+T9p
         GwhaYRRgEbLKMG2JgjApvUoVftiuhtZbOCtEa5SDQ9SJS+iD+Scsz+RmKyUOU3blhTT/
         lhyjDpSPwn08AOCKl0Re8QXv6Fo5DNiYvbxd+dUZYSKTnBwTohvmmZ59pWReWtfYm/8j
         nXHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774244110; x=1774848910;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TlXaP+IFmmVfoKzzKCCSDSX+UdWxoAiPPWpEI6W5CbQ=;
        b=kKkhNBnV1iqGohWAmujVNkeuW2aa6ZHI0elNW2wHMySvgIgwM9xSsoaXRxab5eVIgM
         TxyqwrSiciMT1ltOEXHadTJyT3VfozEBCH6638zmnmzM9eDLrzgGfFeDgQWpDRuUEGoB
         eEygECuIVwh42VcIB/Jds6i+x82HKTsXi87m7z889vYwUohAKWuO3d4I1wL0oOGNgygp
         bLIPiGSHDofIfyf3Y3sTZ5PRT7qKPbo6P/dFgu3jXRcWJpnG8Be6UXGPXcZTR0MXoZIb
         St8YMm3DG4xx9GnIm1fMJjG/DVYDw5qmm70Qj9fO9umnxJ4KfJ/JHgZurRGOZDnkTWAO
         008w==
X-Gm-Message-State: AOJu0YwgBh4LuLQ6uYqSgomt6jwz6EZ8R01mt8ms1w+MXxLFUwIA8fQo
	QsCUND+tD4KHXBPPM6A9ZwpJ0xiKfEtq5G9X0KdWtbTHa8qT3vio7fOw3Vju4g==
X-Gm-Gg: ATEYQzxKchbpPnsw7UxdftF06r+A5hWg23jiPkKuWBYcZNfRaTYno3c9bMpZyuSledI
	AF7XKa2fPwiu3LjEEgxgP3gVhvFsG6HbHRS1UJcV7Lcju5Q3dinSVIRkGzGsleA6zidTeNOJ88l
	yj3toGRNaltVykGyxwMNj7/gPrvGMWLLf4VWc+H31GU5Wd2DXhCuPblG+cnx8szK3epR+qRYs1K
	JTBbLCQOn1qKv/fQgaLSOf5q/w+6yLZLy1uvEGedLcDYa6lLlFI/wd14uKZOQPANeGXi9ZK6Sd4
	ORZasyMBWrEAxuHX4WIYYF7+CHSxGjpD4B2gt1PDd08wDwfshEx6ZdGJ8kGlqnDSFGdpAWqB/1l
	jIv/9WMisdYSw2stm9o0KFBARzJj3fvx/aaCCcWkTgJNxLNR5DT/itVEOgKJLuMfexkimNGB0Dj
	Vl8iI2I9JhLfdHldUMJ6S+BYWEDF5QcbM=
X-Received: by 2002:a05:600c:a016:b0:485:3a22:69b9 with SMTP id 5b1f17b1804b1-486ff024e6emr138217775e9.29.1774244110323;
        Sun, 22 Mar 2026 22:35:10 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48705135631sm179634245e9.15.2026.03.22.22.35.09
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Mar 2026 22:35:09 -0700 (PDT)
Message-ID: <9f257de5-5fef-4df8-bbab-81d8cb5c66bd@gmail.com>
Date: Mon, 23 Mar 2026 06:35:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
From: Gyorgy Sarvari <skandigraun@gmail.com>
Subject: Call for Kirkstone patches for next release
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Mar 2026 05:35:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125496

Hello,

The next PR for meta-oe Kirkstone branch is planned in the first half of
next week. Patches that arrive until the end of Saturday (28/March, any
timezone) will be considered for inclusion.

You can find the currently queued patches here:
https://git.openembedded.org/meta-openembedded-contrib/log/?h=stable/kirkstone-nut

This is planned to be the last regular PR for Kirkstone, however as
mentioned in a previous email[1] I plan to have a kind of grace period
for last minute patches afterwards. Nevertheless, if you still have some
patches you would like to have in Kirkstone, I recommend to send them
sooner rather than later.

Thank you,
Gyorgy

[1]: https://lists.openembedded.org/g/openembedded-devel/message/124804

