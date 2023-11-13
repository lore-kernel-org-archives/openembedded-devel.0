Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BE12C4167D
	for <webhook@archiver.kernel.org>; Mon, 13 Nov 2023 18:34:01 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web11.3228.1699900441243239109
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Nov 2023 10:34:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bkQRJ8OM;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-6bd0e1b1890so3622078b3a.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 13 Nov 2023 10:34:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699900440; x=1700505240; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g6cJuIldcIMmDZRSFHBi7CVkpC6jSLkLTYF1TkHm5lY=;
        b=bkQRJ8OMjBTHbgYzIn1jX+ZC4IhDYVKr+PeksTb8G6pAp5okBM+aStS8DJPxZcM5+1
         /5rkKmZuJ/svEruJ1KTKn1/DWXeVv1t9dwk8xl+S3dqwyKBFLmx8/ZcMxVM6iofPuxVq
         HcIajwtAc96gVN+L/mKqq5KIKA4rPsgv+JTdPwqrHYP0EJB2zo1LOk8m2GBnk8DIANfE
         w8nJrdvFxFFShTYncZmkY7TmwxDe6hWUpo/IhThuM+pVS5ehREQN/H4rubByii6dwfZX
         ymJQ8FfBlMiXUN4JnS5j00KrvLqzfu+9hjuTqtTuvDMfTYe9eBWRKkQPJqJ5z9CKSdZl
         JDeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699900440; x=1700505240;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g6cJuIldcIMmDZRSFHBi7CVkpC6jSLkLTYF1TkHm5lY=;
        b=sIX9UB0ZTYx2aF3pVkkeRNa8ZN2c97DS7upyZZiOFjIL1wEx2jgPeikPe16vmCPPjD
         klOWwpxKJgLcHJb/B97cFmmWiY9ichS40uU1eSMo0dH3gGWPBCuFBGrns2jt6seOUgTW
         FefDq6IghyF8O9OJduhgbZws+PSTXmwm6l428zIyAnV3ZwJrW35JqPFAeq1/zWb41PEH
         yh/BAe8eAPuCgKLk+/5QE2OFkff0LyXskTMxcfwVsVNhZ26wsms5d7VCOIn/QVwoALEC
         NVF+ISYb/q1zmVO1RYy4+kSP8nP5m5xchvWH13reTQcp7UtgXVInALTNvyiD+voj6Zli
         rgag==
X-Gm-Message-State: AOJu0YwEOADgT6hHNJ61UTCaqyd2n6vHwj55CAPnwJ2aLBGMAg/npTHo
	He3eP+0/6BEzOIGcRgFrflBkeME5u6el0g==
X-Google-Smtp-Source: AGHT+IH86FPswB69uDhs5CKWXb8MiOzSqwB5NutRmHEB3NEe0L1f7f5RfvaJ7pNhKl4eZnCIfJsaNQ==
X-Received: by 2002:a05:6a00:2310:b0:6be:4789:97ba with SMTP id h16-20020a056a00231000b006be478997bamr6072757pfh.3.1699900440470;
        Mon, 13 Nov 2023 10:34:00 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::62f8])
        by smtp.gmail.com with ESMTPSA id m11-20020a62f20b000000b006c1221bc58bsm4063471pfh.115.2023.11.13.10.33.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 10:33:59 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 alperak <alperyasinak1@gmail.com>
In-Reply-To: <20231112155444.524147-1-alperyasinak1@gmail.com>
References: <20231112155444.524147-1-alperyasinak1@gmail.com>
Subject: Re: [meta-multimedia][PATCH] mpd: upgrade 0.23.12 -> 0.23.14
Message-Id: <169990043965.4418.3997943163061382277.b4-ty@gmail.com>
Date: Mon, 13 Nov 2023 10:33:59 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Nov 2023 18:34:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106664


On Sun, 12 Nov 2023 18:54:44 +0300, alperak wrote:
> Patches deleted because issues fixed in the new version.
> 
> Changelog:
> 
> ver 0.23.14 (2023/10/08)
> * decoder
>   - flac: fix scanning files with non-ASCII names on Windows
>   - mad: fix calculation of LAME peak values
> * mixer
>   - wasapi: fix problem setting volume
> * more libfmt 10 fixes
> * fix auto-detected systemd unit directory
> * Android
>   - require Android 7 or newer
> 
> [...]

Applied, thanks!

[1/1] mpd: upgrade 0.23.12 -> 0.23.14
      commit: 2afb48b7f6a34dfadcc6038816c712dc022046d0

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


