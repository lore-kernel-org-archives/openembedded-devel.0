Received: from mrqout3.tiscali.it ([195.130.225.13])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <l.bolognini@tiscali.it>) id 1P2oBe-0004U2-6l
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Oct 2010 18:47:06 +0200
Received: from [10.39.115.21] by mrq-3 with esmtp (Exim)
	id 1P2nBy-0001Di-Tk; Mon, 04 Oct 2010 17:43:06 +0200
Received: from ps-wm7 (10.39.75.207) by mail-1.mail.tiscali.sys (8.5.124)
	id 4CA2ECAE0020CC9D; Mon, 4 Oct 2010 17:43:06 +0200
Message-ID: <33321834.75021286206986565.JavaMail.defaultUser@defaultHost>
Date: Mon, 4 Oct 2010 17:43:06 +0200 (CEST)
From: "l.bolognini@tiscali.it" <l.bolognini@tiscali.it>
To: Arago Mailing List <arago-devel@gforge.ti.com>, 
	Open Embedded Mailing List <openembedded-devel@lists.openembedded.org>
MIME-Version: 1.0
xOriginalSenderIP: 89.118.158.66
X-SA-Exim-Connect-IP: 195.130.225.13
X-SA-Exim-Mail-From: l.bolognini@tiscali.it
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: c6a816x-evm support
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
X-List-Received-Date: Mon, 04 Oct 2010 16:47:06 -0000
Content-Type: text/plain;charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hallo,
I'm working with Arago but I thought to extend this mail to OE=20
mailing list too.
I made=20
git clone git://arago-project.org/git/arago.
git
git clone git://arago-project.org/git/arago-oe-dev.git
git clone=20
git://arago-project.org/git/arago-bitbake.git=20
last Friday (1st October=20
2010)
Now I'm trying to build my custom image for MACHINE=3Dc6a816x-evm.

This is my image recipe:

<arago-custom/recipes/images/ti816x-image.bb>

require recipes/images/arago-base-tisdk-image.bb
IMAGE_INSTALL +=3D "\
=09
openssh \
=09nano \
        [...]
=09openldap \
=09lmsensors-sensors \
=09"


export IMAGE_BASENAME =3D "ti816x-image"

When I launch:
MACHINE=3Dc6a816x-
evm bitbake -v ti816x-image
I got the following error:

From git:
//arago-project.org/git/projects/linux-omap3
 * branch           =20
master     -> FETCH_HEAD
NOTE: Creating tarball of git repository

fatal: failed to unpack tree object=20
661585a1407961c5e71f1d8203f1a32f08e9a772
NOTE: Task failed: Fetch=20
failed: Fetch command export HOME=3D...; export PATH=3D...;
git read-tree=20
661585a1407961c5e71f1d8203f1a32f08e9a772 failed with signal 128,=20
output:
fatal: failed to unpack tree object=20
661585a1407961c5e71f1d8203f1a32f08e9a772

ERROR: TaskFailed event=20
exception, aborting
ERROR: Build of=20
/home/bolognini/oe/arago/recipes/linux/linux-omap3_2.6.34-psp04.
00.00.06.bb do_fetch failed
ERROR: Task 1485=20
(/home/bolognini/oe/arago/recipes/linux/linux-omap3_2.6.34-psp04.
00.00.06.bb, do_fetch) failed
NOTE: Tasks Summary: Attempted 576 tasks=20
of which 576 didn't need to be rerun and 1 failed.
ERROR:=20
'/home/bolognini/oe/arago/recipes/linux/linux-omap3_2.6.34-psp04.
00.00.06.bb' failed

Is there still something to adjust for this=20
MACHINE?
Or is the server out of work for some reasons?
I notice some=20
patches have been uploaded few days ago.
Please let me know,
thank you=20
very much,
bye
Luca




Supera i limiti: raddoppia la velocit=C3=A0 da 10 a 20 Mega!   Risparmia co=
n Tutto Incluso: telefono + adsl 20 mega a soli 26,60 =E2=82=AC al mese per=
 un anno!  SCONTO DI 160 EURO!  http://abbonati.tiscali.it/telefono-adsl/pr=
odotti/tc/tuttoincluso/?WT.mc_id=3D01fw


