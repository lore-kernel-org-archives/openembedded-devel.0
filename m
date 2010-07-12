Received: from ausc60pc101.us.dell.com ([143.166.85.206])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Sean_Hudson@Dell.com>) id 1OYRbu-0000Fw-Gp
	for openembedded-devel@lists.openembedded.org;
	Tue, 13 Jul 2010 00:37:08 +0200
X-Loopcount0: from 10.166.72.158
From: <Sean_Hudson@Dell.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 12 Jul 2010 17:31:10 -0500
Thread-Topic: [PATCH] Correcting APACHE mirror location for APR recipes.
Thread-Index: AcsiEe3JHQwDByVbTtuXbCTfXM2oUg==
Message-ID: <113134CF306E8E4CACC27BE5937261B20931BF148F@AUSX7MCPS303.AMER.DELL.COM>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-cr-puzzleid: {B177AB65-D5D2-4843-A5CD-C9F5F5541395}
x-cr-hashedpuzzle: A2d1 A3EW BTUQ CGob Cpc4 EBq5 ELkM EbSf FZ5C Fs05 F60k
	GSeC GuFW HBOI IbU2 Ibgn; 1;
	bwBwAGUAbgBlAG0AYgBlAGQAZABlAGQALQBkAGUAdgBlAGwAQABsAGkAcwB0AHMALgBvAHAAZQBuAGUAbQBiAGUAZABkAGUAZAAuAG8AcgBnAA==;
	Sosha1_v1; 7; {B177AB65-D5D2-4843-A5CD-C9F5F5541395};
	cwBlAGEAbgBfAGgAdQBkAHMAbwBuAEAAZABlAGwAbAAuAGMAbwBtAA==; Mon,
	12 Jul 2010 22:31:10 GMT;
	WwBQAEEAVABDAEgAXQAgAEMAbwByAHIAZQBjAHQAaQBuAGcAIABBAFAAQQBDAEgARQAgAG0AaQByAHIAbwByACAAbABvAGMAYQB0AGkAbwBuACAAZgBvAHIAIABBAFAAUgAgAHIAZQBjAGkAcABlAHMALgA=
acceptlanguage: en-US
MIME-Version: 1.0
X-OriginalArrivalTime: 12 Jul 2010 22:31:14.0059 (UTC)
	FILETIME=[EFA5A5B0:01CB2211]
X-SA-Exim-Connect-IP: 143.166.85.206
X-SA-Exim-Mail-From: Sean_Hudson@Dell.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] Correcting APACHE mirror location for APR recipes.
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
X-List-Received-Date: Mon, 12 Jul 2010 22:37:09 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi all,

  We recently noticed that apr and apr-util recipes were not fetching corre=
ctly.
  It appears as though the APACHE_MIRROR variable in the bitbake.conf file.

  Below is a trivial patch to update the variable.

Regards,
Sean


diff --git a/conf/bitbake.conf b/conf/bitbake.conf
index 12a5522..71c7273 100644
--- a/conf/bitbake.conf
+++ b/conf/bitbake.conf
@@ -533,7 +533,7 @@ export palmqtdir =3D "${palmtopdir}"
 OE_STRICT_CHECKSUMS ?=3D "1"
=20
 ADOBE_MIRROR =3D "http://fpdownload.macromedia.com/get/flashplayer/current=
/"
-APACHE_MIRROR =3D "http://www.apache.org/dist"
+APACHE_MIRROR =3D "http://archive.apache.org/dist"
 DEBIAN_MIRROR =3D "ftp://ftp.debian.org/debian/pool"
 E_CVS =3D "cvs://anonymous@anoncvs.enlightenment.org/var/cvs/e"=20
 E_URI =3D "http://enlightenment.freedesktop.org/files"





