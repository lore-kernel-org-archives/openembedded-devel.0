Received: from [84.21.108.25] (helo=ns.penguin.cz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1McSUm-0005KB-V1
	for openembedded-devel@lists.openembedded.org;
	Sun, 16 Aug 2009 01:17:09 +0200
Received: from localhost (localhost [127.0.0.1])
	by ns.penguin.cz (Postfix) with ESMTP id 29E621417196
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Aug 2009 00:51:54 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at ns.penguin.cz
Received: from ns.penguin.cz ([127.0.0.1])
	by localhost (ns.penguin.cz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NhDtSZIq0aYv
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Aug 2009 00:51:54 +0200 (CEST)
Received: from [192.168.1.2] (7-165-207-85.strcechy.adsl-llu.static.bluetone.cz
	[85.207.165.7]) by ns.penguin.cz (Postfix) with ESMTP id F2DE01417184
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Aug 2009 00:51:53 +0200 (CEST)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1250284105.4215.144.camel@lenovo.internal.reciva.com>
References: <4A8516BF.9080405@atmel.com> <h63h7v$8pk$1@ger.gmane.org>
	<4A8581D9.9010205@atmel.com>
	<1250264545.12282.1271.camel@mill.internal.reciva.com>
	<4A85C292.9030605@atmel.com>
	<1250284105.4215.144.camel@lenovo.internal.reciva.com>
Date: Sun, 16 Aug 2009 01:00:21 +0200
Message-Id: <1250377221.5033.16.camel@utx.utx.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.1.1 
Subject: Re: No graphic when loading "x11-gpe-image"
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
X-List-Received-Date: Sat, 15 Aug 2009 23:17:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Phil Blundell p=C3=AD=C5=A1e v P=C3=A1 14. 08. 2009 v 22:08 +0100:
> On Fri, 2009-08-14 at 22:01 +0200, Ulf Samuelsson wrote:
> > The full command line is:
> > exec Xorg -br -pn  -dpi 100 -rgba bgr -screen 240x320 :0 -noreset
> >=20
> > It complains about an unrecognized option "-rgba"
>=20
> Yeah, that looks like the startup scripts are trying to pass kdrive
> options to Xorg.  I guess you need to either install kdrive, or patch
> the scripts to do the right thing for Xorg.

Yes, this script is broken - it checks, whether Xorg is installed. If it
is, but the platform was originally designed for kdrive, it breaks.

There was a thread "=EF=BB=BF[RFC] Xserver-common 1.30" about it few week=
s ago.

Maybe a new platform specific package with a working xorg.conf will be
useful. (Future versions of Xorg may be able to start without xorg.conf,
just with auto-detection.)


________________________________________________________________________
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



