Received: from mail-gg0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <giuseppe.condorelli@gmail.com>) id 1SUI5F-0005Iz-Sw
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 May 2012 15:46:38 +0200
Received: by ggnp4 with SMTP id p4so1745173ggn.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 May 2012 06:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=d7vgq8pa6oIfACo7IzLwSBqfDSC6aCOqaMNkPhdkb2Q=;
	b=FHK2NW02l6w6EJ82JhvHlVzDzcn91mbRAC/mE1yDw+iIzOc5EeH4iWEp1GJIlhHPht
	pXva69vxWymIuRRUToqEoKpwVw2IqLaXzr2hMpravCADMEqTrsfgTmY1ZzXTHKFE+SdL
	2CLXE1qpqZOMXh8r6ZoyXWtexxjbsyR40oY0Q2mB8UEb+QppJX2v8qvnv8yq5kkrAdrU
	E4c/9+MKZZ1sAojZfZ5zSj1/oEDvk0cdGg+SIzsJsYYEZVK5FFn0P71NyVLGkPTHwrXN
	7iDYPfGHiN7Dendv/pfXg4dQspki6HLG7Tgp81VBnyQm1b7TZFvayPCEfqzZHQKNdE9o
	HrSg==
MIME-Version: 1.0
Received: by 10.50.185.232 with SMTP id ff8mr2374131igc.5.1337088997112; Tue,
	15 May 2012 06:36:37 -0700 (PDT)
Received: by 10.231.241.3 with HTTP; Tue, 15 May 2012 06:36:37 -0700 (PDT)
In-Reply-To: <4FB25A88.3000100@mlbassoc.com>
References: <CAOHjBZto_R5S777po-K8mXG-Z9XLYNVzE05-kq_TOCeo4YgyoQ@mail.gmail.com>
	<4FB2575C.3070407@mlbassoc.com>
	<CAOHjBZtfhFoZN=Hva3W_0yf7sRNS0xymrj1MHER9yHEeW=RHyw@mail.gmail.com>
	<4FB25A88.3000100@mlbassoc.com>
Date: Tue, 15 May 2012 15:36:37 +0200
Message-ID: <CAOHjBZv+ox9dJh+g1rjFqqnYvcQvLuRboV8ANZssKXTv0NSO7Q@mail.gmail.com>
From: Giuseppe Condorelli <giuseppe.condorelli@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [oe-core] Packages broken URL
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
X-List-Received-Date: Tue, 15 May 2012 13:46:38 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

That's right, but why the git.inc contains a undownloadable url?
This can create a mistake in my opinion.

2012/5/15 Gary Thomas <gary@mlbassoc.com>

> On 2012-05-15 07:19, Giuseppe Condorelli wrote:
>
>> For example building git-1.7.7 fails fetching the source.
>>
>
> Works fine for me:
>
>  $ wget http://git-core.googlecode.**com/files/git-1.7.7.tar.gz<http://gi=
t-core.googlecode.com/files/git-1.7.7.tar.gz>
>  --2012-05-15 07:29:43--  http://git-core.googlecode.**
> com/files/git-1.7.7.tar.gz<http://git-core.googlecode.com/files/git-1.7.7=
.tar.gz>
>  Resolving git-core.googlecode.com... 209.85.225.82
>  Connecting to git-core.googlecode.com|209.85.225.82|:80..**. connected.
>  HTTP request sent, awaiting response... 200 OK
>  Length: 3475448 (3.3M) [application/octet-stream]
>  Saving to: =93git-1.7.7.tar.gz=94
>
>  100%[=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D**=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D**=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D>]
> 3,475,448    477K/s   in 7.3s
>
>  2012-05-15 07:29:50 (466 KB/s) - =93git-1.7.7.tar.gz=94 saved
> [3475448/3475448]
>
> What error/problem are you having?
>
>  2012/5/15 Gary Thomas<gary@mlbassoc.com>
>>
>>  On 2012-05-15 07:02, Giuseppe Condorelli wrote:
>>>
>>>  Hi All,
>>>>
>>>> there are a number of packages having a broken SRC_URI, for example gi=
t.
>>>> Has someone met this issue?
>>>> For sure we can correct those links adding a dedicated .bbappend file
>>>> for
>>>> each failing package but
>>>> I think we could also update the main package fixing the errors.
>>>>
>>>>
>>> Details?  People build using oe-core all the time, so providing
>>> more info on the problems _you_ are having would go a long way
>>> towards finding&  fixing them.
>>>
>>
> --
> ------------------------------**------------------------------
> Gary Thomas                 |  Consulting for the
> MLB Associates              |    Embedded world
> ------------------------------**------------------------------
>
> ______________________________**_________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.**openembedded.org<Openembedded-devel@lists.open=
embedded.org>
> http://lists.linuxtogo.org/**cgi-bin/mailman/listinfo/**openembedded-deve=
l<http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>
>

