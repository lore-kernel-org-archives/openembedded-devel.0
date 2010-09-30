Received: from tx2ehsobe002.messaging.microsoft.com ([65.55.88.12]
	helo=TX2EHSOBE004.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Soumya.R@kpitcummins.com>) id 1P1Jlt-0004le-OQ
	for openembedded-devel@lists.openembedded.org;
	Thu, 30 Sep 2010 16:06:08 +0200
Received: from mail186-tx2-R.bigfish.com (10.9.14.248) by
	TX2EHSOBE004.bigfish.com (10.9.40.24) with Microsoft SMTP Server id
	14.1.225.8; Thu, 30 Sep 2010 14:05:42 +0000
Received: from mail186-tx2 (localhost.localdomain [127.0.0.1])	by
	mail186-tx2-R.bigfish.com (Postfix) with ESMTP id 14F155C8439	for
	<openembedded-devel@lists.openembedded.org>;
	Thu, 30 Sep 2010 14:05:42 +0000 (UTC)
X-SpamScore: -19
X-BigFish: VPS-19(z971Jz14e3M14ffO1443Nzz1202hzzz32i2a8h43h64h)
Received: from mail186-tx2 (localhost.localdomain [127.0.0.1]) by mail186-tx2
	(MessageSwitch) id 1285855533142820_27617;
	Thu, 30 Sep 2010 14:05:33 +0000 (UTC)
Received: from TX2EHSMHS042.bigfish.com (unknown [10.9.14.238])	by
	mail186-tx2.bigfish.com (Postfix) with ESMTP id 773899F00C6	for
	<openembedded-devel@lists.openembedded.org>;
	Thu, 30 Sep 2010 14:04:50 +0000 (UTC)
Received: from kcinpunhjhc02.kpit.com (220.225.38.51) by
	TX2EHSMHS042.bigfish.com (10.9.99.142) with Microsoft SMTP Server (TLS)
	id 14.0.482.44; Thu, 30 Sep 2010 14:04:47 +0000
Received: from Kcinpunhjcms01.kpit.com ([172.10.16.121]) by
	kcinpunhjhc02.kpit.com ([172.10.16.124]) with mapi;
	Thu, 30 Sep 2010 19:34:44 +0530
From: Soumya R <Soumya.R@kpitcummins.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Thu, 30 Sep 2010 19:34:01 +0530
Thread-Topic: QtOpengl es 2.0 does not work on mips processor
Thread-Index: AQHLYKhusMxkasR55k6Qr6d7OC8/Hw==
Message-ID: <76E258664B189C4CBEF125491CA11ECC945B7077A4@KCINPUNHJCMS01.kpit.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
X-Reverse-DNS: unknown
X-SA-Exim-Connect-IP: 65.55.88.12
X-SA-Exim-Mail-From: Soumya.R@kpitcummins.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: QtOpengl es 2.0 does not work on mips processor
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
X-List-Received-Date: Thu, 30 Sep 2010 14:06:08 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi All,

I have build qt4-embedded-gles in openembedded , by adding new recipe for E=
GL support which contains khronos headers and libraries and even the SDK is=
 build .

I am woking on mips machine, which contains mali 200(GPU) driver.

Below is the configuration which i have done for opengl es2 support

-DQT_NO_QWS_CURSOR \
-DQT_QWS_CLIENTBLIT \
-opengl es2 -plugin-gfx-powervr -v -DQMAKE_LIBS_EGL=3DEGL\
"

Made some modifications in /src/plugins/gfxdrivers/powerr/QWSWSEGL/Makefile=
 i removed lpvr2d and included lMali and even in .pro file.

I am using the rootfs which i build using openembedded where i check all th=
e qt application which works fine but not qtopengl application.

when i run ./hellogl_es2 -qws


This the error i get =


root@(none):/usr/bin/qtopia/examples/opengl/hellogl_es2# ./hellogl_es2 -qws=
 =

Panel(Samsung 800x480), 800x480
wm97xx-ts 1-0:WM9713,WM9714: No IRQ specified
************************************************** *******************
ERROR: In file: src/base/os/linux/mali_uku.c function: _mali_uku_open() lin=
e: 60
Failed to open device file /mnt/dev/mali
Please verify that the file exists and that the driver has been loaded

QEgl::display(): Cannot initialize EGL display: "Bad alloc (0x3003)" =

QEglContext::chooseConfig(): Could not find a suitable EGL configuration =

Requested: "type=3Des2 rgba=3D5,6,5,0 surface-type=3Dwindow" =

Available: =

=03

Then I inserted the mali driver insmod /lib/modules/mali.ko . Even after in=
serting mali driver , just a plain window will come up on the screen in whi=
ch i can see only the slider and menu i can not even see the qt icon and i =
dont even get any errors in the console please see the log below,

./hellogl_es2 -qws disp
lay -mali.ko
Panel(Samsung 800x480), 800x480
wm97xx-ts 1-0:WM9713,WM9714: No IRQ specified
WARNING: Skipping PP version check
=03Panel(Samsung 800x480), 800x480

It just stops here..

Am I doing anything wrong please help me out to resolve this. Any suggestio=
ns is badly needed.

Thanks in advance =


Regards,
Soumya




