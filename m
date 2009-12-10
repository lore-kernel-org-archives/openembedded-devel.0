Received: from mail-iw0-f194.google.com ([209.85.223.194])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NIbRN-0003GX-Cp
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Dec 2009 06:19:52 +0100
Received: by iwn32 with SMTP id 32so5033636iwn.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Dec 2009 21:18:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=F1lA89OSh3hxMT0HXazrnMRs/WIAZTN7G4TqTtGeq1I=;
	b=LdTl6p1UjJ0RGCNzYzQK6KYYZpxLCqjx8sal60osLkk/Ynpe7Aecs2DFpZaRYMn4rm
	8OMmtA9jrMggX6dKlfAteYCL+6MBAJ0z8n/bxwhmyZbgg0M5YRM3Ut6zUN3YxCgFR7W3
	gKip8AET8t2GSvlTwIO5y80PsTZQJNmoIuluI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=UuVFIABcWyESiJ5kBNbgNwYSe/B9jysTVVfWLibzy4YPvH2XaHemO5Yv5TE1vj21s9
	esKcN5SbyCq7HqPsc+TnJDZewKHX/DTfCNk4zKIAks6PfAnZT1jHO6+g97nq/WgKa/D2
	jEX/tpEjjltFF80UoL+VjAE6MMOUe8Lf06444=
MIME-Version: 1.0
Received: by 10.231.121.164 with SMTP id h36mr536197ibr.9.1260422287212; Wed, 
	09 Dec 2009 21:18:07 -0800 (PST)
In-Reply-To: <ec1f3d400912090347w217d39d2jd64c9801f95e96e4@mail.gmail.com>
References: <ec1f3d400911270337wbbbcae8gab291075d242c9d9@mail.gmail.com>
	<19c1b8a90911301042t6ed432b2m1189c619772edf9c@mail.gmail.com>
	<ec1f3d400912072024u2ab3a98bg96665cd8457efcd9@mail.gmail.com>
	<19c1b8a90912081214u9abe04fm774bd7f54e7bf70a@mail.gmail.com>
	<ec1f3d400912090347w217d39d2jd64c9801f95e96e4@mail.gmail.com>
Date: Wed, 9 Dec 2009 21:18:07 -0800
Message-ID: <19c1b8a90912092118o54903eb4v4044e2c1191617c8@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.194
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: cortex-a9 build failure at glibc
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
X-List-Received-Date: Thu, 10 Dec 2009 05:19:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 9, 2009 at 3:47 AM, RK Raggit <rk.raggit@gmail.com> wrote:
>>
>>
>> Could you provide preprocessed output of
>> checktty.c file ?
>>
>>
> pls find attached (checktty.i). just trying to recompile the file from th=
e
> command line gave me a gcc error "gcc: error trying to exec 'cc1': execvp=
:
> No such file or directory", so i had to hack the login-utils makefile to =
get
> this output. here's the patch -
>
> ******
> ---
> /home/raghu/opendistro/build/tmp/work/armv7a-angstrom-linux-gnueabi/util-=
linux-ng-2.16-r8.3/util-linux-ng-2.16/login-utils/Makefile.orig
> 2009-12-09 17:17:49.000000000 +0530
> +++
> /home/raghu/opendistro/build/tmp/work/armv7a-angstrom-linux-gnueabi/util-=
linux-ng-2.16-r8.3/util-linux-ng-2.16/login-utils/Makefile
> 2009-12-09 17:18:05.000000000 +0530
> @@ -648,7 +648,7 @@
> =C2=A0include ./$(DEPDIR)/wall.Po
>
> =C2=A0.c.o:
> - =C2=A0 =C2=A0 =C2=A0 $(COMPILE) -MT $@ -MD -MP -MF $(DEPDIR)/$*.Tpo -c =
-o $@ $<
> + =C2=A0 =C2=A0 =C2=A0 $(COMPILE) -MT $@ -MD -MP -MF $(DEPDIR)/$*.Tpo -E =
$<
> =C2=A0 =C2=A0 =C2=A0 =C2=A0mv -f $(DEPDIR)/$*.Tpo $(DEPDIR)/$*.Po
> =C2=A0# =C2=A0 =C2=A0 =C2=A0source=3D'$<' object=3D'$@' libtool=3Dno \
> =C2=A0# =C2=A0 =C2=A0 =C2=A0DEPDIR=3D$(DEPDIR) $(CCDEPMODE) $(depcomp) \
> ******
>
> Thanks

What version are you using for binutils ? I could not reproduce the
issue with 2.20

>
> --RK
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>


