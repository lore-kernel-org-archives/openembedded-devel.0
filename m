Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RSTmk-0002PW-O0 for openembedded-devel@lists.openembedded.org;
	Mon, 21 Nov 2011 14:19:47 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RSTgV-0000gi-7R for openembedded-devel@lists.openembedded.org;
	Mon, 21 Nov 2011 14:13:19 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Nov 2011 14:13:19 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Nov 2011 14:13:19 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 21 Nov 2011 14:13:07 +0100
Message-ID: <jadip3$i8c$1@dough.gmane.org>
References: <1321876515-15089-1-git-send-email-msprathap@ti.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:8.0) Gecko/20111105 Thunderbird/8.0
In-Reply-To: <1321876515-15089-1-git-send-email-msprathap@ti.com>
X-Enigmail-Version: 1.3.3
Subject: Re: [PATCH v2 1/1] kernel.bbclass: stage additional directories
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
X-List-Received-Date: Mon, 21 Nov 2011 13:19:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 21-11-11 12:55, Prathap M S schreef:
> * The graphics SDK requires additional directories to be staged for
> compilation.
> 
> Signed-off-by: Prathap M S <msprathap@ti.com>

This patch is against OE-core, so it needs to be sent to the OE-core mailing
list.

> --- meta/classes/kernel.bbclass |    2 +- 1 files changed, 1
> insertions(+), 1 deletions(-)
> 
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass 
> index 12e0b83..b00461b 100644 --- a/meta/classes/kernel.bbclass +++
> b/meta/classes/kernel.bbclass @@ -243,7 +243,7 @@ FILES_kernel-image =
> "/boot/${KERNEL_IMAGETYPE}*" FILES_kernel-dev = "/boot/System.map*
> /boot/Module.symvers* /boot/config*" FILES_kernel-vmlinux =
> "/boot/vmlinux*" # misc is a package to contain files we need in staging 
> -FILES_kernel-misc = "/kernel/include/config /kernel/scripts
> /kernel/drivers/crypto /kernel/drivers/media" +FILES_kernel-misc =
> "/kernel/include/config /kernel/scripts /kernel/drivers/crypto
> /kernel/drivers/media /kernel/drivers/video /kernel/drivers/gpu
> /kernel/drivers/base" RDEPENDS_kernel = "kernel-base" # Allow machines to
> override this dependency if kernel image files are # not wanted in images
> as standard

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iEYEARECAAYFAk7KTmEACgkQMkyGM64RGpHkPwCfYuJp5B4WxtX2U/SNX9uZDiI5
mUQAnRncjVVeKsIhni3+X6mAMV9MqWFZ
=dON5
-----END PGP SIGNATURE-----



