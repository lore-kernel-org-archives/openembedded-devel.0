Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72BD2C433EF
	for <webhook@archiver.kernel.org>; Wed,  5 Jan 2022 12:51:55 +0000 (UTC)
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com
 [209.85.166.52])
 by mx.groups.io with SMTP id smtpd.web11.6550.1641387114286590668
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Jan 2022 04:51:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nseDnykx;
 spf=pass (domain: gmail.com, ip: 209.85.166.52,
 mailfrom: alex.kiernan@gmail.com)
Received: by mail-io1-f52.google.com with SMTP id l3so45932710iol.10
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Jan 2022 04:51:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=IvsNABt+30Nf0utD/Hvug6GtFuU/DcbXnd33j+Ia3ik=;
        b=nseDnykxAKZoi/D+u0FfsMtHE+SZsRJbHQFO0WQdWCQ8KQH/xVFAhCVNuSm6Dlakoi
         x/zHKI075xxhMrGNv2No+r5OviIcZL87CV+prTqoNslrQQNqEaJhxP37RLRgDZIKnumN
         GTEVpuYb19Jtw5HFEEBbMK8tRshI95ygGywjCAClz6rpBf0kX9nI30c+yd6UdO1jdC9V
         kITT8hqKYYdNnybibt/+fPsVKXP8uZ8r8Jxj+mWIO9QwcuvIF7oLc2EWhA9OdLf7x+0b
         a0vQwf6OdbbDOlYod2/hfutI2Iz4PXDzUszpmIsdtSOK9/ElPxdkd8WoLfSy0pr+C3Sk
         ZriA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=IvsNABt+30Nf0utD/Hvug6GtFuU/DcbXnd33j+Ia3ik=;
        b=VZmavfNas+WUBPHqXhB1z1LBnzaQKU23FgoFX/TcxQU8JOk+VMKljwDWnvfDC1KxiG
         7nDijy4pkDZDUE3EAA7agt6SQHSW1D2BgSv/Cnibf/gIB3OmoZmaNaurdo0F5ofu6KVq
         OAxhov0pCEg1dcOR48IfZk7c1+8AirlofT+1Q/ncJEfEtggoP60pl8a2+H1V+ahQ0nnS
         wy5p10IJHNMnyU7eX1ExFtaZ/+jiW2mDriCDxHaZ/nQS7kn9w6E/thg9bCkUd8iOBlsh
         hmkZaCDl+HJHH5Wu645CLnw649DYpb4Pe4ApGoY6ysuW1NDdEJYpmDl8GajkTM0FSIfn
         oMXA==
X-Gm-Message-State: AOAM5308CLZZ/cpLums8kKbDugG58CO3z3iVa4BiA5eN9e0+vYEv+RoQ
	8rAlWHfXT5YXQE8dyi+L24DuWo4VHVZxnRij4MM=
X-Google-Smtp-Source: 
 ABdhPJyDfPro+3zN3bxFaPqrdrlQftdiNhd6v7kzmcx5xX6+PIL1jU9nEjlskp7ov7QGAqUsuV3F+PgXfspJSXcuycE=
X-Received: by 2002:a05:6638:c51:: with SMTP id
 g17mr25740381jal.136.1641387113357;
 Wed, 05 Jan 2022 04:51:53 -0800 (PST)
MIME-Version: 1.0
References: <20220103163754.32439-1-alexk@zuma.ai>
 <CAAnfSTvy_xKboMuVNqodt5PduOtdj+tNM+qPc84X-Z=vKtSRWw@mail.gmail.com>
 <CAP9ODKpSjs7_g-aHDf=WjNDbwLDrru8h8Xu9K2zAuDGAN=beRQ@mail.gmail.com>
In-Reply-To: 
 <CAP9ODKpSjs7_g-aHDf=WjNDbwLDrru8h8Xu9K2zAuDGAN=beRQ@mail.gmail.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Wed, 5 Jan 2022 12:51:42 +0000
Message-ID: 
 <CAO5Uq5TMppqwskcZOHPUE=5fDUN5Q1QP_vRPegfFoi4jmG8M=w@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH v2] ifupdown-ng: Add recipe
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Ross Burton <ross@burtonini.com>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
 Alex Kiernan <alexk@zuma.ai>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 05 Jan 2022 12:51:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94660

On Wed, Jan 5, 2022 at 12:16 PM Otavio Salvador
<otavio.salvador@ossystems.com.br> wrote:
>
> Hello Ross,
>
> Em ter., 4 de jan. de 2022 =C3=A0s 07:28, Ross Burton <ross@burtonini.com=
> escreveu:
> > On Mon, 3 Jan 2022 at 16:40, Alex Kiernan <alex.kiernan@gmail.com> wrot=
e:
> > > ifupdown-ng is a network device manager that is largely compatible wi=
th
> > > Debian ifupdown, BusyBox ifupdown and Cumulus Networks' ifupdown2.
> >
> > If this is a superior alternative, should this be merged into oe-core
> > as the replacement for the existing ifupdown scripts?
>

I suspect it's too early, though I guess there's already ifupdown in
busybox, so three is possibly excessive.

> I think we could consider it but it'd be interesting to check the size
> difference between both so we can have a clear idea on the impact of
> it.
>

Smaller if anything (though I've just realised I've not dealt the
ALTERNATIVES paths correctly):

--=20
Alex Kiernan

