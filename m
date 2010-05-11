Received: from mail.dns-net.ch ([195.160.190.3] helo=111.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <c.aeschlimann@acn-group.ch>) id 1OBlB0-0004oM-IX
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 May 2010 10:50:55 +0200
Received: from [172.16.145.92] (unknown [212.98.42.40])
	by 111.com (Postfix) with ESMTPA id 4B004370A3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 May 2010 10:40:56 +0200 (CEST)
Message-ID: <4BE9181D.3060307@acn-group.ch>
Date: Tue, 11 May 2010 10:41:01 +0200
From: Christophe Aeschlimann <c.aeschlimann@acn-group.ch>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; fr;
	rv:1.9.1.9) Gecko/20100317 Thunderbird/3.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 195.160.190.3
X-SA-Exim-Mail-From: c.aeschlimann@acn-group.ch
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [Hawkboard] OE u-boot image
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
X-List-Received-Date: Tue, 11 May 2010 08:50:55 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi,

(sorry I sent that first to openembedded-users and to hawkboard google=20
groups but the first one seems to be abandoned and the second needs=20
users to be registered)

Did someone successfully booted the hawkboard through UART with the=20
u-boot image built with OpenEmbedded ?

I generated a minimal-image with the following conf :

MACHINE =3D "hawkboard"
DISTRO =3D "angstrom-2008.1"

This generated the approriate kernel image and jffs2 file system and=20
also a u-boot image :

u-boot-hawkboard-2009.08+gitr0d291f2f255e6d66a78b3dc2445362a96ae39a57-r49=
.bin

And I would like to boot the hawkboard through the serial port using the=20
TI tools (aisgen and UART boot host) and this image.

So I followed what we can see on elinux.org/hawboard as for the AIS=20
image generation. The hawkboard load the image (I get the BOOTME and the=20
tool start to upload the code, jump and close the COM port) but then=20
nothing happens when I open a console. (I should get the U-Boot prompt=20
like I do when I boot with the AIS file delivered with the hawkboard)

Any clue ?

Regards,

--=20
Christophe Aeschlimann

Embedded Software Engineer

Advanced Communications Networks S.A.

Rue du Puits-Godet 8a
2000 Neuch=E2tel, Switzerland

T=E9l. +41 32 724 74 31

c.aeschlimann@acn-group.ch


