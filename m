Received: from [78.46.147.237] (helo=gandharva.secretlabs.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1Mr90s-00060N-Jx
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Sep 2009 13:31:01 +0200
Received: from tamarin.localnet (unknown [188.46.65.193])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 3846D1B10C04
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Sep 2009 11:37:06 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 25 Sep 2009 13:29:54 +0200
User-Agent: KMail/1.12.1 (Linux/2.6.31; KDE/4.3.1; i686; ; )
References: <4AA3ABA8.304@eukrea.com> <4AA43612.8070808@4d-electronics.co.nz>
	<4ABBC232.7010901@eukrea.com>
In-Reply-To: <4ABBC232.7010901@eukrea.com>
MIME-Version: 1.0
Message-Id: <200909251329.54901.holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] qt4-embedded & tslib
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
X-List-Received-Date: Fri, 25 Sep 2009 11:31:01 -0000
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

On Thursday 24 September 2009 21:02:10 Eric B=E9nard wrote:
> Hi,
>=20
> Matthew Dombroski wrote :
> > Actually, the problem is that tslib is linked incorrectly.
> > The pthres, linear, etc. modules are not linked to libts so theyre
> > missing symbols when an attempt is made to load them.
> > To confirm, do
> >
> > LD_PRELOAD=3D/usr/lib/libts-1.0.so.0 <args>
> >
> > tslib modules will resolve symbols properly so tslib will work.
> >
> > A quick patch to tslib to link those modules against libts is below.
> > A little dirty linking against the static libs, but it works!
>=20
> in fact, the patch you sent on the list was integrated into tslib in
> november 2008 :
> http://svn.berlios.de/viewcvs/tslib/trunk/tslib/plugins/Makefile.am?r1=3D=
51&r
> 2=3D56
>=20
> Please find attached a patch to add this patch to the tslib's recipe.
>=20
> Best regards
> Eric
>=20

Signed-off-by: Holger Hans Peter Freyther <zecke@selfish.org>


PS: This will be unlikely tracked by patchwork. Could you try in the future=
 to=20
send a patch from git format-patch and add a signed-off-by line so landing =
the=20
patch will be more easy.


