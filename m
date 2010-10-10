Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P4uFg-0006QI-Lg
	for openembedded-devel@lists.openembedded.org;
	Sun, 10 Oct 2010 13:39:58 +0200
Received: by iwn7 with SMTP id 7so1509824iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Oct 2010 04:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=LKsUg16OjvH6w+Ia+BAbW+EzB5xd8IXgA5E7fhTB0j0=;
	b=C1nP0o6L5YZ0m5iVKemR5dmCGXuOGzbK6rZJt5k0ijdDtAPbxzgnq8bW/Wwzr1zw8w
	0vxznPq7i8GYERUCdAIxkSih7xw5X1WR/kyevO2gs0UGkdgJRxX3hC6RCtUUAoCnUuAi
	ohtNjip0U2nohwg7kfTYFZ1S7a0QaJK2egss8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=a5BJwchEHeXQaJAi4Y3HUoVN2XWHEg+gXp47KHki2E6dDGAIhSbtl4NshsZG1Qfdgd
	HlUHWS4UVkVF/Ig0y5lzu3eOoLYMgO0nqKoldoFN1FCiGQk+S/PYgxH2b8FRHqrDQuip
	Mrm/PeY6N3ItpcFG2xn0UGhRRCS60uG+h2ZyE=
MIME-Version: 1.0
Received: by 10.231.20.65 with SMTP id e1mr3902242ibb.32.1286710754831; Sun,
	10 Oct 2010 04:39:14 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Sun, 10 Oct 2010 04:39:14 -0700 (PDT)
In-Reply-To: <AANLkTikXgD1ULsL7Fc3jQ45vDEH4ECqsG7s6KHRhJ1op@mail.gmail.com>
References: <AANLkTikXgD1ULsL7Fc3jQ45vDEH4ECqsG7s6KHRhJ1op@mail.gmail.com>
Date: Sun, 10 Oct 2010 13:39:14 +0200
Message-ID: <AANLkTikNtJMywuDf-FkjYpcx67oWEKXmOgaNbzhNoZTm@mail.gmail.com>
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
Subject: Re: Question on writing perl lib .bb files
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
X-List-Received-Date: Sun, 10 Oct 2010 11:39:59 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/10/10 J. L. <vwyodapink@gmail.com>:
> I am trying to add a few more perl libs into my build that dont exist
> and I have seen some that have dependences and others that dont. So I
> wrote one for Net::Whois::ARIN and tried without what CPAN says is the
> dependencies and it built correctly with no errors I installed the
> .ipk and went to try the build of a program I wanted to try on my
> overo and it no longer complains about it missing that. But why do
> some perl lib .bb use depends and not even all the depends that cpan
> lists and some list none even though according to CPAN they need them?

The recipes that do not have all the first level CPAN dependencies are
wrong and should be fixed.
If you see such a recipe please submit a patch.
There seem to be a few causes for this to happen:
- when creating the recipe the CPAN dependencies were not checked, but
only those that were needed were added.
- a recipe was moved to a newer version and dependencies change, but
where never added

The reasong things work for you is because either:
you already had the recipes that you needed on your system.
or the listed cpan dependencies were wrong (I'm fairly sure they cover
all what is needed, but I am less sure that they never mention things
that are not needed).

> I will post the .bb I wrote as well, thanks for any info on the
> correct way to do this as not sure if what I did is enough to properly
> get the lib for perl built
>
> DESCRIPTION =3D "Net::Whois::ARIN =A0 =A0 =A0 =A0 whois arin "
> SECTION =3D "libs"
> LICENSE =3D "Perl"
That would be "Artistic|GPLv1"

> PR =3D "r1"

Start with r0
>
> DEPENDS +=3D "libtest-mockmodule-perl scalar-util-perl libtest-exception-=
perl \
> =A0 =A0 =A0 =A0 =A0 =A0test-harness-perl test-more-perl libsub-uplevel-pe=
rl \
> =A0 =A0 =A0 =A0 =A0 =A0libmodule-build-perl carp-perl universal-isa-perl =
\
> =A0 =A0 =A0 =A0 =A0 =A0universal-can-perl io-socket-inet-perl "

Hm, I found that perl recipes need the native variant of the recipe to
be in staging. If you peek at other recipes you'll see they DEPENDS on
the -native variant and RDEPENDS on the non-native one.

Also you only need  libtest-mockmodule-perl-native in DEPENDS. This is
because e.g. the dependency on libtest-exception-perl is a dependency
of libtest-mockmodule-perl who will drag it in.
So you only need the direct dependencies, not the indirect ones.

And finally you do not need the core modules like  io-socket-inet-perl
in DEPENDS
There is a dependency on perl and perl will make sure these modules are the=
re.
Note though that  io-socket-inet-perl needs to be in RDEPENDS_${PN}

While doing this noticed one more thing. You are using the
dependencies as they arre given for perl 15.12.1 but we are at version
5.10.1 (and the dependencies for that one are somewhat different)

Frans

PS: and please commit locally and submit a patch (use git format-patch
and git send-email)

>
> SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/T/TC/TCAINE/Net-Whois=
-ARIN-${PV}.tar.gz"
>
> S =3D "${WORKDIR}/Net-Whois-ARIN-${PV}"
>
> inherit cpan
>
> BBCLASSEXTEND=3D"native"
>
> SRC_URI[md5sum] =3D "a5aee39187c6272acd2a77e30847fdef"
> SRC_URI[sha256sum] =3D
> "d47a6720ff265674cbd918d866c73221be9916d81e1c30ccdb0d49e6b45110e8"
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


