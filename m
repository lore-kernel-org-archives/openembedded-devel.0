Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1M7UZK-0004YW-L9
	for openembedded-devel@openembedded.org; Fri, 22 May 2009 15:13:50 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1M7URt-00012S-Ib
	for openembedded-devel@openembedded.org; Fri, 22 May 2009 13:06:09 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Fri, 22 May 2009 13:06:09 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Fri, 22 May 2009 13:06:09 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 22 May 2009 15:05:56 +0200
Message-ID: <gv67vm$a4v$1@ger.gmane.org>
References: <fce2a370905220555o3d234765y6fbeadb0c41629d3@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b5pre) Gecko/20090519 Shredder/3.0b3pre
In-Reply-To: <fce2a370905220555o3d234765y6fbeadb0c41629d3@mail.gmail.com>
Sender: news <news@ger.gmane.org>
Subject: Re: New hal is not buildable (needs new blkid version)
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
X-List-Received-Date: Fri, 22 May 2009 13:13:51 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22-05-09 14:55, Ihar Hrachyshka wrote:
> Hello!
>
> After Koen committed new hal (0.5.12) to .dev branch it becomes
> unbuildable.

Hal 0.5.12 is disabled by default, btw, only angstrom sets a def-pref 
for it.

> The reason is that this new version depends on new blkid
> library (version>=1.43)

It's part of util-linux-ng:

koen@dominion:/OE/angstrom-dev/deploy/glibc$ dpkg-deb -I 
ipk/armv7a/libblkid1_2.15-r2.2_armv7a.ipk
  new debian package, version 2.0.
  size 38512 bytes: control archive= 547 bytes.
      476 bytes,    12 lines      control
      118 bytes,     6 lines   *  postinst             #!/bin/sh
  Package: libblkid1
  Version: 2.15-r2.2
  Description: util-linux-ng blkid library
  Section: base
  Priority: optional
  Maintainer: Angstrom Developers <angstrom-distro-devel@linuxtogo.org>
  License: GPL
  Architecture: armv7a
  OE: util-linux-ng
  Homepage: unknown
  Depends: libuuid1 (>= 1.41.5), libgcc1 (>= 4.3.3), libc6 (>= 2.6.1)
  Source: 
http://kernel.org/pub/linux/utils/util-linux-ng/v2.15/util-linux-ng-2.15.tar.bz2 
file://fix-make-c.patch;patch=1 file://optional-uuid.patch;patch=1

and:

koen@dominion:/OE/org.openembedded.dev/recipes/hal$ grep util-linux *
hal.inc:DEPENDS = "virtual/kernel util-linux-ng dbus-glib udev intltool 
intltool-native expat libusb gperf-native"

So you'll have to see why it didn't get built for you.

regards,

Koen



