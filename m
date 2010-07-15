Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OZWHP-0000Eb-Cy
	for openembedded-devel@lists.openembedded.org;
	Thu, 15 Jul 2010 23:47:44 +0200
Received: by iwn34 with SMTP id 34so1465365iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Jul 2010 14:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=+uGvJaMoigAHOySZfPVEeKn0HJirVHOsYy9LBRv7j4g=;
	b=LH8cWgFNKi7okR2XkdGDWJ67kM2jvckcCPneWeCUdi3W26xpLamQm7jEgCMXunc96/
	CtQrVOCQiK/Q/9pXbsxWftCZBm2tQlqSK6MJYHz3fHSAPO+F2sCa5PL0xyf7fcaUEYBE
	pYqybbuMrUga07rgOfAXIQALrkHbbb8JaxaDc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=nFFQ4symLWD8xf2yCWWVV5gpnIYieklJzWVsPFtaHVgL+fR0QeW5vIOA4OD29D+P87
	vbLxJWrzvoGiAPyKI1s+iPbmAUY0p4LuM0uMpbC3gdJdmr5Ejx66kM9ySnLeK+z2K4UV
	xUBQjENrgFprvFdSQw9OM48sF1d8cs8iDdNXY=
Received: by 10.231.39.196 with SMTP id h4mr19282370ibe.64.1279230456288; Thu, 
	15 Jul 2010 14:47:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.35.8 with HTTP; Thu, 15 Jul 2010 14:47:16 -0700 (PDT)
In-Reply-To: <1279178275.5049.28.camel@mattotaupa>
References: <1279178275.5049.28.camel@mattotaupa>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 15 Jul 2010 14:47:16 -0700
Message-ID: <AANLkTinZBf7D9RpXhGrkJXxwM-WSYupcefRpG0qpfNwk@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: uclibc: PREFERRED_UCLIBC_VERSION = "git" not respected
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
X-List-Received-Date: Thu, 15 Jul 2010 21:47:44 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 15, 2010 at 12:17 AM, Paul Menzel
<paulepanter@users.sourceforge.net> wrote:
> Dear OE folks,
>
>
> the commit message of 070e46f2932b254a617d7ce88af9b078c2a2849f [1] says
>
> =A0 =A0 =A0 =A0With this change, you can put PREFERRED_UCLIBC_VERSION=3D"=
git"
> =A0 =A0 =A0 =A0into your conf/local.conf once or set
> =A0 =A0 =A0 =A0PREFERRED_VERSION_uclibc{*}=3D"git" and need not adjust lo=
cal.conf
> =A0 =A0 =A0 =A0if the git revision was changed.
>
> I have the following line in my `local.conf`.
>
> =A0 =A0PREFERRED_UCLIBC_VERSION =A0 =A0 =A0 =A0 =A0 =A0 =A0 =3D "git"

change it to

PREFERRED_VERSION_uclibc_local                  =3D "git"
PREFERRED_VERSION_uclibc-initial_local          =3D "git"


>
> Doing `bitbake uclibc` with
>
> =A0 =A0 =A0 =A0DISTRO =3D "angstrom-2008.1"
>
> =A0 =A0 =A0 =A0GLIBC_GENERATE_LOCALES =3D "en_US.UTF-8 en_GB.UTF-8 de_DE.=
UTF-8"
>
> =A0 =A0 =A0 =A0MACHINE =3D "beagleboard"
> =A0 =A0 =A0 =A0BUILD_ARCH =3D "i686"
> =A0 =A0 =A0 =A0BUILD_OS =3D "linux"
> =A0 =A0 =A0 =A0ANGSTROMLIBC =3D "uclibc"
>
> chooses uclibc-0.9.30.2-r34.0 nevertheless.
>
> Doing `git grep "PREFERRED_UCLIBC"` does not list anything distribution
> specific as far as I can see.
>
>
> Thanks,
>
> Paul
>
>
> [1] http://git.openembedded.org/cgit.cgi/openembedded/commit/?id=3D070e46=
f2932b254a617d7ce88af9b078c2a2849f
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>


