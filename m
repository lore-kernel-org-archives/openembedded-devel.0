Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id E6B786007A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Apr 2017 07:16:01 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id r190so39766896wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Apr 2017 00:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=YtErB2OlMAW25WAjuxmI8KKxwh0BDzghPhKveIc+RyE=;
	b=Br7h1TEQghNXQiJL30xJDSTNbOPP7P7cfl751xkIS07Re5HTLVR9/C9MiUzBgBilqH
	spqqljdFMwO0v5t1TNW6yi+DeXm7SrZkgstNIUO+IUda8SzWV4vLYjma2S8s9Wi3+GNB
	VmWVDGk72L4j5bM2Bg76dM+u2xyvip2ZPgmmO7xkGvhM9xl0jIZGoMP0r7VTf+4hz3ZH
	MpYTOsWSsCjAB7PmLscvNoJdqrkwbRmVEZE/EtEyR6tfCzDjypRvAREWQVJNPiIzGMEv
	6o5TUx9E8aCT6nfsY3cwFKARfdpt2vB4md+Ns/VE4dT82RSNI29o2jXElMH/iaJIeigf
	wPtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=YtErB2OlMAW25WAjuxmI8KKxwh0BDzghPhKveIc+RyE=;
	b=NpEqMgqXOO5waBWv2SBHExNSodQ95D9yqyIVWsxVrLyWluF8I1DdhExBxiicAyQtCa
	1dHZyQrJPrZI/a52t07bMOx7TC+vw4b0phKIOMFnsBSSecc3ofpha9F/VeHjtjbQUrJO
	chy+3T4woCShvwRFpOveEBAGXdwJM97h5TsN5BkwyUOfSSC1lWq2+9QioNc0uCzoRdyP
	v+dgsGvkQbBsYNF9fnHighrCKjy5eibLP7WW0ubiT/AmNriKYkhVFV+KAm1vE6NTAEkt
	3tFEAiBJaNzgMVpAv2PyN3by9rqox47l3PUoAY4J9/+U3bApAfr8Huu3t0kbaYx7j8Zp
	Rm0w==
X-Gm-Message-State: AN3rC/752sj+653SaJGxaN7xkghUbIu98dlaQ7Gcu7VTIZfEvRiREyKe
	fg1QgHO7nlUuEykAYhT+WN++bh7p2g==
X-Received: by 10.28.146.11 with SMTP id u11mr1533738wmd.124.1492672562426;
	Thu, 20 Apr 2017 00:16:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.148.54 with HTTP; Thu, 20 Apr 2017 00:16:01 -0700 (PDT)
In-Reply-To: <CAMKF1sqP-mQDReWq=Ttt5+RHB01DHHjdDTPKhuk4tSRT=S4qSA@mail.gmail.com>
References: <20170418182142.27253-1-raj.khem@gmail.com>
	<20170418182142.27253-27-raj.khem@gmail.com>
	<CAMKF1sqP-mQDReWq=Ttt5+RHB01DHHjdDTPKhuk4tSRT=S4qSA@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 20 Apr 2017 09:16:01 +0200
Message-ID: <CA+chaQfS27T2RuU4Wj-zGd7msSOrpuxysTxys6mocPFy+tLW1w@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>, Jose Lamego <jose.a.lamego@linux.intel.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][ 27/32] mosh: Upgrade to 1.3.0
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
X-List-Received-Date: Thu, 20 Apr 2017 07:16:09 -0000
Content-Type: text/plain; charset=UTF-8

OK, I took it from there. There were 2 more patches in that branch:
pick 58ec00043 ne10: Fix build errors on cortex-a7 cpus
pick 49de0a778 live555: Update from 20130430  to 20170410
which I haven't seen on ML, will keep them for next build, but if you want
them to be applied send them to ML as well.

Jose: can you please check why patchwork didn't pick this series (twice)?

Thanks


On Wed, Apr 19, 2017 at 6:51 PM, Khem Raj <raj.khem@gmail.com> wrote:

> I sent the series but its not showing up in patchwork again, I have no
> idea whats going on. Meanwhile you can cherry-pick them from
>
> https://github.com/kraj/meta-openembedded/tree/kraj/master
>
> On Tue, Apr 18, 2017 at 11:21 AM, Khem Raj <raj.khem@gmail.com> wrote:
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta-oe/recipes-connectivity/mosh/{mosh_1.2.4.bb => mosh_1.3.0.bb} | 5
> ++---
> >  1 file changed, 2 insertions(+), 3 deletions(-)
> >  rename meta-oe/recipes-connectivity/mosh/{mosh_1.2.4.bb =>
> mosh_1.3.0.bb} (93%)
> >
> > diff --git a/meta-oe/recipes-connectivity/mosh/mosh_1.2.4.bb
> b/meta-oe/recipes-connectivity/mosh/mosh_1.3.0.bb
> > similarity index 93%
> > rename from meta-oe/recipes-connectivity/mosh/mosh_1.2.4.bb
> > rename to meta-oe/recipes-connectivity/mosh/mosh_1.3.0.bb
> > index e4d5b69bc..9fc8435ee 100644
> > --- a/meta-oe/recipes-connectivity/mosh/mosh_1.2.4.bb
> > +++ b/meta-oe/recipes-connectivity/mosh/mosh_1.3.0.bb
> > @@ -15,9 +15,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=
> d32239bcb673463ab874e80d47fae504"
> >  DEPENDS = "protobuf-native protobuf ncurses zlib libio-pty-perl openssl
> libutempter"
> >
> >  SRC_URI = "http://mosh.mit.edu/mosh-${PV}.tar.gz"
> > -
> > -SRC_URI[md5sum] = "c2d918f4d91fdc32546e2e089f9281b2"
> > -SRC_URI[sha256sum] = "e74d0d323226046e402dd469a17607
> 5fc2013b69b0e67cea49762c957175df46"
> > +SRC_URI[md5sum] = "d961276995936953bf2d5a794068b076"
> > +SRC_URI[sha256sum] = "320e12f461e55d71566597976bd944
> 0ba6c5265fa68fbf614c6f1c8401f93376"
> >
> >  inherit autotools pkgconfig
> >
> > --
> > 2.12.2
> >
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

