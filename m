Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RKplr-0000G7-I6 for openembedded-devel@lists.openembedded.org;
	Mon, 31 Oct 2011 12:11:16 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RKpfw-0000d5-TS for openembedded-devel@lists.openembedded.org;
	Mon, 31 Oct 2011 12:05:08 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Oct 2011 12:05:08 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Oct 2011 12:05:08 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 31 Oct 2011 11:53:35 +0100
Message-ID: <j8lunf$7vb$6@dough.gmane.org>
References: <eeffc3b2de8e5277ef3184874b88e4e382fa72c8.1319884094.git.Martin.Jansa@gmail.com>
	<1dd29bc4f6b05d60b8b7a5d01c3c2cb94c9d9c46.1319884094.git.Martin.Jansa@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
In-Reply-To: <1dd29bc4f6b05d60b8b7a5d01c3c2cb94c9d9c46.1319884094.git.Martin.Jansa@gmail.com>
X-Enigmail-Version: 1.3.2
Subject: Re: [meta-efl][meta-oe 11/12] systemd-serialgetty: use better default SERIAL_CONSOLE
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
X-List-Received-Date: Mon, 31 Oct 2011 11:11:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 29-10-11 12:29, Martin Jansa schreef:
> * having /dev/ttySO fails with: | ln: failed to create symbolic link 
> `/OE/shr-core/tmp/work/nokia900-oe-linux-gnueabi/systemd-serialgetty-1.0-r0/image/etc/systemd/system/getty.target.wants/serial-getty@/dev/ttyS0.service':
>
> 
No such file or directory
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com> --- 
> .../recipes-core/systemd/systemd-serialgetty.bb    |    2 +- 1 files
> changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/meta-oe/recipes-core/systemd/systemd-serialgetty.bb
> b/meta-oe/recipes-core/systemd/systemd-serialgetty.bb index
> 86d833e..9294869 100644 ---
> a/meta-oe/recipes-core/systemd/systemd-serialgetty.bb +++
> b/meta-oe/recipes-core/systemd/systemd-serialgetty.bb @@ -2,7 +2,7 @@
> DESCRIPTION = "Systemd serial config" LICENSE = "GPLv2+" LIC_FILES_CHKSUM
> = "file://${WORKDIR}/LICENSE;md5=751419260aa954499f7abaabaa882bbe"
> 
> -SERIAL_CONSOLE ?= "115200 /dev/ttyS0" +SERIAL_CONSOLE ?= "115200 ttyS0"
> 
> SRC_URI = "file://LICENSE \ file://serial-getty@.service"

Missing PR bump
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFOrn4vMkyGM64RGpERAkzGAJ42j+LXz7GZQfUCtdrk2hgzBjuhDwCdHs6q
UjxgP+htyH+rTcU7/oPfikw=
=jTYz
-----END PGP SIGNATURE-----



