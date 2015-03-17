Return-Path: <philip@balister.org>
Received: from sanddollar.geekisp.com (sanddollar.geekisp.com
	[216.168.135.167])
	by mail.openembedded.org (Postfix) with SMTP id 3066465CD0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Mar 2015 12:44:38 +0000 (UTC)
Received: (qmail 8481 invoked by uid 1003); 17 Mar 2015 12:44:39 -0000
Received: from unknown (HELO ?10.212.226.128?)
	(philip@opensdr.com@98.191.4.207)
	by mail.geekisp.com with (DHE-RSA-AES128-SHA encrypted) SMTP;
	17 Mar 2015 12:44:39 -0000
Message-ID: <550821AC.6080908@balister.org>
Date: Tue, 17 Mar 2015 08:44:28 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1426528097-14698-1-git-send-email-kaiu@gmx.de>
	<20150317120552.GA4738@jama>
In-Reply-To: <20150317120552.GA4738@jama>
Cc: kulrich <ulrich.kai@gmail.com>, Holger Freyther <zecke@selfish.org>
Subject: Re: [meta-oe][PATCH] Add smstools3 http://smstools3.kekekasvi.com to meta-oe recipes-connectivity.
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
X-List-Received-Date: Tue, 17 Mar 2015 12:44:40 -0000
X-Groupsio-MsgNum: 54813
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="TWTb2gHiJ5JI9qsI8TdeOJjtnL9mpfjlJ"

--TWTb2gHiJ5JI9qsI8TdeOJjtnL9mpfjlJ
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

Also does this belong in meta-telephony?

Philip

On 03/17/2015 08:05 AM, Martin Jansa wrote:
>=20
> subject should start with smstools3:
>=20
> On Mon, Mar 16, 2015 at 06:48:17PM +0100, Kai Ulrich wrote:
>> From: kulrich <ulrich.kai@gmail.com>
>>
>> Signed-off-by: kulrich <ulrich.kai@gmail.com>
>> ---
>>  .../smstools3/sms_binpath_and_psops.patch          | 19 ++++++++++
>>  .../smstools3/smstools3_3.1.15.bb                  | 44 +++++++++++++=
+++++++++
>>  2 files changed, 63 insertions(+)
>>  create mode 100644 meta-oe/recipes-connectivity/smstools3/smstools3/s=
ms_binpath_and_psops.patch
>>  create mode 100644 meta-oe/recipes-connectivity/smstools3/smstools3_3=
=2E1.15.bb
>>
>> diff --git a/meta-oe/recipes-connectivity/smstools3/smstools3/sms_binp=
ath_and_psops.patch b/meta-oe/recipes-connectivity/smstools3/smstools3/sm=
s_binpath_and_psops.patch
>> new file mode 100644
>> index 0000000..ffcaa09
>> --- /dev/null
>> +++ b/meta-oe/recipes-connectivity/smstools3/smstools3/sms_binpath_and=
_psops.patch
>> @@ -0,0 +1,19 @@
>> +Index: smstools3/scripts/sms3
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +--- smstools3.orig/scripts/sms3	2010-05-04 11:21:44.000000000 +0200
>> ++++ smstools3/scripts/sms3	2015-02-22 20:05:51.615074469 +0100
>> +@@ -24,11 +24,11 @@
>> + # Logfile can also be defined in here:
>> + LOGFILE=3D"/var/log/smsd.log"
>> +=20
>> +-DAEMON=3D/usr/local/bin/smsd
>> ++DAEMON=3D/usr/bin/smsd
>> + # A program which turns power off for couple of seconds:
>> +-RESETMODEMS=3D/usr/local/bin/smsd_resetmodems
>> ++RESETMODEMS=3D/usr/bin/smsd_resetmodems
>> + NAME=3Dsmsd
>> +-PSOPT=3D"-e"
>> ++PSOPT=3D""
>> + ECHO=3Decho
>> + case `uname` in
>> +   *BSD|Darwin)
>> diff --git a/meta-oe/recipes-connectivity/smstools3/smstools3_3.1.15.b=
b b/meta-oe/recipes-connectivity/smstools3/smstools3_3.1.15.bb
>> new file mode 100644
>> index 0000000..55a2583
>> --- /dev/null
>> +++ b/meta-oe/recipes-connectivity/smstools3/smstools3_3.1.15.bb
>> @@ -0,0 +1,44 @@
>> +SUMMARY =3D "The SMS Server Tools 3 is a SMS Gateway software which c=
an send and receive short messages through GSM modems and mobile phones."=

>=20
> SUMMARY should be short, split to SUMMARY and DESCRIPTION.
>=20
>> +SECTION =3D "network"
>> +LICENSE =3D "GPLv2"
>> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D4d21efa1bb2a186360dde4035f=
860682"
>> +HOMEPAGE =3D "http://smstools3.kekekasvi.com"
>> +
>> +SRC_URI =3D "http://smstools3.kekekasvi.com/packages/${PN}-${PV}.tar.=
gz \
>=20
> ${PN}-${PV} -> ${BP}
>=20
>> +           file://sms_binpath_and_psops.patch"
>> +
>> +SRC_URI[md5sum] =3D "0241ef60e646fac1a06254a848e61ed7"
>> +SRC_URI[sha256sum] =3D "ed00ffaeaa312a5b4f969f4e97a64603a866bbe16e393=
ea02f5bf05234814d59"
>> +
>> +
>> +S =3D "${WORKDIR}/${PN}"
>> +
>> +RDEPENDS_${PN} =3D " bash "
>=20
> drop unnecessary spaces around bash.
>=20
>> +INITSCRIPT_NAME =3D "sms3"
>> +INITSCRIPT_PARAMS =3D "defaults"
>> +
>> +inherit update-rc.d
>> +
>> +do_install () {
>> +=09
>> +	install -d ${D}${bindir}=09
>> +	install -m 755 ${S}/src/smsd "${D}${bindir}/smsd"
>> +=09
>> +	install -m 755 ${S}/scripts/sendsms "${D}${bindir}/sendsms"
>> +	install -m 755 ${S}/scripts/sms2html "${D}${bindir}/sms2html"
>> +	install -m 755 ${S}/scripts/sms2unicode "${D}${bindir}/sms2unicode" =

>> +	install -m 755 ${S}/scripts/unicode2sms "${D}${bindir}/unicode2sms"
>> +
>> +	install -d ${D}${sysconfdir}=09
>> +	install -m 644 ${S}/examples/smsd.conf.easy "${D}${sysconfdir}/smsd.=
conf"
>> +
>> +	install -d "${D}${localstatedir}/spool"
>> +	install -d "${D}${localstatedir}/spool/sms"
>> +	install -d "${D}${localstatedir}/spool/sms/incoming"
>> +	install -d "${D}${localstatedir}/spool/sms/outgoing"
>> +	install -d "${D}${localstatedir}/spool/sms/checked"
>> +
>> +	install -d ${D}${sysconfdir}/init.d
>> +	install -m 755 ${S}/scripts/sms3 "${D}${sysconfdir}/init.d/${INITSCR=
IPT_NAME}"
>> +
>> +}
>> --=20
>> 1.9.1
>>
>> --=20
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>=20
>=20
>=20


--TWTb2gHiJ5JI9qsI8TdeOJjtnL9mpfjlJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJVCCGvAAoJEMDJd4rr0merI9YIAMRpCS2Tb7SZNGjDBncc3q5I
8/BxliGURbkmkC8rZrpjTKNBx4he8cNbc+NWLuSvKGKkrY7vzretBAhCvEGKNkse
PHpmc2BXUBLxOUlLxIkLYPsDpDJ0kOS3uVC+Nys5CBLeZhbqqHLRLtXDUW+2+LZK
iDhuOpVqzZlJlmCir3S24I+i42rmYcnQkBbUu3VW2hHCckP839w2oHqD/LQuuizA
CwNO/+ROvQ1o3vn5WOnZo5TCGL3+J5Vrd75GjyNr8ECJ5nKBwo3BePtYm7i+7ktC
LGE18JEd6ts/pUk+7RH1FBuixDBUyH21jW0N/+uSPvzpz7RrDqNEjIX4KGGgoTE=
=NnLZ
-----END PGP SIGNATURE-----

--TWTb2gHiJ5JI9qsI8TdeOJjtnL9mpfjlJ--
