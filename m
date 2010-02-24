Received: from ca-lin-mx01.artesis.be ([193.191.129.207])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <glenn.ergeerts@artesis.be>) id 1NkIRc-00008f-K7
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Feb 2010 15:42:35 +0100
Received: from ca-win-cas02.artesis.be (ca-win-cas02.artesis.be [10.3.3.2])
	by ca-lin-mx01.artesis.be (Postfix) with ESMTP id D91043F883E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Feb 2010 15:39:42 +0100 (CET)
Received: from ca-win-mbs02.artesis.be ([::1]) by ca-win-cas02.artesis.be
	([::1]) with mapi; Wed, 24 Feb 2010 15:39:42 +0100
From: Ergeerts Glenn <glenn.ergeerts@artesis.be>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Wed, 24 Feb 2010 15:39:44 +0100
Thread-Topic: ccid recipe configure problem
Thread-Index: Acq1XzUKPgl3o6N9Rb6ovir1TOtl6g==
Message-ID: <5429EF528F02C34281C8573452C749431AC0B972E2@ca-win-mbs02.artesis.be>
Accept-Language: en-US, nl-BE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US, nl-BE
MIME-Version: 1.0
X-Artesis-MailScanner-Watermark: 1267627184.98899@sN7TObhr0PtcEPjZe5aVjQ
X-MailScanner-ID: D91043F883E.471E5
X-Artesis-MailScanner: This message is clean
X-Artesis-MailScanner-SpamCheck: not spam, SpamAssassin (not cached,
	score=-4.321, required 4, autolearn=not spam, ALL_TRUSTED -1.80,
	AWL 0.08, BAYES_00 -2.60)
X-Artesis-MailScanner-From: glenn.ergeerts@artesis.be
X-SA-Exim-Connect-IP: 193.191.129.207
X-SA-Exim-Mail-From: glenn.ergeerts@artesis.be
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: ccid recipe configure problem
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
X-List-Received-Date: Wed, 24 Feb 2010 14:42:35 -0000
Content-Language: nl-NL
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

I'm trying to build the ccid recipe (from here http://cgit.openembedded.org=
/cgit.cgi/openembedded/tree/recipes/ccid?id=3D709c4d66e0b107ca606941b988bad=
717c0b45d9b).
This gives me the following problem during the configure step:

| NOTE: Running /home/glenn/projects/OpenEmbedded/Branch/v1.0.8.0-1oksoluti=
ons/build/tmp/work/armv5te-angstrom-linux/ccid-1.3.8-r0/ccid-1.3.8/configur=
e                     --build=3Di686-linux                 --host=3Darm-ang=
strom-linux               --target=3Darm-angstrom-linux                    =
 --prefix=3D/usr                   --exec_prefix=3D/usr              --bind=
ir=3D/usr/bin                  --sbindir=3D/usr/sbin                     --=
libexecdir=3D/usr/libexec               --datadir=3D/usr/share             =
       --sysconfdir=3D/etc         --sharedstatedir=3D/usr/com             =
   --localstatedir=3D/var                    --libdir=3D/usr/lib           =
    --includedir=3D/usr/include               --oldincludedir=3D/usr/includ=
e               --infodir=3D/usr/share/info               --mandir=3D/usr/s=
hare/man                     --enable-udev               ...

<snip>

| checking ifdhandler.h usability... no
| checking ifdhandler.h presence... no
| checking for ifdhandler.h... no
| configure: error: ifdhandler.h not found, install pcsc-lite 1.3.3 or late=
r, or use ./configure PCSC_CFLAGS=3D...
| FATAL: oe_runconf failed

ifdhandler.h should be provided by pcsc-lite. The bitbake build for pcsc-li=
te worked and the file exists at the following places:

$ find -name ifdhandler.h
./build/tmp/work/armv5te-angstrom-linux/ccid-1.3.8-r0/ccid-1.3.8/MacOSX/ifd=
handler.h
./build/tmp/work/armv5te-angstrom-linux/pcsc-lite-1.5.2-r0/install/pcsc-lit=
e-dev/usr/include/PCSC/ifdhandler.h
./build/tmp/work/armv5te-angstrom-linux/pcsc-lite-1.5.2-r0/pcsc-lite-1.5.2/=
src/PCSC/ifdhandler.h
./build/tmp/work/armv5te-angstrom-linux/pcsc-lite-1.5.2-r0/image/usr/includ=
e/PCSC/ifdhandler.h

The question is: why does the configure of ccid not find this file?

I tried to fix this by adding PCSC_CFLAGS to EXTRA_OECONF, which fixed this=
 error but this got me to the next error:

| checking for SCardEstablishContext... configure: error:=20
| SCardEstablishContext() not found, install pcsc-lite 1.2.9-beta9 or=20
| later,or use PCSC_LIBS=3D...  ./configure
| FATAL: oe_runconf failed

To fix this I also added PCSC_LIBS to EXTRA_OECONF like this:

EXTRA_OECONF =3D "--enable-udev \
                --enable-usbdropdir=3D${D}/usr/lib/pcsc/drivers/ \
                PCSC_CFLAGS=3D-I${S}/../../pcsc-lite-1.5.2-r0/image/usr/inc=
lude/PCSC/ \
                PCSC_LIBS=3D\"-L${S}/../../pcsc-lite-1.5.2-r0/image/usr/lib=
 -lpcsclite\" \
                "
(probably this is not the best way but I was trying to be pragmatic..) Runn=
ing this gives the following error:

| NOTE: Running /home/glenn/projects/OpenEmbedded/Branch/v1.0.8.0-1oksoluti=
ons/build/tmp/work/armv5te-angstrom-linux/ccid-1.3.8-r0/ccid-1.3.8/configur=
e                     --build=3Di686-linux                 --host=3Darm-ang=
strom-linux               --target=3Darm-angstrom-linux                    =
 --prefix=3D/usr                   --exec_prefix=3D/usr              --bind=
ir=3D/usr/bin                  --sbindir=3D/usr/sbin                     --=
libexecdir=3D/usr/libexec               --datadir=3D/usr/share             =
       --sysconfdir=3D/etc         --sharedstatedir=3D/usr/com             =
   --localstatedir=3D/var                    --libdir=3D/usr/lib           =
    --includedir=3D/usr/include               --oldincludedir=3D/usr/includ=
e               --infodir=3D/usr/share/info               --mandir=3D/usr/s=
hare/man                     --enable-udev           --enable-usbdropdir=3D=
/home/glenn/projects/OpenEmbedded/Branch/v1.0.8.0-1oksolutions/build/tmp/wo=
rk/armv5te-angstrom-linux/ccid-1.3.8-r0/image/usr/lib/pcsc/drivers/        =
         PCSC_CFLAGS=3D-I/home/glenn/projects/OpenEmbedded/Branch/v1.0.8.0-=
1oksolutions/build/tmp/work/armv5te-angstrom-linux/ccid-1.3.8-r0/ccid-1.3.8=
/../../pcsc-lite-1.5.2-r0/image/usr/include/PCSC/               PCSC_LIBS=
=3D"-L/home/glenn/projects/OpenEmbedded/Branch/v1.0.8.0-1oksolutions/build/=
tmp/work/armv5te-angstrom-linux/ccid-1.3.8-r0/ccid-1.3.8/../../pcsc-lite-1.=
5.2-r0/image/usr/lib -lpcsclite"                    ...
| configure: error: unrecognized option: -lpcsclite"
| Try `/home/glenn/projects/OpenEmbedded/Branch/v1.0.8.0-1oksolutions/build=
/tmp/work/armv5te-angstrom-linux/ccid-1.3.8-r0/ccid-1.3.8/configure --help'=
 for more information.
| FATAL: oe_runconf failed

For some reason configure is confused with the quotes. I tried different co=
mbinations (not escaping them, using single quotes,..) but I can't get it w=
orking.
So as an openembedded newbie I am stuck now.. Does anyone know how to fix t=
his issue?

Thanks,
Glenn



