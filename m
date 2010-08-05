Received: from office.altell.ru ([80.246.246.162])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1Ogw1I-00081m-Hx
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 Aug 2010 10:41:51 +0200
Received: from keemun.localnet (unknown [192.168.1.169])
	by mail.altell.local (Postfix) with ESMTPS id 966894669
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Aug 2010 12:46:07 +0400 (MSD)
From: Roman I Khimov <khimov@altell.ru>
Organization: Altell Ltd.
To: openembedded-devel@lists.openembedded.org
Date: Thu, 5 Aug 2010 12:41:23 +0400
User-Agent: KMail/1.12.4 (Linux/2.6.31.12-0.2-desktop; KDE/4.3.5; x86_64; ; )
References: <E1OguCD-00023v-03@melo.openembedded.org>
	<201008051138.00510.khimov@altell.ru> <20100805082440.GE29578@jama>
In-Reply-To: <20100805082440.GE29578@jama>
MIME-Version: 1.0
Message-Id: <201008051241.24091.khimov@altell.ru>
X-Altell-MailScanner-ID: 966894669.5260B
X-Altell-MailScanner: Found to be clean
X-Altell-MailScanner-From: khimov@altell.ru
X-SA-Exim-Connect-IP: 80.246.246.162
X-SA-Exim-Mail-From: khimov@altell.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [oe-commits] Roman I Khimov : bitbake.conf: trust server certificate when doing svn over https
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
X-List-Received-Date: Thu, 05 Aug 2010 08:41:51 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

=D0=92 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B8 =D0=BE=D1=82 =
=D0=A7=D0=B5=D1=82=D0=B2=D0=B5=D1=80=D0=B3 05 =D0=B0=D0=B2=D0=B3=D1=83=D1=
=81=D1=82=D0=B0 2010 12:24:40 =D0=B0=D0=B2=D1=82=D0=BE=D1=80 Martin Jansa =
=D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB:
> On Thu, Aug 05, 2010 at 11:38:00AM +0400, Roman I Khimov wrote:
> > =D0=92 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B8 =D0=BE=D1=
=82 =D0=A7=D0=B5=D1=82=D0=B2=D0=B5=D1=80=D0=B3 05 =D0=B0=D0=B2=D0=B3=D1=83=
=D1=81=D1=82=D0=B0 2010 11:12:01 =D0=B0=D0=B2=D1=82=D0=BE=D1=80 Martin Jans=
a=20
=D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB:
> > > Maybe we should add also
> > > --accept theirs-full (just in case)
> > > --force (to force overwrite of existing files)
> > >
> > > ie
> > > matchbox-panel-2-icon-themes_0.0.1.bb
> > > matchbox-panel-2_svn.bb
> > > are checkouting/updating tiwo different SRCREVs and every few builds
> > > you end up removing svn checkout from downloads dir, just because it
> > > refuses to upgrade to newer revision (applets dir already exists
> > > there).
> > >
> > > Any objections (someone intentionaly keeping dirty checkouts in his
> > > DL_DIR)?
> >
> > No objections here.
>=20
> On older buildhost I noticed that
> svn, version 1.5.1 (r32289)
> doesn't support --trust-server-cert

Argh. Certainly, not my day. Usually I use Debian lenny as a build machine =
and=20
that really has 1.5.1 with no "--trust-server-cert" option. And that pf_rin=
g=20
recipe that does svn over https worked there just because I've had that rep=
o=20
checked out before packaging it in OE.

Then as usually I've cherry-picked the patch to another machine with differ=
ent=20
machine/distro build configuration (surprisingly how often seem-to-be-good=
=20
recipes fail after that) running under OpenSUSE 11.2. Immediately seen svn=
=20
checkout error and figured out that it's "trivial" to fix (with OpenSUSE's =
svn=20
1.6.6).

Turns out, not that much. Sorry. Feel free to revert it as I would only be=
=20
able to do that some 8-9 hours later.

> I don't know if it's worth it to force builders to upgrade subversion or
> add their FETCHCOMMAND_svn UPDATECOMMAND_svn to local.conf.

IMO we should not break support for major stable (or LTS) distros, so my pa=
tch=20
is broken.


