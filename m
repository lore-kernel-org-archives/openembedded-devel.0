Received: from static.26.116.47.78.clients.your-server.de ([78.47.116.26]
	helo=drlauer-research.com) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickey@vanille-media.de>) id 1NFRky-0005PJ-Vd
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Dec 2009 13:23:04 +0100
Received: from [192.168.1.12] (dialbs-092-079-168-007.static.arcor-ip.net
	[92.79.168.7])
	by drlauer-research.com (Postfix) with ESMTP id 9B999584143
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Dec 2009 14:09:04 +0100 (CET)
Mime-Version: 1.0 (Apple Message framework v1077)
From: "Dr. Michael Lauer" <mickey@vanille-media.de>
In-Reply-To: <ad82c8890912010402p6defc358rd7c353f92c6b2fa9@mail.gmail.com>
Date: Tue, 1 Dec 2009 13:21:27 +0100
Message-Id: <A689A171-1453-4B10-AC0A-484E018DBF21@vanille-media.de>
References: <ad82c8890912010402p6defc358rd7c353f92c6b2fa9@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.1077)
X-SA-Exim-Connect-IP: 78.47.116.26
X-SA-Exim-Mail-From: mickey@vanille-media.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: compiling linphone using openembedded
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
X-List-Received-Date: Tue, 01 Dec 2009 12:23:04 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

> Now i login as a user. I exported following paths
>=20
> export OEBASE=3D/home/development/em-x270/stuff
> export PATH=3D$OEBASE/bitbake/bin:$PATH
> export BBPATH=3D$OEBASE/build:$OEBASE/openembedded
> export BB_ENV_EXTRAWHITE=3D"OEBASE"
>=20
> and set CACHE variable in usr/share/bitbake/conf/bitbake.conf as
>=20
> CACHE =3D "/home/development/em-x270/stuff/build/tmp"
>=20
> when i compile "bitbake linphone" i get following error
>=20
> [vivek@primary build]$ bitbake linphone
> Traceback (most recent call last):
>  File "/home/development/em-x270/stuff/bitbake/bin/bitbake", line 143, =
in
> <module>
>    main()
>  File "/home/development/em-x270/stuff/bitbake/bin/bitbake", line 123, =
in
> main
>    cooker.parseConfiguration()
>  File "/home/development/em-x270/stuff/bitbake/lib/bb/cooker.py", line =
68,
> in parseConfiguration
>    self.parseConfigurationFile( os.path.join( "conf", "bitbake.conf" ) =
)
>  File "/home/development/em-x270/stuff/bitbake/lib/bb/cooker.py", line =
402,
> in parseConfigurationFile
>    bb.fetch.fetcher_init(self.configuration.data)
>  File =
"/home/development/em-x270/stuff/bitbake/lib/bb/fetch/__init__.py",
> line 93, in fetcher_init
>    pd =3D persist_data.PersistData(d)
>  File =
"/home/development/em-x270/stuff/bitbake/lib/bb/persist_data.py",
> line 52, in __init__
>    bb.mkdirhier(self.cachedir)
>  File "/home/development/em-x270/stuff/bitbake/lib/bb/__init__.py", =
line
> 138, in mkdirhier
>    if e.errno !=3D 17: raise e
> *OSError: [Errno 13] Permission denied:
> '/home/development/em-x270/stuff/build/tmp'

Sounds like your previous building with root messed up permissions. Use =
chmod/chown to correct.

:M:



