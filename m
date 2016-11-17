Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f196.google.com (mail-ua0-f196.google.com
	[209.85.217.196])
	by mail.openembedded.org (Postfix) with ESMTP id C4EC2719E3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Nov 2016 17:10:40 +0000 (UTC)
Received: by mail-ua0-f196.google.com with SMTP id 12so15019134uas.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Nov 2016 09:10:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=oz1syTuxZiFYxpEU70zOYGWV3bpGEXsnGJPCCTBS6I4=;
	b=G/PHvAdT+nr7aGw1vU8MFBLefBwWJ4G1ybGWiSqCQhijnxQZegBUU0SlQUf4WxnyAv
	fTdMTnELiNn0rNVF6Y538Sq6guGiCLCuR3tNcDlE5MIslqG9a0holKWcOuXtYuNRasvm
	RNCm8Rb3za8MHzZ4zD2veRGfYig2DOVIXT33IhvPHzHWU34ZXYh3bfgcBxjFhK3S5owD
	t8mFCKrGZWkZssc+oPs4vTv4zQSzgGHXt9c+P0Fmeqw6j6R3YOKr85iTnbPYWNkTljno
	TAZZuecKt2RG21cCXiZwed4ysAhCBQj62jjwAAuaE6Hg8VlJo1EXbo9bjby5A4C84S0T
	RkoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=oz1syTuxZiFYxpEU70zOYGWV3bpGEXsnGJPCCTBS6I4=;
	b=hy8ckK9beF/mF+RlILqbOfwodfXK09Z4zerYbQX3RZIjytEne5eGI4I8AFVwMVjMa9
	zmtaGM/NlnMpZ2y4hTCZWid3iXDFFEk8RbKc29Cni6a9R3MKyncEnqBHXzzETQmY7zt/
	hpyG9Ou9OlCCL1DgUSBpwj0okTx0YH79lTUs7hFJ/DiRIO3ZDEFTk0FvzrdWwCjk5Moa
	XSshv3oXqCGpGkpfeTqrd7Wpuyz3Ky8Bcp1mzoflM7JfaFQAdqLILrCGE3zbt4YSaV3o
	cpAdxc9o++PtDdLjA5EwGLLV31UYrbBrDi4b+GUvcQCDh0kVzFkGXm9ysAxLnhLAxv8X
	jzhA==
X-Gm-Message-State: ABUngvfVextJ7yPEKy9mwxqFsoCL0xoBuBDPgAwpTUFDtOmIIXcOJR1PfEFy7t8Y25HcafJqbJYDbkr8XY1xyg==
X-Received: by 10.176.0.180 with SMTP id 49mr2588324uaj.32.1479402641979; Thu,
	17 Nov 2016 09:10:41 -0800 (PST)
MIME-Version: 1.0
Received: by 10.176.5.136 with HTTP; Thu, 17 Nov 2016 09:10:11 -0800 (PST)
In-Reply-To: <1479383974.27546.3.camel@andred.net>
References: <20161115154311.30118-3-git@andred.net>
	<20161116090234.30806-1-git@andred.net>
	<109be6fe-8d0c-619b-fb4a-4f836982e064@gmail.com>
	<1479383974.27546.3.camel@andred.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 17 Nov 2016 09:10:11 -0800
Message-ID: <CAMKF1sqxxyjaYL2EJXD_KzGGMYuB5ohWvye9ba-YrJ6e0pU1Gg@mail.gmail.com>
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <git@andred.net>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH 2/2 v2] ncp: add v1.2.4
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 17 Nov 2016 17:10:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 17, 2016 at 3:59 AM, Andr=C3=A9 Draszik <git@andred.net> wrote:
> On Wed, 2016-11-16 at 09:28 -0800, Khem Raj wrote:
>>
>> On 11/16/16 1:02 AM, Andr=C3=A9 Draszik wrote:
>> > Signed-off-by: Andr=C3=A9 Draszik <git@andred.net>
>> > ---
>> >  meta-networking/recipes-support/ncp/ncp_1.2.4.bb | 32
>> > ++++++++++++++++++++++++
>> >  1 file changed, 32 insertions(+)
>> >  create mode 100644 meta-networking/recipes-support/ncp/ncp_1.2.4.bb
>> >
>> > diff --git a/meta-networking/recipes-support/ncp/ncp_1.2.4.bb b/meta-
>> > networking/recipes-support/ncp/ncp_1.2.4.bb
>> > new file mode 100644
>> > index 0000000..7bbaaad
>> > --- /dev/null
>> > +++ b/meta-networking/recipes-support/ncp/ncp_1.2.4.bb
>> > @@ -0,0 +1,32 @@
>> > +SUMMARY =3D "a fast file copy tool for LANs"
>> > +DESCRIPTION =3D "ncp is a utility for copying files in a LAN. It has
>> > absolutely no \
>> > +security or integrity checking, no throttling, no features, except \
>> > +one: you don't have to type the coordinates of your peer."
>> > +HOMEPAGE =3D "http://www.fefe.de/ncp"
>> > +LICENSE =3D "GPLv2"
>> > +LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/files/common-licenses/G=
PL-
>> > 2.0;md5=3D801f80980d171dd6425610833a22dbe6"
>> > +DEPENDS =3D "libowfat"
>> > +
>> > +SRC_URI =3D "https://dl.fefe.de/${BP}.tar.bz2"
>> > +SRC_URI[md5sum] =3D "421c4855bd3148b7d0a4342942b4bf13"
>> > +SRC_URI[sha256sum] =3D
>> > "6cfa72edd5f7717bf7a4a93ccc74c4abd89892360e2e0bb095a73c24b9359b88"
>> > +
>> > +EXTRA_OEMAKE =3D "\
>> > +    DIET=3D \
>> > +    DEBUG=3Dnostrip \
>> > +    CC=3D'${CC}' CFLAGS=3D'${CFLAGS} -I${STAGING_INCDIR}/libowfat'
>> > LDFLAGS=3D'${LDFLAGS}' \
>> > +"
>>
>> Is setting CC etc. on make cmdline really needed ?
>
> Yes, the Makefile sets CC CFLAGS LDFLAGS excplicitly, so make doesn't
> inherit them from the environment variables, because OE doesn't pass the =
-e
> make flag anymore. https://www.gnu.org/software/make/manual/html_node/Env=
iro
> nment.html#Environment
>
>> may be just adding the -I flags to CPPFLAGS is enough ?
>
> It doesn't respect CPPFLAGS, but an alternative would be:
>
> EXTRA_OEMAKE =3D "\
>     DIET=3D \
>     DEBUG=3Dnostrip \
>     -e \
> "
> CFLAGS_append =3D " -I${STAGING_INCDIR}/libowfat"

Thats seems better.

>
> I have no preference either way, but my original version makes it more
> obvious what we're after.
>
>
>> > +
>> > +do_install() {
>> > +    install -d -m0755 ${D}${bindir}
>>
>> not needed if you can just do
>>
>> install -D -m 0755 ncp ${D}${bindir}/ncp
>>
>> and avoid two calls to install ( one for dir and another for file )
>>
>> > +    install -d -m0755 ${D}${mandir}/man1
>> > +
>> > +    install -m0755 ncp ${D}${bindir}
>>
>>
>> > +    ln -sf ncp ${D}${bindir}/npoll
>> > +    ln -sf ncp ${D}${bindir}/npush
>> > +
>> > +    install -m0644 ncp.1 npush.1 ${D}${mandir}/man1
>>
>> same here not needed.
>
> Using -D that'd still need two calls, as multiple files are being copied =
and
> -D only allows you to specify one destination (I think). Not really gaini=
ng
> anything here. In addition, you have to specify the source filename multi=
ple
> times (in src and destination).
> This:
>     install -d -m0755 ${D}${mandir}/man1
>     install -m0644 ncp.1 npush.1 ${D}${mandir}/man1
> vs.
>     install -D -m0644 ncp.1 ${D}${mandir}/man1/ncp.1
>     install -D -m0644 npush.1 ${D}${mandir}/man1/npush.1

but 4 install calls will be reduced to two.

>
>
> Cheers,
> Andre'
>

