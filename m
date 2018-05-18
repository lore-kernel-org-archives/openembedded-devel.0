Return-Path: <clopez@igalia.com>
Received: from fanzine.igalia.com (fanzine.igalia.com [91.117.99.155])
	by mail.openembedded.org (Postfix) with ESMTP id C545374BEA
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 May 2018 13:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; 
	h=Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject;
	bh=EsQvQegtw6yBWn/Pbn6kxqOYoBUa9cr1mCM5O8EWh2g=; 
	b=iidtSrP6chKlr6seM8RT34Jqi30PheMkjzbYPpTA/NbjhjJAFegH/yb5E6dAco8SsuQIDbrHcHNbxlhcNebk7/vU1vYhqeN6h45l0B68zbQcY9RkVnL7t3N84Ht1Xvz0hoOIBJdDW4szy8nIxikxXiqE2mtg1BbysdO66Zz3lL/Pkfct03LklXYOrDJ+xOKWLZ1KFJbE1dNeokQTsSacq+hXJjmO4JwJk17/UX0SG8wy7nwym4ImxhPT8K4vrqVeJLGX6oZZ3IDLASpN28KUy0JOkpeEBwfH1FjSVIPpt/36t6JgZp2LCYRN3pNistGOPalFiepJOoWNRF9FuHP72Q==;
Received: from 1.14.117.91.dynamic.reverse-mundo-r.com ([91.117.14.1]
	helo=[192.168.0.23]) by fanzine.igalia.com with esmtpsa 
	(Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
	id 1fJfPg-00076u-O8 for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 May 2018 15:27:16 +0200
To: openembedded-devel@lists.openembedded.org
References: <20180512030758.31409-1-raj.khem@gmail.com>
	<20180512030758.31409-5-raj.khem@gmail.com>
	<8c2ae33c-fbde-11de-6fd7-d220c0b55d57@igalia.com>
	<b55b0545-7867-a168-a853-903313da12de@gmail.com>
From: Carlos Alberto Lopez Perez <clopez@igalia.com>
Openpgp: id=B5D2B50BC48EC7F1EE90D9AB965089CE6B95F882;
	url=http://key.neutrino.es
Organization: Igalia S.L.
Mail-Followup-To: openembedded-devel@lists.openembedded.org
Message-ID: <5e41dd1d-0a05-39a4-888c-948be3cc8714@igalia.com>
Date: Fri, 18 May 2018 15:27:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <b55b0545-7867-a168-a853-903313da12de@gmail.com>
Subject: Re: [meta-oe][PATCH 5/8] luajit: Dont use BUILD_LDFLAGS when compiling host binaries
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
X-List-Received-Date: Fri, 18 May 2018 13:27:18 -0000
X-Groupsio-MsgNum: 72255
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature";
	boundary="ulNqNp3LKQsgBqRMvDiKw9ARE7qblPDRO"

--ulNqNp3LKQsgBqRMvDiKw9ARE7qblPDRO
Content-Type: multipart/mixed; boundary="EKxH6M2weUIOAusuiDtlP6qX43bvY65YP";
 protected-headers="v1"
From: Carlos Alberto Lopez Perez <clopez@igalia.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <5e41dd1d-0a05-39a4-888c-948be3cc8714@igalia.com>
Subject: Re: [oe] [meta-oe][PATCH 5/8] luajit: Dont use BUILD_LDFLAGS when
 compiling host binaries
References: <20180512030758.31409-1-raj.khem@gmail.com>
 <20180512030758.31409-5-raj.khem@gmail.com>
 <8c2ae33c-fbde-11de-6fd7-d220c0b55d57@igalia.com>
 <b55b0545-7867-a168-a853-903313da12de@gmail.com>
In-Reply-To: <b55b0545-7867-a168-a853-903313da12de@gmail.com>

--EKxH6M2weUIOAusuiDtlP6qX43bvY65YP
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable

On 18/05/18 06:44, Khem Raj wrote:
>> I suggest adding something like this:
>>
>> EXTRA_OEMAKE_remove_class-target =3D "'HOST_LDFLAGS=3D${BUILD_LDFLAGS}=
'"
>>
>=20
> This would be a general case where we have bbclassextend for native
> luajit is a special case however, where the needed build time tools
> are built along the target build, thats why this fix.=C2=A0 The change =
you
> you proposed might not work in this case.

I'm carrying this change here [1]:

First I tried setting the removal without specifying a target, like in

EXTRA_OEMAKE_remove =3D "'HOST_LDFLAGS=3D${BUILD_LDFLAGS}'"

But then doing:

bitbake -f -c cleanall luajit-native
bitbake luajit-native

Will fail.

Specifying the removal only for the target class is what allowed this to
work for both luajit and luajit-native
(just in case is relevant, my target machine is a raspberrypi3 (32-bit))


Regards
-------

[1]
https://github.com/Igalia/meta-webkit/blob/master/recipes-devtools/luajit=
/luajit_2.0.5.bbappend


--EKxH6M2weUIOAusuiDtlP6qX43bvY65YP--

--ulNqNp3LKQsgBqRMvDiKw9ARE7qblPDRO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Comment: You can fetch my GnuPG key from http://key.neutrino.es

iQIzBAEBCgAdFiEEtdK1C8SOx/HukNmrllCJzmuV+IIFAlr+1KsACgkQllCJzmuV
+ILsrw/+LaerzZqH25z8pCdwEaLCt6hVWt3eIrUhteU0ctiLBrMQyBaEmDWLYjvG
r5auqUIfIcvVkr/7h/+bS0z5ouSUka6/WAemKdzy65cfojAmw0XetFkOR3GjWnoh
pBVJOTz+nuT+sMB6cIn+5iZi1ETszRtMNlpcXdMbW8NU3R33XadfaSzugZrv8rt/
jGvuYW2pwx9rKeTSMM5EvDbiRBQyz0GK7SUEcj+rdlfLj76l5M7gA2RXhrKCXWDF
7WOurC7efGNXEocLScDbh2eEVhzoxqlXq0868QYlgW0HSkD+ESBV+wfuImjp91yD
zSqJLvZF0dsmZAcVA/13BKaU9Dv+Sx/OYuz/G9scapEQsLz5/rgVuSs6CMscVd+S
4ogq85da0lskLSkv95eqc/EbEoozDR3+EpIJEN7+1rPBTxdyyw1KDF0t6WI9tlRe
gMmV7DIAEc+hkGaxSeIoteOLJBgk7G3hipeJMWti7tWjA+rIcVLbScMgx3NOnfU/
1OhYORpvT0pnTxpIhvZ/x8pjN9xhlvRFS+nFsOMdS8SwbO+0HWPwk3luDyZLRRRq
w84U/v2RFHUGv1LW+dmGVAys93elun+4+EFxjvY2wwB0ekC5zxRxzLTkKf1aQPoi
/bQKJd8kNDXSbtgc8JuloqExriqk7Dy/084mXTUk6SzBu3Vp4zs=
=R8dO
-----END PGP SIGNATURE-----

--ulNqNp3LKQsgBqRMvDiKw9ARE7qblPDRO--
