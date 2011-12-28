Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <giuseppe.condorelli@gmail.com>) id 1Rfvje-0006sB-06
	for openembedded-devel@lists.openembedded.org;
	Wed, 28 Dec 2011 16:48:10 +0100
Received: by iakh37 with SMTP id h37so18588936iak.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Dec 2011 07:40:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=MRnnP9Lnj10hnWv2z5s37xnLtZKIZPZuxfSczlrZJh0=;
	b=uZI5EyJGfK63gUp3ElurkrtiTMKky0blZc0fZHoIz9MDDFK/jGBMl+z+5rqYhR+w8Z
	j/NNZNQ6SiQsGVwpH1AJvb9YLeD5pTVwI/JPViqjnzTnZpBQbobYJaedTwaDCXhnC1Ho
	p/D+WH4bi8c/XqNA+EaTixmrrBp4nCpJeYCpI=
MIME-Version: 1.0
Received: by 10.50.100.164 with SMTP id ez4mr16870765igb.12.1325086855185;
	Wed, 28 Dec 2011 07:40:55 -0800 (PST)
Received: by 10.231.3.70 with HTTP; Wed, 28 Dec 2011 07:40:55 -0800 (PST)
In-Reply-To: <10519823.CSrPkrPaVF@helios>
References: <CAOHjBZtWd8-_xgqbzx=jBjA4=tRD3CHJ62YiA=dzFr9QsUzaVA@mail.gmail.com>
	<CAOHjBZv6UcZcc1CNqzUEinbmUWeKw85AjoADWKE_gM0m9VEOMw@mail.gmail.com>
	<CAOHjBZs+qDj-Rz-rMeMXrAPPDq2huA2cobNBv0cK7qncejMk-g@mail.gmail.com>
	<10519823.CSrPkrPaVF@helios>
Date: Wed, 28 Dec 2011 16:40:55 +0100
Message-ID: <CAOHjBZtRqvM+DD1_JwuDs2MzWXF=DK9Sg-AtSwNpQsTq--+itw@mail.gmail.com>
From: Giuseppe Condorelli <giuseppe.condorelli@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Question about package prefix
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 28 Dec 2011 15:48:10 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi Paul,

many thanks for your support (see below).

2011/12/28 Paul Eggleton <paul.eggleton@linux.intel.com>

> On Wednesday 28 December 2011 10:40:47 Giuseppe Condorelli wrote:
> > any advices?
> > Thanks again,
> > Giuseppe
> >
> > 2011/12/20 Giuseppe Condorelli <giuseppe.condorelli@gmail.com>
> > > looking at the link Paul suggested me I cannot see anything that can be
> > > address me to solve my problem.
> > > The lone modification I can see here is the prefix, exec_prefix, etc...
> > > setting inside micro.conf file, but this
> > > is not good to help me.
> > > I'm showing an example:
> > >
> > > 1) imagine we have a package rpm, for example zlib
> > > 2) rpm -qpli zlib.rpm (let me to call the package in this manner) will
> > > show a list of the included files plus other info.
> > >
> > >    All of those will have absolute path (/usr, etc...)
> > >
> > > 3) What I need is to change this to a prefixed one (for example
> > > /opt/test/distro/usr, etc...)
> > > 4) I need this for all package in my distribution
>
> So I'm not entirely sure I understand why this doesn't solve your problem.
> For
> your purposes you should have your own distro config file
> (conf/distro/distroname.conf) and set DISTRO = "distroname" in local.conf,
> and
> AFAICT then you should just need to set the *_prefix variables in the
> distro
> config as micro.conf does. You can look at classes/nativesdk.bbclass in
> OE-Core
> for another example of setting these prefixes.
>

What micro.conf does is to put all the *_prefix variables to "".
Also to create an sdk is not my scope, I need to build a base-image distro
and, running "bitbake base-image", this will not use nativesdk.bbclass
AFAIK.
I tried to modify *_prefix variables but, everytime, build failed at a
given point.
I repeat, what I need is to obtain the rpm packages with %files containing
relocated information (see above).

What's your idea?
Regards,
Giuseppe

>
> Cheers,
> Paul
>
> --
>
> Paul Eggleton
> Intel Open Source Technology Centre
>

