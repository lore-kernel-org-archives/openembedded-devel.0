Received: from mrqout1-sorbs.tiscali.it ([195.130.225.22]
	helo=mrqout1.tiscali.it) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <l.bolognini@tiscali.it>) id 1P6P44-0000Cc-Hf
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 Oct 2010 16:45:53 +0200
Received: from [10.39.115.25] by mrq-1 with esmtp (Exim)
	id 1P6P3a-0003IN-KE; Thu, 14 Oct 2010 16:45:22 +0200
Received: from ps-wm5 (10.39.75.205) by mail-5-it.mail.tiscali.sys (8.5.124)
	id 4CA2F4DC00621C77 for openembedded-devel@lists.openembedded.org;
	Thu, 14 Oct 2010 16:45:22 +0200
Message-ID: <10213762.146341287067522122.JavaMail.defaultUser@defaultHost>
Date: Thu, 14 Oct 2010 16:45:22 +0200 (CEST)
From: "l.bolognini@tiscali.it" <l.bolognini@tiscali.it>
To: <openembedded-devel@lists.openembedded.org>
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
Subject: Re: S98configure role
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
X-List-Received-Date: Thu, 14 Oct 2010 14:45:53 -0000
Content-Type: text/plain;charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you Chris et al. for your reply.
Even if I told you in my last=20
mail I had no chanche to investigate further, I took some time to burn=20
some SD and tried to understand the topic.
Well, in my build machine, 4=20
packages remain unpacked:
openssh-sshd
net-snmp-server
udev
update-
modules

But, since openssh-sshd and update-modules are intentionally=20
left unpacked (if test "x$D" !=3D "x"; then exit 1 - in the .postinst=20
script), it seems that for udev and net-snmp-server something goes=20
wrong.
Looking in depth, I saw that in udev_141.bb, inside=20
pkg_postinst_udev_append(), the usual test
if test "x$D" !=3D "x"; then

        OPT=3D"-r $D"
else
        OPT=3D"-s"
fi
isn't written before=20
update-rc.d command:
update-rc.d $OPT udev-cache start 12 S .
Simply,=20
this piece of code is not available.
Result: update.rc.d fails in the=20
build machine because OPT is empty.
Then we have not S03udev and=20
S12udev-cache init links and S98configure can repair the situation but=20
only from 2nd boot on.
To solve the problem I had to add that usual=20
test inside pkg_postinst_udev_append() in udev_141.bb, then bitbake=20
udev again.

Similar thing happens for net-snmp-server, where the=20
postinst script has the same piece of code written twice, resulting in=20
an error and then in the flag unpacked for the package.
Commenting out=20
the first occurrance I got good results.

Here net-snmp configuration=20
by means of S98configure is less dramatical because net-snmp agent=20
starts after S98configure and then everything is fine also in 1st boot.


I hope this investigation could help someone involved in the same=20
problems,
bye,
Luca

----Messaggio originale----
Da: clarson@kergoth.
com
Data: 14/10/2010 16.01
A: <openembedded-devel@lists.openembedded.
org>
Ogg: Re: [oe] S98configure role

On Thu, Oct 14, 2010 at 2:32 AM,=20
l.bolognini@tiscali.it <
l.bolognini@tiscali.it> wrote:

> I'm=20
wondering what is the role of this script, placed in /etc/rcS.d.
>
>=20
What I guess is that, for some reasons, some packages get installed but

> not configured (then unpacked) since their postinstall script returns

> non zero value.
>

Yes, this is correct.  Some postinsts do things=20
which can be done at image
creation time on the build machine, but not=20
all.  Those which must *run* the
binaries in the filesystem, for=20
example, cannot be run at build time, so
must be run at first boot time=20
on the target.
--=20
Christopher Larson
clarson at kergoth dot com

Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior=20
Software Engineer, Mentor Graphics

_______________________________________________
Openembedded-devel=20
mailing list
Openembedded-devel@lists.openembedded.org
http://lists.
linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel





Supera i limiti: raddoppia la velocit=C3=A0 da 10 a 20 Mega!   Risparmia co=
n Tutto Incluso: telefono + adsl 20 mega a soli 26,60 =E2=82=AC al mese per=
 un anno!  SCONTO DI 160 EURO!  http://abbonati.tiscali.it/telefono-adsl/pr=
odotti/tc/tuttoincluso/?WT.mc_id=3D01fw


