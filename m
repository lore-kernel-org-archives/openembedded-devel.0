Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f51.google.com (mail-pa0-f51.google.com
	[209.85.220.51])
	by mail.openembedded.org (Postfix) with ESMTP id 36FC971633
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Aug 2015 05:57:21 +0000 (UTC)
Received: by padfo6 with SMTP id fo6so12457969pad.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Aug 2015 22:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:message-id
	:references:to;
	bh=M5Yp5nTceP3eGhb9rXp1hFiKWm0Sy3bLZLgzxTBdqcY=;
	b=JeXd38yYAxxM1sNfuYXUAwlc+GKWUTubqk0/0Ujdj37m62Q2lBF5nyevDr5oQ5WqcM
	TT9LB7A2oOl77DwE77Rm3yJ/3KKDbNvcdPjV/Ddn77EYTnhZg6lZqLwXT88xDESQY7HH
	Pyw9XCel3FkImIR5SU4uTMu4Em+RCck7SyUQp67A21tyite8v/l9Nkur0zZXRYMudhoC
	+/MJOFiO7QgP1N9A2gFf+5D1k574sECgC0TsR77Jzy7EIeb5gerszNQ4q0h5+GMVIG08
	3LEd4gDtcgNaWmaoivEn54CRALqAC/FFXBqcyR6jaZu+1FswpFBcm4vTdC10wzivZjCK
	iq6w==
X-Received: by 10.66.248.72 with SMTP id yk8mr12458642pac.112.1440741439539;
	Thu, 27 Aug 2015 22:57:19 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:e943:4351:71e0:b332?
	([2601:646:8601:4580:e943:4351:71e0:b332])
	by smtp.gmail.com with ESMTPSA id
	eu6sm4359157pdb.86.2015.08.27.22.57.18
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 27 Aug 2015 22:57:19 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Pgp-Agent: GPGMail 2.5.1
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <20150827141522.GP26375@denix.org>
Date: Thu, 27 Aug 2015 22:57:17 -0700
Message-Id: <D4C07404-5127-46A0-867F-D21F90BBFDA7@gmail.com>
References: <1440332209-8802-1-git-send-email-net147@gmail.com>
	<20150827141522.GP26375@denix.org>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.2104)
Subject: Re: [meta-qt5][PATCH] qtbase: replace host paths with qmake built-in properties in qconfig.pri
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
X-List-Received-Date: Fri, 28 Aug 2015 05:57:27 -0000
X-Groupsio-MsgNum: 57095
Content-Type: multipart/signed;
	boundary="Apple-Mail=_D2C49199-A98E-4903-93CA-785D5923612B";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_D2C49199-A98E-4903-93CA-785D5923612B
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Denys

I have posted an incremental fix, here
=
https://github.com/meta-qt5/meta-qt5/commit/a0a5002ed4bfcce50d6462897c4701=
246061581a

Jonathan

Can you see if it still fixes the usecase that you originally were =
trying to fix ?

> On Aug 27, 2015, at 7:15 AM, Denys Dmytriyenko <denis@denix.org> =
wrote:
>=20
> This seems to cause a build issue in qtwebkit and qtwebengine as well.
>=20
> It manifests in not being able to find glib.h or gio/gio.h headers.
>=20
> Khem, Martin and I are still discussing this on IRC, but I propose to =
revert
> this commit until it's tested better for all modules.
>=20
> --
> Denys
>=20
>=20
> On Sun, Aug 23, 2015 at 10:16:49PM +1000, Jonathan Liu wrote:
>> This avoids qconfig.pri in the Qt SDK incorrectly including paths =
from
>> the build host that may not exist on the SDK host. As the paths are
>> now correct, qmake can correctly detect system include paths and use
>> -isystem instead of -I for Qt's include directories which allows the
>> suppression of warnings from library headers when building Qt
>> applications.
>>=20
>> Signed-off-by: Jonathan Liu <net147@gmail.com>
>> ---
>> recipes-qt/qt5/qtbase_git.bb | 5 +++++
>> 1 file changed, 5 insertions(+)
>>=20
>> diff --git a/recipes-qt/qt5/qtbase_git.bb =
b/recipes-qt/qt5/qtbase_git.bb
>> index ae63150..324a115 100644
>> --- a/recipes-qt/qt5/qtbase_git.bb
>> +++ b/recipes-qt/qt5/qtbase_git.bb
>> @@ -234,6 +234,11 @@ do_install_append() {
>>     # Remove macx-ios-clang directory because =
/usr/lib/qt5/mkspecs/macx-ios-clang/rename_main.sh:#!/bin/bash
>>     # triggers QA Issue: qtbase-mkspecs requires /bin/bash, but no =
providers in its RDEPENDS [file-rdeps]
>>     rm -rf ${D}/${OE_QMAKE_PATH_QT_ARCHDATA}/mkspecs/macx-ios-clang
>> +
>> +    # Replace host paths with qmake built-in properties
>> +    sed -i -e 's| ${STAGING_DIR_NATIVE}| $$[QT_HOST_PREFIX]|g' \
>> +        -e 's| ${STAGING_DIR_HOST}| $$[QT_INSTALL_PREFIX]|g' \
>> +        ${D}/${OE_QMAKE_PATH_QT_ARCHDATA}/mkspecs/qconfig.pri
>> }
>>=20
>> PACKAGES =3D. " \
>> --
>> 2.5.0
>>=20
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--Apple-Mail=_D2C49199-A98E-4903-93CA-785D5923612B
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlXf+D0ACgkQuwUzVZGdMxQNXQCfX+K9uvqMSfEGVfH+cqJpN1T4
VNcAnAzr44xCyKTrplDO1s+pO2EqNhyO
=o7lS
-----END PGP SIGNATURE-----

--Apple-Mail=_D2C49199-A98E-4903-93CA-785D5923612B--
