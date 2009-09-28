Received: from [78.47.42.153] (helo=wam.ukma.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mattheis@ukma.de>) id 1MsBKB-0002fI-LY
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Sep 2009 10:11:14 +0200
Received: from wam.ukma.de (localhost [127.0.0.1])
	by wam.ukma.de (Postfix) with ESMTP id 1FDEE49D8A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Sep 2009 08:34:06 +0200 (CEST)
Received: from ws.ukma.de (ws.ukma.local [172.16.20.10])
	by wam.ukma.de (Postfix) with ESMTP id DBF5D49D83
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Sep 2009 08:34:05 +0200 (CEST)
Received: from ws.ukma.de ([172.16.20.10]) by ws ([172.16.20.10]) with mapi;
	Mon, 28 Sep 2009 10:10:15 +0200
From: Konrad Mattheis <mattheis@ukma.de>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Mon, 28 Sep 2009 10:10:13 +0200
Thread-Topic: u-boot 2009.08
Thread-Index: AcpAExq4rqxiAvFFRZyhdja5wvjZ+g==
Message-ID: <F32E8C2599F37641BB4E3F3AC4A3C412016D265C4FF1@ws>
Accept-Language: de-DE, de-LU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: de-DE, de-LU
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
X-SA-Exim-Connect-IP: 78.47.42.153
X-SA-Exim-Mail-From: mattheis@ukma.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: u-boot 2009.08
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
X-List-Received-Date: Mon, 28 Sep 2009 08:11:15 -0000
Content-Language: de-DE
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

I have this patch to get the new Version of u-boot working. Please could yo=
u apply this an the repository or tell me how I can do this.

diff --git a/conf/checksums.ini b/conf/checksums.ini
index 2dcb043..8fcf94d 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -29158,3 +29158,7 @@ sha256=3Df57c4e33eb2cdd87a6c2f01bfa4794340fbe61ea1a=
1cfc7dac3b6671e1dd22af
 md5=3D5f7b88ebb2bcd7e8044328482d079661
 sha256=3Df57c4e33eb2cdd87a6c2f01bfa4794340fbe61ea1a1cfc7dac3b6671e1dd22af

+[ftp://ftp.denx.de/pub/u-boot/u-boot-2009.08.tar.bz2]
+md5=3Dcd4788ea1c6ac4f9b100b888a1063a6b
+sha256=3D858fd04efd5b98e99fd1a074998b1a8ac5fbd07b176de1d20d8eb148492d949d
+
diff --git a/recipes/u-boot/u-boot_2009.06.bb b/recipes/u-boot/u-boot_2009.=
06.bb
index cefbed2..3ea182a 100644
--- a/recipes/u-boot/u-boot_2009.06.bb
+++ b/recipes/u-boot/u-boot_2009.06.bb
@@ -3,7 +3,6 @@ require u-boot.inc

 DEFAULT_PREFERENCE =3D "-1"
 DEFAULT_PREFERENCE_mpc8315e-rdb =3D "1"
-DEFAULT_PREFERENCE_at91sam9g20ek =3D "1"

 SRC_URI =3D "ftp://ftp.denx.de/pub/u-boot/u-boot-${PV}.tar.bz2 "

diff --git a/recipes/u-boot/u-boot_2009.08.bb b/recipes/u-boot/u-boot_2009.=
08.bb
new file mode 100644
index 0000000..ce25d58
--- /dev/null
+++ b/recipes/u-boot/u-boot_2009.08.bb
@@ -0,0 +1,16 @@
+PR =3D "r0"
+require u-boot.inc
+
+DEFAULT_PREFERENCE =3D "-1"
+DEFAULT_PREFERENCE_at91sam9g20ek =3D "1"
+
+SRC_URI =3D "ftp://ftp.denx.de/pub/u-boot/u-boot-${PV}.tar.bz2 "
+
+TARGET_LDFLAGS =3D ""
+
+inherit base
+
+do_compile () {
+       oe_runmake ${UBOOT_MACHINE}
+       oe_runmake all
+}

bye
Konrad Mattheis


