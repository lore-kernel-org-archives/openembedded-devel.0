Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <giuseppe.condorelli@gmail.com>) id 1Rfq77-0004YM-37
	for openembedded-devel@lists.openembedded.org;
	Wed, 28 Dec 2011 10:48:02 +0100
Received: by iakh37 with SMTP id h37so18189875iak.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Dec 2011 01:40:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=BEdzae8k+n+ZLrMRi4muPrLG1zwmOt7x3p7oyPrOHCQ=;
	b=KvhumSDWdotbpr/8lVJ/DME1QKFMeYPWbuPNmW2b4h2MgUAQHajHrA41FVZXS913XQ
	+W+0bHvQ1mMJVA/MrFcyjsLnXLJ97G+d5BPOfp2c1qVRGdEPG8o5AHYcL0Ej79zGz3Br
	ypAoU3cuUR1vcE+SF2naIRe4PBRQcmv38IbJM=
MIME-Version: 1.0
Received: by 10.43.58.10 with SMTP id wi10mr31767278icb.57.1325065247270; Wed,
	28 Dec 2011 01:40:47 -0800 (PST)
Received: by 10.231.3.70 with HTTP; Wed, 28 Dec 2011 01:40:47 -0800 (PST)
In-Reply-To: <CAOHjBZv6UcZcc1CNqzUEinbmUWeKw85AjoADWKE_gM0m9VEOMw@mail.gmail.com>
References: <CAOHjBZtWd8-_xgqbzx=jBjA4=tRD3CHJ62YiA=dzFr9QsUzaVA@mail.gmail.com>
	<CAMKF1srRe_ksYrw3Zq+ScS0ED12e7QoeGurtynybsFOvACH1-Q@mail.gmail.com>
	<1845722180277205462@unknownmsgid> <13795657.zIHqNnJ6yk@helios>
	<5552958045648051101@unknownmsgid>
	<CAOHjBZv6UcZcc1CNqzUEinbmUWeKw85AjoADWKE_gM0m9VEOMw@mail.gmail.com>
Date: Wed, 28 Dec 2011 10:40:47 +0100
Message-ID: <CAOHjBZs+qDj-Rz-rMeMXrAPPDq2huA2cobNBv0cK7qncejMk-g@mail.gmail.com>
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
X-List-Received-Date: Wed, 28 Dec 2011 09:48:02 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi All,

any advices?
Thanks again,
Giuseppe

2011/12/20 Giuseppe Condorelli <giuseppe.condorelli@gmail.com>

> Hi All,
>
> looking at the link Paul suggested me I cannot see anything that can be
> address me to solve my problem.
> The lone modification I can see here is the prefix, exec_prefix, etc...
> setting inside micro.conf file, but this
> is not good to help me.
> I'm showing an example:
>
> 1) imagine we have a package rpm, for example zlib
> 2) rpm -qpli zlib.rpm (let me to call the package in this manner) will
> show a list of the included files plus other info.
>    All of those will have absolute path (/usr, etc...)
> 3) What I need is to change this to a prefixed one (for example
> /opt/test/distro/usr, etc...)
> 4) I need this for all package in my distribution
> 5) Is there a solution for this?
>
> Thanks for all people that will try to help me.
> Best Regards,
> Giuseppe
>
> 2011/12/16 Giuseppe Condorelli <giuseppe.condorelli@gmail.com>
>
>> Many thanks Paul, I'll at it soon and I'll let you know.
>>
>> Cheers,
>> Giuseppe
>>
>> Il giorno 16/dic/2011, alle ore 23:41, Paul Eggleton
>> <paul.eggleton@linux.intel.com> ha scritto:
>>
>> > On Friday 16 December 2011 23:35:37 Giuseppe Condorelli wrote:
>> >> I'm sorry but I'm not able to find the meta-micro file. I searched it
>> >> under meta directory without success (openembedded git repos).
>> >> Any suggestions?
>> >
>> > FYI you can find a link to it on the layer index page:
>> >
>> > http://www.openembedded.org/wiki/LayerIndex
>> >
>> > Cheers,
>> > Paul
>> >
>> > --
>> >
>> > Paul Eggleton
>> > Intel Open Source Technology Centre
>>
>
>

