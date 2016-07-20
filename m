Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f173.google.com (mail-pf0-f173.google.com
	[209.85.192.173])
	by mail.openembedded.org (Postfix) with ESMTP id 21DAD606A8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jul 2016 20:23:06 +0000 (UTC)
Received: by mail-pf0-f173.google.com with SMTP id x72so22293994pfd.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jul 2016 13:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:subject:from:in-reply-to:date:message-id:references:to; 
	bh=kTiaeZnz/nVi76VhlKP2/g/53JtVp0JghGOKz35mai4=;
	b=XFeajYWYtFuoawc/dh649cxbCCFxsQK9H/Y7X1i+4UXxZ5DPspyy3WOUZpPKNWLS31
	NLKaHWO3nkpY5XXvRvqSmaxNSjrBgRCgppd6PAB8YvCFjxUwhAPNTvHKKjlih1M8P2be
	sg/R7vqtDGkU6Tasg3mXclEcjNX8pQJ7q/ipGMxEB7A86FKuSOmEzcUPUOtxKqlPuUNf
	1I5UMRtErt0gbxk854qgwwXREsQaaQiE96N6qdLSLT9tH4jqnvkrvCXU9l9aqao62Uzr
	yCuQy2JFWsrhpgB/Qw12VZCTU5sShn+3ZfbvDYY/B7AXsISTnw6yaRl5zDZBzJI5CVqv
	UoHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date
	:message-id:references:to;
	bh=kTiaeZnz/nVi76VhlKP2/g/53JtVp0JghGOKz35mai4=;
	b=evVXJ+v3WsOBJUy6/UtBZ/1Wkz0gYBT/AxCq/6V9O0Qb63wlwNgG7Tv/FzPaTNO92n
	KEG5leOsIWtDPvna4jQWLNtXCDBh8HucJHuIBdpn21AthU7KSyM2KQlXY2DNKquL2bP9
	I7Z8D7HfJ5bEJ0YdgTk2C7Js3oK/pvRG9FMYbLZAhV+aWxvwcdKys3F6zRHBfgpl7eGC
	NObyaiAxC4v3oVu8h6rYILEwfhpiXtkZp+mk+cZqTYuVM2yEb3ZHwxEJVaLDXD69INw2
	uCxl1ot3FLh/81lIkAv8dYQO4QTIsG8wYnM3y0Zp/tETsdSviYGudlrTxkRyBxG2m/vr
	VoKQ==
X-Gm-Message-State: ALyK8tKX2Dw8THxhmsyRzuEoBnp2dTjUJbfCt6YpVR7z3wx2YGsQaG3BO+OlR//qe9KM+g==
X-Received: by 10.98.60.20 with SMTP id j20mr67532458pfa.114.1469046186727;
	Wed, 20 Jul 2016 13:23:06 -0700 (PDT)
Received: from ?IPv6:2601:646:8882:b8c:e800:ab06:7d73:85ce?
	([2601:646:8882:b8c:e800:ab06:7d73:85ce])
	by smtp.gmail.com with ESMTPSA id
	z10sm6558598pff.95.2016.07.20.13.23.05
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 20 Jul 2016 13:23:05 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <20160720201335.GA23547@openSUSE-i7.site>
Date: Wed, 20 Jul 2016 13:23:00 -0700
Message-Id: <E74BEDDC-C288-4F0E-80FE-2FCC5B76F762@gmail.com>
References: <20160720195201.22250-1-twoerner@gmail.com>
	<20160720195201.22250-3-twoerner@gmail.com>
	<CAMKF1spXxjfGzhg58hHNDcxQaRWWJ4pB36y7WTbpLjBSM_01LA@mail.gmail.com>
	<20160720201335.GA23547@openSUSE-i7.site>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
X-Mailer: Apple Mail (2.3124)
Subject: Re: [meta-browser][PATCH 2/4] chromium: gcc-6 support
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
X-List-Received-Date: Wed, 20 Jul 2016 20:23:07 -0000
X-Groupsio-MsgNum: 62284
Content-Type: multipart/signed;
	boundary="Apple-Mail=_7637163A-2ECE-4E57-AB52-23CAE33618D0";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_7637163A-2ECE-4E57-AB52-23CAE33618D0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Jul 20, 2016, at 1:13 PM, Trevor Woerner <twoerner@gmail.com> =
wrote:
>=20
> On Wed 2016-07-20 @ 12:59:21 PM, Khem Raj wrote:
>> On Wed, Jul 20, 2016 at 12:51 PM, Trevor Woerner <twoerner@gmail.com> =
wrote:
>>> Allow chromium to build with gcc-6.
>>=20
>> bunch of patches are deleted. Are they upstreamed ? or how do they
>> help compiling chromium with gcc6?
>=20
> At some point in the past (I could figure out who, but I don't want to =
give
> the impression that I'm pointing fingers) someone added the following =
line to
> the recipe:
>=20
> 	-Ddisable_fatal_linker_warnings=3D1
>=20
> The *intention* was to keep the build from failing due to compiler =
-Werror
> issues. For whatever reason this line has no effect on the build; the =
-Werror
> is still used, and builds still fail for annoying, non-critical =
reasons.
> Therefore we've amassed a large set of patches that try to fix these
> warnings by either fixing the code itself:

which is the right thing. We should try to make packages better and send =
patches upstream as much
as we can. This helps us ensure that the patches get reviewed even if =
they are rejected. Improves
our metadata quality.

>=20
>=20
> 	> > ---- a/third_party/ots/src/name.cc
> 	> > -+++ b/third_party/ots/src/name.cc
> 	> > -@@ -79,7 +79,7 @@ bool ots_name_parse(Font *font, const =
uint8_t* data, size_t length) {
> 	> > -   const char* string_base =3D reinterpret_cast<const =
char*>(data) +
> 	> > -       string_offset;
> 	> > -
> 	> > --  NameRecord prev_record;
> 	> > -+  NameRecord prev_record(0, 0, 0, 0);
> 	> > -   bool sort_required =3D false;
> 	> > -
>=20
> or by (more likely) some l337 #pragma tricks:
>=20

these are still workarounds but alright in some cases we need them. I =
would still encourage to run
then by chromium community though.

>=20
> 	> > ---- a/third_party/WebKit/Source/wtf/dtoa/bignum.cc
> 	> > -+++ b/third_party/WebKit/Source/wtf/dtoa/bignum.cc
> 	> > -@@ -102,7 +102,10 @@
> 	> > -     }
> 	> > -
> 	> > -
> 	> > -+#pragma GCC diagnostic push
> 	> > -+#pragma GCC diagnostic warning "-Wstrict-overflow"
> 	> > -     void Bignum::AssignDecimalString(Vector<const char> =
value) {
> 	> > -+#pragma GCC diagnostic pop
> 	> > -         // 2^64 =3D 18446744073709551616 > 10^19
> 	> > -         const int kMaxUint64DecimalDigits =3D 19;
> 	> > -         Zero();
> 	> > -@@ -696,7 +696,10 @@
> 	> > -     }
>=20
> What I've done here is to patch the various BUILD.gn files and *gyp =
files so
> that -Werror is actually removed from our build (which was the =
original
> intent), thereby making a number of subsequent patches superfluous.


I see that and its fine. However we are going to hide issues if we lower =
the guards.

>=20
> Given the chromium developers use a completely different compiler and,
> therefore, are unlikely to be tripping over the same warning/error =
problems we
> keep seeing, I believe this is a sensible thing to do. Especially =
since, going
> forward, is reduces the maintanance burden, and (in my opinion) the =
upstream
> developers are probably unlikely to ever accept these sorts of patches =
anyway.

If you fix a genuine case that is being caught by gcc and clang is =
missing to catch and vice
versa it its definitely of interest

--Apple-Mail=_7637163A-2ECE-4E57-AB52-23CAE33618D0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAleP3akACgkQuwUzVZGdMxTz7gCcDUN0z/p2QCQ4EYnGMYPyTx1o
SH4AnRLedDNxhlm310u3WnHn7P6hY0UO
=ubXJ
-----END PGP SIGNATURE-----

--Apple-Mail=_7637163A-2ECE-4E57-AB52-23CAE33618D0--
