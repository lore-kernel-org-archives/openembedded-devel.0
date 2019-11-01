Return-Path: <schnitzeltony@gmail.com>
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	by mail.openembedded.org (Postfix) with ESMTP id BDEE97FCA2
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Nov 2019 18:10:58 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id c11so11795711iom.10
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Nov 2019 11:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=eXiE7w7JmFSoweBamCYVmH7eo9nLBECA55OyeYlHIp0=;
	b=XAbDl3368qg1ejjowWrl0YSBC70seoOJdYDyXwgOz4Vz6S6cuJLNHJe+0YCqF013KT
	Piy1BTHUd+S5W0PcEV/FE1gnfvUsF0y0LtdPF38VKnw17RBDbm17ClnfJmR4ZhD90nFk
	G7QFI11XxMBIcCg07ipbu73E9cWCblivZwZ/a+GEs34BOuBNUgVCO45X+OyOPHvRDTQM
	xQD/+E8UR0Yd/NndR30WE4v415X7WDNklivBATR0aBkAd66pjqFWlN55nPH8YejMzj6u
	niVzZORnwAXZKKoBUz/UenL6PyyrU9H3e6kHHPvbpBAvnMaPHWq1V0bEkd5du55gRTs0
	KZFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=eXiE7w7JmFSoweBamCYVmH7eo9nLBECA55OyeYlHIp0=;
	b=I7h7vUS9jUKxdyAXikVwujKC+0BEm991hhlTD2A5pmgXVprLQ6fSCJ4+y1U64DeyLA
	pozcGlapcDN+gKqwDmuOmmlIOFPc8xd6/IaCAEER3DLVoz4682dA1vXsVdDgnkSWcmz6
	ohln8e2R+6qVC3Rqf5Miknd5AQL6fdnMRePQtPpE3lmbbUFu6YiC392BnQ0wIc62kwkN
	PqBCnus2pplGZdlMg2gYQkhSalxBgogMAKRVQ3XuIhCQx4aHC2ox13tappZ5wjPMSG87
	Fr4X1FFHyul6dSpA6hgCx1t1Ptwzae57wfLAhEYNOXijhxuOW/K4e4cr8SH4QFxZS839
	4vPg==
X-Gm-Message-State: APjAAAUG9QM4VeZUIiFtVZHNxrzVB76AWrmC3zywym97+reOf8y1s3Gv
	uCJRBgJW0KFzM8yLkeZgwYbE7B3VBbBwD0w44vU=
X-Google-Smtp-Source: APXvYqycs8HZvUYmC9Lzyerw5fetMznhvWXLuZQOWKYREhA4vqdTpT9W4GCVsx4tqFyqewHu0aDQ8NyszbSHCLH+dsw=
X-Received: by 2002:a5e:d806:: with SMTP id l6mr8464556iok.299.1572631859669; 
	Fri, 01 Nov 2019 11:10:59 -0700 (PDT)
MIME-Version: 1.0
References: <20191029010253.5784-1-schnitzeltony@gmail.com>
	<20191029010253.5784-4-schnitzeltony@gmail.com>
	<CAMKF1srqmOG5k8mfAZ04YH0DUUROSLUCVLwMGUrRQ-=Y2yeFsg@mail.gmail.com>
	<CALbNGRQn151mjXniXnS+Edi79VMomdaUiP9-hbzzMo30dAwCog@mail.gmail.com>
	<CAMKF1sq-2rVXqmYeVNTqjaB7DsKFJr9+u095P826_N3E2RhNMw@mail.gmail.com>
In-Reply-To: <CAMKF1sq-2rVXqmYeVNTqjaB7DsKFJr9+u095P826_N3E2RhNMw@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Fri, 1 Nov 2019 19:10:48 +0100
Message-ID: <CALbNGRRmNDE-i7RXY8562DmpymCmX-18m6DjDo0bo5=O_x6E-Q@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH v2 4/4] ibus: initial add 1.5.21
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
X-List-Received-Date: Fri, 01 Nov 2019 18:10:58 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 1, 2019 at 6:04 PM Khem Raj <raj.khem@gmail.com> wrote:
> > > Hi Andreas
> > >
> > > I see this fail on ubuntu 18.04 host
> > > https://errors.yoctoproject.org/Errors/Details/275175/
> > See what I can do - is it a server 'only' installation?
> >
>
> thats right. Its minimal server install + OE prerequisites
>
> > Andreas
Think I got it: By the tailored build I created a race condition which
tends to pop up on high numbers of threads for make: Your server
builds with make -j 16.

Will create a V2 building ibusmarshalers.* explicitly and run tests
with high numbers for make to see if there are others.

Tailoring build is nasty business but necessary in our project sometimes...

Cheers

Andreas

