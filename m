Received: from mail-da0-f48.google.com ([209.85.210.48])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UFjxc-00068D-2l
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Mar 2013 12:35:30 +0100
Received: by mail-da0-f48.google.com with SMTP id w4so369812dam.7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Mar 2013 04:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:mime-version
	:content-type:content-disposition:user-agent;
	bh=BOCc1iw4RV4PLGxfGdGs0mw73kkQXQ2G01uQJKAOZzI=;
	b=Wk3e47jFTWV6Q3WhysjCO017eUh60FdZYxEHulqJZZm8Hx29rt4tprNJENd91IFiQ/
	iPlp/jVlxqyukZWe++9knTDf3wLFqt898P0JrZbV0WeP6BLjJmFAXPbBjZyrHaR3ReQ5
	CGDmGckFCuo+HSLRaw125jT8c1RgTxCF5N12G+PK+tXWHfcaoZ5yG84AKDVhwoZ4AD4F
	c6TMtsqQYXqy4PkfF2g4OgkayMI7tRKLbrv0sWMZYYnNUx06HABw0BQ62adBJbhGIwaC
	LrafynQ75SWPVwyU0ukN9cWcMFjHHG+OkRa03AFNRms9pOeLhq3aLPHCLslgq/D9zZr7
	+uAA==
X-Received: by 10.68.11.135 with SMTP id q7mr44708064pbb.5.1363173506667;
	Wed, 13 Mar 2013 04:18:26 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id y1sm9699227pbg.10.2013.03.13.04.18.24
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 13 Mar 2013 04:18:25 -0700 (PDT)
Date: Wed, 13 Mar 2013 12:18:17 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20130313111817.GC3260@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia] gst123 using wrong sysroot
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
X-List-Received-Date: Wed, 13 Mar 2013 11:35:30 -0000
X-Groupsio-MsgNum: 43514
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6zdv2QT/q3FMhpsV"
Content-Disposition: inline

--6zdv2QT/q3FMhpsV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

gst123 is still "sometimes" using wrong sysroot, we talked about this on
IRC, any update?

| arm-oe-linux-gnueabi-g++  -march=3Darmv5te  -marm -mthumb-interwork   --s=
ysroot=3D/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/qe=
muarm -pthread -I/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sys=
roots/qemuarm/usr/include/gstreamer-0.10 -I/home/jenkins/oe/shr-core-branch=
es/shr-core/tmp-eglibc/sysroots/qemuarm/usr/include/glib-2.0 -I/home/jenkin=
s/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/qemuarm/usr/lib/glib-2.=
0/include -I/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots=
/qemuarm/usr/include/libxml2   -pthread -I/home/jenkins/oe/shr-core-branche=
s/shr-core/tmp-eglibc/sysroots/qemuarm/usr/include/gstreamer-0.10 -I/home/j=
enkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/qemuarm/usr/includ=
e/glib-2.0 -I/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroot=
s/qemuarm/usr/lib/glib-2.0/include -I/home/jenkins/oe/shr-core-branches/shr=
-core/tmp-eglibc/sysroots/qemuarm/usr/include/libxml2 -I/home/jenkins/oe/sh=
r-core-branches/shr-core/tmp-eglibc/sysroots/qemuarm/usr/include/gtk-2.0 -I=
/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/qemuarm/usr=
/lib/gtk-2.0/include -I/home/jenkins/oe/shr-core-branches/shr-core/tmp-egli=
bc/sysroots/qemuarm/usr/include/atk-1.0 -I/home/jenkins/oe/shr-core-branche=
s/shr-core/tmp-eglibc/sysroots/qemuarm/usr/include/cairo -I/home/jenkins/oe=
/shr-core-branches/shr-core/tmp-eglibc/sysroots/qemuarm/usr/include/gdk-pix=
buf-2.0 -I/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/q=
emuarm/usr/include/pango-1.0 -I/home/jenkins/oe/shr-core-branches/shr-core/=
tmp-eglibc/sysroots/qemuarm/usr/include/pixman-1 -I/home/jenkins/oe/shr-cor=
e-branches/shr-core/tmp-eglibc/sysroots/qemuarm/usr/include/freetype2 -I/ho=
me/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/qemuarm/usr/in=
clude/libpng16 -I/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sys=
roots/qemuarm/usr/include/harfbuzz   -I/home/jenkins/oe/shr-core-branches/s=
hr-core/tmp-eglibc/sysroots/x86_64-linux/usr/include/ncurses -I/home/jenkin=
s/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -g -feliminate-unused-debug-types -fpermissive -fvisibility-inl=
ines-hidden  -O2 -Wall  -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -o g=
st123 gst123.o glib-extra.o terminal.o gtkinterface.o options.o microconf.o=
 configfile.o uri.o playlist.o m3uparser.o plsparser.o iostream.o networkst=
ream.o filestream.o consolestream.o httpstream.o visualization.o msg.o type=
finder.o -pthread -lgstreamer-0.10 -lgobject-2.0 -lgmodule-2.0 -lgthread-2.=
0 -lxml2 -lglib-2.0   -pthread -lgtk-x11-2.0 -lgdk-x11-2.0 -latk-1.0 -lgio-=
2.0 -lpangoft2-1.0 -lpangocairo-1.0 -lgdk_pixbuf-2.0 -lcairo -lpango-1.0 -l=
freetype -lfontconfig -lgstinterfaces-0.10 -lgstvideo-0.10 -lgstbase-0.10 -=
lgstreamer-0.10 -lgobject-2.0 -lgmodule-2.0 -lgthread-2.0 -lxml2 -lglib-2.0=
   -L/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/x86_64=
-linux/usr/lib -lncurses -ltinfo -lX11
| /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/x86_64-li=
nux/usr/lib/libgobject-2.0.so: file not recognized: File format not recogni=
zed
| collect2: error: ld returned 1 exit status
| make[2]: *** [gst123] Error 1
| make[2]: Leaving directory `/home/jenkins/oe/shr-core-branches/shr-core/t=
mp-eglibc/work/armv5te-oe-linux-gnueabi/gst123/0.3.1-r0/gst123-0.3.1/src'

Complete logs:
http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.201=
30312_110444.log

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--6zdv2QT/q3FMhpsV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFAYHkACgkQN1Ujt2V2gBzMjQCgt2w1eV44fNBVSDIB/53/bB9o
/awAn2HNonOBrOgOUKfkJ0c0W41I68If
=kvlv
-----END PGP SIGNATURE-----

--6zdv2QT/q3FMhpsV--
