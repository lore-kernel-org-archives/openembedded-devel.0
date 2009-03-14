Received: from [208.51.207.131] (helo=mail.2mi.com.br)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcos@2mi.com.br>) id 1LiXW7-0006KM-LC
	for openembedded-devel@lists.openembedded.org;
	Sat, 14 Mar 2009 18:19:25 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.2mi.com.br (Postfix) with ESMTP id 5C61450361A5
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 Mar 2009 14:23:48 -0300 (BRT)
X-Virus-Scanned: amavisd-new at 2mi.com.br
Received: from mail.2mi.com.br ([127.0.0.1])
	by localhost (mail.2mi.com.br [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bZTr+jppMQ51
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 Mar 2009 14:23:44 -0300 (BRT)
Received: from [192.168.15.106] (unknown [189.102.205.109])
	by mail.2mi.com.br (Postfix) with ESMTP id 9AF03502762D
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 Mar 2009 14:23:42 -0300 (BRT)
From: Marcos Amorim <marcos@2mi.com.br>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1236962040.9119.16.camel@faraday>
References: <1236962040.9119.16.camel@faraday>
Organization: 2MI Tecnologia
Date: Sat, 14 Mar 2009 14:18:45 -0300
Message-Id: <1237051125.4021.2.camel@faraday>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Problem with xserver-xorg
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
X-List-Received-Date: Sat, 14 Mar 2009 17:19:25 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

This problem is solved:

I set PREFERRED_VERSION_mesa =3D "7.2".


Marcos Amorim
Eq. de Desenvolvimento
2MI Tecnologia



Em Sex, 2009-03-13 =C3=A0s 13:34 -0300, Marcos Amorim escreveu:

> I'm compile distro with xorg-xserver how to fix this problem?
>=20
>=20
> openembedded/packages/xorg-xserver/xserver-xorg_1.5.3.bb, do_configure
>=20
> checking for GL... configure: error: Package requirements (glproto >=3D
> 1.4.9 gl >=3D 7.1.0) were not met:
> =20
> No package 'gl' found
>=20
> I try with --disable-xgl and --disable-glx and unsuccessfully
>=20
> This is my configure options
>=20
> build/tmp/work/i486-linux/xserver-xorg-2_1.5.3-r4/xorg-server-1.5.3/con=
figure --build=3Di686-linux --host=3Di486-linux --target=3Di486-linux --p=
refix=3D/usr --exec_prefix=3D/usr --bindir=3D/usr/bin --sbindir=3D/usr/sb=
in --libexecdir=3D/usr/libexec --datadir=3D/usr/share --sysconfdir=3D/etc=
 --sharedstatedir=3D/usr/com 	--localstatedir=3D/var 	--libdir=3D/usr/lib=
 --includedir=3D/usr/include --oldincludedir=3D/usr/include --infodir=3D/=
usr/share/info --mandir=3D/usr/share/man --enable-xcalibrate --enable-kdr=
ive --enable-xephyr  --disable-xfbdev --disable-xnest --disable-kdrive-ve=
sa                   --with-default-font-path=3D/usr/share/fonts/X11/misc=
 ac_cv_file__usr_share_sgml_X11_defs_ent=3Dno
>=20
>=20
>=20
> Marcos Amorim
> Eq. de Desenvolvimento
> 2MI Tecnlogia
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

