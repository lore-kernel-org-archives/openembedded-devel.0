Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OulQF-0008QA-GS
	for openembedded-devel@lists.openembedded.org;
	Sun, 12 Sep 2010 14:12:40 +0200
Received: by iwn2 with SMTP id 2so4109667iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Sep 2010 05:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=kPRa7Vu8sPgvM08PbB46LfAs1VKxXBjIzTknd5Ey1rk=;
	b=L7n5RSEdmJJ+myFGpxUz3nAqLfIJjpeSVcoL2vKWO9G6CmY4/EJRer3FhZXd1Bbxa6
	MOAqh6kwheezbZUFpwIXyMDlsVQHgY/0OAK7eIe9QuT+U2NN1jvEntpvPm4V/RNOwdAz
	WXyOkW/yghNvKhQhGHkcjC+kiApgH0m+qRnY4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=UE0YjBYC/mmNq+ivVz4hZx4H0QYxfJPnYVRebKZTfO9sirYUrgW5Irz5npMgLk5VMW
	83S0McYCFBrJEfFq4+uCpmWiYF0juGTS6jsY9UKaqwa64067XsDGfKwkH+iNwzrf9McL
	SLXa97hET/83n1CGG8g16RI8Fvbfop8jdodg8=
MIME-Version: 1.0
Received: by 10.231.152.146 with SMTP id g18mr4315390ibw.48.1284293515033;
	Sun, 12 Sep 2010 05:11:55 -0700 (PDT)
Received: by 10.231.208.17 with HTTP; Sun, 12 Sep 2010 05:11:54 -0700 (PDT)
In-Reply-To: <i6ielv$sld$1@dough.gmane.org>
References: <AANLkTimErvT=QwSRo25H-Bn2cjdao5x4XMbp_nz4Vc9_@mail.gmail.com>
	<AANLkTi=o8sM5eBxtMLbB3WVk4vQ8r5mL7g5SKSrK0h34@mail.gmail.com>
	<i6629i$d5c$1@dough.gmane.org> <201009081609.32135.pieterg@gmx.com>
	<4C879EC5.10402@balister.org> <4C8ADB7A.4000303@techsol.ca>
	<i6f9uu$39o$1@dough.gmane.org> <i6fc40$90f$1@dough.gmane.org>
	<AANLkTimZ1Vzyj0+wT1amdtrxjXkVy=fNbKzCWNG_LrOW@mail.gmail.com>
	<i6i5g8$ums$1@dough.gmane.org>
	<AANLkTinELVSoGrq1km6dFpXGF524h328t+TBM4p32inz@mail.gmail.com>
	<i6ielv$sld$1@dough.gmane.org>
Date: Sun, 12 Sep 2010 14:11:54 +0200
Message-ID: <AANLkTimkAw+05s6-FkWuLTOvALgfGypgHCOz6bKBa8gA@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: patch to fix libstdc++ problem, was Re: Images no longer automatically include libstdc++6
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
X-List-Received-Date: Sun, 12 Sep 2010 12:12:40 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/9/12 Koen Kooi <k.kooi@student.utwente.nl>:

> On 12-09-10 13:27, Frans Meulenbroeks wrote:

> It won't, since you need to rebuild everything that uses gcc. Bumping PR
> for gcc-cross would just give people a false sense of security. I'm not
> against bumping PR for gcc-cross, I'm just saying that it doesn't come
> close to fixing the problem at hand, which is packages with missing
> dependencies (libgcc for normal ones, libstdc++ for c++ ones,
> libgfortran for fortran ones, etc).

I know it does not fix anything, but it fixes most of it (because
although there is a missing dep, if you install libstdc++/libgcc
manually or install a package made after the fix is applied things
still work.
>
>> Thinking of it let's see how many distro's actually use DISTRO_PR:
>> ../../conf/distro/angstrom-2008.1.conf:DISTRO_PR = ".6"
>> ../../conf/distro/kaeilos-2010.conf:DISTRO_PR = ".1"
>> ../../conf/distro/kaeilos.conf:DISTRO_PR = ".5"
>> ../../conf/distro/angstrom-2010.x.conf:DISTRO_PR = ".7"
>> ../../conf/distro/shr.conf:DISTRO_PR = ".5"
>>
>> So that is 5 out of the 32 recipes.
>> Even one of your own (angstrom-2008.1-legacy.conf) does ot use DISTRO_PR
>
> Do you know how requires work in OE?

Yes.
The grep above does not reveal these. There might be similar cases for
some of the other 32-5-1 = 26 distro's.
I just did not check.

Anyway the above just illustrates again that it is is probably quite
useful to clearly identify maintainers for all distro's and move the
unmaintained one to a separate folder or so, so people using those at
least are aware that they are using an unmaintained distro and as such
are kind-a "on their own"

Frans
>
> conf/distro$ grep require angstrom-2008.1-legacy.conf
> require conf/distro/angstrom-2008.1.conf
>
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFMjL3+MkyGM64RGpERAsRvAJ43TZNi07Md1wcPxdz5T6KaYYl8AwCgvNLY
> X+Hd1AJVQULZ0BDAiiU6X5A=
> =hIhF
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


