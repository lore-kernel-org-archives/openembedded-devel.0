Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A635C5AE5E
	for <webhook@archiver.kernel.org>; Mon, 20 Nov 2023 03:51:05 +0000 (UTC)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
 by mx.groups.io with SMTP id smtpd.web10.43633.1700452261437469273
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Nov 2023 19:51:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IbZXahle;
 spf=pass (domain: gmail.com, ip: 209.85.167.178, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-3b2ea7cca04so2698047b6e.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 19 Nov 2023 19:51:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700452260; x=1701057060; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mYwvj778++w1GaRyFRcmquWhfHpcz7AM370atTw39Vk=;
        b=IbZXahleXh7e7H8oJ1nkPc3yUbzQUPv2a8AFhJSgmhxxN/syMKzO8CK4B3W68JvhQh
         bc5khaRYhTFVVh4wB6MeUbZ5YWEvq4+1tHuVMZ0s8D+Ohw4+Sw9WsWcshsgY+mPintcw
         NLgW8pnyxw8tC99HzcoUlIMdcQV7uxQjkyzu9QhE61MvEXNBZNrU3sjiBJZ6AC9CipZV
         LUEYQGGv5FmrEomXtsPkK7CR/AcgxbZ2ZsGfONV4jtVv4osb61+sZc/gdotJRA5G8gKK
         NhJJJ8m899NdfiFV0itNtoQcB5u3HMwkut3cNiLEW6Uih0VLsbJJN9j02PYcmi6I/SGO
         8Bzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700452260; x=1701057060;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mYwvj778++w1GaRyFRcmquWhfHpcz7AM370atTw39Vk=;
        b=TP+bbx6yXDiJwHz6xIXw02+2uGOwqnXoIAXvpvVnWoBmHRDhKsDHKD4ZSZt+CW1z/j
         SfvMhWBtSsy+K1/cWw4j3GZ8ChprVqI4ElitUs4M8EIZttGHjk9gFm+HZlZm7aoPbQXY
         EJnMCx2NIKGoLYxgn1kzNqDqWrqsnwGAA07g7FtVxQvxyGSyf7p6d2amtFHf7cPZtnzV
         6H9h5O4E/sM3X3yDX2uc3ukLJZT457iKuYEZvvkVb9oCWPn+9l7np4iNJOa6mKlJGDoq
         X+aQuoXaHLCiWzGO/O9Qki5GzlUANTkWyRBkThaFm3OIzZjGwzWiU3PiqKxZmFoOrU/T
         1eiQ==
X-Gm-Message-State: AOJu0YzDdWMDOBN6o9fWJzCJhbrhcpzV9QJ41kBGDh1gKbHCUTMejkqd
	/3TsmWXMXC2Mvp7j04FHr5k=
X-Google-Smtp-Source: AGHT+IEi7Tb+ES4OWsV+AuSZLpBvRxxTL4ejOmO4sHY6eWs2EUQMhsIXOH17QCa08qzp/NZPmmVg+g==
X-Received: by 2002:a05:6808:1143:b0:3b2:d8cb:8e14 with SMTP id u3-20020a056808114300b003b2d8cb8e14mr10129429oiu.28.1700452260617;
        Sun, 19 Nov 2023 19:51:00 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::b319])
        by smtp.gmail.com with ESMTPSA id a34-20020a056a0011e200b006be0fb89ac2sm4954381pfu.197.2023.11.19.19.50.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 19:50:59 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
In-Reply-To: <1700123266-22328-1-git-send-email-wangmy@fujitsu.com>
References: <1700123266-22328-1-git-send-email-wangmy@fujitsu.com>
Subject: Re: [oe] [meta-python] [PATCH] python3-pyaudio: upgrade 0.2.13 ->
 0.2.14
Message-Id: <170045225911.1416826.13559211259957897492.b4-ty@gmail.com>
Date: Sun, 19 Nov 2023 19:50:59 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Nov 2023 03:51:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106917


On Thu, 16 Nov 2023 16:27:46 +0800, wangmy@fujitsu.com wrote:
> Changelog:
> -pre-compiled wheels for Microsoft Windows (32-bit and 64-bit) are now
>  available for Python 3.12 on PyPI.
> 
> 

Applied, thanks!

[1/1] python3-pyaudio: upgrade 0.2.13 -> 0.2.14
      commit: 6b0eb1807e90f641dc05633ac67cbd521637098d

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


