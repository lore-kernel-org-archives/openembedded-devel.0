Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id 44D06609B2
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Aug 2014 13:52:23 +0000 (UTC)
Received: by mail-wi0-f172.google.com with SMTP id n3so1060161wiv.17
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Aug 2014 06:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=nSMxOzKfOZRUHfqsIvHS+09WspbEr8N6920LthzgRrQ=;
	b=adPq/JgAL8CBb7chMaOY+Ubeo1ko4g+EEGpodxLil+gS+f6NNxDi1tkzINOyn0c7G0
	AbT0WwCujYvNb8nUbBzXdzyBYBNSFAtb051lzlXNrEj0wzsb/H7PkA60RHVn01ibIIh0
	rddaoLMwd+rGYUoNWd3oUgJ5IA2bwrwCePp+Lc9Xv0MoQiLd8cxHsk2DJiaD3sSmTOfC
	i3FA6T4+f5k8ADBot+t4THUiIK8tZIPdxscfvsFDEf1B3EmOYDdImi9S9c/rx8PbEVlN
	rJWWFxdsrfJHvoKhgKR0g/OyMsXuL0i73sKoBimP1+zNMOGw1zyMYVh6LfwoIJM+99Ru
	WtSQ==
X-Received: by 10.194.3.51 with SMTP id 19mr32389216wjz.93.1407505944597;
	Fri, 08 Aug 2014 06:52:24 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ge8sm7423078wib.4.2014.08.08.06.52.23 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 08 Aug 2014 06:52:23 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 8 Aug 2014 15:52:55 +0200
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20140808135255.GF14848@jama>
References: <20140806192249.GP14848@jama> <20140808004507.GZ14848@jama>
	<20140808100208.GC14848@jama>
	<1638429.iXmVO7ted9@peggleto-mobl5.ger.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <1638429.iXmVO7ted9@peggleto-mobl5.ger.corp.intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH v2] mariadb: update to 5.5.38
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
X-List-Received-Date: Fri, 08 Aug 2014 13:52:31 -0000
X-Groupsio-MsgNum: 51500
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5MRs3DbAxHy5wbhc"
Content-Disposition: inline

--5MRs3DbAxHy5wbhc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 08, 2014 at 02:05:42PM +0100, Paul Eggleton wrote:
> On Friday 08 August 2014 12:02:08 Martin Jansa wrote:
> > And now it failed on jenkins builder (maybe because this one is using
> > gold)
> >=20
> > | cd
> > | /home/jenkins/oe/world/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnue=
abi/
> > | mariadb/5.5.38-r0/build/storage/myisam &&
> > | /home/jenkins/oe/world/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/=
bin/
> > | arm-oe-linux-gnueabi/arm-oe-linux-gnueabi-gcc  -DHAVE_CONFIG_H -Wall=
=20
> > | -march=3Darmv5te -marm -mthumb-interwork=20
> > | --sysroot=3D/home/jenkins/oe/world/shr-core/tmp-eglibc/sysroots/qemua=
rm=20
> > | -O2 -pipe -g -feliminate-unused-debug-types -fPIC -O2 -g -DNDEBUG
> > | -DDBUG_OFF
> > | -I/home/jenkins/oe/world/shr-core/tmp-eglibc/work/armv5te-oe-linux-gn=
ueab
> > | i/mariadb/5.5.38-r0/build/include
> > | -I/home/jenkins/oe/world/shr-core/tmp-eglibc/work/armv5te-oe-linux-gn=
ueab
> > | i/mariadb/5.5.38-r0/mariadb-5.5.38/include
> > | -I/home/jenkins/oe/world/shr-core/tmp-eglibc/work/armv5te-oe-linux-gn=
ueab
> > | i/mariadb/5.5.38-r0/mariadb-5.5.38/sql
> > | -I/home/jenkins/oe/world/shr-core/tmp-eglibc/work/armv5te-oe-linux-gn=
ueab
> > | i/mariadb/5.5.38-r0/mariadb-5.5.38/regex
> > | -I/home/jenkins/oe/world/shr-core/tmp-eglibc/sysroots/qemuarm/usr/inc=
lude
> > |     -fvisibility=3Dhidden -o CMakeFiles/myisam.dir/mi_create.c.o   -c
> > | /home/jenkins/oe/world/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnue=
abi/
> > | mariadb/5.5.38-r0/mariadb-5.5.38/storage/myisam/mi_create.c
> > | /home/jenkins/oe/world/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/=
libe
> > | xec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld: error:
> > | /home/jenkins/oe/world/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnue=
abi/
> > | mariadb/5.5.38-r0/build/libmysql/libmysql_versions.ld:155:9: invalid =
use
> > | of VERSION in input file collect2: error: ld returned 1 exit status
> > | make[2]: *** [libmysql/libmysqlclient.so.18..0] Error 1
> > | make[2]: Leaving directory
> > | `/home/jenkins/oe/world/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnu=
eabi
> > | /mariadb/5.5.38-r0/build' make[1]: ***
> > | [libmysql/CMakeFiles/libmysql.dir/all] Error 2
>=20
> I'm really not sure what to do about this. There is a bug report about th=
is=20
> here:
>=20
>   https://sourceware.org/bugzilla/show_bug.cgi?id=3D16895
>=20
> Unfortunately there is no viable workaround or patch either in the linked=
=20
> gentoo/mariadb bugs.
>=20
> Any suggestions?

When I've found this, I was looking on u-boot hack to use ld.bfd instead
of default ld, maybe we can temporary add something similar here.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--5MRs3DbAxHy5wbhc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPk1jcACgkQN1Ujt2V2gByFMACgoqSerP7sg7HWUMqG4I2NEoaH
3ZcAn3rlRpEBdnsXSJS8ethPrW6jpfm9
=Re3w
-----END PGP SIGNATURE-----

--5MRs3DbAxHy5wbhc--
