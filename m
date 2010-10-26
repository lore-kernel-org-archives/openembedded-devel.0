Received: from mrqout1-sorbs.tiscali.it ([195.130.225.22]
	helo=mrqout1.tiscali.it) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <l.bolognini@tiscali.it>) id 1PAlJ6-0006aU-J2
	for openembedded-devel@lists.openembedded.org;
	Tue, 26 Oct 2010 17:19:26 +0200
Received: from [10.39.115.24] by mrq-1 with esmtp (Exim)
	id 1PAlIN-0000pu-It; Tue, 26 Oct 2010 17:18:39 +0200
Received: from ps-wm8 (10.39.75.208) by mail-4.mail.tiscali.sys (8.5.124)
	id 4CBFE97B0022B892; Tue, 26 Oct 2010 17:18:39 +0200
Message-ID: <14172071.346581288106319217.JavaMail.defaultUser@defaultHost>
Date: Tue, 26 Oct 2010 17:18:39 +0200 (CEST)
From: "l.bolognini@tiscali.it" <l.bolognini@tiscali.it>
To: <denis@denix.org>,  <arago-devel@gforge.ti.com>
MIME-Version: 1.0
xOriginalSenderIP: 89.118.158.66
X-SA-Exim-Connect-IP: 195.130.225.22
X-SA-Exim-Mail-From: l.bolognini@tiscali.it
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Open Embedded Mailing List <openembedded-devel@lists.openembedded.org>
Subject: Re: [arago-devel] c6a816x-evm support
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
X-List-Received-Date: Tue, 26 Oct 2010 15:19:26 -0000
Content-Type: text/plain;charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hallo, any news about ti816x support?
Do I have to setup again Arago=20
environment by the three "git clone" commands or is there a way to=20
update the tree with the new supports?

With the same tree "cloned" in=20
the beginning of October now I get:
[luca@fedora13 oe]$ MACHINE=3Dc6a816x-
evm bitbake -v ti816x-image
[...]
NOTE: fetch http://www.angstrom-
distribution.org/unstable/sources/git_arago-project.org.git.projects.
linux-omap3.git_661585a1407961c5e71f1d8203f1a32f08e9a772.tar.gz
--2010-
10-26 17:11:43--  http://www.angstrom-distribution.
org/unstable/sources/git_arago-project.org.git.projects.linux-omap3.
git_661585a1407961c5e71f1d8203f1a32f08e9a772.tar.gz
Resolving www.
angstrom-distribution.org... 188.40.83.200
Connecting to www.angstrom-
distribution.org|188.40.83.200|:80... connected.
HTTP request sent,=20
awaiting response... 404 Not Found
2010-10-26 17:11:50 ERROR 404: Not=20
Found.

fatal: read error: Connection reset by peer

NOTE: Task failed:=20
Fetch failed: Fetch command export HOME=3D...; export PATH=3D...; git fetch=
=20
git://arago-project.org/git/projects/linux-omap3.git master failed with=20
signal 128, output:
fatal: read error: Connection reset by peer

What=20
about the development for MACHINE=3Dc6a816x-evm ?
Thank you,
bye=20
Luca





----Messaggio originale----
Da: denis@denix.org
Data: 04/10/2010 18.34

A: "l.bolognini@tiscali.it"<l.bolognini@tiscali.it>, <arago-
devel@gforge.ti.com>
Cc: "Open Embedded Mailing List"<openembedded-
devel@lists.openembedded.org>
Ogg: Re: [arago-devel] c6a816x-evm=20
support

On Mon, Oct 04, 2010 at 05:43:06PM +0200, l.bolognini@tiscali.
it wrote:
> Hallo,
> I'm working with Arago but I thought to extend=20
this mail to OE=20
> mailing list too.
> I made=20
> git clone git://arago-
project.org/git/arago.
> git
> git clone git://arago-project.
org/git/arago-oe-dev.git
> git clone=20
> git://arago-project.
org/git/arago-bitbake.git=20
> last Friday (1st October=20
> 2010)
> Now=20
I'm trying to build my custom image for MACHINE=3Dc6a816x-evm.
>=20
> From=20
git:
> //arago-project.org/git/projects/linux-omap3
>  *=20
branch           =20
> master     -> FETCH_HEAD
> NOTE: Creating tarball=20
of git repository
>=20
> fatal: failed to unpack tree object=20
>=20
661585a1407961c5e71f1d8203f1a32f08e9a772
> NOTE: Task failed: Fetch=20
>=20
failed: Fetch command export HOME=3D...; export PATH=3D...;
> git read-
tree=20
> 661585a1407961c5e71f1d8203f1a32f08e9a772 failed with signal=20
128,=20
> output:
> fatal: failed to unpack tree object=20
>=20
661585a1407961c5e71f1d8203f1a32f08e9a772

Luca,

Yes, we have noticed=20
this issue last Friday - the commit ID the recipe was=20
originally based=20
on, is no longer available. I believe Roger fixed it when=20
pushing the=20
ti816x support to OE, but I haven't had time to fix it in Arago=20
yet.=20
It should be fixed in Arago shortly, sorry for the inconvenience.

--=20

Denys





Supera i limiti: raddoppia la velocit=C3=A0 da 10 a 20 Mega!   Risparmia co=
n Tutto Incluso: telefono + adsl 20 mega a soli 26,60 =E2=82=AC al mese per=
 un anno!  SCONTO DI 160 EURO!  http://abbonati.tiscali.it/telefono-adsl/pr=
odotti/tc/tuttoincluso/?WT.mc_id=3D01fw


