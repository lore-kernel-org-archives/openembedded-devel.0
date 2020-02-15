Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id 6190F613C9;
	Sat, 15 Feb 2020 20:49:50 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id t13so9469745qto.3;
	Sat, 15 Feb 2020 12:49:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=CTUnU0DBIt23sq38Z/xjRE/QpHiALfpPDztW9GKzfHg=;
	b=t95ey1wXXbngW2H21pXim4I9Zu0K61BfPOp8ROtNxoTt8KmEIXk9UnkrK5eg7yBMqg
	OkSNUPqa6YxPN9/Ub1414SK0jnU+F42HbadkUUJy2nFBtCsyLdfqpROsmZKfjDkFwNpB
	Feg27QU1eIcs9pwZo2jvPKyEfqR6tZiUWNCq2iXO2Cg59ELGWAGKyoAzxQmHVIa4O1IK
	N1eH8eSdQGC27FsekVbgrwwpUJ9DUFtDe77a8pG+ZntPr060IGu3TFBvcHwDcxl2af3+
	FEtGFxmfrjKrdalZCJ3oPtE4Q0CfsqdSWFZx61ZOz9GLiJItNplQYMPy81oDuK2pvHGK
	6rBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=CTUnU0DBIt23sq38Z/xjRE/QpHiALfpPDztW9GKzfHg=;
	b=iLPlwCjjIyiSNT3oUtceGJWcOexX4uC5ufonIKebkig1Qq2UV049g2k/XLnAELpZPp
	RbONVlCN2lMy8CoYSGDn1Z+UTUFaIqqNP3erQJplxARKDDjEDaqef4GZkmwFYPf+1Dpg
	t0qVYq5p6IBSP6I+p1ufb0lYLvBblHWeiklr+hMjWNt3VwuQ++wZ6QvEmKEEZP8f9j8t
	LvemTVmqiOVIurBcV/JfcaYNh26TU5AmaAYTQNArfNCNwZ0xnYnoqyN/v7FNruHDBEjQ
	JkcwR3aiYpX+yIN2cdX0EUxg3v2N7JOxu5lOswmMpJHFzHYptkF24/gJNEV9X+YcxpBJ
	UhGA==
X-Gm-Message-State: APjAAAXt7S8Oj1AAROtoKez4ik2QA6dWZO7i6vC8Sq0ITakq8dR0VhWY
	yi06fFLWB5m+W/Qtc+xWeUD9xrI/5zXinzNdFwk=
X-Google-Smtp-Source: APXvYqxR8Ok0dYkNOxrTANK/7Q2S+nc18ZsKXOrsIUqDEJaSuyhRYGlqrCLkoF0aG/3GZ2jSjVjl0o9+OOuQZUGOpQQ=
X-Received: by 2002:ac8:405a:: with SMTP id j26mr7692961qtl.88.1581799790799; 
	Sat, 15 Feb 2020 12:49:50 -0800 (PST)
MIME-Version: 1.0
References: <158176248670.31260.7654152103178704127@git.openembedded.org>
	<20200215102807.938B8232818@git.openembedded.org>
	<65fcf6fa-6f55-b082-52fb-6d8a8ce2ef3c@koncepto.io>
	<CA+chaQduoaTu7+dX13w2PbC_uf_CuSChyfRbF+DnhE23dkoTdA@mail.gmail.com>
	<432947a2-e180-8799-c6dd-22aa89ba4e89@koncepto.io>
In-Reply-To: <432947a2-e180-8799-c6dd-22aa89ba4e89@koncepto.io>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 15 Feb 2020 12:49:24 -0800
Message-ID: <CAMKF1sr6kwy4Le85vFsdo8odH-ArO=Y7Fw+fnFeC=ZH0hND1oQ@mail.gmail.com>
To: Pierre-Jean Texier <pjtexier@koncepto.io>
Cc: openembedded-commits@lists.openembedded.org,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe-commits] [openembedded-core] 11/18: busybox: Backport patches to support removal of __NR_clock_gettime
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 15 Feb 2020 20:49:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 15, 2020 at 8:46 AM Pierre-Jean Texier <pjtexier@koncepto.io> w=
rote:
>
> Martin,
>
> Le 15/02/2020 =C3=A0 17:38, Martin Jansa a =C3=A9crit :
> > Isn't it caused by some other layer prepending some busybox patch causi=
ng
> > this? Can you check with bitbake -e?
> >
> > I'm not seeing this one in my builds (and I was just refreshing some of=
 our
> > webOS OSE patches to apply cleanly on 1.31.1)
>
> You're indeed right :(, after a quick check, it seems the build failure
> comes from the meta-riscv.
>
> Thanks, and sorry for the noise.
>

some of these patches were in meta-riscv which is fixed now.

> Regards,
> --
> Pierre-Jean Texier
> Embedded Linux Engineer
> https://koncepto.io

