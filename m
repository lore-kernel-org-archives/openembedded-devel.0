Received: from [145.253.133.146] (helo=miraculix.pixel.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <poessinger@mixed-mode.de>) id 1L0aGx-0002H2-Dz
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Nov 2008 12:22:03 +0100
Received: from encryptix.pixel.de ([145.253.132.115])
	by miraculix.pixel.de with smtp (Exim 4.50) id 1L0aEx-0001ax-ON
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Nov 2008 12:19:59 +0100
Received: from encryptix.pixel.de (localhost [127.0.0.1])
	by encryptix.pixel.de (Postfix) with ESMTP id A0F2887825
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Nov 2008 12:19:29 +0100 (CET)
Received: from verleihnix.pixel.de (verleihnix.pixel.de [145.253.132.195])
	by encryptix.pixel.de (Postfix) with ESMTP id 799CE87824
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Nov 2008 12:19:29 +0100 (CET)
Received: from verleihnix (verleihnix.pixel.de [145.253.132.195])
	by verleihnix.pixel.de (Postfix) with ESMTP id 8C2BD8013C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Nov 2008 12:19:28 +0100 (CET)
Received: from automatix.pixel.de (145.253.132.220)
	by verleihnix (F-Secure/fsigk_smtp/549/verleihnix);
	Thu, 13 Nov 2008 12:19:28 +0100 (CET)
X-Virus-Status: clean(F-Secure/fsigk_smtp/549/verleihnix)
Received: from 80.246.32.33 (SquirrelMail authenticated user cpo)
	by intern.netexpress.de with HTTP;
	Thu, 13 Nov 2008 12:19:28 +0100 (CET)
Message-ID: <49251.80.246.32.33.1226575168.squirrel@intern.netexpress.de>
Date: Thu, 13 Nov 2008 12:19:28 +0100 (CET)
From: Christian =?iso-8859-1?Q?P=F6ssinger?= <poessinger@mixed-mode.de>
To: openembedded-devel@lists.openembedded.org
User-Agent: SquirrelMail/1.4.4
MIME-Version: 1.0
X-Priority: 3 (Normal)
Importance: Normal
X-TBoneOriginalFrom: Christian =?iso-8859-1?Q?P=F6ssinger?=
	<poessinger@mixed-mode.de>
X-TBoneOriginalTo: openembedded-devel@lists.openembedded.org
X-TBoneDomainSigned: false
X-SA-Do-Not-Run: Yes
X-SA-Exim-Scanned: No (on miraculix.pixel.de); SAEximRunCond expanded to false
Subject: Issues with the system startup when the IMAGE_TYPE is squashfs
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
X-List-Received-Date: Thu, 13 Nov 2008 11:22:04 -0000
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Hello,

I'm currently building a rootfs that will be stored in a squashfs
container. The file is properly created by OpenEmbedded, but I noticed
some issues:

First of all, when I boot an OE generated rootfs for the first time, a
file called /etc/volatile.cache will be generated. As of the fact that
squashfs is read-only this file can't be created.

The second issue comes with the kernel modules. Again, the first system
startup will create the modules.dep file inside the /lib/modules/$(uname
-a) directory. But as stated before, this is not possible on a read-only
filesystem.

Is there any way within OpenEmbedded to create those files before the
actual rootfs image is packed?


Best regards,

Christian P=F6ssinger
Software Development

Mixed Mode GmbH
Lochhamer Schlag 17
D-82166 Gr=E4felfing/M=FCnchen
Tel.        +49 / 89 / 89 86 8-200
Fax        +49 / 89 / 89 86 8-222
Mobil        +49 / 172 /
http://www.mixed-mode.de





