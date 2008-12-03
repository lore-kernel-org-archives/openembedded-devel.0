Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1L7x5f-0000PV-E1
	for openembedded-devel@openembedded.org; Wed, 03 Dec 2008 20:08:51 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1L7x2C-0001MV-HO
	for openembedded-devel@openembedded.org; Wed, 03 Dec 2008 19:05:16 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 03 Dec 2008 19:05:16 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 03 Dec 2008 19:05:16 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 03 Dec 2008 20:05:07 +0100
Message-ID: <gh6l93$480$1@ger.gmane.org>
References: <87hc5lp1id.fsf@neumann.lab.ossystems.com.br>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b2pre) Gecko/20081125 Shredder/3.0b1pre
In-Reply-To: <87hc5lp1id.fsf@neumann.lab.ossystems.com.br>
Sender: news <news@ger.gmane.org>
Subject: Re: wierd rdepends on libvolume-id-dev
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
X-List-Received-Date: Wed, 03 Dec 2008 19:08:51 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 03-12-08 19:16, Otavio Salvador wrote:
> Hello,
>
> I've noticed a very weird rdepends on libvolume-id-dev. Take a look
> bellow:
>
> otavio@neumann:~/hacking/ossystems/oe$ dpkg -I tmp/deploy/glibc/ipk/i486/udev_*_i486.ipk
>   novo pacote debian, versão 2.0.
>   tamanho 83462 bytes: arquivo de controle= 842 bytes.
>       947 bytes,    13 linhas      control
>       103 bytes,     7 linhas   *  postinst             #!/bin/sh
>        37 bytes,     2 linhas   *  postrm               #!/bin/sh
>        62 bytes,     4 linhas   *  prerm                #!/bin/sh
>   Package: udev
>   Version: 124-r8.1
>   Description: udev is a daemon which dynamically creates and removes device nodes from /dev/, handles hotplug events and loads drivers at boot time. It replaces the hotplug package and requires a kernel not older than 2.6.12.
>   Section: base
>   Priority: optional
>   Maintainer: Angstrom Developers<angstrom-distro-devel@linuxtogo.org>
>   License: GPL
>   Architecture: i486
>   OE: udev
>   Homepage: http://www.ossystems.com.br
>   Depends: update-rc.d, libvolume-id-dev (>= 124), libc6 (>= 2.6.1), udev-locale*
>   Provides: hotplug
>   Source: http://kernel.org/pub/linux/utils/kernel/hotplug/udev-124.tar.gz file://noasmlinkage.patch;patch=1 file://flags.patch;patch=1 file://vol_id_ld.patch;patch=1 file://udevtrigger_add_devname_filtering.patch;patch=1 file://mount.blacklist file://run.rules file://udev.rules file://devfs-udev.rules file://links.conf file://permissions.rules file://mount.sh file://network.sh file://local.rules file://init
>
> Do someone has any idea why it has this depends?

Have a look at 
/OE/angstrom-dev/staging/i486-angstrom-linux-gnueabi/shlibs/libvolume*.list 
to see what OE thinks the -dev package provides.

regards,

Koen



