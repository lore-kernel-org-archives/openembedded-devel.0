Received: from cluster-a.mailcontrol.com ([85.115.52.190])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Daniele.Bosi@mta.it>) id 1Q9x4u-00076L-14
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Apr 2011 12:13:40 +0200
Received: from mail.mta.it (mail.mta.it [91.143.207.180])
	by rly20a.srv.mailcontrol.com (MailControl) with ESMTP id
	p3DA9j4a018413 for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Apr 2011 11:11:23 +0100
Received: from mta-digicas.MTA.INT ([172.26.10.13]) by mail.mta.it with
	Microsoft SMTPSVC(6.0.3790.4675); Wed, 13 Apr 2011 12:10:28 +0200
Received: from mta-digimail.MTA.INT ([172.26.10.14]) by mta-digicas.MTA.INT
	([172.26.10.13]) with mapi; Wed, 13 Apr 2011 12:10:27 +0200
From: Bosi Daniele <Daniele.Bosi@mta.it>
To: "'openembedded-devel@lists.openembedded.org'"
	<openembedded-devel@lists.openembedded.org>
Date: Wed, 13 Apr 2011 12:10:27 +0200
Thread-Topic: [oe] R:  issue building the rule "gnome/gconf-dbus_svn.bb"
Thread-Index: Acv5vtGCBEVO3pWuReuwrFqxeT2tYAAAU2eA
Message-ID: <531B6536C9F737458807DF75064873C801CE0CD63518@mta-digimail.MTA.INT>
In-Reply-To: <20110413093909.GB2319@xora-desktop.xora.org.uk>
Accept-Language: it-IT
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: it-IT
MIME-Version: 1.0
X-OriginalArrivalTime: 13 Apr 2011 10:10:28.0404 (UTC)
	FILETIME=[03922740:01CBF9C3]
X-Scanned-By: MailControl A_10_80_00 (www.mailcontrol.com) on 10.65.0.130
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
X-List-Received-Date: Wed, 13 Apr 2011 10:13:40 -0000
Content-Language: it-IT
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Graeme,
our DISTRO is an "angstrom-2008.1" with some custom rules for our softwares
.

>Out of interest what DISTRO are you trying to build from which branch?

>AFAIK the dbus support was folded back into the gconf mainline so all the
>active distros now use gconf mainline.

>Graeme

On Wed, Apr 13, 2011 at 11:09:28AM +0200, Bosi Daniele wrote:
> Ok Martin thanks, for the link.
> Now my question is: have I got to fix the rule in order to build it?
> if I change the SRC_URI then the rule still don't build.
>
> In the past days I tried without any success with
>
> SRC_URI =3D "http://ftp.gnome.org/pub/gnome/sources/GConf-dbus/2.16/GConf=
-dbus-2.16.0.tar.bz2 \
>         file://69gconfd-dbus"
>
> and the result on the terminal is:
>
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
>
>
>
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
>
> Depends on revision
> trunk_developer.imendio.com_.svn.gconf-dbus_705_.tar.gz
> is avaliable on yocto mirror
> http://autobuilder.yoctoproject.org/downloads/yocto-1.0/sources/
>
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
> > ERROR: '/opt/OE/org.cnh_fred.dev/recipes/gnome/gconf-dbus_svn.bb' faile=
d
> >
> >
> > Thanks in advance
> > Daniele
> >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


