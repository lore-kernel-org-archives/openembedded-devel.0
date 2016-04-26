Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f182.google.com (mail-pf0-f182.google.com
	[209.85.192.182])
	by mail.openembedded.org (Postfix) with ESMTP id 9A51E60119
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Apr 2016 21:33:39 +0000 (UTC)
Received: by mail-pf0-f182.google.com with SMTP id y69so11808273pfb.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Apr 2016 14:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=4iXsAlB5pHc6NYe+isShJz0l3alKVO1ppxTVsqKu8BY=;
	b=NTmqKBh6Gchsk0Ekv3HcnQ9CASiaM2J2IHusXtVY7gm8mUNpjyeYMiGIht32W47VtX
	fus6E9ES2b2CV8+OZzC+vtmdJ5SUhdCKxNUdp1+RNRAYUlYOEjkb5d+/0aKLrIsg3DOY
	q6QYC2T3Lw6ntipon3pMkvMmzpVgQOtAXhnP5tav+kHGhmVLEJUYpMeO1Ja3wpWulC4D
	JtkxnitwS2vw/bYsTjO3+1C73Ck2V4qOZzj8gyUzj48UZqmkSEUwDZAJztOTtQ7LTsbj
	DjvnwOJ8SF35riQG5/S9tHgyfxLyIrByMk2Olj2pkvfyqrP9bOHqAki3zWdPUzJRgq11
	xx1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=4iXsAlB5pHc6NYe+isShJz0l3alKVO1ppxTVsqKu8BY=;
	b=L6Wd56rIhURqz6ZCphzg74SN0xMnH8YdzuVaORHOTtRUwGZVz5dNe00mKILR84/BAs
	9ceVlZ+VOUrR6/4Lk5xQrbv1F2/m0dzwv6rtsIh2x3oKaATMuN0y//SptkKEai06cyZe
	GvuJRaiX9pZvq7rpPlaVYfQgRKP9bDuoLTxdnflteV9Ur7RZokFTVTR1OdrHjVqV9jpx
	+sYCPqO/uSrjFq19pCDEMKFoJ1eYEQ6fS360FEpX96abjz2hFss4o0KppxsuUBGAbhNn
	BmQoRYNWk5PLARs3I7XK2dqEcXUhVKpxOtQk7mnQFHuBf+dP2PGrvPRNiefaUPhtdjei
	gfqA==
X-Gm-Message-State: AOPr4FWNYY6QA/JjSoVaVGbFBp/JfieOqkCgBgujlgohiC1dj/+TreXIZIRtNDDa3Er13A==
X-Received: by 10.98.80.206 with SMTP id g75mr6794666pfj.127.1461706420052;
	Tue, 26 Apr 2016 14:33:40 -0700 (PDT)
Received: from ?IPv6:2601:647:4c01:b37d:5aa:718:3ff4:4256?
	([2601:647:4c01:b37d:5aa:718:3ff4:4256])
	by smtp.gmail.com with ESMTPSA id p26sm578767pfi.84.2016.04.26.14.33.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 26 Apr 2016 14:33:39 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <3674906.352tKuzgEq@peggleto-mobl.ger.corp.intel.com>
Date: Tue, 26 Apr 2016 14:33:35 -0700
Message-Id: <D0CC99E0-9C5B-4951-95DA-3E2D8B58B037@gmail.com>
References: <CAJTo0LYJ=9m9z4-4pE6dD2mRZNGVzGte5ktCYEWP4Bw58qAd6w@mail.gmail.com>
	<1461660218-2313-1-git-send-email-daicy.fnst@cn.fujitsu.com>
	<CEC3C9D8-666A-4041-91D5-5BBD1ECECC1B@gmail.com>
	<3674906.352tKuzgEq@peggleto-mobl.ger.corp.intel.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Mailer: Apple Mail (2.3124)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH v3] hwdata: add new recipe
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
X-List-Received-Date: Tue, 26 Apr 2016 21:33:42 -0000
X-Groupsio-MsgNum: 61192
Content-Type: multipart/signed;
	boundary="Apple-Mail=_73E2A345-70DA-4A43-B31E-A91AF25712E2";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_73E2A345-70DA-4A43-B31E-A91AF25712E2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Apr 26, 2016, at 2:20 PM, Paul Eggleton =
<paul.eggleton@linux.intel.com> wrote:
>=20
> On Tue, 26 Apr 2016 09:50:54 Khem Raj wrote:
>>> On Apr 26, 2016, at 1:43 AM, Dai Caiyun <daicy.fnst@cn.fujitsu.com> =
wrote:
>>>=20
>>> Signed-off-by: Dai Caiyun <daicy.fnst@cn.fujitsu.com>
>>> ---
>>> meta-oe/recipes-support/hwdata/hwdata_0.288.bb | 21 =
+++++++++++++++++++++
>>> 1 file changed, 21 insertions(+)
>>> create mode 100644 meta-oe/recipes-support/hwdata/hwdata_0.288.bb
>>>=20
>>> diff --git a/meta-oe/recipes-support/hwdata/hwdata_0.288.bb
>>> b/meta-oe/recipes-support/hwdata/hwdata_0.288.bb new file mode =
100644
>>> index 0000000..67199e9
>>> --- /dev/null
>>> +++ b/meta-oe/recipes-support/hwdata/hwdata_0.288.bb
>>> @@ -0,0 +1,21 @@
>>> +DESCRIPTION =3D "Hardware identification and configuration data"
>>> +HOMEPAGE =3D "http://git.fedorahosted.org/git/hwdata.git"
>>> +SECTION =3D "System/Base"
>>> +
>>> +LICENSE =3D "GPL-2.0+"
>>> +LIC_FILES_CHKSUM =3D =
"file://LICENSE;md5=3D1556547711e8246992b999edd9445a57"
>>> +SRC_URI =3D
>>> "https://git.fedorahosted.org/cgit/${BPN}.git/snapshot/${BP}.tar.gz" =
+
>>> +SRC_URI[md5sum] =3D "f3fa1c5edb66ce5b376d95e772b2d303"
>>> +SRC_URI[sha256sum] =3D
>>> "56fc26275b102e538fcfcf9c1093a09f476a1ea8d4e0c733d3c578442923693d" +
>>> +do_configure() {
>>> +    ${S}/configure --datadir=3D${datadir} --libdir=3D${libdir}
>>> +}
>>=20
>> is it using autotools ? if so then inherit autotools might be a good =
options
>> and remove the do_ functions here.
>=20
> We established earlier in the thread that it's not using autotools:
>=20
>  https://git.fedorahosted.org/cgit/hwdata.git/tree/configure

ah thanks

>=20
> Cheers,
> Paul
>=20
> --
>=20
> Paul Eggleton
> Intel Open Source Technology Centre


--Apple-Mail=_73E2A345-70DA-4A43-B31E-A91AF25712E2
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlcf3rMACgkQuwUzVZGdMxRvRwCgk+v2GKwIYzHUethp8bZZgxUC
m+oAninKz9pIEv8cfadMFpvdt/lFrXwX
=a0/b
-----END PGP SIGNATURE-----

--Apple-Mail=_73E2A345-70DA-4A43-B31E-A91AF25712E2--
