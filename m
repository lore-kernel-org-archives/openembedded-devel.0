Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RbgIl-0001UA-29
	for openembedded-devel@lists.openembedded.org;
	Fri, 16 Dec 2011 23:30:51 +0100
Received: by lami14 with SMTP id i14so1614391lam.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Dec 2011 14:23:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=sX+nLjktOtKToMKJryujHkOsBAvDHJSkjHr/MHWSeeI=;
	b=FG4OGCtY2E6zNKBIGDLvD46lMpUnEm6ogl407DXzm84ddbcBDMWkVrNNsxhb8ZbDXr
	1NEO79xa+AlNmM+nDiFQH6m6eEzBTdZOhiNZM9+tRNk10lHsDcna4YI7Zs6sCuPwkF++
	x57W4aC1dkpPWIPvN9ExBaRsgvHFv4Z9nhPKw=
Received: by 10.152.104.103 with SMTP id gd7mr9268577lab.34.1324074231288;
	Fri, 16 Dec 2011 14:23:51 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.24.36 with HTTP; Fri, 16 Dec 2011 14:23:19 -0800 (PST)
In-Reply-To: <-6031077886875684187@unknownmsgid>
References: <CAOHjBZtWd8-_xgqbzx=jBjA4=tRD3CHJ62YiA=dzFr9QsUzaVA@mail.gmail.com>
	<20111216220119.GE28832@sakrah.homelinux.org>
	<-6031077886875684187@unknownmsgid>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 16 Dec 2011 14:23:19 -0800
Message-ID: <CAMKF1srRe_ksYrw3Zq+ScS0ED12e7QoeGurtynybsFOvACH1-Q@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Fri, 16 Dec 2011 22:30:51 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Dec 16, 2011 at 2:12 PM, Giuseppe Condorelli
<giuseppe.condorelli@gmail.com> wrote:
> Thanks so much!!!
> Do you mean I have to write a unified (in distro/machine conf dir)
> do_install to be propagated to all the built packages?
>
> Regards,
> Giuseppe
>
> Il giorno 16/dic/2011, alle ore 23:01, Khem Raj <raj.khem@gmail.com> ha scritto:
>
>> On (16/12/11 10:36), Giuseppe Condorelli wrote:
>>> Hi All,
>>>
>>> I need to package against a different prefix using rpm. I mean, I don't
>>> want to have to files located with
>>> the absolute path (i.e. /usr/lib/ etc...) but I need to have them under a
>>> specified path.
>>> How can I obtain this? I saw conf/bitbake.conf contains many variable to be
>>> accordingly set (prefix, exec_prefix, etc...)
>>> but if I modify them the build will be broken. Also, looking at the
>>> distro/<distros>.conf files I have not seen nothing similar.
>>> Please can you suggest me something to solve my issue?

hmm I thought you wanted to do it just for one package.
do you want whole image to be relocated to this location.
the see how micro does it look at meta-micro

>>
>> write do_install so they get installed in the new location.



>>
>>>
>>> Thanks,
>>> Giuseppe
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>> --
>> -Khem
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


