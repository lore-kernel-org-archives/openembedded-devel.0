Received: from [74.125.92.147] (helo=qw-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1MicuW-0003Q9-Cz
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Sep 2009 01:37:13 +0200
Received: by qw-out-1920.google.com with SMTP id 4so204867qwk.36
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Sep 2009 16:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:from:date:x-google-sender-auth:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=Gv4U3+jXfWL5xlY+w1ShKUK3M/Xxe8gDCcT+Mn1g9Ws=;
	b=E3+rgdjx6Q5ZiQRjUARvTFzD8xQ7cZZbsXs87WASWDND15Yvgnz/z79RbuTAP6y8Gv
	GN1Z6tDgFAWRBjfUq/Cl1xDNR/Hw955BU7If2HYCa3tXmr325Ga8C6TQEB6MR8tmXS1O
	8IR18WrzYiOivD18E0QVJp1wO1Dxpf+K5ccmY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type
	:content-transfer-encoding;
	b=xd3eXvP+MnuuM/aO1wDBffM7S3en530TWjoyfJ73Jw/z+8eukwFBk9RJzEQbzB4R2/
	B2dD6jX51uh36qOxoF66N0pVWigLdSWvl2L2jn1hULdojUlgq6RIVbvRsOQ+dNeOdLjV
	1XeRITInoaO2QNua0ay0A8vTiJtKuPzeckHSE=
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.51.208 with SMTP id e16mr2202618qcg.33.1251847112455; Tue, 
	01 Sep 2009 16:18:32 -0700 (PDT)
In-Reply-To: <be7a9f3d0909011529g61920aav8c9308207ae51d3e@mail.gmail.com>
References: <b6ebd0a50908261905r7d839647k6fc53460301efca0@mail.gmail.com> 
	<be7a9f3d0909010638h75451d65la4a599a1583c3208@mail.gmail.com> 
	<b6ebd0a50909010924u4f9a1ee5jebfae98afb2462e6@mail.gmail.com> 
	<be7a9f3d0909011529g61920aav8c9308207ae51d3e@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Tue, 1 Sep 2009 16:18:12 -0700
X-Google-Sender-Auth: c33a27fcc796d209
Message-ID: <b6ebd0a50909011618m2bf76503jb1d83f800034d076@mail.gmail.com>
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
X-List-Received-Date: Tue, 01 Sep 2009 23:37:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

This doesn't answer my question, however.  You wouldn't be able to
safely use AUTOPV in PV unless you're pointing S to an existing
non-fetched git repository, since PV would change before and after the
fetch, so I was attempting to clarify this. Since you can't use it
safely for fetched sources, it doesn't really belong in bb.fetch.

On Tue, Sep 1, 2009 at 3:29 PM, Otavio Salvador<otavio@ossystems.com.br> wr=
ote:
> In bitbake.conf
>
> @@ -532,6 +534,7 @@ UPDATECOMMAND_svn =3D "/usr/bin/env svn update ${SVNC=
OOPTS}"
> =C2=A0SRCDATE =3D "${DATE}"
> =C2=A0SRCREV =3D "1"
> =C2=A0AUTOREV =3D "${@bb.fetch.get_srcrev(d)}"
> +AUTOPV =3D "${@bb.fetch.describe_revision(d)}"
>
> =C2=A0SRC_URI =3D "file://${FILE}"
>
> On Tue, Sep 1, 2009 at 1:24 PM, Chris Larson<clarson@kergoth.com> wrote:
>> Seems interesting, but how are you making use of it? =C2=A0It wouldn't b=
e
>> particularly useful for recipes that have to fetch, since you can't
>> change PV before and after fetch without things exploding.
>>
>> On Tue, Sep 1, 2009 at 6:38 AM, Otavio Salvador<otavio@ossystems.com.br>=
 wrote:
>>> Hello Chris,
>>>
>>> On Wed, Aug 26, 2009 at 11:05 PM, Chris Larson<clarson@kergoth.com> wro=
te:
>>> [...]
>>>> gitver facilitates extraction of version information from git. =C2=A0B=
y
>>>> default, it runs 'git describe' to get the version. =C2=A0If that fail=
s, it
>>>> will set the version to 0.0-<sha1 hash>. =C2=A0This version is stored =
in
>>>> the ${GITVER} variable, and can be used in the recipe's PV variable.
>>>> When using this, it will automatically detect changes to .git/HEAD
>>>> (i.e. commit your local changes, check out a different branch, ..) and
>>>> invalidate the bitbake cache, pick up the new PV, and know that it
>>>> needs to re-run the build steps.
>>> [...]
>>>
>>> In the line of your gitver class we've been using a bitbake change for
>>> it already for some time.
>>>
>>> What we did is to add a AUTOPV (as we have AUTOREV) to bitbake and use =
it in OE.
>>>
>>> I'm attaching the diff for it here.
>>>
>>> --
>>> Otavio Salvador =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0O.S. Systems
>>> E-mail: otavio@ossystems.com.br =C2=A0http://www.ossystems.com.br
>>> Mobile: +55 53 9981-7854 =C2=A0 =C2=A0 =C2=A0 =C2=A0 http://projetos.os=
systems.com.br
>>>
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>>
>>>
>>
>>
>>
>> --
>> Chris Larson
>> clarson at kergoth dot com
>> clarson at mvista dot com
>> Founder - BitBake, OpenEmbedded, OpenZaurus
>> Maintainer - Tslib
>> Software Engineer
>> MontaVista Software, Inc.
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>
>
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



--=20
Chris Larson
clarson at kergoth dot com
clarson at mvista dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Software Engineer
MontaVista Software, Inc.


