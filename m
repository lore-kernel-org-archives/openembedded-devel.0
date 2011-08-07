Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1QqC0n-0003y6-Ju
	for openembedded-devel@lists.openembedded.org;
	Mon, 08 Aug 2011 00:40:01 +0200
Received: by pzk2 with SMTP id 2so1730391pzk.34
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 07 Aug 2011 15:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=hj4cH6KySc0LkupFXyqWyySFS9gYGGAaseE5pxQkuco=;
	b=Ehpda/Li3P80VjhCfyI0bdOoWAmLmfp0LJdNREofMVWKkphDeRIYb+kTKiQcR3IkLs
	t7Mmwe3STdrHZcNsmc05Y7GnJMQLQY4ykYrTiK0YH/d4cuVZJFvKOQc3tnkTxGmOkA+R
	oCMCHOVqYrjOS5BlvQitT13aRF/xg698udK+s=
MIME-Version: 1.0
Received: by 10.143.77.5 with SMTP id e5mr5004966wfl.295.1312756533383; Sun,
	07 Aug 2011 15:35:33 -0700 (PDT)
Received: by 10.142.191.9 with HTTP; Sun, 7 Aug 2011 15:35:33 -0700 (PDT)
In-Reply-To: <j1iufq$i4e$2@dough.gmane.org>
References: <cover.1312578809.git.andrea.adami@gmail.com>
	<f4f0e18f46651290556cba9c44f49b2db6177ccb.1312578809.git.andrea.adami@gmail.com>
	<j1iufq$i4e$2@dough.gmane.org>
Date: Mon, 8 Aug 2011 00:35:33 +0200
Message-ID: <CAAQYJAvpbbfygv7vMgCgN2NhVG=7_XY3HpX6aJVQG0ibrOD0nQ@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 2/2] klibc.bbclass: shared include for building against klibc
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
X-List-Received-Date: Sun, 07 Aug 2011 22:40:01 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 6, 2011 at 10:37 AM, Koen Kooi <koen@dominion.thruhere.net> wro=
te:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Op 05-08-11 23:30, Andrea Adami schreef:
>> * from meta-zaurus * reworked in meta-smartphones/meta-zaurus
>>
>> Signed-off-by: Andrea Adami <andrea.adami@gmail.com> --- meta-oe/classes=
/klibc.bbclass | =A0 =A09 +++++++++ 1 files changed, 9 insertions(+), 0 del=
etions(-) create mode 100644 meta-oe/classes/klibc.bbclass
>>
>> diff --git a/meta-oe/classes/klibc.bbclass b/meta-oe/classes/klibc.bbcla=
ss new file mode 100644 index 0000000..d684367 --- /dev/null +++ b/meta-oe/=
classes/klibc.bbclass @@ -0,0 +1,9 @@ +# klcc-cross depends on klibc +DEPEN=
DS =3D+ "klcc-cross" + +export CC=3D${TARGET_PREFIX}klcc
>
> please put quotes around that

sure, was somehow overlooked

>
>> +# reset inherited OE flags to avoid e.g. ggdb3 and keep size small +exp=
ort CFLAGS=3D"" +export CPPFLAGS=3D"" +export LDFLAGS=3D""
>
> Stripping takes care of ggdb3, so remove those

The comment is misleading: see  klcc.1 and klcc.in
http://git.kernel.org/?p=3Dlibs/klibc/klibc.git;a=3Dtree;f=3Dklcc

Anyhow, if you dare to comment out those lines today, then some
recipes break (one atm).

kexec-tools-klibc:
...
klibc/include/stddef.h:9:3: error: #error "__KLIBC__ not defined,
compiler invocation error!"

>
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFOPP06MkyGM64RGpERAiAKAJ4xqRH+AmjUGfb9z8DE3Q89+WGy7wCcD6HQ
> cQKfreqlgsk+dRuwvyZSn1g=3D
> =3DirwZ
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

Regards

Andrea


