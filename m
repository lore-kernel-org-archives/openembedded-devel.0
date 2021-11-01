Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C33EBC433F5
	for <webhook@archiver.kernel.org>; Mon,  1 Nov 2021 19:42:47 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.1408.1635795766345811695
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Nov 2021 12:42:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=csDH/GYa;
 spf=pass (domain: burtonini.com, ip: 209.85.221.43,
 mailfrom: ross@burtonini.com)
Received: by mail-wr1-f43.google.com with SMTP id u18so29685117wrg.5
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Nov 2021 12:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RZ0r1Gk+VJzM7fshlvE40GIaMKoPC0T6iPYaZHn7xJY=;
        b=csDH/GYaRSq1bRPbSlWPQWVC+V1kvoQW1vnLVqYC3FTWpTtOtSSbm4Ygqmp9rFUSNH
         N7bNyLWMI8HaXzJJJs6ALac8JRF5ew8MK4SvDYl6xd6gMZdPA5tAvOb0VjdlCsVMhdg1
         quGaiX9qktyaCvbsd6IT9j2AsnU2+fUE+i6muQ7ZVXu74F94PALNITdb80p3CEtXk7FR
         HryoPmjZQlGoT1e0xXk1kUMZjl8/fTmLRmcbxbNh6LCCFAAgOrn2A8o1/QPIXYYa1Z/R
         EXADSQx5pKjFDynd8xQmqaodMp6AW8Q0laOlR51Rga625F911DEneviEA/qFyU7ViBlq
         lFcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RZ0r1Gk+VJzM7fshlvE40GIaMKoPC0T6iPYaZHn7xJY=;
        b=yE6aVNorLO4IQ71bgXKRU5JMKeYKS5DUlW52gucaCRKiK5E4ugBIL1sDI0Nixlk6j7
         l7/eMXY9Q2Pc8Qln96KsDjaOO/hXxRPd1zmdo6GkpyGKOopFy/o5b3WaG9xd3a+wF/qt
         qI65NfTPyuRpkgko9ShqP/m7Nhlj29adfFF9I4WrwpHIe3L78QA4XtopF4YDqRZKn5hW
         RfILoiWeLetKMVA2k/HifYw+GF/VR1eKTDk0IpVEH45DR8EeaanXG+SL2majSy+ofHsU
         FM5qev1FDjVM1iU2B2EVAPbYnR3y/UQCHJuxxzCeoYKLPa9XU36qhEcTqgeYaC4/HXJ0
         /+SQ==
X-Gm-Message-State: AOAM530Rn7679Hz9Has5kCcAzb91aYI09THnfr9dcDY0qpMjgz31jvBa
	cC70gh0uraEpnqQujrndPF/xxYuThZ0wkqqYl7ZUww==
X-Google-Smtp-Source: 
 ABdhPJzFyOQBnBBeFyA4mVsVpLCc7X9Fc91Ct3wFafc7ZRnJrknr2Qw/jLF7Z+Z/C7ubNRxIzg/lrcsLU7CiFph+iQE=
X-Received: by 2002:a5d:4e09:: with SMTP id p9mr25851515wrt.28.1635795764440;
 Mon, 01 Nov 2021 12:42:44 -0700 (PDT)
MIME-Version: 1.0
References: <20211101161831.1978140-1-ross.burton@arm.com>
 <b10ccd03-dd16-1e54-9372-1fd7c0261a8d@windriver.com>
 <CAAnfSTuGnE-=fAP4bu-k61QoD_N3EcR2QdNqUO1d8HMs+X7ZOg@mail.gmail.com>
In-Reply-To: 
 <CAAnfSTuGnE-=fAP4bu-k61QoD_N3EcR2QdNqUO1d8HMs+X7ZOg@mail.gmail.com>
From: Ross Burton <ross@burtonini.com>
Date: Mon, 1 Nov 2021 19:42:33 +0000
Message-ID: 
 <CAAnfSTspBaT8ntn5W+Sp2GJ-eNK1Yj0tjbR8v8h4s6pQPia_gg@mail.gmail.com>
Subject: Re: [oe] [PATCH][meta-python] python3-imgtool: add recipe
To: Trevor Gamblin <trevor.gamblin@windriver.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Nov 2021 19:42:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93754

On Mon, 1 Nov 2021 at 19:18, Ross Burton <ross@burtonini.com> wrote:
>
> On Mon, 1 Nov 2021 at 19:12, Trevor Gamblin
> <trevor.gamblin@windriver.com> wrote:
> > +RDEPENDS:${PN} = "python3-cbor python3-click python3-cryptography python3-intelhex"
> >
> > Did you mean python3-cbor2? The layer index suggests that python3-cbor is only in meta-iot-cloud/meta-arm/meta-ros-common.
>
> Probably.  Very curious how this worked as I don't have that layer
> locally!  I'll double-check.

The requirements file explicitly says cbor, and it turns out I can't
read your message as I do have meta-arm present.

I shall post cbor too tomorrow.

Ross

