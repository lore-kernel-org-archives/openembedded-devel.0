Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <giuseppe.condorelli@gmail.com>) id 1Rd04f-0003B3-9G
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Dec 2011 14:49:45 +0100
Received: by iakh37 with SMTP id h37so6691445iak.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Dec 2011 05:42:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=yRQ5t7vOkWh2FJG1/EM+87WMmEn4dpRT583T8UuiryA=;
	b=L0vwOCmJg/hvmbCbznZYM8rzpCdGx18n+y5bZ/FHG0IkpjC9Y0vWMLGmufMiWEHPe1
	ggHlhdLfcoKd+18Zcj9QRulbA/3KsIajR7k1X1AFztrciS0tfVtZx87YQ/ZjWUZa7cOr
	h6J+J2Ap8WkpO1EnFihwBMEhKjCS4QeACneZE=
MIME-Version: 1.0
Received: by 10.50.188.129 with SMTP id ga1mr2426007igc.69.1324388553243; Tue,
	20 Dec 2011 05:42:33 -0800 (PST)
Received: by 10.231.3.70 with HTTP; Tue, 20 Dec 2011 05:42:33 -0800 (PST)
In-Reply-To: <5552958045648051101@unknownmsgid>
References: <CAOHjBZtWd8-_xgqbzx=jBjA4=tRD3CHJ62YiA=dzFr9QsUzaVA@mail.gmail.com>
	<CAMKF1srRe_ksYrw3Zq+ScS0ED12e7QoeGurtynybsFOvACH1-Q@mail.gmail.com>
	<1845722180277205462@unknownmsgid> <13795657.zIHqNnJ6yk@helios>
	<5552958045648051101@unknownmsgid>
Date: Tue, 20 Dec 2011 14:42:33 +0100
Message-ID: <CAOHjBZv6UcZcc1CNqzUEinbmUWeKw85AjoADWKE_gM0m9VEOMw@mail.gmail.com>
From: Giuseppe Condorelli <giuseppe.condorelli@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Tue, 20 Dec 2011 13:49:45 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi All,

looking at the link Paul suggested me I cannot see anything that can be
address me to solve my problem.
The lone modification I can see here is the prefix, exec_prefix, etc...
setting inside micro.conf file, but this
is not good to help me.
I'm showing an example:

1) imagine we have a package rpm, for example zlib
2) rpm -qpli zlib.rpm (let me to call the package in this manner) will show
a list of the included files plus other info.
   All of those will have absolute path (/usr, etc...)
3) What I need is to change this to a prefixed one (for example
/opt/test/distro/usr, etc...)
4) I need this for all package in my distribution
5) Is there a solution for this?

Thanks for all people that will try to help me.
Best Regards,
Giuseppe

2011/12/16 Giuseppe Condorelli <giuseppe.condorelli@gmail.com>

> Many thanks Paul, I'll at it soon and I'll let you know.
>
> Cheers,
> Giuseppe
>
> Il giorno 16/dic/2011, alle ore 23:41, Paul Eggleton
> <paul.eggleton@linux.intel.com> ha scritto:
>
> > On Friday 16 December 2011 23:35:37 Giuseppe Condorelli wrote:
> >> I'm sorry but I'm not able to find the meta-micro file. I searched it
> >> under meta directory without success (openembedded git repos).
> >> Any suggestions?
> >
> > FYI you can find a link to it on the layer index page:
> >
> > http://www.openembedded.org/wiki/LayerIndex
> >
> > Cheers,
> > Paul
> >
> > --
> >
> > Paul Eggleton
> > Intel Open Source Technology Centre
>

