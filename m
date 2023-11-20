Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0205CC197A0
	for <webhook@archiver.kernel.org>; Mon, 20 Nov 2023 03:50:55 +0000 (UTC)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
 by mx.groups.io with SMTP id smtpd.web10.43626.1700452251819273678
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Nov 2023 19:50:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EtUPdjAz;
 spf=pass (domain: gmail.com, ip: 209.85.167.172, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-3b6c31e604cso2778048b6e.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 19 Nov 2023 19:50:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700452251; x=1701057051; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YIm573IpjYXPoxQvk3XEkO8HtDtTnd+xbe1q8fkErOc=;
        b=EtUPdjAzP+EHfeh/KgJAuIRUPDnhvuXWKXij7DOH3JsDAUcWD2mo5+08I4AhIiyGbn
         OtUwahO3eled+P/d8Vy2ZvMjeW9Ovc2Qgz9QLYxxWfg71OI0Ulx03xrG8BQAotSaxZCK
         hCLl6OtdtQrasENddU5q+nupGWHK7q+a31QAt5uSf5VoXp9Dcla2+bdhd6A5esQAJuML
         sCusf5xR/KhysY53Er6w7ALapTTHtQcurjvEPwCY6il9Eij31J9uWStAUn6HErlAKGSp
         /YZa5/czFyyf79lG5JTRhwAhQnPHbrzWv96oRnQJlSBoGi1zjR+iz7WVkaSD9Dy1uoS8
         2Few==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700452251; x=1701057051;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YIm573IpjYXPoxQvk3XEkO8HtDtTnd+xbe1q8fkErOc=;
        b=ppE3sjWrpx7Ac8ca0HAntkW6CXlJAY1AeXznC6kLrQbH5l1ck0i+ppOziots08tzvq
         tid2K8j6x/E1l+JG+b3a5NR5Ipoy39jcxO405THbAmShSKhu9TUxC1WCTbNf5hRVOP2I
         rVtfEzRtnCB0pXqffiuEuFgeqPf5aDt5Sdx+YR8tBL2K+nIOM2i20HUISbQWrAjzUC/u
         4O+VF1/rWee+x1xGW+/e9zfYIj9hNrk7bzVeCLpWaLW+fVTfcWPMqcLF77hptXqDO5LL
         vzuUFhpVPX7Odsk2JtL0q/nXuRiF/1hnFcfRKaFxGh6zEZYEFhQDKbP/YoJE2wKcvcR3
         jYqw==
X-Gm-Message-State: AOJu0YwnZqOdK4AnkMefP6LLG4VK6urbiic76Gogrbjp06m5yijIdof8
	tafnEOXPKUbCtmytiYMl5Kg1uYfU/hj8ng==
X-Google-Smtp-Source: AGHT+IEcYD9VUu94xGbF97aHiNTh2AF0kZiWCUD7BWYajLQ408GgexD9Ea2IlvINNrRhUH71Qbx52A==
X-Received: by 2002:a05:6808:d4a:b0:3b6:ccce:b20f with SMTP id w10-20020a0568080d4a00b003b6ccceb20fmr10327375oik.33.1700452251129;
        Sun, 19 Nov 2023 19:50:51 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::b319])
        by smtp.gmail.com with ESMTPSA id a34-20020a056a0011e200b006be0fb89ac2sm4954381pfu.197.2023.11.19.19.50.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 19:50:50 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
In-Reply-To: <1700122251-21927-1-git-send-email-wangmy@fujitsu.com>
References: <1700122251-21927-1-git-send-email-wangmy@fujitsu.com>
Subject: Re: [oe] [meta-python] [PATCH] python3-dbus-fast: upgrade 2.12.0
 -> 2.14.0
Message-Id: <170045225016.1416826.10060699359371390994.b4-ty@gmail.com>
Date: Sun, 19 Nov 2023 19:50:50 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Nov 2023 03:50:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106908


On Thu, 16 Nov 2023 16:10:51 +0800, wangmy@fujitsu.com wrote:
> Changelog:
> ==========
> -Add support for tuples to the marshaller
> -Re-release since the previous release ran out of space on PyPI
> 
> 

Applied, thanks!

[1/1] python3-dbus-fast: upgrade 2.12.0 -> 2.14.0
      commit: 516868458050c61019bdacbbcd51f616ad81f099

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


