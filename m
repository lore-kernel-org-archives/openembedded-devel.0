Return-Path: <behanw@converseincode.com>
Received: from mail-pg0-f48.google.com (mail-pg0-f48.google.com [74.125.83.48])
	by mail.openembedded.org (Postfix) with ESMTP id E615771BF2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Aug 2017 15:16:58 +0000 (UTC)
Received: by mail-pg0-f48.google.com with SMTP id v77so4152027pgb.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Aug 2017 08:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=converseincode.com; s=google;
	h=mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=Zczy12r/z5mM9MGSbe1gXqrcsb2zIy776vcwuCAmVAs=;
	b=En1NhiF1mnO7hm17zOKeeHZemMbCFWI97e0wEvTK6Edx2hSEkwTFHwwqvwKMupbf5g
	qn63u1nER2ZacXnf9OQ98To0NlvWcP3mRIkJll6y5B6SbcY3/pc/48cPdi8jCSlljTI3
	AZadEHBEQpCjw13OoOnhJaD1RSRvyvYD1xDbE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=Zczy12r/z5mM9MGSbe1gXqrcsb2zIy776vcwuCAmVAs=;
	b=Dfmf4mAgAAhegO7dY28+UT6asNVc1O0WiswAIzXIHqv3puY5psfGwWrPoWOLR7QcLj
	hOwHnCz1P0e+B2FhDlNQLpeaUdoZ+BstGMyjXES7ekDIogcpydtnA50T8zvi77KgkDEw
	FZselhJxbfsevkUXNiaM7HUku1GpvOv/w/20/x/aAvZ1xIP62m+lrcukEu0gfom2hdie
	PFLQYgvV5pA+HyFlf+HaCv/iqRC+6k/JBnQMXsVUYgC5GK2LRmt00VT2rFaapEuyNpJn
	S2uZm4+W3KCCjz0B4TdL5tMKyOHW8RGNsznj0umd0H2eBrEKD8VW73/6eVD7hyTo4JUN
	upLw==
X-Gm-Message-State: AHYfb5j7+jc7bvqFi43TcKmotp8fa8Go4nN8iwQm776sbIp2I3ELqPQr
	WxMj39v7ZGoYVhR4
X-Received: by 10.84.210.40 with SMTP id z37mr13523999plh.265.1502378220109;
	Thu, 10 Aug 2017 08:17:00 -0700 (PDT)
Received: from [192.168.120.81] (d207-6-122-147.bchsia.telus.net.
	[207.6.122.147]) by smtp.gmail.com with ESMTPSA id
	e5sm14282812pgn.55.2017.08.10.08.16.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 Aug 2017 08:16:59 -0700 (PDT)
Mime-Version: 1.0 (1.0)
From: Behan Webster <behanw@converseincode.com>
X-Mailer: iPhone Mail (14G60)
In-Reply-To: <CANx9H-AJpd0OpMG13ps89kQ7bpzH3b3GdN5xzfhVPTW3EcdjmA@mail.gmail.com>
Date: Thu, 10 Aug 2017 08:16:58 -0700
Message-Id: <7106F072-3844-419D-9153-7A159AD8B223@converseincode.com>
References: <73F79297-B92A-4F4D-A3F1-A3F43CD39DAE@converseincode.com>
	<1502288526.1934.39.camel@linux.intel.com>
	<879E7479-CCE4-47D5-BB40-E789BA93185C@converseincode.com>
	<CANx9H-AJpd0OpMG13ps89kQ7bpzH3b3GdN5xzfhVPTW3EcdjmA@mail.gmail.com>
To: Tim Orling <ticotimo@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>,
	openembedded-devel@lists.openembedded.org
Subject: Re: Alpha release of check-requirement.sh
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
X-List-Received-Date: Thu, 10 Aug 2017 15:16:59 -0000
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

It is in a git repo. The same git repo as my other tool. It's just entangled=
 in a number of other things right now that I need to disentangle. There is 5=
 years of history in building this in that repo. Also 5 years of seeing what=
 works in precisely the use case this solves: checking the requirements of a=
 developer's computer and making sure the right packages are installed so th=
ey can proceed.

The reason it is written in bash, and not python, is because python is not u=
niversally available on all distros out of the box. This is why python is li=
sted in the package list for every distro in the setup documentation. Rememb=
er this isn't about choose your favourite language, it's about using bootstr=
apping a build environment.

There is literally nothing you need to do other than download it and run it o=
n the distros most people use.

I wrote it in bash (and related utilities) because bash is always there. And=
 considering ready-for.sh (what check-requirements.sh is based on) has succe=
ssfully been run (minimally) thousands of times successfully (probably a lot=
 higher since it is also used for the LF MOOC) I stand by this decision.

And again this is not intended to be an OE or YP only thing. Again this is b=
eing maintained alongside an existing tool and shares more than 90% of the c=
ode with ready-for.sh. Moving or rewriting it in $LANGUAGE means essentially=
 forking it.

Behan

Sent from my Mobile Computer which is also a phone

> On Aug 10, 2017, at 1:38 AM, Tim Orling <ticotimo@gmail.com> wrote:
>=20
> So where does it live? It ends up being: run shell script from "somewhere"=
. I know what you mean about git and other requirements, but still it must b=
e sourced from "somewhere". If you add a desire to be version controlled, it=
 then logically lands in a git repo. Or subversion, bazaar or mercurial.
>=20
> Thinking outside the box, we could make it a python (humor me) module inst=
alled from pypi and document how to run it...
>=20
> I tend to use shell scripts as my first draft and then translate to python=
. This usually means a lot of "subprocess" calls and is by no means a silver=
 bullet.
>=20
> Alternatively, it becomes a clickable link on a website. That means nodejs=
. Or perl. Or...
>> On Wed, Aug 9, 2017 at 9:40 PM Behan Webster <behanw@converseincode.com> w=
rote:
>> > On Aug 9, 2017, at 7:22 AM, Leonardo Sandoval <leonardo.sandoval.gonzal=
ez@linux.intel.com> wrote:
>> >
>> > in my opinion, this fits nicely into the oe-core, into the
>> > scripts/contrib folder.
>>=20
>> Keeping it in script/contrib seems odd to me (horse before the cart). One=
 of the requirements for OE is git (or tar) to actually get OE in the first p=
lace.
>>=20
>> I see this as more something some one would run before cloning OE or Poky=
. It=E2=80=99s a replacement for needing to read a long HOWTO on a webpage t=
o get started with OE or YP.
>>=20
>> Behan
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

