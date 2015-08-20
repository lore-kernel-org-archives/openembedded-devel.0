Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id 551DB76A51
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Aug 2015 16:00:43 +0000 (UTC)
Received: by wicja10 with SMTP id ja10so149417497wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Aug 2015 09:00:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=3bIWS17c08RnwH3trpn9IOeFa0QJwBooNtgnfPNTKXU=;
	b=cPpVl5Kpc+72OJBvsO0zAYpITYj7RPtAq7spyDkbPkHTHYZ7AvnAJVa9iE3qj3EjzG
	J841LdnxzXVvi3Ei7zVM0qXpmYkveewnn25ZKMu67cnc9IRr3rAUJ/OT1ZT9joyGoqyw
	H2DxJnLodLkWGQhdKyp2IVFRZhUtBxNzEATy25ZihW5D5gEmeMYxDz+vC37mT5ENGgKT
	A/Km/Be6+lUfRlmWfrSp93zSXde/fmqraQ4dtsOWPl6hla36NjtSAaN9lob4/AwTwWth
	6/DM4rhE0BmPMy7gUxQQQ8OWdNJL415eBeARjou5UkmnuA3jmCDhVt8IT94xvLZIVy3Y
	gq9w==
X-Gm-Message-State: ALoCoQltb8gZZjXDXByqSDf2mjviGXs9tYLtCb2reFUKv+K0Z57Tq3Xg5vyD48joVi01XppdVTES
X-Received: by 10.194.113.170 with SMTP id iz10mr7289278wjb.58.1440086443764; 
	Thu, 20 Aug 2015 09:00:43 -0700 (PDT)
Received: from ?IPv6:2001:610:612::d135:af1b:59d8:7e60?
	([2001:610:612:0:d135:af1b:59d8:7e60])
	by smtp.gmail.com with ESMTPSA id
	ub19sm31136814wib.8.2015.08.20.09.00.42
	(version=TLS1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 20 Aug 2015 09:00:42 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.0 \(3075\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <20150818103519.GA13732@jama>
Date: Thu, 20 Aug 2015 18:00:42 +0200
Message-Id: <B49558CC-A15C-42A6-B132-E0D1C496EB94@dominion.thruhere.net>
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
X-List-Received-Date: Thu, 20 Aug 2015 16:00:44 -0000
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
>=20
> and consolidate into one patchsets which will work for both?

I=E2=80=99ve sent my WIP patchset to the list just now. It=E2=80=99s not =
working reliably, but it=E2=80=99s close :)


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


