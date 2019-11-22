Return-Path: <ticotimo@gmail.com>
Received: from mail-il1-f196.google.com (mail-il1-f196.google.com
	[209.85.166.196])
	by mail.openembedded.org (Postfix) with ESMTP id DF5BA7FC99
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Nov 2019 01:16:42 +0000 (UTC)
Received: by mail-il1-f196.google.com with SMTP id f6so1263302ilh.9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Nov 2019 17:16:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=vceLZ+oxaBbsRLBoyDP4Q6DRxF3R5MnsyB1WAkQUld8=;
	b=Zz3QG/8iq8vY41N16coHLWMpawFsV27uxJvnbVeyZ9qPDLLGZlMgT+rAH4B6abOl1H
	6aawEonlPSSHFsOzKLhYpGpBdJjmCP1zxadFk8jhpV51Dl3+1t4LAFZqUiy7HOBlW+Vu
	yeXcs45P9nV1Djm/nqQsnp33V+jvE8DBlU9GwQ/1QQi2omKq9jornDVo1PkMAxwcV499
	9fsKkW/+yJTHNtyqcOfamDbXHJAUd/eAhvlr1Bj5OqP1lBHyQsLUcwHscmee121xalcx
	A6LClLjhBbhcGqJjn+FgXnnFBMQVbepU9JXSQPmVAj8laMhF49/5mo82wHV2Zn9m7HMX
	fnxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=vceLZ+oxaBbsRLBoyDP4Q6DRxF3R5MnsyB1WAkQUld8=;
	b=U9wLcsY7ROOGPksySQUtTO08M5LnM+ljV4QYIYXM07++80CbYX1rU7bZcMl1U46i7h
	rrgTCzwsSKrkvTnWueyJB8C2Kd53vhDOsFeiamADaJi3FerEP+gkR7h1lVe1A9it0rZ4
	+H/+dNHB71cXS1wGZ/3fkIL/R9wdbbYYtSS704PajQBUmttGW6KFTJKCVAXnWTNC1oVa
	nPNaKRL0fpgNzgJN9tiAYO612tamA9WpZlL0Kfrq6zMwFAQ8tgIUtqaamvZZ2ElDv1Uy
	qkshc0LsFpBTJlAGoMsTW4JDA/5lnqJj54vNTW8tVB6L66AkJkxv1ywbIsjlfkwc7VFK
	Vy5g==
X-Gm-Message-State: APjAAAXZaR5gUWNJEsI5lugEJhDursgUqnCjoFA5BV4j6/EBpoJHLfh1
	dfd9FYfTeCEVSQf9MGIbWoLNEzg6cxsauElaL2Q=
X-Google-Smtp-Source: APXvYqyfSXorBo+2OB7jcZe+bDeTZM1uEL5EhhXbJyPrx6Yhfa0iTPJS0fAFIsE0uvGHocU1ATrKtRFN/jrvSidp6Hg=
X-Received: by 2002:a92:d8c4:: with SMTP id l4mr763144ilo.122.1574385403827;
	Thu, 21 Nov 2019 17:16:43 -0800 (PST)
MIME-Version: 1.0
References: <20191121182410.2803533-1-raj.khem@gmail.com>
	<CALbNGRQRuBvyA24+TagxbHPiEY-ALEBA9PMH4tCCG_Qj7oKN9A@mail.gmail.com>
In-Reply-To: <CALbNGRQRuBvyA24+TagxbHPiEY-ALEBA9PMH4tCCG_Qj7oKN9A@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Thu, 21 Nov 2019 17:16:32 -0800
Message-ID: <CANx9H-ApxJe+DkfuJ740_ynVGsY830imBeZLcLYJm=KcEETtrg@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] nodejs: libatomic patch should be target specific
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
X-List-Received-Date: Fri, 22 Nov 2019 01:16:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 21, 2019 at 12:49 PM Andreas M=C3=BCller <schnitzeltony@gmail.c=
om>
wrote:

> On Thu, Nov 21, 2019 at 7:24 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > host usually are using gcc/x86_64/aarch64 and all of them have gcc whic=
h
> > can support atomic intrinsics, but not all of them install libatomic by
> > default e.g. centos-7, so asking for libatomic unconditionally may not
> > work always
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Fell over this today on Fedora  and had to install libatomic. So
>
> Acked--by: Andreas M=C3=BCller <schnitzeltony@gmail.com>


I think the same on Fedora-29

Acked-by: Tim Orling <timothy.t.orling@linux.intel.com>

>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

