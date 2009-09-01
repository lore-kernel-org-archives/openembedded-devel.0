Received: from [74.125.92.149] (helo=qw-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1MiWSN-00073l-1v
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Sep 2009 18:43:43 +0200
Received: by qw-out-1920.google.com with SMTP id 4so62580qwk.36
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Sep 2009 09:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:from:date:x-google-sender-auth:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=xTcR5p7TvIX2jEtU3VFkH6gRmtAIOMI6TuY2h/uZzxI=;
	b=RdhkY/vvw0ihTjdAfk355I8VkvXgfNd79cIBGjGhXtr5y5O0iT2ReFy7zGv6n5H0M/
	8YLBlLxGeQkEIp6xetmv9PzXwOuqGRbGd3m+WEi1E7/e20CLYuljF65l7ASDqoaFwrSz
	9SK94uloUmzOSI5MwU9/bxwUFysYiyyhTmmas=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type
	:content-transfer-encoding;
	b=UbsO9YG5CEEYJPr5eP8Yw9jVZMHDhFT3aBDych9IqAigKwEOSt8BzMC8nLqiaaECkq
	b6Jo6KZ1EODKi/B6gTPT4qEJOIU2xsz6m95NOq86SZvSQaP9cuwh6bGcs+pI4cUKLDdT
	spalIS08nkFAG3RkZyHPzhAUQthbeTUL7hZ58=
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.2.23 with SMTP id 23mr2069743qch.87.1251822305111; Tue, 01 
	Sep 2009 09:25:05 -0700 (PDT)
In-Reply-To: <be7a9f3d0909010638h75451d65la4a599a1583c3208@mail.gmail.com>
References: <b6ebd0a50908261905r7d839647k6fc53460301efca0@mail.gmail.com> 
	<be7a9f3d0909010638h75451d65la4a599a1583c3208@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Tue, 1 Sep 2009 09:24:45 -0700
X-Google-Sender-Auth: 43447db84edb481d
Message-ID: <b6ebd0a50909010924u4f9a1ee5jebfae98afb2462e6@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: srctree & gitver
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
X-List-Received-Date: Tue, 01 Sep 2009 16:43:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Seems interesting, but how are you making use of it?  It wouldn't be
particularly useful for recipes that have to fetch, since you can't
change PV before and after fetch without things exploding.

On Tue, Sep 1, 2009 at 6:38 AM, Otavio Salvador<otavio@ossystems.com.br> wr=
ote:
> Hello Chris,
>
> On Wed, Aug 26, 2009 at 11:05 PM, Chris Larson<clarson@kergoth.com> wrote=
:
> [...]
>> gitver facilitates extraction of version information from git. =C2=A0By
>> default, it runs 'git describe' to get the version. =C2=A0If that fails,=
 it
>> will set the version to 0.0-<sha1 hash>. =C2=A0This version is stored in
>> the ${GITVER} variable, and can be used in the recipe's PV variable.
>> When using this, it will automatically detect changes to .git/HEAD
>> (i.e. commit your local changes, check out a different branch, ..) and
>> invalidate the bitbake cache, pick up the new PV, and know that it
>> needs to re-run the build steps.
> [...]
>
> In the line of your gitver class we've been using a bitbake change for
> it already for some time.
>
> What we did is to add a AUTOPV (as we have AUTOREV) to bitbake and use it=
 in OE.
>
> I'm attaching the diff for it here.
>
> --
> Otavio Salvador =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0O.S. Systems
> E-mail: otavio@ossystems.com.br =C2=A0http://www.ossystems.com.br
> Mobile: +55 53 9981-7854 =C2=A0 =C2=A0 =C2=A0 =C2=A0 http://projetos.ossy=
stems.com.br
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>



--=20
Chris Larson
clarson at kergoth dot com
clarson at mvista dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Software Engineer
MontaVista Software, Inc.


