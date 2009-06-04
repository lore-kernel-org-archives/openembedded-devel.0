Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MCN4S-0002dC-EY
	for openembedded-devel@openembedded.org; Fri, 05 Jun 2009 02:14:08 +0200
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1MCMve-0001k2-QL
	for openembedded-devel@openembedded.org; Fri, 05 Jun 2009 00:05:03 +0000
Received: from h24-207-4-118.primesignal.com ([24.207.4.118])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Fri, 05 Jun 2009 00:05:02 +0000
Received: from quickx by h24-207-4-118.primesignal.com with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Fri, 05 Jun 2009 00:05:02 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: NBeing <quickx@hotmail.com>
Date: Thu, 4 Jun 2009 23:56:15 +0000 (UTC)
Message-ID: <loom.20090604T233316-304@post.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: main.gmane.org
User-Agent: Loom/3.14 (http://gmane.org/)
X-Loom-IP: 24.207.4.118 (Mozilla/5.0 (Windows; U; Windows NT 5.1;
	en-US) AppleWebKit/525.19 (KHTML, like Gecko) Chrome/1.0.154.65
	Safari/525.19)
Sender: news <news@ger.gmane.org>
Subject: GPE Application Development Questions
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
X-List-Received-Date: Fri, 05 Jun 2009 00:14:08 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

The "angstrom-2008.1-test-20090104-armv5te-linux-gnueabi-toolchain-gpe.tar.bz2" 
sets up the environment like so:

export PATH=/usr/local/angstrom/arm/bin:$PATH

export PKG_CONFIG_SYSROOT_DIR=/usr/local/angstrom/arm/arm-angstrom-linux-
gnueabi

export PKG_CONFIG_PATH=/usr/local/angstrom/arm/arm-angstrom-linux-
gnueabi/usr/lib/pkgconfig

export CONFIG_SITE=/usr/local/angstrom/arm/site-config

alias opkg='LD_LIBRARY_PATH=/usr/local/angstrom/arm/lib 
/usr/local/angstrom/arm/bin/opkg-cl -f /usr/local/angstrom/arm/etc/opkg-
sdk.conf -o /usr/local/angstrom/arm'

alias opkg-target='LD_LIBRARY_PATH=/usr/local/angstrom/arm/lib 
/usr/local/angstrom/arm/bin/opkg-cl -f /usr/local/angstrom/arm/arm-angstrom-
linux-gnueabi/etc/opkg.conf -o /usr/local/angstrom/arm/arm-angstrom-linux-
gnueabi'



I'm using an "angstrom-2009.X-test-XXXX" image so believe I need to build my 
own toolchain.  I built the image with the latest OE and everything runs on the 
board, however, I'm unable to build the simple "gpe-hello" app.  I believe the 
problem has to do with my mapping of the above paths.  This is what I have, 
would someone be able to confirm, fix, give advance on what I have wrong with 
them?  Or a different way/tutorial I should be following on GPE Application 
Developemnt?  Basically I used the "cross" folder when I could, then staging, 
then rootfs.

export PATH=${HOME}/oe/build/tmp/cross/armv5te/bin:$PATH

export PKG_CONFIG_SYSROOT_DIR=${HOME}/oe/build/tmp/cross/armv5te/arm-angstrom-
linux-gnueabi

export PKG_CONFIG_PATH=${HOME}/oe/build/tmp/staging/armv5te-angstrom-linux-
gnueabi/usr/lib/pkgconfig

export CONFIG_SITE= ???? (Left Out)

alias opkg='LD_LIBRARY_PATH=${HOME}/oe/build/tmp/cross/armv5te/lib 
${HOME}/oe/build/tmp/rootfs/x11-image/usr/bin/opkg-cl -f 
${HOME}/oe/build/tmp/staging/i686-linux/etc/opkg-sdk.conf -o 
${HOME}/oe/build/tmp/cross/armv5te'

alias opkg-target='LD_LIBRARY_PATH=${HOME}/oe/build/tmp/cross/armv5te/lib 
${HOME}/oe/build/tmp/rootfs/x11-image/usr/bin/opkg-cl -f 
${HOME}/oe/build/tmp/rootfs/x11-image/etc/opkg.conf -o 
${HOME}/oe/build/tmp/cross/armv5te/arm-angstrom-linux-gnueabi'



Also while I'm here, in the deploy directory there is a "modules-2.6.28-r9-
at91sam9261ek.tgz" file build, however, I'm unsure what I'm suppose to do with 
it?  If I'm suppose to flash it to my board where would I find the address to 
flash too?  Thanks



