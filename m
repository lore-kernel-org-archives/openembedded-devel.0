Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id 6E9AA75E7E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Aug 2015 10:51:08 +0000 (UTC)
Received: by wicne3 with SMTP id ne3so97071820wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Aug 2015 03:51:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=iHtiPatrnurqACGmZSyLWegyVbvdxMFuoC1ZP2NhmXw=;
	b=e7/Ava5IwkUhuQOyCPze9AMFQOGMD14JwNJHNfaASTB0f4FfTBH3VdLGzKpguMDUba
	OXcnvpJ6OFs2Pby7kAmz8Z7tIETVN6fXJpUo3H3q7l5SuU9lip2s67Q5jxx7P8nsTtIn
	m85J8Ym633p9D9aT8DlxLWA84rUTCqyEKOY4vqJpqCj2dmHqVF0l4pChE4NCbdZphVPX
	M/IPEKU8Pnk3aEquExyQSvij2W+VClBxFS6ShJazeW9UldhPjXibjso4vW/cNyEYJG7J
	lsW7QTgMXQcebVqR7GnDtY0lNp17d/kFTuKWw4Dhli+7yERZPVYW9y428spc6gwkfq42
	EtTg==
X-Gm-Message-State: ALoCoQlH37Fp8wHdXA/yPmxbuqIMEqx6HcRMbwYDyMF/ChBeUt9PXibQrYDf9uq/daPj0qKp1rwc
X-Received: by 10.180.85.233 with SMTP id k9mr44040908wiz.53.1439895069048;
	Tue, 18 Aug 2015 03:51:09 -0700 (PDT)
Received: from ?IPv6:2001:610:612::c876:d568:c498:f6d2?
	([2001:610:612:0:c876:d568:c498:f6d2])
	by smtp.gmail.com with ESMTPSA id
	b13sm20813881wic.15.2015.08.18.03.51.07
	(version=TLS1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 18 Aug 2015 03:51:08 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.0 \(3075\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <20150818103519.GA13732@jama>
Date: Tue, 18 Aug 2015 12:51:06 +0200
Message-Id: <E9FFBF34-7714-453B-BD43-0B3241486A08@dominion.thruhere.net>
References: <1439110446-22189-1-git-send-email-koen@dominion.thruhere.net>
	<20150818103519.GA13732@jama>
To: Martin Jansa <martin.jansa@gmail.com>
X-Mailer: Apple Mail (2.3075)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][RFC][PATCH 1/3] heimdal 1.6rc2: add buildtool for samba4
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 18 Aug 2015 10:51:10 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


> Op 18 aug. 2015, om 12:35 heeft Martin Jansa <martin.jansa@gmail.com> =
het volgende geschreven:
>=20
> On Sun, Aug 09, 2015 at 10:54:04AM +0200, Koen Kooi wrote:
>> Samba4 uses ans1_compile and compile_et to build itself, so we need a
>> -native version of it. Heimdal is the external upstream  variant of =
the tools
>> samba bundles.
>=20
> Can you please compare with implementation from Bian:
> =
http://lists.openembedded.org/pipermail/openembedded-devel/2015-August/102=
571.html

Bians version has some shiny features, like qemu support, but has some =
other issues, style violations being the most obvious.=20

> and consolidate into one patchsets which will work for both?

I=E2=80=99ll take Bians set and fix up the support recipes and try to =
consolidate the samba recipes. After I get back from vacation, so that =
will take a few weeks.

regards,

Koen

>=20
> Thanks,
>=20
>>=20
>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>> ---
>> ...dm5-fix-race-in-Makefile-with-kadm5_err.h.patch | 34 =
++++++++++++++++
>> .../recipes-connectivity/samba/heimdal_1.6rc2.bb   | 45 =
++++++++++++++++++++++
>> 2 files changed, 79 insertions(+)
>> create mode 100644 =
meta-oe/recipes-connectivity/samba/heimdal/0002-kadm5-fix-race-in-Makefile=
-with-kadm5_err.h.patch
>> create mode 100644 =
meta-oe/recipes-connectivity/samba/heimdal_1.6rc2.bb
>>=20
>> diff --git =
a/meta-oe/recipes-connectivity/samba/heimdal/0002-kadm5-fix-race-in-Makefi=
le-with-kadm5_err.h.patch =
b/meta-oe/recipes-connectivity/samba/heimdal/0002-kadm5-fix-race-in-Makefi=
le-with-kadm5_err.h.patch
>> new file mode 100644
>> index 0000000..bab933c
>> --- /dev/null
>> +++ =
b/meta-oe/recipes-connectivity/samba/heimdal/0002-kadm5-fix-race-in-Makefi=
le-with-kadm5_err.h.patch
>> @@ -0,0 +1,34 @@
>> +=46rom 18fe7d300f133c2b9eb93bb4bd81e4644979a74b Mon Sep 17 00:00:00 =
2001
>> +From: =3D?UTF-8?q?Jakub=3D20=3DC4=3D8Cajka?=3D <jcajka@redhat.com>
>> +Date: Tue, 1 Jul 2014 13:13:43 -0600
>> +Subject: [PATCH] kadm5: fix race in Makefile with kadm5_err.h
>> +
>> +When running make with -j4, occasionally kadm5 fails due to a =
missing
>> +header file kadm5_err.h. Fix the race condition.
>> +
>> +Reported at https://bugzilla.redhat.com/1115164
>> +
>> +Reviewed-by: Ken Dreyer <ktdreyer@ktdreyer.com>
>> +
>> +Upstream-status: Backport [upstream commit =
6affa4cceceaa1369dd895f8acdd7a883ee65674]
>> +
>> +Signed-off-by: Thomas Petazzoni =
<thomas.petazzoni@free-electrons.com>
>> +---
>> + lib/kadm5/Makefile.am | 1 +
>> + 1 file changed, 1 insertion(+)
>> +
>> +diff --git a/lib/kadm5/Makefile.am b/lib/kadm5/Makefile.am
>> +index f8be3b1..1b399b1 100644
>> +--- a/lib/kadm5/Makefile.am
>> ++++ b/lib/kadm5/Makefile.am
>> +@@ -155,6 +155,7 @@ iprop-commands.c iprop-commands.h: =
iprop-commands.in
>> + 	$(SLC) $(srcdir)/iprop-commands.in
>> +=20
>> + $(libkadm5srv_la_OBJECTS): kadm5_err.h
>> ++$(libkadm5clnt_la_OBJECTS): kadm5_err.h
>> + $(iprop_log_OBJECTS): iprop-commands.h
>> +=20
>> + client_glue.lo server_glue.lo: $(srcdir)/common_glue.c
>> +--=20
>> +2.4.5
>> +
>> diff --git a/meta-oe/recipes-connectivity/samba/heimdal_1.6rc2.bb =
b/meta-oe/recipes-connectivity/samba/heimdal_1.6rc2.bb
>> new file mode 100644
>> index 0000000..7245d14
>> --- /dev/null
>> +++ b/meta-oe/recipes-connectivity/samba/heimdal_1.6rc2.bb
>> @@ -0,0 +1,45 @@
>> +SUMMARY =3D "The Heimdal Kerberos 5, PKIX, CMS, GSS-API, SPNEGO, =
NTLM, Digest-MD5 and, SASL implementation."
>> +
>> +DEPENDS =3D "e2fsprogs ncurses"
>> +
>> +LICENSE =3D "BSD-3"
>> +LIC_FILES_CHKSUM =3D =
"file://LICENSE;md5=3Dd2c6f8cfe82d4fdd74355866f0c14d3f"
>> +
>> +PV =3D "1.5+1.6rc2"
>> +
>> +SRC_URI =3D "http://www.h5l.org/dist/src/heimdal-1.6rc2.tar.gz \
>> +           =
file://0002-kadm5-fix-race-in-Makefile-with-kadm5_err.h.patch \
>> +          "
>> +S =3D "${WORKDIR}/heimdal-1.6rc2"
>> +SRC_URI[md5sum] =3D "152ca82660864acf7f712ae1a57e6795"
>> +SRC_URI[sha256sum] =3D =
"8fe19e0f12ff0d0c2f20a6cf56727deaabd89db9c197288022fb489e103b730d"
>> +
>> +inherit autotools pkgconfig
>> +
>> +EXTRA_OECONF =3D " \
>> +	--disable-shared \
>> +	--enable-static \
>> +	--without-openldap \
>> +	--without-capng \
>> +	--without-sqlite3 \
>> +	--without-libintl \
>> +	--without-openssl \
>> +	--without-berkeley-db \
>> +	--without-readline \
>> +	--without-libedit \
>> +	--without-hesiod \
>> +	--without-x \
>> +	--disable-heimdal-documentation \
>> +       "
>> +
>> +# Even with the makefile patch parallel make fails 8 out of 10 times =
with -j8=20
>> +PARALLEL_MAKE =3D ""
>> +
>> +# Put both compile tools together in $PATH and libexecdir in order =
to build samba4
>> +do_install_append() {
>> +    ln -sf ${libexecdir}/heimdal/asn1_compile ${D}${bindir}/
>> +    ln -sf ${bindir}/compile_et ${D}${libexecdir}/heimdal/
>> +}
>> +
>> +BBCLASSEXTEND =3D "native"
>> +
>> --=20
>> 2.0.1
>>=20
>> --=20
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


