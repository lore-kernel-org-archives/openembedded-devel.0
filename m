Received: from mrqout1-sorbs.tiscali.it ([195.130.225.22]
	helo=mrqout1.tiscali.it) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <l.bolognini@tiscali.it>) id 1P6KBG-00053J-V3
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 Oct 2010 11:33:00 +0200
Received: from [10.39.115.27] by mrq-1 with esmtp (Exim)
	id 1P6KAo-0003xm-1C; Thu, 14 Oct 2010 11:32:30 +0200
Received: from ps-wm5 (10.39.75.205) by mail-7-it.mail.tiscali.sys (8.5.124)
	id 4CA2F79600602CEB for openembedded-devel@lists.openembedded.org;
	Thu, 14 Oct 2010 11:32:29 +0200
Message-ID: <26434292.80091287048749327.JavaMail.defaultUser@defaultHost>
Date: Thu, 14 Oct 2010 11:32:29 +0200 (CEST)
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
Subject: S98configure role
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
X-List-Received-Date: Thu, 14 Oct 2010 09:33:00 -0000
Content-Type: text/plain;charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I'm wondering what is the role of this script, placed in /etc/rcS.d.

What I guess is that, for some reasons, some packages get installed but=20
not configured (then unpacked) since their postinstall script returns=20
non zero value.
Here it is a small extract of rootfs_ipk.bbclass:

for=20
i in ${IMAGE_ROOTFS}${libdir}/opkg/info/*.postinst; do
               =20
if [ -f $i ] && ! sh -e $i configure; then
                        opkg-
cl ${IPKG_ARGS} flag unpacked `basename $i .postinst`
               =20
fi
done

For example, in my beagleboard, I get udev unpacked because=20
udev-cache can't be found in /etc/init.d (sounds strange, it's there!).

Then udev remain unpacked but the magic S98configure heals udev,=20
adjusting all stuff.
But, here is my question, what about the very=20
first boot? Do I have a first boot without udev-cache?
Unfortunately at=20
the moment I haven't the chance to investigate and burn a SD card and=20
can't go further, however I'm very interested to listen to your=20
opinions.

Thank you,
bye,
Luca



Supera i limiti: raddoppia la velocit=C3=A0 da 10 a 20 Mega!   Risparmia co=
n Tutto Incluso: telefono + adsl 20 mega a soli 26,60 =E2=82=AC al mese per=
 un anno!  SCONTO DI 160 EURO!  http://abbonati.tiscali.it/telefono-adsl/pr=
odotti/tc/tuttoincluso/?WT.mc_id=3D01fw


