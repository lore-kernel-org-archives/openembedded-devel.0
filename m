Received: from bay0-omc4-s21.bay0.hotmail.com ([65.54.190.223])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <salehusman@hotmail.com>) id 1O5Ljo-0005Np-5t
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Apr 2010 18:28:21 +0200
Received: from BAY127-W18 ([65.54.190.199]) by bay0-omc4-s21.bay0.hotmail.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Fri, 23 Apr 2010 09:23:39 -0700
Message-ID: <BAY127-W18C49E409BA1BBC8422B11D8070@phx.gbl>
X-Originating-IP: [203.82.49.5]
From: saleh usman <salehusman@hotmail.com>
To: Openembedded Discussion <openembedded-devel@lists.openembedded.org>
Date: Fri, 23 Apr 2010 22:23:39 +0600
Importance: Normal
MIME-Version: 1.0
X-OriginalArrivalTime: 23 Apr 2010 16:23:39.0489 (UTC)
	FILETIME=[550D5510:01CAE301]
X-SA-Exim-Connect-IP: 65.54.190.223
X-SA-Exim-Mail-From: salehusman@hotmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	RCVD_IN_SORBS_WEB,SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Problem while booting from OE generated kernel
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
X-List-Received-Date: Fri, 23 Apr 2010 16:28:21 -0000
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable


 Hi
I've built console-image for dm6446 and now I am having problem while booti=
ng kernel
image after writint it to NAND flash.When I enter boot command in
U-BOOT linux kernel stuck at uncompressing linux.Terminal log is show below
=20
I want to  enable  serial port to print debug messages=2CI've checked for K=
Config file  in=20
/recipes/linux/linux-davinci directory but that's not there .Where I may fi=
nd this ?

By setting
this feature I've to build console-image again?

Also I am using already present U-boot in my board and that's not OE genera=
ted.can this create some problem?

One=20
thing more  that  in OE generated  output i.e.
/deploy/glibc/images/dm6446-evm there are three file system images and
one kernel image but there is no U-boot.Are all three file systems same
and where should be u-boot?

Terminal log is here
U-Boot > boot                                                              =
    =20
                                                                           =
    =20
Loading from NAND 256MiB 1=2C8V 8-bit=2C offset 0x120000                   =
        =20
   Image Name:   Linux-2.6.32-rc2-davinci1                                 =
    =20
   Created:      2010-03-15   9:44:32 UTC                                  =
    =20
   Image Type:   ARM Linux Kernel Image (uncompressed)                     =
    =20
   Data Size:    1080360 Bytes =3D  1 MB                                   =
      =20
   Load Address: 80008000                                                  =
    =20
   Entry Point:  80008000                                                  =
    =20
## Booting kernel from Legacy Image at 80700000 ...                        =
    =20
   Image Name:   Linux-2.6.32-rc2-davinci1                                 =
    =20
   Created:      2010-03-15   9:44:32 UTC                                  =
    =20
   Image Type:   ARM Linux Kernel Image (uncompressed)                     =
    =20
   Data Size:    1080360 Bytes =3D  1 MB                                   =
      =20
   Load Address: 80008000                                                  =
    =20
   Entry Point:  80008000                                                  =
    =20
   Verifying Checksum ... OK                                               =
    =20
   Loading Kernel Image ... OK                                             =
    =20
OK                                                                         =
    =20
                                                                           =
    =20
Starting kernel ...                                                        =
    =20
                                                                           =
    =20
Uncompressing Linux........................................................=
.....


Saleh 		 	   		 =20
_________________________________________________________________
Hotmail: Trusted email with Microsoft=92s powerful SPAM protection.
https://signup.live.com/signup.aspx?id=3D60969=

