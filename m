Received: from mrqout1-sorbs.tiscali.it ([195.130.225.22]
	helo=mrqout1.tiscali.it) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <l.bolognini@tiscali.it>) id 1OqoSF-0006ob-FA
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Sep 2010 16:38:25 +0200
Received: from [10.39.115.22] by mrq-1 with esmtp (Exim)
	id 1Oqnoz-0004Ys-ST; Wed, 01 Sep 2010 15:57:49 +0200
Received: from ps22 (10.39.75.92) by mail-2.mail.tiscali.sys (8.5.124)
	id 4C4EB8DC008FDB49 for openembedded-devel@lists.openembedded.org;
	Wed, 1 Sep 2010 15:57:49 +0200
Message-ID: <10034543.559431283349469680.JavaMail.defaultUser@defaultHost>
Date: Wed, 1 Sep 2010 15:57:49 +0200 (CEST)
From: "l.bolognini@tiscali.it" <l.bolognini@tiscali.it>
To: Open Embedded Mailing List <openembedded-devel@lists.openembedded.org>
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
Subject: opkg vs dpkg/rpm
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
X-List-Received-Date: Wed, 01 Sep 2010 14:38:25 -0000
Content-Type: text/plain;charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,
I'm working on a beagleboard.
I'm wondering if there is a=20
quick=20
way to change package manager from opkg to dpkg or to rpm, both=20
on the=20
host and on the target.
I think that including dpkg package in,=20
for=20
example, arago-console-image is not enough because all packages=20
are=20
built with ipkg/opkg.
Moreover the directory /usr/lib/opkg/info=20
with=20
all postinst/prerm scripts could not be used anymore.

I report a=20
small=20
extract from openembedded manual:
"The package_write task is=20

responsible for taking each packages subdirectory and creating any=20

actual
installation package, such as .ipk, .deb or .rpm. Currently .
ipk=20
is the only fully supported packing
format although .deb packages=20
are=20
being actively worked on."

Has anyone tried a .deb or .rpm based=20

rootfs (built with oe/bitbake) on beagleboard or in another target?



Thanks for your attention,
best regards,
Luca


Risparmia con Tutto Incluso Light: telefono + adsl 8 mega a soli 19,95 =E2=
=82=AC al mese per un anno!  SCONTO DI 120 EURO!   http://abbonati.tiscali.=
it/telefono-adsl/prodotti/tc/tuttoincluso_light/?WT.mc_id=3D01fw


