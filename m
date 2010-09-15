Received: from mrqout1-sorbs.tiscali.it ([195.130.225.22]
	helo=mrqout1.tiscali.it) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <l.bolognini@tiscali.it>) id 1OvrTN-0000RN-9G
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Sep 2010 14:52:38 +0200
Received: from [10.39.115.78] by mrq-1 with esmtp (Exim)
	id 1OvrSZ-00035F-Tg; Wed, 15 Sep 2010 14:51:36 +0200
Received: from ps-wm3 (10.39.75.203) by mail-8.mail.tiscali.sys (8.5.124)
	id 4C4ECDFA00DDC3DB for openembedded-devel@lists.openembedded.org;
	Wed, 15 Sep 2010 14:51:35 +0200
Message-ID: <12925243.239881284555095548.JavaMail.defaultUser@defaultHost>
Date: Wed, 15 Sep 2010 14:51:35 +0200 (CEST)
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
Subject: net-snmp trouble
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
X-List-Received-Date: Wed, 15 Sep 2010 12:52:38 -0000
Content-Type: text/plain;charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi,
I'm trying to build a custom image for my beagleboard.
I'm using 
Arago overlay of oe/bitbake but I think this place can be a good place 
to ask my question.
Here it is the recipe for the image: 
(arago/recipes/images/my-image.bb)

------------------------------------------------------
# Arago image (a 
custom image for my purposes)
# gives you an image with basic media 
libraries and some add ons as SSH, nano, file cmd, strace...

require 
recipes/images/arago-console-image.bb

IMAGE_INSTALL += "\
	openssh		\
	
nano		\
	file		\
	strace		\
	apache2		\
	modphp		\
	parted		\
	net-snmp	
\
	"

export IMAGE_BASENAME = "my-image"

----------------------------------------------------

Everything is 
fine except for net-snmp package.
This is the package I last added, 
before adding it everything was good.

This is the error I face:


[luca@Fedora13LucaNB oe]$ MACHINE=beagleboard bitbake -v my-image
NOTE: 
Handling BitBake files: \ (7323/7323) [100 %]
NOTE: Parsing finished. 
6526 cached, 464 parsed, 333 skipped, 732 masked.
NOTE: Resolving any 
missing task queue dependencies
NOTE: selecting external-toolchain-csl 
to satisfy virtual/arm-none-linux-gnueabi-gcc due to 
PREFERRED_PROVIDERS
NOTE: selecting external-toolchain-csl to satisfy 
virtual/libc due to PREFERRED_PROVIDERS
ERROR: 
'['/home/luca/oe/arago/recipes/images/my-image.bb']' 
RDEPENDS/RRECOMMENDS or otherwise requires the runtime entity 'net-
snmp' but it wasn't found in any PACKAGE or RPROVIDES variables
NOTE: 
Runtime target 'net-snmp' is unbuildable, removing...
Missing or 
unbuildable dependency chain was: ['net-snmp']
NOTE: Target 'my-image' 
is unbuildable, removing...
Missing or unbuildable dependency chain 
was: ['my-image', 'net-snmp']
ERROR: Required build target 'my-image' 
has no buildable providers.
Missing or unbuildable dependency chain 
was: ['my-image', 'net-snmp']

I tried to build net-snmp by interactive 
bitbake (bitbake -i) and I had no errors:
bitbake -i
BB>> parse
BB>> 
build net-snmp

I notice net-snmp_svn was built. 
[luca@Fedora13LucaNB 
oe]$ find arago-tmp/deploy/ipk | grep net-snmp
arago-
tmp/deploy/ipk/armv7a/net-snmp-client_svn-r7.0.5_armv7a.ipk
arago-
tmp/deploy/ipk/armv7a/net-snmp-server_svn-r7.0.5_armv7a.ipk
arago-
tmp/deploy/ipk/armv7a/net-snmp-static_svn-r7.0.5_armv7a.ipk
arago-
tmp/deploy/ipk/armv7a/net-snmp-dev_svn-r7.0.5_armv7a.ipk
arago-
tmp/deploy/ipk/armv7a/net-snmp-mibs_svn-r7.0.5_armv7a.ipk
arago-
tmp/deploy/ipk/armv7a/net-snmp-dbg_svn-r7.0.5_armv7a.ipk

It's OK for 
me, I can launch an opkg install from my target board but I would like 
this package could be automatically included in my image.

Any ideas?

Thank you for you attention

Luca



Tiscali wiPhone, chiama gratis dal tuo cellulare nelle aree wi-fi!  Scopri come su http://wiphone.tiscali.it/?WT.mc_id=01fw


