Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94C34C47DA6
	for <webhook@archiver.kernel.org>; Mon,  8 Jan 2024 02:47:06 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web10.31439.1704682021472273867
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Jan 2024 18:47:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JXDXXO9X;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-28bc870c540so1238492a91.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 Jan 2024 18:47:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704682021; x=1705286821; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KE5aqMK5oDXsSEU7rbi5lZJjfJUBKk3IGBhhtmIGmIo=;
        b=JXDXXO9XJuyqByOiK/JzMq3bh/ENg2FitPooX+fWzZZXcXdtj1MsUG9054JQVc27or
         gcg+UTCVfdUk13Cb0PX7Q36XGAmBBk0q9hb0HjfaGX9FG/YXv4ABds12nQc41euuF+rl
         qWkxwdIbRsELf8drI0XVRlyA0+NeLkxmrP5aNlX7faJlsKmq+aEa3tp6F2Gop69PqYuL
         4IciTUox8AzM/3zDCBGoGkDjHK1WQYa9msrYuN6o6I7mEICFsBNHNWWdoCNrJqAFftD0
         bL3csqGHdDf0AP8L9yRk/r6EJ4vuH+wXcIpCKT1Li4Zi/db9QmqxyeYPBRbniN3V1Qod
         7P4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704682021; x=1705286821;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KE5aqMK5oDXsSEU7rbi5lZJjfJUBKk3IGBhhtmIGmIo=;
        b=vuNNA6Z0p4xI8PxB8OyaGPDA2cQ7ZnyjaM/OpmqAHTzLoZ80wGRASsceHDPaqVzoAW
         2VUwFIW7w221yOj7KmQSKIzjXvKo1QYIrsXZGaJBlfE+stivRPZXRbEFccRp60lh714F
         CTCBC3NR8yuJmiTQOGC/jxC7XIn+UEs0a77RnhI/CYuAYRlFnnE1ufT80vQaxdlHddjj
         dj7fbOR564pEniVMo6DGZPX/RObe5kN97qwewNKnGX9H94oU8vhXzbGoW+UDNjhT8k6t
         9fOqUauXTyd8P/fsuHn4hVLvUK0qt2rw/MdyfPxA2i9VFjmJFCvfJPOm4ITYUSCCbRt6
         7zsg==
X-Gm-Message-State: AOJu0YzV0rDH83ui+nGOkH18vQsDpSVswCLgb6PhU3qP/ob0Je1dDtVS
	WpdT0pAm1JuYn7A19CQHzZbwrg3REqQ=
X-Google-Smtp-Source: AGHT+IHPdqn2a4wNjIIaxe2WhJeKMmR/KBM/fvGuluI0Iwhfm9yFN1+l95ctFK+EqnDtOEmPBdaSuQ==
X-Received: by 2002:a17:902:9a0c:b0:1d5:36e8:9ac0 with SMTP id v12-20020a1709029a0c00b001d536e89ac0mr711046plp.50.1704682020871;
        Sun, 07 Jan 2024 18:47:00 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id az2-20020a170902a58200b001d08e080042sm5019868plb.43.2024.01.07.18.47.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jan 2024 18:47:00 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, liezhi.yang@windriver.com
In-Reply-To: <20240102085042.3151355-1-liezhi.yang@windriver.com>
References: <20240102085042.3151355-1-liezhi.yang@windriver.com>
Subject: Re: [meta-oe][PATCH] v4l-utils: Add PACKAGECONFIG for v4l2-tracer
 to fix determinstic build
Message-Id: <170468202025.912276.436618269157259027.b4-ty@gmail.com>
Date: Sun, 07 Jan 2024 18:47:00 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Jan 2024 02:47:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108105


On Tue, 02 Jan 2024 00:50:42 -0800, liezhi.yang@windriver.com wrote:
> Fixed do_package error when json-c is in the build dependencies chain:
> ERROR: QA Issue: -dev package libv4l-dev contains non-symlink .so '/usr/lib/libv4l2tracer.so' [dev-elf]
> 
> This recipe builds out files such as av4l1compat.so v4l2convert.so and
> libv4l2tracer.so which are not symlinks.
> 
> 
> [...]

Applied, thanks!

[1/1] v4l-utils: Add PACKAGECONFIG for v4l2-tracer to fix determinstic build
      commit: 9ef06c6319d2a2ce11bdc2dd21d7d03e8131be4d

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


