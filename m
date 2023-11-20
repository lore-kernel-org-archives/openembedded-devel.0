Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B90CC5B563
	for <webhook@archiver.kernel.org>; Mon, 20 Nov 2023 03:51:05 +0000 (UTC)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
 by mx.groups.io with SMTP id smtpd.web10.43630.1700452256870778860
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Nov 2023 19:50:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Yms9gdzh;
 spf=pass (domain: gmail.com, ip: 209.85.219.173, mailfrom: raj.khem@gmail.com)
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-da077db5145so3570737276.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 19 Nov 2023 19:50:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700452256; x=1701057056; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KudPWzK8ENGe6Y3BcJj3t6+ksZCSF3egPgrl3ZA8igk=;
        b=Yms9gdzhOqPFPasU6zM/rCrOMImvplP1vJSo17uPFCAy60PKBgH/vPNsKKVt9pAtik
         Mh8TR9IQctLZ/S7zc+ALHkcTyFOPuZTB3IqJrKVWHuttYX2mRUKIsN7LWChpFOpIRsOJ
         eU+ygyCzajivHJC/ZY+gdqKZFmmC1QysmvliviuzXAJIzeUR0Qa4XS63623KC+TKt4+c
         uuDBTdt9ErBNKuSZpLbvNc4manKr6BJa0WPJ9HdQTE/2FOlE/d2XSyi7zkmFI0779CJ8
         1XoCJJchusEOlYvYESn/s+kqM4IQhVjRFd39dCPuxJXswOQogd5RdY7cVKvFo488T9vm
         yI3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700452256; x=1701057056;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KudPWzK8ENGe6Y3BcJj3t6+ksZCSF3egPgrl3ZA8igk=;
        b=cregKK8sPs/6nm9xC+ZwdExc3DR5vuOVBSW9W/kRjsAJpPoIt6BvmqXkQM9U/BlYXZ
         3VFEtxk4L6yB10b3TNO7AuTzp7Ge0j6u3qW/+rd3NpiKZlVsD4xVXBkHAWS26HjyDaWD
         XLwZe9ETHKBAZFCIVW0KRyh82Tn2qdQyGkmaJw3TcCR+DsktQL0qs4XW5UP2l9Fv87gB
         4W03NH1tmY6Un9Mi6F+Xw8gO3SZxev8J0o5idfctMv6/+JRsCstZxB/96e7/vb6+Yoxu
         GE7aBo3GpsCnUuYZ3i+YEECkz5zE9X8uCo3zpaofO9SzhD6nGifZHLyg9+YAZlVUHaEa
         1GRw==
X-Gm-Message-State: AOJu0Yzg/uNC+Q/eZYm85UF4/As6bGWwvut64ZlW3yh8/djnx81i8oMy
	CX92qY85dHrHKUxY5tdXibMcb7IBVUDQ3w==
X-Google-Smtp-Source: AGHT+IFIDkGVdcxTT5E+IkA7/p6txkbw8/QMWSi9ixpiMkUlm/AuI4CoqZEYuixGkLkuNfc6AcZNMA==
X-Received: by 2002:a25:408e:0:b0:d9b:76c3:4567 with SMTP id n136-20020a25408e000000b00d9b76c34567mr5532238yba.55.1700452255890;
        Sun, 19 Nov 2023 19:50:55 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::b319])
        by smtp.gmail.com with ESMTPSA id a34-20020a056a0011e200b006be0fb89ac2sm4954381pfu.197.2023.11.19.19.50.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 19:50:55 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
In-Reply-To: <1700122616-22134-1-git-send-email-wangmy@fujitsu.com>
References: <1700122616-22134-1-git-send-email-wangmy@fujitsu.com>
Subject: Re: [oe] [meta-python] [PATCH] python3-google-api-python-client:
 upgrade 2.106.0 -> 2.108.0
Message-Id: <170045225516.1416826.10783183233368593315.b4-ty@gmail.com>
Date: Sun, 19 Nov 2023 19:50:55 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Nov 2023 03:51:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106913


On Thu, 16 Nov 2023 16:16:56 +0800, wangmy@fujitsu.com wrote:
> Changelog:
>  https://github.com/googleapis/google-api-python-client/blob/main/CHANGELOG.md
> 
> 

Applied, thanks!

[1/1] python3-google-api-python-client: upgrade 2.106.0 -> 2.108.0
      commit: e669da68af8f4aba62994b34f7fd854a83247dab

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


