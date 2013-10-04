Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f177.google.com (mail-ea0-f177.google.com
	[209.85.215.177])
	by mail.openembedded.org (Postfix) with ESMTP id 21A7960FA6
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Oct 2013 14:14:25 +0000 (UTC)
Received: by mail-ea0-f177.google.com with SMTP id f15so1785674eak.8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Oct 2013 07:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=mgPWszN8FGh0YsxDsYkVwhhNAeuEVqbIUDi/aoOtRgU=;
	b=MF/L6Ok8riN0udAQngnempLK709AW3JHShIVy+jmWFldidGAWFHns89d9PIMYGDnuZ
	YsRpcqj4Vox3bnAkGe/x4KZ+lyoXPBbTCPWMZqtzQXXZZ09wqOifoETJkFcG/VDjRPAb
	M3lANWsmDOKUH+o/Daw0hEyyawfGaUHIAoTjvOF6pnIOJGQ2PuEM86HjxIeW53izrXY9
	roFzU0Cdx+WWFH1abmC6xils9u55YHAvZHJ8wEDcYrAX3ElRS5ImIkwaJdyDf4oIRD/+
	GoNuYHGX8JXkEuNsXy2ikrw3nbiOyO9Ifrd+UnzriqYCuK1i/sDipVgbBSjfhObptd7B
	Ad/Q==
X-Received: by 10.15.91.3 with SMTP id r3mr22318914eez.4.1380896067453;
	Fri, 04 Oct 2013 07:14:27 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	k7sm28500341eeg.13.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 04 Oct 2013 07:14:26 -0700 (PDT)
Date: Fri, 4 Oct 2013 16:14:33 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Trevor Woerner <trevor.woerner@linaro.org>
Message-ID: <20131004141433.GG6240@jama>
References: <CALmOhgkzmnVuviF+cAzELRpdZomHDzpHn5-1dZEwa_xznG8JiQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALmOhgkzmnVuviF+cAzELRpdZomHDzpHn5-1dZEwa_xznG8JiQ@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Abhijit Potnis <abhijit_potnis@mentor.com>,
	openembedded-devel@lists.openembedded.org
Subject: Re: meta-qt5, master, qtwebkit-examples build failure
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
X-List-Received-Date: Fri, 04 Oct 2013 14:14:27 -0000
X-Groupsio-MsgNum: 46443
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gvF4niNJ+uBMJnEh"
Content-Disposition: inline

--gvF4niNJ+uBMJnEh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 04, 2013 at 09:03:06AM -0400, Trevor Woerner wrote:
> Hi,
>=20
> I tried performing a
>=20
>     $ bitbake qtwebkit-examples
>=20
> and had a build failure in do_configure. I was just wondering if anyone
> else is seeing
> the same thing?
>=20
>     Unknown module(s) in QT: webkit

Just lucky guess, do you have ICU enabled in qtbase?

>=20
> Full error:
>=20
> ERROR: Function failed: do_configure (log file is located at
> /home/trevor/build/yocto/tmp/master/qemuarm/work/armv5te-poky-linux-gnuea=
bi/qtwebkit-examples/5.1.0-r0/temp/log.do_configure.20401)
> ERROR: Logfile of failure stored in:
> /home/trevor/build/yocto/tmp/master/qemuarm/work/armv5te-poky-linux-gnuea=
bi/qtwebkit-examples/5.1.0-r0/temp/log.do_configure.20401
> Log data follows:
> | DEBUG: Executing python function sysroot_cleansstate
> | DEBUG: Python function sysroot_cleansstate finished
> | DEBUG: Executing shell function qmake5_base_preconfigure
> | DEBUG: Shell function qmake5_base_preconfigure finished
> | DEBUG: Executing shell function do_configure
> | Reading
> /home/trevor/build/yocto/tmp/master/qemuarm/work/armv5te-poky-linux-gnuea=
bi/qtwebkit-examples/5.1.0-r0/qtwebkit-examples-opensource-src-5.1.0/exampl=
es/
> examples.pro[/home/trevor/build/yocto/tmp/master/qemuarm/work/armv5te-pok=
y-linux-gnueabi/qtwebkit-examples/5.1.0-r0/build/examples]
> |  Reading
> /home/trevor/build/yocto/tmp/master/qemuarm/work/armv5te-poky-linux-gnuea=
bi/qtwebkit-examples/5.1.0-r0/qtwebkit-examples-opensource-src-5.1.0/exampl=
es/webkitqml/
> webkitqml.pro[/home/trevor/build/yocto/tmp/master/qemuarm/work/armv5te-po=
ky-linux-gnueabi/qtwebkit-examples/5.1.0-r0/build/examples/webkitqml]
> |   Reading
> /home/trevor/build/yocto/tmp/master/qemuarm/work/armv5te-poky-linux-gnuea=
bi/qtwebkit-examples/5.1.0-r0/qtwebkit-examples-opensource-src-5.1.0/exampl=
es/webkitqml/shared/
> shared.pro[/home/trevor/build/yocto/tmp/master/qemuarm/work/armv5te-poky-=
linux-gnueabi/qtwebkit-examples/5.1.0-r0/build/examples/webkitqml/shared]
> |   Reading
> /home/trevor/build/yocto/tmp/master/qemuarm/work/armv5te-poky-linux-gnuea=
bi/qtwebkit-examples/5.1.0-r0/qtwebkit-examples-opensource-src-5.1.0/exampl=
es/webkitqml/flickrview/
> flickrview.pro[/home/trevor/build/yocto/tmp/master/qemuarm/work/armv5te-p=
oky-linux-gnueabi/qtwebkit-examples/5.1.0-r0/build/examples/webkitqml/flick=
rview]
> | Project ERROR: Unknown module(s) in QT: webkit
> | ERROR: Error calling
> /home/trevor/build/yocto/tmp/master/qemuarm/sysroots/x86_64-linux/usr/bin=
/qt5/qmake
> -makefile -o Makefile  -r
> /home/trevor/build/yocto/tmp/master/qemuarm/work/armv5te-poky-linux-gnuea=
bi/qtwebkit-examples/5.1.0-r0/qtwebkit-examples-opensource-src-5.1.0/
> qtwebkit-examples.pro
> | WARNING:
> /home/trevor/build/yocto/tmp/master/qemuarm/work/armv5te-poky-linux-gnuea=
bi/qtwebkit-examples/5.1.0-r0/temp/run.do_configure.20401:1
> exit 1 from
> |   exit 1
> | ERROR: Function failed: do_configure (log file is located at
> /home/trevor/build/yocto/tmp/master/qemuarm/work/armv5te-poky-linux-gnuea=
bi/qtwebkit-examples/5.1.0-r0/temp/log.do_configure.20401)
> ERROR: Task 6 (/home/trevor/devel/yocto/git/meta-qt5/recipes-qt/qt5/
> qtwebkit-examples_5.1.0.bb, do_configure) failed with exit code '1'

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--gvF4niNJ+uBMJnEh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iEYEARECAAYFAlJOzUkACgkQN1Ujt2V2gBzM6ACfbBDkyDn8HE2J5HoW601DW4Tt
ieYAn0VJs22YmqQImHDu7OAXTtUmla0y
=3z1/
-----END PGP SIGNATURE-----

--gvF4niNJ+uBMJnEh--
