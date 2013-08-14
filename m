Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f169.google.com (mail-ea0-f169.google.com
	[209.85.215.169])
	by mail.openembedded.org (Postfix) with ESMTP id 67E8E60593
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Aug 2013 07:03:40 +0000 (UTC)
Received: by mail-ea0-f169.google.com with SMTP id z7so4656779eaf.28
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Aug 2013 00:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=bOypvoYT9dNmJpScOG67f+OHGIHDHkRyfCbURBoZlS8=;
	b=AzXPskn2062zFwshElxh9D5yKznQKu7SS08/I7mX3rU3tBnDBFuy+aphd4AuAxLt9N
	YRFtO/0xl8XHJ7YnMVqHB/ON7BerQI7ofq44QHPbJOmplRfC+xHOLTCQS4yvsfeDn4JW
	PwJcFcBAsFyRjkHnjXVjhIMiQ9673S1sD7QwnAiQXlmG2OHCwOcSXrVxdNLnHqFJv1um
	4Aae2wVzA8qzTz9midO/WHBgbNFmJgatCeYySv40birZ3qvwGq9th9y8Z4BEpIMNEtbi
	wm6Jj0r7ak98KZcJAGPYWOhILJ3T0JWp+kM2h79JdJSfPfCBrq2Q14cyaWNZakHGz6av
	UWTA==
X-Received: by 10.14.122.69 with SMTP id s45mr1410860eeh.58.1376463820470;
	Wed, 14 Aug 2013 00:03:40 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	d8sm59404440eeh.8.2013.08.14.00.03.39
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 14 Aug 2013 00:03:39 -0700 (PDT)
Date: Wed, 14 Aug 2013 09:04:30 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130814070430.GR17945@jama>
References: <1375526327-16139-1-git-send-email-lpapp@kde.org>
	<1375526327-16139-2-git-send-email-lpapp@kde.org>
MIME-Version: 1.0
In-Reply-To: <1375526327-16139-2-git-send-email-lpapp@kde.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-qt5][PATCH] Add QtSerialPort
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
X-List-Received-Date: Wed, 14 Aug 2013 07:03:41 -0000
X-Groupsio-MsgNum: 45680
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="eyYj78xbwv+yMvU1"
Content-Disposition: inline

--eyYj78xbwv+yMvU1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 03, 2013 at 11:38:47AM +0100, Laszlo Papp wrote:
> Signed-off-by: Laszlo Papp <lpapp@kde.org>
> ---
>  recipes-qt/qt5/qtserialport.inc      | 3 +++
>  recipes-qt/qt5/qtserialport_5.1.0.bb | 5 +++++
>  2 files changed, 8 insertions(+)
>  create mode 100644 recipes-qt/qt5/qtserialport.inc
>  create mode 100644 recipes-qt/qt5/qtserialport_5.1.0.bb

Unfortunately I've merged this yesterday even without test run in world bui=
ld
because builder was busy with test-dependencies tasks for last 3 weeks
and it fails:

ERROR: qtserialport: md5 data is not matching for file://LICENSE.LGPL;md5=
=3D4193e7f1d47a858f6b7c0f1ee66161de
ERROR: qtserialport: The new md5 checksum is 4fbd65380cdd255951079008b36451=
6c
ERROR: qtserialport: Check if the license information has changed in
ERROR: qtserialport: md5 data is not matching for file://LGPL_EXCEPTION.txt=
;md5=3D0145c4d1b6f96a661c2c139dfb268fb6
ERROR: qtserialport: The new md5 checksum is eb6c371255e1262c55ae9b652a90b5=
28
ERROR: qtserialport: Check if the license information has changed in
ERROR: qtserialport: md5 data is not matching for file://LICENSE.FDL;md5=3D=
6d9f2a9af4c8b8c3c769f6cc1b6aaf7e
ERROR: qtserialport: The new md5 checksum is 3801d7932fdc07fd9efe89f9854a6c=
aa
ERROR: qtserialport: Check if the license information has changed in
ERROR: Licensing Error: LIC_FILES_CHKSUM does not match, please fix
ERROR: Function failed: do_qa_configure
ERROR: Logfile of failure stored in: /home/jenkins/oe/shr-core-branches/shr=
-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/qtserialport/5.1.0-r0/temp/l=
og.do_configure.31249
NOTE: recipe qtserialport-5.1.0-r0: task do_configure: Failed

Please fix asap and next time send tested patches only or indicate in
e-mail that it wasn't tested.

>=20
> diff --git a/recipes-qt/qt5/qtserialport.inc b/recipes-qt/qt5/qtserialpor=
t.inc
> new file mode 100644
> index 0000000..bbb05a6
> --- /dev/null
> +++ b/recipes-qt/qt5/qtserialport.inc
> @@ -0,0 +1,3 @@
> +require qt5.inc
> +
> +DEPENDS +=3D "qtbase"
> diff --git a/recipes-qt/qt5/qtserialport_5.1.0.bb b/recipes-qt/qt5/qtseri=
alport_5.1.0.bb
> new file mode 100644
> index 0000000..9b6f7da
> --- /dev/null
> +++ b/recipes-qt/qt5/qtserialport_5.1.0.bb
> @@ -0,0 +1,5 @@
> +require qt5-${PV}.inc
> +require ${PN}.inc
> +
> +SRC_URI[md5sum] =3D "1f70621ae40cbda948106b070c6c37d2"
> +SRC_URI[sha256sum] =3D "0f36803c480b2b7111b343e9dd871ffab1b4fd53147bd564=
125ef2994b09cfb9"
> --=20
> 1.8.3.4
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--eyYj78xbwv+yMvU1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlILK/4ACgkQN1Ujt2V2gBzedACgtFhOIeGX15ZR7lhdCq1d6hrP
QxEAoK+Y027dMyyLOGaxcZzVav9an8fV
=H+6u
-----END PGP SIGNATURE-----

--eyYj78xbwv+yMvU1--
