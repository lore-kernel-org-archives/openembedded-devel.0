Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Q9wR6-00065L-7R
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Apr 2011 11:32:32 +0200
Received: by fxm19 with SMTP id 19so369634fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Apr 2011 02:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=LZ+kxJWJqwCmCuXafcwBOrlTtWcZgl2ABfm27ukhuhA=;
	b=s8hDaNUhT9/BpAOiz43ReqrR6YRMGNY35aRN1vVZyQ/9FbUPuX2krVtyLvldAaCZP3
	P1QpzEczUGqN8TuVJ1f5yXSv7kDf5gu2tBtQBN13vO9MaI9vKCONnXtEFR1DREASp7B9
	hh3NlAJ5JUOvAvTT0+KDCu6jYmNLTw3k/VzGo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=fZif0sCt75T3qeAiDkoyuLyay8YkP6+a4BnhOCT+utkrMBHE62Z/vmh/0AE9MxLL9o
	dy99sxz0d2mULdY97J783v53ejG3Kmph3qZIJQ4IBFaddgAfyw+2UasXGJLNq/yYFGMr
	CUBCoDOkrnGTpg1A6QrnhkibXEJgGCIkRCGRw=
Received: by 10.223.55.200 with SMTP id v8mr500956fag.82.1302687017669;
	Wed, 13 Apr 2011 02:30:17 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id p16sm111013fax.45.2011.04.13.02.30.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 13 Apr 2011 02:30:16 -0700 (PDT)
Date: Wed, 13 Apr 2011 11:30:14 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110413093014.GE21027@jama.jama.net>
References: <20110412192818.GD21027@jama.jama.net>
	<531B6536C9F737458807DF75064873C801CE0CD63517@mta-digimail.MTA.INT>
MIME-Version: 1.0
In-Reply-To: <531B6536C9F737458807DF75064873C801CE0CD63517@mta-digimail.MTA.INT>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: issue building the rule "gnome/gconf-dbus_svn.bb"
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
X-List-Received-Date: Wed, 13 Apr 2011 09:32:32 -0000
X-Groupsio-MsgNum: 31143
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="PGNNI9BzQDUtgA2J"
Content-Disposition: inline

--PGNNI9BzQDUtgA2J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 13, 2011 at 11:09:28AM +0200, Bosi Daniele wrote:
> Ok Martin thanks, for the link.
> Now my question is: have I got to fix the rule in order to build it?
> if I change the SRC_URI then the rule still don't build.

you can compare your recipe with oe-core
http://git.openembedded.org/cgit.cgi/openembedded-core/tree/meta/recipes-gn=
ome/gnome/gconf-dbus_svn.bb

all I know about gconf-dbus is that SRCREV=3D705 builds fine with
oe-core..

>=20
> In the past days I tried without any success with
>=20
> SRC_URI =3D "http://ftp.gnome.org/pub/gnome/sources/GConf-dbus/2.16/GConf=
-dbus-2.16.0.tar.bz2 \
>         file://69gconfd-dbus"
>=20
> and the result on the terminal is:
>=20
> NOTE: Handling BitBake files: \ (6705/6705) [100 %]
> NOTE: Parsing finished. 6405 cached, 0 parsed, 300 skipped, 0 masked.
> NOTE: Cache is clean, not saving.
> NOTE: Resolving any missing task queue dependencies
> NOTE: Preparing runqueue
> NOTE: Executing runqueue
> NOTE: Running task 638 of 942 (ID: 1, /opt/OE/org.cnh_fred.dev/recipes/gn=
ome/gconf-dbus_svn.bb, do_setscene)
> NOTE: Running task 639 of 942 (ID: 2, /opt/OE/org.cnh_fred.dev/recipes/gn=
ome/gconf-dbus_svn.bb, do_fetch)
> NOTE: Running task 640 of 942 (ID: 3, /opt/OE/org.cnh_fred.dev/recipes/gn=
ome/gconf-dbus_svn.bb, do_unpack)
> NOTE: Unpacking ../../sources/GConf-dbus-2.16.0.tar.bz2 to ../../build_cn=
h_fred/tmp.1/work/ppce300c3-linux/gconf-dbus-2.16.0+svnr641-r0/
> NOTE: Unpacking ../recipes/gnome/gconf-dbus/69gconfd-dbus to ../../build_=
cnh_fred/tmp.1/work/ppce300c3-linux/gconf-dbus-2.16.0+svnr641-r0/
> NOTE: Running task 681 of 942 (ID: 4, /opt/OE/org.cnh_fred.dev/recipes/gn=
ome/gconf-dbus_svn.bb, do_patch)
> NOTE: Running task 682 of 942 (ID: 5, /opt/OE/org.cnh_fred.dev/recipes/gn=
ome/gconf-dbus_svn.bb, do_configure)
> NOTE: Running task 690 of 942 (ID: 6, /opt/OE/org.cnh_fred.dev/recipes/gn=
ome/gconf-dbus_svn.bb, do_qa_configure)
> NOTE: Running task 691 of 942 (ID: 7, /opt/OE/org.cnh_fred.dev/recipes/gn=
ome/gconf-dbus_svn.bb, do_compile)
> NOTE: Running task 692 of 942 (ID: 8, /opt/OE/org.cnh_fred.dev/recipes/gn=
ome/gconf-dbus_svn.bb, do_install)
> ERROR: function do_install failed
> ERROR: log data follows (/opt/OE/build_cnh_fred/tmp.1/work/ppce300c3-linu=
x/gconf-dbus-2.16.0+svnr641-r0/temp/log.do_install.21697)
> | NOTE: make DESTDIR=3D/opt/OE/build_cnh_fred/tmp.1/work/ppce300c3-linux/=
gconf-dbus-2.16.0+svnr641-r0/image install
> | make: *** No rule to make target `install'.  Stop.
> | FATAL: oe_runmake failed
> NOTE: Task failed: /opt/OE/build_cnh_fred/tmp.1/work/ppce300c3-linux/gcon=
f-dbus-2.16.0+svnr641-r0/temp/log.do_install.21697
> ERROR: TaskFailed event exception, aborting
> ERROR: Build of /opt/OE/org.cnh_fred.dev/recipes/gnome/gconf-dbus_svn.bb =
do_install failed
> ERROR: Task 8 (/opt/OE/org.cnh_fred.dev/recipes/gnome/gconf-dbus_svn.bb, =
do_install) failed
> NOTE: Tasks Summary: Attempted 691 tasks of which 684 didn't need to be r=
erun and 1 failed.
> ERROR: '/opt/OE/org.cnh_fred.dev/recipes/gnome/gconf-dbus_svn.bb' failed
>=20
>=20
>=20
> On Tue, Apr 12, 2011 at 04:05:28PM +0200, Bosi Daniele wrote:
> > Hi Guys,
> > I can't build the rule gcnf-dbus_svn.bb.
> >
> > the problem seems to be that the svn server
> > svn://developer.imendio.com/svn/gconf-dbus
> > is not working anymore.
> >
> > Does anyone know a mirror for this site? Or a fix for the not working r=
ule?
>=20
> Depends on revision
> trunk_developer.imendio.com_.svn.gconf-dbus_705_.tar.gz
> is avaliable on yocto mirror
> http://autobuilder.yoctoproject.org/downloads/yocto-1.0/sources/
>=20
> >
> > This is the output I see on the terminal when I build
> >
> > NOTE: Handling BitBake files: \ (6705/6705) [100 %]
> > NOTE: Parsing finished. 6405 cached, 0 parsed, 300 skipped, 0 masked.
> > NOTE: Cache is clean, not saving.
> > NOTE: Resolving any missing task queue dependencies
> > NOTE: Preparing runqueue
> > NOTE: Executing runqueue
> > NOTE: Running task 638 of 942 (ID: 1, /opt/OE/org.cnh_fred.dev/recipes/=
gnome/gconf-dbus_svn.bb, do_setscene)
> > NOTE: Running task 639 of 942 (ID: 2, /opt/OE/org.cnh_fred.dev/recipes/=
gnome/gconf-dbus_svn.bb, do_fetch)
> > NOTE: Fetch svn://developer.imendio.com/svn/gconf-dbus;module=3Dtrunk;p=
roto=3Dhttp
> > svn: Server sent unexpected return value (504 Gateway Time-out) in resp=
onse to OPTIONS request for 'http://developer.imendio.com/svn/gconf-dbus/tr=
unk'
> > NOTE: Task failed: Fetch failed: Fetch command export SSH_AUTH_SOCK=3D/=
tmp/keyring-Clq4Sq/ssh; export PATH=3D/opt/OE/build_cnh_fred/tmp.1/staging/=
i686-linux/usr/bin/ppce300c3-linux:/opt/OE/build_cnh_fred/tmp.1/staging/i68=
6-linux/usr/bin/ppce300c3-linux:/opt/OE/build_cnh_fred/tmp.1/staging/i686-l=
inux/usr/sbin:/opt/OE/build_cnh_fred/tmp.1/staging/i686-linux/usr/bin:/opt/=
OE/build_cnh_fred/tmp.1/cross/ppce300c3/bin:/opt/OE/build_cnh_fred/tmp.1/st=
aging/i686-linux/sbin:/opt/OE/build_cnh_fred/tmp.1/staging/i686-linux/bin:/=
usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games; /us=
r/bin/env svn co -r 641 http://developer.imendio.com/svn/gconf-dbus/trunk@6=
41 trunk failed with signal 1, output:
> > svn: Server sent unexpected return value (504 Gateway Time-out) in resp=
onse to OPTIONS request for 'http://developer.imendio.com/svn/gconf-dbus/tr=
unk'
> >
> > ERROR: TaskFailed event exception, aborting
> > ERROR: Build of /opt/OE/org.cnh_fred.dev/recipes/gnome/gconf-dbus_svn.b=
b do_fetch failed
> > ERROR: Task 2 (/opt/OE/org.cnh_fred.dev/recipes/gnome/gconf-dbus_svn.bb=
, do_fetch) failed
> > NOTE: Tasks Summary: Attempted 638 tasks of which 637 didn't need to be=
 rerun and 1 failed.
> > ERROR: '/opt/OE/org.cnh_fred.dev/recipes/gnome/gconf-dbus_svn.bb' failed
> >
> >
> > Thanks in advance
> > Daniele
> >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>=20
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--PGNNI9BzQDUtgA2J
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk2lbSYACgkQN1Ujt2V2gByQygCgkkP6A818ku4XhePxdqlfXKRt
+ZEAn3HXYhzEys6aM26asMWukkVoytrl
=z80i
-----END PGP SIGNATURE-----

--PGNNI9BzQDUtgA2J--
