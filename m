Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f174.google.com (mail-pd0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id BD2296D769
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Nov 2013 19:40:41 +0000 (UTC)
Received: by mail-pd0-f174.google.com with SMTP id y10so3889601pdj.33
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Nov 2013 11:40:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to;
	bh=gCQvh8QgLeJ6CvZyZymy1SI0kXsH2PDjnPVLUmpyDDQ=;
	b=qlxZ1+X9tf/YCUzWXWhqpCV97UdRLPmcO8J5f7Q7t0lVbr7ozAOsJ8qRpK0Nmi4qNi
	rAMEZgHCoXORwSAxFrx7LhiLdBDnC6e8o8h62lbA7UPQLnRmC/SlPhKRP29vt6GMRqEp
	sUn/DyPnGc5B0yQTYzuc+h+AgLUSmoBtXclkrkf0E9SIp+6uUa297+PySHPqKx0ZajG2
	JkO4HoIeByy4blxElAAlOxOHfIAsglsEU8yWVEPjy/AZ4RK/ICWxm29RIixgWMvDf+O7
	bKlZ1Kofxeg0z5XGHpzdXUJYMU3c986ftki5e9WuZrGDNjKHfdIS9ACgMysaeYbmWdqT
	KjAg==
X-Received: by 10.66.119.136 with SMTP id ku8mr8545116pab.121.1384544443089;
	Fri, 15 Nov 2013 11:40:43 -0800 (PST)
Received: from kraj-sslvpn-nc.jnpr.net ([66.129.239.14])
	by mx.google.com with ESMTPSA id xe9sm7062810pab.0.2013.11.15.11.40.41
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 15 Nov 2013 11:40:42 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 7.0 \(1822\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CA+gsK-reC5jKTGB=4nPqWR5i0a_+MRQRBj9gbBXz6E8gc6OpdQ@mail.gmail.com>
Date: Fri, 15 Nov 2013 11:40:40 -0800
Message-Id: <35D7134A-B170-4398-A914-ED13F1C897F3@gmail.com>
References: <CA+gsK-reC5jKTGB=4nPqWR5i0a_+MRQRBj9gbBXz6E8gc6OpdQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.1822)
Subject: Re: [meta-java] Building openjdk-7-jre for PPC
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
X-List-Received-Date: Fri, 15 Nov 2013 19:40:42 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Nov 15, 2013, at 10:39 AM, Rudolf Streif <rudolf.streif@linux.com> =
wrote:

> While building openjdk-7-jre 25b30 for PPC architecture with dylan I =
ran
> into the following issues:
>=20
> The patch icedtea-jdk-nio-use-host-cc.patch is conditionally applied =
to PPC
> only. It also requires this patch of the patch [1]. This patch has not =
yet
> been included with meta-java although a pull request was sent a while =
ago.
>=20
> Furthermore, the original  icedtea-jdk-nio-use-host-cc.patch includes =
this
> change of the Sun toplevel makefile:
>=20
> Index: openjdk/jdk/make/sun/Makefile
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- openjdk/jdk/make/sun/Makefile       2013-07-25 09:10:09.000000000 =
-0700
> +++ openjdk/jdk/make/sun/Makefile       2013-10-01 21:32:01.625839149 =
-0700
> @@ -55,7 +55,7 @@
>     endif
>   endif
>   HEADLESS_SUBDIR =3D headless
> -  XAWT_SUBDIR     =3D xawt
> +  XAWT_SUBDIR     =3D
> endif
>=20
> This removes the xawt subdir from the build process resulting in =
XToolkit
> and other Java classes not to be build and also not to be included =
into
> rt.jar. Hence, applications using awt UI classes will break with a =
"class
> not found" error.
>=20
> I reverted the change and now it builds correctly, but I would like to
> understand why this change was made in the first place.

xawt was not buildable under ppc a while back, we have updated the revs =
since=20
then, this was best case available

>=20
>=20
> Cheers,
> Rudi
>=20
> [1]
> =
https://github.com/kraj/meta-java/commit/22983b1ab80b3393ecc27e5c3d3a9b52e=
3b8e692
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


