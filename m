Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id A2BC7721D7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Nov 2014 14:06:44 +0000 (UTC)
Received: by mail-wi0-f178.google.com with SMTP id hi2so8924841wib.11
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Nov 2014 06:06:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=nbKTNjP7T+aYD9qi/9YaZ7b1Lyo8yOgqfBlnOTVm3HU=;
	b=KM6ExPPTXFFyHbRGZVSkQJem7yE6kSXUecKY862n/HY3FJRLUHPbYaXhm5h1WJmjma
	PXRYUFVym4HQBx6+epg13wUPhns6oPMKaI74KgGsaXdlUtY5E1OO9Zziwiew0Unm8uxj
	xXI20mkU1wIxT0KVMRJ7a9FFhJlxvGQMkakTkleOWavtUXq5zZSN6OHyNsSR859MRSun
	KByvt7sg6T+EprtNv4gNQJ0KUEp6aYwLJVc436DuDdx102PxmRwd0gawq75bODAiXm1Z
	bD7bP0k+rz5lGPF2GbI6/P9MeU3B/3M/1nSXZcPv7GsQ9hsezYFSv/fYv2LE/QIM9V2u
	aaHA==
X-Received: by 10.180.103.33 with SMTP id ft1mr8049392wib.71.1416578798316;
	Fri, 21 Nov 2014 06:06:38 -0800 (PST)
Received: from localhost ([89.176.104.3])
	by mx.google.com with ESMTPSA id gy8sm7061129wib.3.2014.11.21.06.06.37
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 21 Nov 2014 06:06:37 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 21 Nov 2014 15:06:38 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20141121140638.GI2163@jama>
References: <1416222008-9218-1-git-send-email-lixin.fnst@cn.fujitsu.com>
	<1416222008-9218-4-git-send-email-lixin.fnst@cn.fujitsu.com>
	<20141117122224.D41DB3814FF@gemini.denx.de>
MIME-Version: 1.0
In-Reply-To: <20141117122224.D41DB3814FF@gemini.denx.de>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [PATCH 3/5] sblim-sfcb : add new recipe
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
X-List-Received-Date: Fri, 21 Nov 2014 14:06:46 -0000
X-Groupsio-MsgNum: 52972
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Az4VpBrmI9+OyhK/"
Content-Disposition: inline

--Az4VpBrmI9+OyhK/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 17, 2014 at 01:22:24PM +0100, Wolfgang Denk wrote:
> Dear Li xin,
>=20
> In message <1416222008-9218-4-git-send-email-lixin.fnst@cn.fujitsu.com> y=
ou wrote:
> > Sfcb(Small Footprint CIM Broker)is a CIM server conforming to the
> > CIM Operations over HTTP protocol.
> > It is robust, with low resource consumption and therefore specifically
> > suited for embedded and resource constrained environments.
> > sfcb supports providers written against the Common Manageability
> > Programming Interface (CMPI).
> >=20
> > Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
> > ---
> >  .../recipes-extended/sblim-sfcb/files/sfcb.service |  11 +++
> >  ...000sblim-sfcb-disable_auto_service_start1.patch |  19 +++++
> >  .../sblim-sfcb-1.3.4/cimv217Final-MOFs.zip.org     | Bin 0 -> 1259176 =
bytes
>=20
> Are you sure you want to include this huge binary blob?

I agree it should be moved somewhere else and downloaded from SRC_URI.

Also fails to build for qemuarm:

| arm-oe-linux-gnueabi-libtool: link: arm-oe-linux-gnueabi-gcc -march=3Darm=
v5te -marm -mthumb-interwork --sysroot=3D/home/jenkins/oe/world/shr-core/tm=
p-glibc/sysroots/qemuarm -Wall -fno-strict-aliasing -fsigned-char -O2 -pipe=
 -g -feliminate-unused-debug-types -D_GNU_SOURCE -Wl,-O1 -Wl,--hash-style=
=3Dgnu -Wl,--as-needed -o .libs/sfcbd sfcBroker.o  -L=3D/usr/lib/..//lib -L=
=3D/usr/lib /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux=
-gnueabi/sblim-sfcb/1.3.4-r0/build/.libs/libsfcHttpAdapter.so /home/jenkins=
/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/sblim-sfcb/1.3.4=
-r0/build/.libs/libsfcCimXmlCodec.so /home/jenkins/oe/world/shr-core/tmp-gl=
ibc/work/armv5te-oe-linux-gnueabi/sblim-sfcb/1.3.4-r0/build/.libs/libsfcBro=
kerCore.so /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-=
gnueabi/sblim-sfcb/1.3.4-r0/build/.libs/libsfcUtil.so -lssl /home/jenkins/o=
e/world/shr-core/tmp-glibc/sysroots/qemuarm/usr/lib/libcurl.so /home/jenkin=
s/oe/world/shr-core/tmp-glibc/sysroots/qemuarm/usr/lib/libgnutls.so -lnettl=
e -lhogweed /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemuarm/usr/=
lib/libgmp.so -lz -ldl -lpthread -Wl,-rpath -Wl,/usr/lib/sfcb
| /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/s=
blim-sfcb/1.3.4-r0/build/.libs/libsfcHttpAdapter.so: error: undefined refer=
ence to 'X509_STORE_CTX_get_current_cert'
| /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/s=
blim-sfcb/1.3.4-r0/build/.libs/libsfcHttpAdapter.so: error: undefined refer=
ence to 'BIO_new_socket'
| /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/s=
blim-sfcb/1.3.4-r0/build/.libs/libsfcHttpAdapter.so: error: undefined refer=
ence to 'BIO_new'
| /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/s=
blim-sfcb/1.3.4-r0/build/.libs/libsfcHttpAdapter.so: error: undefined refer=
ence to 'BIO_ctrl'
| /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/s=
blim-sfcb/1.3.4-r0/build/.libs/libsfcHttpAdapter.so: error: undefined refer=
ence to 'BIO_f_buffer'
| /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/s=
blim-sfcb/1.3.4-r0/build/.libs/libsfcHttpAdapter.so: error: undefined refer=
ence to 'BIO_push'
| /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/s=
blim-sfcb/1.3.4-r0/build/.libs/libsfcHttpAdapter.so: error: undefined refer=
ence to 'BIO_int_ctrl'
| /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/s=
blim-sfcb/1.3.4-r0/build/.libs/libsfcHttpAdapter.so: error: undefined refer=
ence to 'ERR_print_errors_fp'
| /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/s=
blim-sfcb/1.3.4-r0/build/.libs/libsfcHttpAdapter.so: error: undefined refer=
ence to 'RAND_load_file'
| /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/s=
blim-sfcb/1.3.4-r0/build/.libs/libsfcHttpAdapter.so: error: undefined refer=
ence to 'BIO_write'
| collect2: error: ld returned 1 exit status
| make[2]: *** [sfcbd] Error 1
| make[2]: Leaving directory `/home/jenkins/oe/world/shr-core/tmp-glibc/wor=
k/armv5te-oe-linux-gnueabi/sblim-sfcb/1.3.4-r0/build'
| make[1]: *** [all-recursive] Error 1
| make[1]: Leaving directory `/home/jenkins/oe/world/shr-core/tmp-glibc/wor=
k/armv5te-oe-linux-gnueabi/sblim-sfcb/1.3.4-r0/build'
| make: *** [all] Error 2
| ERROR: oe_runmake failed
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_compile (log file is located at /home/jenkins/=
oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/sblim-sfcb/1.3.4-=
r0/temp/log.do_compile.21116)
NOTE: recipe sblim-sfcb-1.3.4-r0: task do_compile: Failed
ERROR: Task 7279 (/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe=
/recipes-extended/sblim-sfcb/sblim-sfcb_1.3.4.bb, do_compile) failed with e=
xit code '1'


>=20
> Best regards,
>=20
> Wolfgang Denk
>=20
> --=20
> DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
> HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
> Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd@denx.de
> Just because your doctor has a name for your condition  doesn't  mean
> he knows what it is.
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Az4VpBrmI9+OyhK/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlRvRu4ACgkQN1Ujt2V2gByLHQCfYt3cDKvcCmVsFnSliKeFbude
qhMAoI6TwSxXmFBTvihBOZxVt8LI2BeP
=FC5v
-----END PGP SIGNATURE-----

--Az4VpBrmI9+OyhK/--
