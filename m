Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
	[209.85.214.180])
	by mail.openembedded.org (Postfix) with ESMTP id 167DE793E6
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Sep 2018 21:24:45 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id s17-v6so3890112plp.7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Sep 2018 14:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:organization
	:message-id:date:user-agent:mime-version:in-reply-to;
	bh=c47641qq6kMq1C2tAqB5kbloVXH0Mq3aLz7Kfvf8pvU=;
	b=mX4tpbVeEFK0yWx7y7UN2ja/GFtqjVSA7qC0iBC6EGAGTqYXiL5XOsiU77TAj8PB3/
	z9K7os8UeU5iXi1+payQxTkgV4s4gWyDAXJBxevAi6GrXeD/VfZfThOd0UO5K2it0mlU
	uxrCkQ8ckxoQoMDVqxgt7rP5GnMz9MDzM0C4pdQCbEAxlcX969J21v0r4Z7u4Xq34TAK
	O5QrougBahXAg2Dt8yMJHMM8RXyGTXBQp+Uo2ygoPoHWhitENy+s5KbgKQ+Zm1x/IAM8
	H4s/i8glsCc4Pk/NMpzKqFyhQb/+9bYZQKKVOFICaVPmk97TEYrbC6d1Rktz/ubytuJR
	OrpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:organization:message-id:date:user-agent:mime-version:in-reply-to;
	bh=c47641qq6kMq1C2tAqB5kbloVXH0Mq3aLz7Kfvf8pvU=;
	b=d/hsbK7tsMd8x+5Bop1RPWEsPTBBl0GJjOKRX0SlTEizZ5d5XOHMnNtyQhL8zzBxzN
	LvauP30rREGMJEi1PRZJIbUSdoCUtX7G2KWAwVRv48B7h8Z6udBjaSUMnaSHAxhRB5AY
	xA1oLO96kvs7gH442LcZQJfqry07VPMR3pgfFniRCCW3XkhhwpbSTv/kUgNmmpNuxxNI
	2iVoiYrI8COjheEhVe2Q3j4f43XEbK3+3NAyibGAS5cr901iFPSFKZAAkahlvSD3JjV0
	SKZNQ2mmCXeDhFdLfEDKKauVx/0biHxYjHQ4m3I889Ha2JAGTIQaB/5ERwbRqgwZJ1xG
	wCxA==
X-Gm-Message-State: APzg51CXv93d4aTK3bmgx9N7pvasfB2uzgqE/paIg1Qcb3Ryc8zRnOHJ
	qRLUfE4V+6pwKjDlX3TEctZxEt3M
X-Google-Smtp-Source: ANB0Vdb4CpTy1U/lYuTouGZ8OrtVyvbsSqgzAHagFEB2A+YjUI6O9AhaRMaRUFeA1ctY1t8z/DglPw==
X-Received: by 2002:a17:902:848d:: with SMTP id
	c13-v6mr11095183plo.194.1536182686671; 
	Wed, 05 Sep 2018 14:24:46 -0700 (PDT)
Received: from hermes.local ([2601:646:877f:9499:95c4:aed6:2277:d076])
	by smtp.gmail.com with ESMTPSA id
	z22-v6sm5137030pgc.67.2018.09.05.14.24.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 05 Sep 2018 14:24:46 -0700 (PDT)
To: Martin Jansa <martin.jansa@gmail.com>
References: <20180905210224.21225-1-raj.khem@gmail.com>
	<20180905210224.21225-12-raj.khem@gmail.com>
	<CA+chaQfAwZcj7W6UhhHa+ETR3O_1XCTdHNf_qvt6-n22urRkMg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=raj.khem@gmail.com; prefer-encrypt=mutual; keydata=
	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
Organization: HIMVIS LLC
Message-ID: <b1f2b522-9e4b-25e7-3838-eb023c327202@gmail.com>
Date: Wed, 5 Sep 2018 14:24:40 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <CA+chaQfAwZcj7W6UhhHa+ETR3O_1XCTdHNf_qvt6-n22urRkMg@mail.gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-multimedia][PATCH 12/12] rtmpdump: Depend on openssl10 and
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
X-List-Received-Date: Wed, 05 Sep 2018 21:24:46 -0000
X-Groupsio-MsgNum: 74362
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="OAVTql0m1cZanhu42Q0GJQGSkihX7DmLB"

--OAVTql0m1cZanhu42Q0GJQGSkihX7DmLB
Content-Type: multipart/mixed; boundary="dJFZhp9APWE40vBhLgC3nK0TJi6oFoRbn";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Message-ID: <b1f2b522-9e4b-25e7-3838-eb023c327202@gmail.com>
Subject: Re: [oe] [meta-multimedia][PATCH 12/12] rtmpdump: Depend on openssl10
 and
References: <20180905210224.21225-1-raj.khem@gmail.com>
 <20180905210224.21225-12-raj.khem@gmail.com>
 <CA+chaQfAwZcj7W6UhhHa+ETR3O_1XCTdHNf_qvt6-n22urRkMg@mail.gmail.com>
In-Reply-To: <CA+chaQfAwZcj7W6UhhHa+ETR3O_1XCTdHNf_qvt6-n22urRkMg@mail.gmail.com>

--dJFZhp9APWE40vBhLgC3nK0TJi6oFoRbn
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 9/5/18 2:19 PM, Martin Jansa wrote:
> Nice series, thanks!
>=20
> Something seems to be missing in the commit summary of the last one.

this is vim autowrapping in full swing during editing the patch subject
lines. The real commit is ok see

http://git.openembedded.org/meta-openembedded-contrib/commit/?h=3Dkraj/ma=
ster&id=3D2a48709d884f24f3cbcc6da4892d3c21b3f5274e

>=20
> On Wed, Sep 5, 2018 at 11:04 PM Khem Raj <raj.khem@gmail.com
> <mailto:raj.khem@gmail.com>> wrote:
>=20
>     Signed-off-by: Khem Raj <raj.khem@gmail.com <mailto:raj.khem@gmail.=
com>>
>     ---
>     =C2=A0.../rtmpdump/rtmpdump/fix-racing-build-issue.patch=C2=A0 =C2=A0=
 =C2=A0| 10 +++++-----
>     =C2=A0.../recipes-multimedia/rtmpdump/rtmpdump_2.4.bb
>     <http://rtmpdump_2.4.bb>=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 4 ++--
>     =C2=A02 files changed, 7 insertions(+), 7 deletions(-)
>=20
>     diff --git
>     a/meta-multimedia/recipes-multimedia/rtmpdump/rtmpdump/fix-racing-b=
uild-issue.patch
>     b/meta-multimedia/recipes-multimedia/rtmpdump/rtmpdump/fix-racing-b=
uild-issue.patch
>     index bb3d8b0efe..6e11c9752e 100644
>     ---
>     a/meta-multimedia/recipes-multimedia/rtmpdump/rtmpdump/fix-racing-b=
uild-issue.patch
>     +++
>     b/meta-multimedia/recipes-multimedia/rtmpdump/rtmpdump/fix-racing-b=
uild-issue.patch
>     @@ -8,11 +8,11 @@ Index: git/librtmp/Makefile
>     =C2=A0=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>     =C2=A0--- git.orig/librtmp/Makefile
>     =C2=A0+++ git/librtmp/Makefile
>     -@@ -107,6 +107,7 @@ install_base:=C2=A0 =C2=A0 =C2=A0 librtmp.a li=
brtmp.pc
>     +@@ -115,6 +115,7 @@ install_base:=C2=A0 =C2=A0 =C2=A0 librtmp.a li=
brtmp.pc
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 cp librtmp.3 $(MANDIR)/man3
>=20
>     - install_so:=C2=A0 =C2=A0librtmp.$(SO_EXT)
>     + install_so:=C2=A0 =C2=A0librtmp$(SO_EXT)
>     =C2=A0+=C2=A0 =C2=A0 =C2=A0 -mkdir -p $(SODIR)
>     -=C2=A0 =C2=A0 =C2=A0 =C2=A0cp librtmp.$(SO_EXT) $(SODIR)
>     -=C2=A0 =C2=A0 =C2=A0 =C2=A0cd $(SODIR); ln -sf librtmp.$(SO_EXT) l=
ibrtmp.$(SOX)
>     -
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0cp librtmp$(SO_EXT) $(SODIR)
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTALL_IMPLIB)
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0cd $(SODIR); ln -sf librtmp$(SO_EXT) li=
brtmp.$(SOX)
>     diff --git
>     a/meta-multimedia/recipes-multimedia/rtmpdump/rtmpdump_2.4.bb
>     <http://rtmpdump_2.4.bb>
>     b/meta-multimedia/recipes-multimedia/rtmpdump/rtmpdump_2.4.bb
>     <http://rtmpdump_2.4.bb>
>     index c5513b0252..a72b0d651e 100644
>     --- a/meta-multimedia/recipes-multimedia/rtmpdump/rtmpdump_2.4.bb
>     <http://rtmpdump_2.4.bb>
>     +++ b/meta-multimedia/recipes-multimedia/rtmpdump/rtmpdump_2.4.bb
>     <http://rtmpdump_2.4.bb>
>     @@ -5,9 +5,9 @@ HOMEPAGE =3D "http://rtmpdump.mplayerhq.hu/"
>     =C2=A0LICENSE =3D "GPLv2"
>     =C2=A0LIC_FILES_CHKSUM =3D
>     "file://COPYING;md5=3D751419260aa954499f7abaabaa882bbe"
>=20
>     -DEPENDS =3D "openssl zlib"
>     +DEPENDS =3D "openssl10 zlib"
>=20
>     -SRCREV =3D "3121324046e4ca1934e7e28293fc8326475d5053"
>     +SRCREV =3D "fa8646daeb19dfd12c181f7d19de708d623704c0"
>     =C2=A0SRC_URI =3D " \
>     =C2=A0 =C2=A0 =C2=A0git://git.ffmpeg.org/rtmpdump <http://git.ffmpe=
g.org/rtmpdump> \
>     =C2=A0 =C2=A0 =C2=A0file://fix-racing-build-issue.patch"
>     --=20
>     2.18.0
>=20
>     --=20
>     _______________________________________________
>     Openembedded-devel mailing list
>     Openembedded-devel@lists.openembedded.org
>     <mailto:Openembedded-devel@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>=20


--dJFZhp9APWE40vBhLgC3nK0TJi6oFoRbn--

--OAVTql0m1cZanhu42Q0GJQGSkihX7DmLB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSPpVvapDR0rgZCCc27BTNVkZ0zFAUCW5BJmAAKCRC7BTNVkZ0z
FMv/AJ9XpMtvBvXNbFphtmuELdxdlez6twCfS4ukTHjxaYkV2TsofSbYPYp9/oM=
=Q1hK
-----END PGP SIGNATURE-----

--OAVTql0m1cZanhu42Q0GJQGSkihX7DmLB--
