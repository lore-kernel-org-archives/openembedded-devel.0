Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RRO11-0008Sx-CB for openembedded-devel@lists.openembedded.org;
	Fri, 18 Nov 2011 13:57:59 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RRNun-0001Vy-H6 for openembedded-devel@lists.openembedded.org;
	Fri, 18 Nov 2011 13:51:33 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Nov 2011 13:51:33 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Nov 2011 13:51:33 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 18 Nov 2011 13:51:20 +0100
Message-ID: <ja5kc8$8vl$1@dough.gmane.org>
References: <1321600643-8366-1-git-send-email-msprathap@ti.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:8.0) Gecko/20111105 Thunderbird/8.0
In-Reply-To: <1321600643-8366-1-git-send-email-msprathap@ti.com>
X-Enigmail-Version: 1.3.3
Subject: Re: [PATCH v2 1/3] kernel.bbclass: stage additional directories
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
X-List-Received-Date: Fri, 18 Nov 2011 12:57:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 18-11-11 08:17, Prathap M S schreef:
> * The graphics SDK requires additional directories to be staged for
> compilation.
> 
> Signed-off-by: Prathap M S <msprathap@ti.com>

This doesn't apply, did you generate it against HEAD?

> --- classes/kernel.bbclass |    2 +- 1 files changed, 1 insertions(+), 1
> deletions(-)
> 
> diff --git a/classes/kernel.bbclass b/classes/kernel.bbclass index
> 0109ce6..bf731e6 100644 --- a/classes/kernel.bbclass +++
> b/classes/kernel.bbclass @@ -168,7 +168,7 @@ sysroot_stage_all_append()
> { mkdir -p $kerneldir/include/asm-generic cp -fR include/asm-generic/*
> $kerneldir/include/asm-generic/
> 
> -	for entry in drivers/crypto drivers/media include/generated
> include/linux include/net include/pcmcia include/media include/acpi
> include/sound include/video include/scsi include/trace include/mtd
> include/rdma include/drm include/xen crypto/ocf; do +	for entry in
> drivers/crypto drivers/media drivers/video drivers/gpu drivers/base
> include/generated include/linux include/net include/pcmcia include/media
> include/acpi include/sound include/video include/scsi include/trace
> include/mtd include/rdma include/drm include/xen crypto/ocf; do if [ -d
> $entry ]; then mkdir -p $kerneldir/$entry cp -fR $entry/*
> $kerneldir/$entry/

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iEYEARECAAYFAk7GVMQACgkQMkyGM64RGpFAogCfdzJy9qTzrsY5eUInm7EAKVgJ
Wr4An1W6wfmQP/obDInB6aI00cFWpAP9
=AHZO
-----END PGP SIGNATURE-----



