Received: from vms173009pub.verizon.net ([206.46.173.9])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1PC8aU-0000nV-3q
	for openembedded-devel@lists.openembedded.org;
	Sat, 30 Oct 2010 12:23:04 +0200
Received: from gandalf.denix.org ([unknown] [71.255.228.135])
	by vms173009.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LB3002P8M47Y3A0@vms173009.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Sat,
	30 Oct 2010 05:21:49 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 83C5514AF6A; Sat,
	30 Oct 2010 06:21:43 -0400 (EDT)
Date: Sat, 30 Oct 2010 06:21:43 -0400
From: Denys Dmytriyenko <denis@denix.org>
In-reply-to: <3F7F8AC4C7A0A042A2FE40720B75E208F0321F@nvs0086.nedap.local>
To: openembedded-devel@lists.openembedded.org
Message-id: <20101030102143.GC21651@denix.org>
MIME-version: 1.0
References: <AANLkTimpAJJUoDkY=JvH6o39kssgWdGkgWs_fHa4q-Gd@mail.gmail.com>
	<3F7F8AC4C7A0A042A2FE40720B75E208F0321F@nvs0086.nedap.local>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.9
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: bitbake error?
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
X-List-Received-Date: Sat, 30 Oct 2010 10:23:05 -0000
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: QUOTED-PRINTABLE
Content-disposition: inline

On Sat, Oct 30, 2010 at 12:16:23PM +0200, Jaap de Jong wrote:
> That fixes it...
>=20
> If relevant:=20
> org.openembedded/conf/sanity.conf needs to be patched?
>=20
>     -BB_MIN_VERSION =3D "1.8.18"
>     +BB_MIN_VERSION =3D "1.10.1"

NAK! It is not officially decided or announced to require 1.10 as a m=
inimal=20
version of Bitbake for OpenEmbedded. The minimal version is still 1.8=
.18 and=20
if it is broken now, it needs to be fixed, not worked around. Too man=
y people=20
(especially, out of tree) use 1.8.x bitbake.

Denys

> Thanks!
>=20
> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org on behalf o=
f James Ronald
> Sent: Fri 10/10/29 17:20
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] bitbake error?
> =20
> Pierluigi,
>=20
> Thanks! Installing bitbake-1.10.1 fixed my problem.
>=20
> - Jim
>=20
> On Fri, Oct 29, 2010 at 5:33 AM, Pierluigi Passaro
> <pierluigi.passaro@phoenixsoftware.it> wrote:
> >
> > Not sure this is the best solution, but I solved same issue using=
 latest bitbake 1.10.1 downloaded from
> >
> > http://download.berlios.de/bitbake/bitbake-1.10.1.tar.gz
> >
> >
> > James Ronald wrote:
> >>
> >> Jaap de Jong <jaap.dejong <at> nedap.com> writes:
> >>
> >>
> >>>
> >>> I'm probably totally stupid...
> >>> What am doing wrong?
> >>> (I'm working on a fresh unstable branch)
> >>> When I bitbake I get:
> >>>
> >>> MACHINE=3Dat91sam9263ek =A0bitbake u-boot
> >>> Traceback (most recent call last):
> >>> =A0 File "/media/OpenEmbedded/unstable/bitbake/bin/bitbake", li=
ne 143, in <module>
> >>> =A0 =A0 main()
> >>> =A0 File "/media/OpenEmbedded/unstable/bitbake/bin/bitbake", li=
ne 123, in main
> >>> =A0 =A0 cooker.parseConfiguration()
> >>> =A0 File "/media/OpenEmbedded/unstable/bitbake/lib/bb/cooker.py=
", line 68, in parseConfiguration
> >>> =A0 =A0 self.parseConfigurationFile( os.path.join( "conf", "bit=
bake.conf" ) )
> >>> =A0 File "/media/OpenEmbedded/unstable/bitbake/lib/bb/cooker.py=
", line 402, in parseConfigurationFile
> >>> =A0 =A0 bb.fetch.fetcher_init(self.configuration.data)
> >>> =A0 File "/media/OpenEmbedded/unstable/bitbake/lib/bb/fetch/__i=
nit__.py", line 93, in fetcher_init
> >>> =A0 =A0 pd =3D persist_data.PersistData(d)
> >>> =A0 File "/media/OpenEmbedded/unstable/bitbake/lib/bb/persist_d=
ata.py", line 52, in __init__
> >>> =A0 =A0 bb.mkdirhier(self.cachedir)
> >>> =A0 File "/media/OpenEmbedded/unstable/bitbake/lib/bb/__init__.=
py", line 133, in mkdirhier
> >>> =A0 =A0 debug(3, "mkdirhier(%s)" % dir)
> >>> =A0 File "/media/OpenEmbedded/unstable/bitbake/lib/bb/__init__.=
py", line 103, in debug
> >>> =A0 =A0 bb.msg.debug(lvl, None, ''.join(args))
> >>> =A0 File "/media/OpenEmbedded/unstable/bitbake/lib/bb/msg.py", =
line 100, in debug
> >>> =A0 =A0 bb.event.fire(MsgDebug(msg, None))
> >>> =A0 File "/media/OpenEmbedded/unstable/bitbake/lib/bb/event.py"=
, line 67, in fire
> >>> =A0 =A0 if tmpHandler(event) =3D=3D Handled:
> >>> =A0 File "tmpHandler(e)", line 8, in tmpHandler
> >>> NameError: global name 'msg' is not defined
> >>>
> >>>
> >>
> >> I'm getting the exact same error. I'm new to OE and just going t=
hrough the Getting started wiki entry. Ubuntu 10.04 installing bitbak=
e via apt-get install bitbake.
> >>
> >> bitbake --version BitBake Build Tool Core version 1.8.18, bitbak=
e version 1.8.18
> >> =A0OE is current as of a few minutes ago.
> >>
> >> jr@ubuntu-xpc:~/oe/build$ bitbake nano
> >> Traceback (most recent call last):
> >> =A0File "/usr/bin/bitbake", line 143, in <module>
> >> =A0 =A0main()
> >> =A0File "/usr/bin/bitbake", line 123, in main
> >> =A0 =A0cooker.parseConfiguration()
> >> =A0File "/usr/lib/pymodules/python2.6/bb/cooker.py", line 67, in=
 parseConfiguration
> >> =A0 =A0self.parseConfigurationFile( os.path.join( "conf", "bitba=
ke.conf" ) )
> >> =A0File "/usr/lib/pymodules/python2.6/bb/cooker.py", line 401, i=
n parseConfigurationFile
> >> =A0 =A0bb.fetch.fetcher_init(self.configuration.data)
> >> =A0File "/usr/lib/pymodules/python2.6/bb/fetch/__init__.py", lin=
e 93, in fetcher_init
> >> =A0 =A0pd =3D persist_data.PersistData(d)
> >> =A0File "/usr/lib/pymodules/python2.6/bb/persist_data.py", line =
52, in __init__
> >> =A0 =A0bb.mkdirhier(self.cachedir)
> >> =A0File "/usr/lib/pymodules/python2.6/bb/__init__.py", line 133,=
 in mkdirhier
> >> =A0 =A0debug(3, "mkdirhier(%s)" % dir)
> >> =A0File "/usr/lib/pymodules/python2.6/bb/__init__.py", line 103,=
 in debug
> >> =A0 =A0bb.msg.debug(lvl, None, ''.join(args))
> >> =A0File "/usr/lib/pymodules/python2.6/bb/msg.py", line 100, in d=
ebug
> >> =A0 =A0bb.event.fire(MsgDebug(msg, None))
> >> =A0File "/usr/lib/pymodules/python2.6/bb/event.py", line 67, in =
fire
> >> =A0 =A0if tmpHandler(event) =3D=3D Handled:
> >> =A0File "tmpHandler(e)", line 8, in tmpHandler
> >> NameError: global name 'msg' is not defined
> >>
> >> - Jim
> >>
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded=
-devel
> >>
> >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-=
devel
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-de=
vel
>=20


> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-de=
vel




