Received: from [213.91.4.211] (helo=bart.wifirst.net)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <jeremy.laine@bolloretelecom.eu>) id 1JRNeG-0008Kq-KT
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Feb 2008 09:16:22 +0100
Received: from bart.wifirst.net (localhost [127.0.0.1])
	by bart.wifirst.net (Postfix) with ESMTP id B6DC75FF8A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Feb 2008 09:15:32 +0100 (CET)
Received: from bart.wifirst.net (localhost [127.0.0.1])
	by bart.wifirst.net (Postfix) with ESMTP id E1FED5FFD7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Feb 2008 09:15:30 +0100 (CET)
Received: from blini.bolloretelecom.eu (smtp.bolloretelecom.eu
	[62.210.194.121])
	by bart.wifirst.net (Postfix) with ESMTP id C0DC05FF8A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Feb 2008 09:15:30 +0100 (CET)
Received: from [192.168.95.68] (unknown [192.168.95.68])
	by blini.bolloretelecom.eu (Postfix) with ESMTP id 8793223E54
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Feb 2008 09:15:30 +0100 (CET)
Message-ID: <47BA9022.6020105@bolloretelecom.eu>
Date: Tue, 19 Feb 2008 09:15:30 +0100
From: =?ISO-8859-1?Q?Jeremy_Lain=E9?= <jeremy.laine@bolloretelecom.eu>
User-Agent: Icedove 1.5.0.14pre (X11/20080208)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Enigmail-Version: 0.94.2.0
X-Virus-Scanned: ClamAV using ClamSMTP
X-SA-Exim-Connect-IP: 213.91.4.211
X-SA-Exim-Mail-From: jeremy.laine@bolloretelecom.eu
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: conf/kernel.bbclass: staging for linux >= 2.6.24 on x86 needs fixing
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 19 Feb 2008 08:16:22 -0000
X-Groupsio-MsgNum: 4224
Content-Type: multipart/mixed; boundary="------------020703080606080403050600"

--------------020703080606080403050600
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Up until linux 2.6.23, for x86 archs we put arch/i386/Makefile* into
staging, but it looks as though from 2.6.24 onwards we should be
staging arch/x86/Makefile* instead.

The attached patch works for me, but I am not sure this is the proper
way to fix this as it introduces some arch-specific code in an
otherwise generic bbclass. Any ideas?

- --
Jeremy LAINE
Bollor=E9 telecom | 11bis, rue Scribe | F-75009 Paris
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFHupAhCL1n3lVB9EYRAmRUAKCR+/e08cu/urfTF95EnozeCR8jSACfRyp5
jZZL3udH5hCT9qJfPazNSrY=3D
=3DU720
-----END PGP SIGNATURE-----


--------------020703080606080403050600
Content-Type: text/x-diff;
 name="kernel-bbclass-x86.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="kernel-bbclass-x86.diff"

# 
# old_revision [8b854b2b358a134500f7b4e1826c4fab2dc417ed]
# 
# patch "classes/kernel.bbclass"
#  from [3aa638c9a8de8e90342e08b530a40c8c2f120497]
#    to [7b688b82d6be204068a4bdbb29bd16cfb63d7b2f]
# 
============================================================
--- classes/kernel.bbclass	3aa638c9a8de8e90342e08b530a40c8c2f120497
+++ classes/kernel.bbclass	7b688b82d6be204068a4bdbb29bd16cfb63d7b2f
@@ -128,6 +128,9 @@ kernel_do_stage() {
 	if [ -e arch/${ARCH}/Makefile ]; then
 		install -d ${STAGING_KERNEL_DIR}/arch/${ARCH}
 		install -m 0644 arch/${ARCH}/Makefile* ${STAGING_KERNEL_DIR}/arch/${ARCH}
+	elif [ "${ARCH}" = "i386" -a -e arch/x86/Makefile ]; then
+		install -d ${STAGING_KERNEL_DIR}/arch/x86
+		install -m 0644 arch/x86/Makefile* ${STAGING_KERNEL_DIR}/arch/x86
 	fi
 	cp -fR include/config* ${STAGING_KERNEL_DIR}/include/	
 	install -m 0644 ${KERNEL_OUTPUT} ${STAGING_KERNEL_DIR}/${KERNEL_IMAGETYPE}

--------------020703080606080403050600
Content-Type: application/octet-stream;
 name="kernel-bbclass-x86.diff.sig"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="kernel-bbclass-x86.diff.sig"

iD8DBQBHupAhCL1n3lVB9EYRAg7tAKDh3yYbYASoGvXiOy/XZTvz5orTFgCgxqk4flohkrrxEL33
IMvn45gJj6E=

--------------020703080606080403050600--
