Received: from [84.21.108.25] (helo=ns.penguin.cz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1MdTnu-0004sL-A0
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Aug 2009 20:53:07 +0200
Received: from localhost (localhost [127.0.0.1])
	by ns.penguin.cz (Postfix) with ESMTP id 99F561417193
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Aug 2009 20:27:44 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at ns.penguin.cz
Received: from ns.penguin.cz ([127.0.0.1])
	by localhost (ns.penguin.cz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NRyyV51DbF4t
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Aug 2009 20:27:44 +0200 (CEST)
Received: from [192.168.1.2] (7-165-207-85.strcechy.adsl-llu.static.bluetone.cz
	[85.207.165.7]) by ns.penguin.cz (Postfix) with ESMTP id 7084C1417182
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Aug 2009 20:27:44 +0200 (CEST)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4A8AC753.8000008@atmel.com>
References: <1250551346.5083.3@zaurus> <1250591188.3555.5.camel@utx.utx.cz>
	<4A8AC753.8000008@atmel.com>
Date: Tue, 18 Aug 2009 20:35:59 +0200
Message-Id: <1250620560.4550.17.camel@utx.utx.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.1.1 
Subject: Re: xtscal fails + other Xorg init problems.
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
X-List-Received-Date: Tue, 18 Aug 2009 18:53:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Ulf Samuelsson wrote:
> Stanislav Brabec skrev:
> > Stanislav Brabec wrote:

> > It didn't work for kdrive based builds, because kdrive recipe wants
> > libxcalibrate, but xtscal wants xcalibrate. One dependency chain
> > overwrites the another with undefined result depending on the build
> > order.
>=20
> What is the difference between "xserver-kdrive-1300" and
> "kdrive based builds" ?

Just a package selection for particular target that causes different
order of overwriting of staged files.

> Do you mean it does not work with later revisions of xserver-kdrive?

xserver-kdrive-1300 is the oldest version in the tree. If=EF=BB=BF the la=
test
libxcalibrate works with it, I guess that it will work with any newer
version.

> Should we try to focus on xorg-xserver-1.6.1 which seems to have kdrive
> support?

Are you sure that it is "kdrive support" and not just "kdrive in the
source tree", as it was in past (i. e. deprecated and without support)?

Well, anything newer than ancient xserver-kdrive-1300 working on
machines like spitz would be a win.

With a highly modularized Xorg, upgrade to full Xorg may be an option,
as it could support modern desktop extensions.

It also seems, that Xorg has much better performance in rotated fbdev
driver than xserver-kdrive-1300.

I was even able to run Xorg with OpenGL (Mesa emulated) on my Zaurus
(5-8FPS in glxgears).

Problems that block upgrage:

- broken keyboard driver (keyboard map loads only sometimes, some keys
or autorepeat doesn't load, kdrive > 1.3.0.0)
- support for different orientation of touchscreen and display (both
kdrive > 1.3.0.0 and xorg)
- working XRandR in fbdev driver (xorg, last time I tested it, just a
code for runtime rotation was missing, rotation itself was already
implemented)


________________________________________________________________________
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



