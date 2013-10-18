Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f182.google.com (mail-pd0-f182.google.com
	[209.85.192.182])
	by mail.openembedded.org (Postfix) with ESMTP id 9183E6CCFC
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Oct 2013 00:02:30 +0000 (UTC)
Received: by mail-pd0-f182.google.com with SMTP id q10so2371231pdj.41
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Oct 2013 17:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=erKryuTZ/6DG2dnymTfM90xfwWrRAjqUDKXu7j6RU30=;
	b=Ga11r6EwRctIsUh0V5P9A95f9t1TnjzTfJRpeISP797jzglLiASJMRPutYjsGMIUbS
	RNnZEexe5hwgxz9oVZWftYEad3iGRL7rs/RBJzp99O+PHdADNNbVxg+hf/FnAJ42v6NM
	g+kqYGJNUCwzu4lJk3k+Wjaej4OZYroDlLn7223/1E8a769/p4xY6j7tbyzVQUBGxsi9
	dgSVaE53Zp79ODHG/IaFyJA7fSLdM6X9zExvN8ZW/TneLh0Ie+a93jGQfm1PWHezWFgE
	K+7fW/tqfu3744bifC/nizSW7JDrw3jpn477Yj5aJKXDp22cK3Sfqy8Xpcewx5k28mNJ
	oxuA==
X-Received: by 10.66.121.234 with SMTP id ln10mr632136pab.20.1382054552484;
	Thu, 17 Oct 2013 17:02:32 -0700 (PDT)
Received: from kraj-sslvpn-nc.jnpr.net (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPSA id
	sd3sm6889601pbb.42.1969.12.31.16.00.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 17 Oct 2013 17:02:31 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.6 \(1510\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <20131017235914.GE3930@jama>
Date: Thu, 17 Oct 2013 17:02:35 -0700
Message-Id: <B3FF8CDA-032C-49E1-86D1-78ED6E92FC10@gmail.com>
References: <1382051520-1562-1-git-send-email-raj.khem@gmail.com>
	<20131017235914.GE3930@jama>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.1510)
Cc: Cliff Brake <cbrake@bec-systems.com>
Subject: Re: [meta-oe][PATCHv2 1/3] libraw1394: add recipe
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
X-List-Received-Date: Fri, 18 Oct 2013 00:02:30 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Oct 17, 2013, at 4:59 PM, Martin Jansa <martin.jansa@gmail.com> =
wrote:

> On Thu, Oct 17, 2013 at 04:11:58PM -0700, Khem Raj wrote:
>> From: Cliff Brake <cbrake@bec-systems.com>
>>=20
>> Initial recipe created by Khem Raj
>=20
> libraw1394 was already merged today:
> =
http://git.openembedded.org/meta-openembedded/commit/?h=3Ddora&id=3Dcd8755=
253e6972356e2172670c1861ea664b0f0a
> =
http://git.openembedded.org/meta-openembedded/commit/?id=3D309eb8a5ff0e7ec=
beaf191a9dc906b618d40dd94
>=20
> It wasn't removed when you rebased, because it was moved to
> recipes-support as discussed on #oe.

hmmm, ok, it was an update so I will redo it.
>=20
> I haven't merged coriander yet, because it wasn't build on jenkins at
> all, because one of dependencies failed because of newer automake.
>=20
>> Signed-off-by: Cliff Brake <cbrake@bec-systems.com>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>> meta-oe/recipes-multimedia/libraw1394/libraw1394_2.1.0.bb | 11 =
+++++++++++
>> 1 file changed, 11 insertions(+)
>> create mode 100644 =
meta-oe/recipes-multimedia/libraw1394/libraw1394_2.1.0.bb
>>=20
>> diff --git =
a/meta-oe/recipes-multimedia/libraw1394/libraw1394_2.1.0.bb =
b/meta-oe/recipes-multimedia/libraw1394/libraw1394_2.1.0.bb
>> new file mode 100644
>> index 0000000..617ba1b
>> --- /dev/null
>> +++ b/meta-oe/recipes-multimedia/libraw1394/libraw1394_2.1.0.bb
>> @@ -0,0 +1,11 @@
>> +DESCRIPTION =3D "base library for low-level IEEE 1394 accesses"
>> +HOMEPAGE =3D =
"https://ieee1394.wiki.kernel.org/index.php/Libraries#libraw1394"
>> +SECTION =3D "libs"
>> +LICENSE =3D "LGPL-2.1"
>> +LIC_FILES_CHKSUM =3D =
"file://COPYING.LIB;md5=3Dd8045f3b8f929c1cb29a1e3fd737b499"
>> +
>> +SRC_URI =3D =
"https://www.kernel.org/pub/linux/libs/ieee1394/${BPN}-${PV}.tar.gz"
>> +SRC_URI[md5sum] =3D "d06cccb776b240b6ab5efdee33b87af2"
>> +SRC_URI[sha256sum] =3D =
"a83cff16fb8885831bc29d7d17f3c570dc39251d89e20795c08e87720de0ba70"
>> +
>> +inherit autotools
>> --=20
>> 1.8.3.2
>>=20
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


