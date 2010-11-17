Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PInk4-0000TO-Nd
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Nov 2010 20:32:46 +0100
Received: by gyf3 with SMTP id 3so1414333gyf.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Nov 2010 11:31:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=Uha0eGDBLJQpT42RuANhKHGizeNkQ7syYPdfvUnIWXg=;
	b=JyYY4YLRtWUUgSvP7m95s8SAFx0kIgu5Ya00cuzeNIeAGPh2hZA7EfzsflVnQfVPLL
	qw9UJTiiTEbcmI55Hh39HJwd/gTr/CRSaUnbaaeXbWVJ4ovpfJHo0c6944y4P7iaSpar
	QiORS69ufgF6ySkrdtYtLgTfe0FEiP8v+81go=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=EPiCzHea2IApIN3yTvnf8psUI676AAhkfXOjITjUT+T4TbSkfZXnqcWbVov6N93UqI
	yI5bcjUhBv8/Jp1oUbKokJv/4VFI3e/ZZI9khYS4XtgzKLFfWKAzZ6HFToKSkoVIHgwb
	MZvvc7jTSKEIwXEH4xnYWJJKesBOY9gdw79D0=
Received: by 10.91.51.19 with SMTP id d19mr12029248agk.183.1290022276715; Wed,
	17 Nov 2010 11:31:16 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.120.8 with HTTP; Wed, 17 Nov 2010 11:30:56 -0800 (PST)
In-Reply-To: <4CE3EF4C.2050105@gmail.com>
References: <4CE3D70F.2000101@gmail.com>
	<AANLkTin0i5rSxwA8Q3+jN7tLR-Rn3JEei6D==1CjKOh9@mail.gmail.com>
	<4CE3EF4C.2050105@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 17 Nov 2010 11:30:56 -0800
Message-ID: <AANLkTin2v1+3UP_rk593i+V4=e4QeKgPinAkoWNwY0BO@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Error: git was compiled without libcurl support
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
X-List-Received-Date: Wed, 17 Nov 2010 19:32:57 -0000
X-List-Received-Date: Wed, 17 Nov 2010 19:32:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 17, 2010 at 7:05 AM, Marco Cavallini <koansoftware@gmail.com> w=
rote:
> Frans Meulenbroeks ha scritto, Il 17/11/2010 15:01:
>> 2010/11/17 Marco Cavallini <koansoftware@gmail.com>:
>>> Hi, I just tried installing OE retrieving it from git
>>> git clone git://git.openembedded.org/openembedded
>>>
>>> bitbake version 1.10.0
>>> branch master
>>> MACHINE=3Dakita time bitbake minimal-image
>>> DISTRO =3D "angstrom-2008.1"
>>> host machine : Debian lenny x86_64-linux
>>>
>>> I face to an unexpected error
>>> "Error: git was compiled without libcurl support"
>>>
>>> I successfully built it until November 2nd but since last Saturday I
>>> wonder if it should build or if is normal this behavoiur.
>>> log: http://paste.ubuntu.com/533450/
>>>
>>
>> you're using git from the host, guess that got changed one way or anothe=
r.
>>
>
> Frans,
> thank you for answering.
>
> I tried removing ASSUME_PROVIDED git-native from my config (local.conf)
> in this case bitbake create git and use it instead of the host provided.
> Then I did
>
> =C2=A0bitbake -b git-native
>
> Anyway there are errors again
> http://tinderbox.openembedded.net/packages/985559/
>
can you post your local.conf and additionally what version of autoconf
is installed on your build host.

>
> Is anybody out there building with Debian Lenny 64 ?
> TIA
>
> /marco
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


