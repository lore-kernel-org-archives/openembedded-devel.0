Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id C858E731D7
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 May 2016 16:40:02 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id q62so8737422wmg.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 May 2016 09:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dominion-thruhere-net.20150623.gappssmtp.com; s=20150623;
	h=mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=lgQh8MP4U2iuZsjoM3EB0Rky+c41gzD5ctqgQbueLt0=;
	b=DTTY+F1+B2tV8GZ+7dVok2ckhdcpwlNBecjhtY0YnCFh8TBIGt5h3Ryd73crR5pMay
	8PxMS8jwLr0oTADduxnt4I3aInH/FbQJNACiXsQDYDyXNYV6Sl9UnZrUnidzp/xNBwVS
	Xe2FzYIcxhfw8XGytM+bFAYd4k/0Jp/1h+5u3UWPkEMgpy/fE4l0T5vFvQ2+/WIzQUPW
	W2ZEQNgHGuzgRmnfMm9TmfPsCWCH9dtt4SXUKkm007/JOemuzi8C9L3sbbAhb8xaI104
	IyqWeFA8S7Tge5bb/Kj9XZYzceXTSHfC4VyKseOrRUs+Q42VV/B3oLKv2ARGvXLvkZTJ
	tMKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=lgQh8MP4U2iuZsjoM3EB0Rky+c41gzD5ctqgQbueLt0=;
	b=EHvJWH2eJgRemA/RFZjBHrjcNWjn9tUS8ER+XTWEmwtXzV8XdVP5f+RoOopbnMWKRc
	n8yUTOK+GUsK/eO0W3miNxNY/1LGKH/vrWaioWmqfgBZb9K/+ixND6qjvZKaLCgmvmq3
	wIO2Eay0BMC2SQAOEEYW+GMwC+PU4+jIZv2DSdxA2jAPOdyWL+LVr6EOBHIV1vKlYf9q
	qBt7nnChDtrx6rg/kx5Ghpf4QJD0si7dU+ELlbyijn91tr8xv+gFLDw+nQyGfSH8hSEa
	eSmJ63Mb7LaymbaZDVYCQLgaltXLnkEoTMQ8b5OI27367aXU2NPQyLhUyJACP4zxkoL2
	ZFqQ==
X-Gm-Message-State: ALyK8tI6vjUMv3r69Xfdtyns+EMcyGcoYQ8BlX+KZSn1KJAvjTu8RPqFecHpMUmlcxKaQQ==
X-Received: by 10.28.154.130 with SMTP id c124mr3899032wme.9.1464453602446;
	Sat, 28 May 2016 09:40:02 -0700 (PDT)
Received: from [172.20.0.187] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by smtp.gmail.com with ESMTPSA id
	h14sm14383811wme.1.2016.05.28.09.40.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 28 May 2016 09:40:01 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <5749C97D.6050809@gmail.com>
Date: Sat, 28 May 2016 18:40:00 +0200
Message-Id: <8ADF3BCD-C001-493B-9A59-C7CC2BFF73E6@dominion.thruhere.net>
References: <1464359669-14962-1-git-send-email-akuster808@gmail.com>
	<nibk7a$fm1$1@ger.gmane.org> <5749C97D.6050809@gmail.com>
To: akuster808 <akuster808@gmail.com>
X-Mailer: Apple Mail (2.3124)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-multimedia][master][krogoth][PATCH] dvd-apps: Fix several QA WARNINGS
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
X-List-Received-Date: Sat, 28 May 2016 16:40:03 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable


> Op 28 mei 2016, om 18:38 heeft akuster808 <akuster808@gmail.com> het =
volgende geschreven:
>=20
>=20
>=20
> On 05/28/2016 01:17 AM, Koen Kooi wrote:
>> Op 27-05-16 om 16:34 schreef Armin Kuster:
>>> Example: WARNING: dvb-apps-1.1.1-r0 do_package_qa: QA Issue:=20
>>> /usr/bin/dvbdate contained in package dvbdate requires libucsi.so, =
but
>>> no providers found in RDEPENDS_dvbdate? [file-rdeps] WARNING:=20
>>> dvb-apps-1.1.1-r0 do_package_qa: QA Issue: /usr/bin/dvbtraffic =
contained=20
>>> in package dvbtraffic requires libdvbapi.so, but no providers found =
in=20
>>> RDEPENDS_dvbtraffic? [file-rdeps] WARNING: dvb-apps-1.1.1-r0=20
>>> do_package_qa: QA Issue: /usr/bin/dvbscan contained in package =
dvb-scan=20
>>> requires libdvbapi.so, but no providers found in RDEPENDS_dvb-scan?=20=

>>> [file-rdeps] WARNING: dvb-apps-1.1.1-r0 do_package_qa: QA Issue:=20
>>> /usr/bin/gotox contained in package dvb-apps requires libdvbapi.so, =
but=20
>>> no providers found in RDEPENDS_dvb-apps? [file-rdeps] WARNING:=20
>>> dvb-apps-1.1.1-r0 do_package_qa: QA Issue: /usr/bin/femon contained =
in=20
>>> package dvb-femon requires libdvbapi.so, but no providers found in=20=

>>> RDEPENDS_dvb-femon? [file-rdeps] WARNING: dvb-apps-1.1.1-r0=20
>>> do_package_qa: QA Issue: /usr/bin/dvbnet contained in package dvbnet=20=

>>> requires libdvbapi.so, but no providers found in RDEPENDS_dvbnet?=20
>>> [file-rdeps]
>>>=20
>>> and WARNING: dvb-apps-1.1.1-r0 do_package_qa: QA Issue: =
/usr/bin/dvbscan=20
>>> contained in package dvb-scan requires libdvbcfg.so, but no =
providers=20
>>> found in RDEPENDS_dvb-scan? [file-rdeps] WARNING: dvb-apps-1.1.1-r0=20=

>>> do_package_qa: QA Issue: /usr/bin/gotox contained in package =
dvb-apps=20
>>> requires libdvbapi.so, but no providers found in RDEPENDS_dvb-apps?=20=

>>> [file-rdeps]
>>=20
>> This shows that OE adds RDEPENDS automagically but can't find the =
matching
>> RPROVIDERS, so ....
>>=20
>>=20
>>> Signed-off-by: Armin Kuster <akuster808@gmail.com> ---=20
>>> meta-multimedia/recipes-dvb/dvb-apps/dvb-apps_1.1.1.bb | 10 =
++++++++++ 1=20
>>> file changed, 10 insertions(+)
>>>=20
>>> diff --git a/meta-multimedia/recipes-dvb/dvb-apps/dvb-apps_1.1.1.bb=20=

>>> b/meta-multimedia/recipes-dvb/dvb-apps/dvb-apps_1.1.1.bb index=20
>>> 1c0d686..d6465d7 100644 ---=20
>>> a/meta-multimedia/recipes-dvb/dvb-apps/dvb-apps_1.1.1.bb +++=20
>>> b/meta-multimedia/recipes-dvb/dvb-apps/dvb-apps_1.1.1.bb @@ -63,6 =
+63,9=20
>>> @@ PACKAGES =3D+ "dvb-evtest dvb-evtest-dbg \ dvb-femon =
dvb-femon-dbg \=20
>>> dvb-zap-data"
>>>=20
>>> +# Expose the packages from the above spitting +PACKAGES =3D+ =
"libdvbapi=20
>>> libdvbcfg libdvben50221 \ +             libesg libucsi libdvbsec"
>>=20
>> ... this would fix that, but ..
>>=20
>>> FILES_${PN} =3D "${bindir} ${datadir}/dvb" FILES_${PN}-doc =3D "" @@ =
-104,3=20
>>> +107,10 @@ FILES_dvb-femon =3D "${bindir}/femon" FILES_dvb-femon-dbg =
=3D=20
>>> "${bindir}/.debug/femon"
>>>=20
>>> FILES_dvb-zap-data =3D "${docdir}/dvb-apps/szap" + +RDEPENDS_dvbdate =
=3D+=20
>>> "libdvbapi libucsi" +RDEPENDS_dvbtraffic =3D+ "libdvbapi"=20
>>> +RDEPENDS_dvb-scan =3D+ "libdvbapi libdvbcfg libdvbsec" =
+RDEPENDS_dvb-apps=20
>>> =3D+ "libdvbapi libdvbcfg libdvbsec libdvben50221 libucsi"=20
>>> +RDEPENDS_dvb-femon =3D+ "libdvbapi" +RDEPENDS_dvbnet =3D+ =
"libdvbapi"
>>=20
>> ... this part isn't needed since the QA issue above wouldn't have =
triggered
>> otherwise.
>=20
> Remove the above RDEPENDS and warnings came back. I must be
> misunderstanding something.

No, my mistake. I took those errors for shlibs errors, which they are =
not. So yes, RDEPENDS are needed. Sorry for the confusion.

regards,

Koen=

