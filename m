Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 170B4C433F5
	for <webhook@archiver.kernel.org>; Mon,  8 Nov 2021 10:48:48 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web08.43354.1636368524220876633
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Nov 2021 02:48:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=OXzJwPW8;
 spf=pass (domain: burtonini.com, ip: 209.85.128.49,
 mailfrom: ross@burtonini.com)
Received: by mail-wm1-f49.google.com with SMTP id
 b184-20020a1c1bc1000000b0033140bf8dd5so11249241wmb.5
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Nov 2021 02:48:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ASWD1VZ7eA2+88AgY83OMEgFlyDTICXnr2mF+k0Eep4=;
        b=OXzJwPW8Liye4tJwz1W7jMiHGpY4+rFUXEwr8y9v7C9fAgVPdzYB+kw3Mbun3uGQhW
         XTgZDuBmOTHwkKfZdqg0ZWp1JAK4eBtpyz9rKsCcK0WKuy1H5pAHRmIxiPTr9iNKkDkf
         rAGc08myzXbQPM0jX947EmtllVpesB/tdIyWQ/ZRH68Fb5HV+YH+KQ3DkNn0lMNXRBTs
         ekeAYp9O/YlzwYu4/yGwsSEApz0nnvcRy5AZPgR2eh9RkxdOj4JflP9+tT8ZR5zYMBz5
         CTCloyeMB7qwaPT/qmYB1L8LkMwxJeqqQGkVV+0EJfSsfvw7sCetzzyPh3x2mpigFoT7
         PQ+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ASWD1VZ7eA2+88AgY83OMEgFlyDTICXnr2mF+k0Eep4=;
        b=phCAqn1Cw/1H2gXFV6js47uqBX7T/XJqs4EIm/Er3ERQFPmfh/oLbSea4vAwzE3S1Y
         xc1iZxlTrhRScSRPUHkn8iaifqbYajcsv1CgMpsmByE6ptX2G2UalxuYcbFkAwnryz2X
         57wIl6MpmZTO3v9X2AQfn/OIlMpuEVysg5GxZsTvgUHlNSnUYEHo4s1CYDYF6xQ27vqh
         /slGjkUR3xR9ADd0WVKWtX18vXsk5mgZzykTJb9kJpbxmWz9/SNPEgSB83g28rSpEcab
         D2NTMp253LoitwhF4LTZioVI44eTYrjA8q0tB8e6TBw7Rhlp3Hekz2qrMOd3ghFHyAuw
         03SA==
X-Gm-Message-State: AOAM532uLwRvkBFUon5WFlq16hk3MTyB4rkodl2kL/BRRXqW0Oj7sHf6
	UXkBWvnM+wzDJnsjQeIh/gJSWV4jwZt7Sv2Pp/+ASmJ9Er96HQ==
X-Google-Smtp-Source: 
 ABdhPJx53YDuftW5FtOb/OAT07G+J9zKozMOIY8xPzgZDCoWvSfffnrtDju6IkRQsbeER0JXH1eZUXZgaatHPrENhfc=
X-Received: by 2002:a1c:f30a:: with SMTP id q10mr52784401wmq.62.1636368522609;
 Mon, 08 Nov 2021 02:48:42 -0800 (PST)
MIME-Version: 1.0
References: <20211105194052.2934833-1-ross.burton@arm.com>
 <CAMKF1sowhr1aFBjE+WBZaKmzK7oVcGquk6Aa9UZGno8XEH8crg@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sowhr1aFBjE+WBZaKmzK7oVcGquk6Aa9UZGno8XEH8crg@mail.gmail.com>
From: Ross Burton <ross@burtonini.com>
Date: Mon, 8 Nov 2021 10:48:31 +0000
Message-ID: 
 <CAAnfSTsk9RSrVv5qNqkeyGNfLc3Ho4qmViajPdbpp9+=u=staA@mail.gmail.com>
Subject: Re: [oe] [PATCH v2] fwupd: add new recipe
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Nov 2021 10:48:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93874

On Sat, 6 Nov 2021 at 19:52, Khem Raj <raj.khem@gmail.com> wrote:
> this fails to compile on x86/x86_64
>
> https://errors.yoctoproject.org/Errors/Details/616488/
> https://errors.yoctoproject.org/Errors/Details/616487/

Sigh.  I'd removed lzma to verify stuff broke and failed to add it back. =
=F0=9F=A4=A6=E2=80=8D=E2=99=82=EF=B8=8F

Ross

