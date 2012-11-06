Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1TVlHb-0001lF-Bh
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Nov 2012 16:41:43 +0100
Received: by mail-wi0-f171.google.com with SMTP id hj13so3773245wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Nov 2012 07:27:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=references:mime-version:in-reply-to:content-type
	:content-transfer-encoding:message-id:cc:x-mailer:from:subject:date
	:to:x-gm-message-state;
	bh=xxlHbjnAR8XCDXKEha3kH00xw9cyohSnkn4dTHPIulk=;
	b=TwZuOBzCLOTuh2E7pGm99jznpnFuOl+fk0aIFngbaxwbBbc26Zbw5NDC1CJt16tlTd
	7HKKTK5eu1z4bin2PF08lo2KlS0ptYflEqhQNXAvk3rdzsaRx9gKUTPRvlzP7V/q+PM6
	C1w0s5c1KlFh+4kZLq6eL3ugtf526BdaSioPeYIG7i3tjih83OjAZgyNuRmzzS1n7qjK
	OnOeVRTRJxqP9BuIWIxbdyYQ3djAHY/om/B/z3FG5DEVigSCmfa02wQ+lENZ4C6no3KZ
	YifcAR7hSUhv/+3nWkJtQ6BNdsBiOgbXCId1nsDYYup1hCNA+8KsqhPb/PT5MRJKXSPS
	Qegg==
Received: by 10.181.11.167 with SMTP id ej7mr2814000wid.11.1352215678519;
	Tue, 06 Nov 2012 07:27:58 -0800 (PST)
Received: from [10.14.17.253] (79.Red-88-2-49.staticIP.rima-tde.net.
	[88.2.49.79])
	by mx.google.com with ESMTPS id bn7sm17102425wib.8.2012.11.06.07.27.56
	(version=SSLv3 cipher=OTHER); Tue, 06 Nov 2012 07:27:57 -0800 (PST)
References: <1351734166-8711-1-git-send-email-Xin.Ouyang@windriver.com>
	<k708l4$3tt$2@ger.gmane.org> <5098C962.8000504@windriver.com>
Mime-Version: 1.0 (1.0)
In-Reply-To: <5098C962.8000504@windriver.com>
Message-Id: <A6BAA703-2F90-4C24-BC08-C472C3708B50@dominion.thruhere.net>
X-Mailer: iPhone Mail (10A403)
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 6 Nov 2012 16:27:52 +0100
To: Pascal Ouyang <xin.ouyang@windriver.com>
X-Gm-Message-State: ALoCoQmDHBB+7PWyssBU4jIv9tMp8GAKAwNfirNO3k/QRGisq5a8KAEtjS/njZVvuhvijcv5NWLP
Cc: "<openembedded-devel@lists.openembedded.org>"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH][meta-networking 1/2] netperf: import recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 06 Nov 2012 15:41:43 -0000
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable



Op 6 nov. 2012 om 09:25 heeft Pascal Ouyang <xin.ouyang@windriver.com> het v=
olgende geschreven:

> =E4=BA=8E 2012=E5=B9=B411=E6=9C=8802=E6=97=A5 18:52, Koen Kooi =E5=86=99=E9=
=81=93:
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>=20
>> Op 01-11-12 02:42, Xin Ouyang schreef:
>>> Git-Url: -
>>> http://git.openembedded.org/openembedded/tree/recipes/netperf/
>>>=20
>>> Signed-off-by: Xin Ouyang <Xin.Ouyang@windriver.com> ---
>>> .../recipes-support/netperf/files/cpu_set.patch    |   24 +++++++++
>>> meta-networking/recipes-support/netperf/files/init |   51
>>> ++++++++++++++++++++
>>=20
>> The initscript is missing LSB headers and hardcodes $sbindir to /usr/sbin=
.
>=20
> The hardcodes would be fixed in V2.
>=20
> But I think we do not need lsb headers, since no lsb init function used in=
 the initscript.

You still need them for depency resolving and lsb compliance=20


>=20
> Thanks.
>=20
> - Pascal
>=20
>>=20
>> -----BEGIN PGP SIGNATURE-----
>> Version: GnuPG v1.4.5 (Darwin)
>> Comment: GPGTools - http://gpgtools.org
>>=20
>> iD8DBQFQk6XuMkyGM64RGpERApMQAJ0f0YMb53j54pjbXUpl7b6RCjWm7gCgrbd/
>> 8Ainle5y7zDc8tFdcr9gCsQ=3D
>> =3DK3FI
>> -----END PGP SIGNATURE-----
>>=20
>>=20
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>=20
>=20
> --=20
> - Pascal


