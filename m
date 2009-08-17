Received: from [84.21.108.25] (helo=ns.penguin.cz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1MdBnT-00066Y-Lv
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Aug 2009 01:39:27 +0200
Received: from localhost (localhost [127.0.0.1])
	by ns.penguin.cz (Postfix) with ESMTP id E6EC81422AA6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Aug 2009 01:14:07 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at ns.penguin.cz
Received: from ns.penguin.cz ([127.0.0.1])
	by localhost (ns.penguin.cz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LVOldHHxMj3O
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Aug 2009 01:14:07 +0200 (CEST)
Received: from zaurus (7-165-207-85.strcechy.adsl-llu.static.bluetone.cz
	[85.207.165.7]) by ns.penguin.cz (Postfix) with ESMTP id AACD91416BAB
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Aug 2009 01:14:07 +0200 (CEST)
Date: Tue, 18 Aug 2009 01:22:26 +0200
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1250526646.4956.43.camel@utx.utx.cz>
X-Mailer: Balsa 2.4.1
Message-Id: <1250551346.5083.3@zaurus>
MIME-Version: 1.0
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
X-List-Received-Date: Mon, 17 Aug 2009 23:39:27 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Stanislav Brabec wrote:
> Phil Blundell wrote:
> > On Sat, 2009-08-15 at 12:06 +0200, Stanislav Brabec wrote:
> >=20
> > > libxcalibrate does not compile on images with xserver-kdrive.
> >=20
> > I can't think offhand why libxcalibrate should care what xserver is
> in
> > your image.  What's the error you get?
>=20

Well, the problem is located in the level between:

There are two recipes for the calibrate library: libxcalibrate and=20
xcalibrate

There are two recipes that provide prototypes: calibrateproto=20
and xcalibrabrateext

Only some of these combinations result in a working environment.

I'll test, whether latest library version works with xserver-
kdrive-1300.

--=20
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus






