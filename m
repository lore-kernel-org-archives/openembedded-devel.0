Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F334C433FE
	for <webhook@archiver.kernel.org>; Sat, 15 Jan 2022 10:33:54 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web08.5767.1642242832682809145
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 15 Jan 2022 02:33:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=nU+fXXdR;
 spf=pass (domain: burtonini.com, ip: 209.85.128.52,
 mailfrom: ross@burtonini.com)
Received: by mail-wm1-f52.google.com with SMTP id c2so5178247wml.1
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 15 Jan 2022 02:33:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tLifkS1z0EwgMZXWw0qkA7TxPxgvtXZQbG8ce3vqT5Y=;
        b=nU+fXXdROVooAiYOuHjBkCPfiF7HIey4jylj85GDzh/XbLTan9mDRmZyLKurtFnH3h
         0Ow8ev+RlyfoB7KTpEU20e5131qM3waB25YCdNLOKyx13wa7kQm+TMXAZ0haljJmvcBf
         Q0O8p7ikzDErz6E43ePXiauL13yRhPfeosBBvtcJpmyQnvhWvISHvAN3E6DmDWG9+d1D
         q/uFkJmUPvF3o+wm4XpEwp9XgBfacXwzQUSDtMTVnYr8Tt7yEQ3J3nHc6EMYt++B9Z/p
         q1LmKzzhGTAchYx2bDTkySwEzFatFHmAGPdWnH59zz/VoaikXm7C9igU6Rf6MrpDs7d3
         wXPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tLifkS1z0EwgMZXWw0qkA7TxPxgvtXZQbG8ce3vqT5Y=;
        b=xTvILHFliESHY98MQfEO8FD7tM8aottjrmBJ+5nCcojH3UT56aqgGSBiBptBFYISpW
         2O8I4aMMbXF1Y2kWwzmID+kSMjEHA3ZOMYLSqPCKbkz0d3wfndl+7WlZdd6LUsuZbiuU
         8y75YXK6jP0JqivqrFBNGr6cA00j+Wt03Zi/KLIyaGjq7DwH1by4ERnL6t9V3uCeDofe
         8ILZG3p3Snq4fxMvpHDVsMyDBry909kKrrZameDTr3F6P/Y2jH0YDHLxqMckSXrJwxJy
         7PGk/1SU9qbIVFsJca7B8MfhgO+fPVQpCLWAAmEtt2BGQmJhkYH+jq9U2ZCV/vz7GHkz
         HA4g==
X-Gm-Message-State: AOAM530zcYriLeVTOj6AFE9ixrAx45dBppc9ICDKxtEMDQrEIy3b0WhN
	7CohL9RFBGGGXHdRnV7P0+3c+wBHyWh4i2QmpEdwSQ==
X-Google-Smtp-Source: 
 ABdhPJzAqjpGzrAAwZJD4AlaR1bY1cxK1FkaVeL8hWebebtM9RBxAkD9YbLE8dV7rmw1IX1L4R/XepffbEvo1g8bwtA=
X-Received: by 2002:a05:600c:2f90:: with SMTP id
 t16mr18965145wmn.69.1642242830676;
 Sat, 15 Jan 2022 02:33:50 -0800 (PST)
MIME-Version: 1.0
References: <20220114115246.3985850-1-ross.burton@arm.com>
 <20220114115246.3985850-2-ross.burton@arm.com>
 <CAMKF1sqe8REidDKhe+VxwSSB9EPHtqVcdfQCXSvH4KPRqUuhGQ@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sqe8REidDKhe+VxwSSB9EPHtqVcdfQCXSvH4KPRqUuhGQ@mail.gmail.com>
From: Ross Burton <ross@burtonini.com>
Date: Sat, 15 Jan 2022 10:33:39 +0000
Message-ID: 
 <CAAnfSTuwhM8oik521ND9qPtFeorOxchkvWqrJDVcKEP+cSgOeg@mail.gmail.com>
Subject: Re: [oe] [PATCH 2/3] iotop: move to the C port of iotop
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 15 Jan 2022 10:33:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94853

On Sat, 15 Jan 2022 at 01:26, Khem Raj <raj.khem@gmail.com> wrote:
> It fails on clang/arm see
> https://errors.yoctoproject.org/Errors/Details/622623/

That's clang segfaulting, fun!  I don't have access to my build
machine this weekend, can you just throw in TOOLCHAIN="gcc" for now?

Ross

