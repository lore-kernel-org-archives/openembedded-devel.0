Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PnsuS-00089X-TG for openembedded-devel@lists.openembedded.org;
	Fri, 11 Feb 2011 14:19:40 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PnstO-0007Fu-1X for openembedded-devel@lists.openembedded.org;
	Fri, 11 Feb 2011 14:18:34 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Feb 2011 14:18:34 +0100
Received: from k.kooi by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Feb 2011 14:18:34 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 11 Feb 2011 14:18:21 +0100
Message-ID: <ij3cut$mts$1@dough.gmane.org>
References: <1297429349-5526-1-git-send-email-obi@opendreambox.org>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <1297429349-5526-1-git-send-email-obi@opendreambox.org>
X-Enigmail-Version: 1.0.1
Subject: Re: [PATCH] kernel.bbclass: provide virtual/kernel-${PV}
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
X-List-Received-Date: Fri, 11 Feb 2011 13:19:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 11-02-11 14:02, Andreas Oberritter wrote:
> * Allow precompiled modules to depend on a specific kernel version.
> 
> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> ---
>  classes/kernel.bbclass |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/classes/kernel.bbclass b/classes/kernel.bbclass
> index 0d1b4ad..55e3ca0 100644
> --- a/classes/kernel.bbclass
> +++ b/classes/kernel.bbclass
> @@ -1,6 +1,6 @@
>  inherit linux-kernel-base module_strip
>  
> -PROVIDES += "virtual/kernel"
> +PROVIDES += "virtual/kernel virtual/kernel-${PV}"
>  DEPENDS += "virtual/${TARGET_PREFIX}gcc virtual/${TARGET_PREFIX}depmod-${@get_kernelmajorversion('${PV}')} virtual/${TARGET_PREFIX}gcc${KERNEL_CCSUFFIX} update-modules bluez-dtl1-workaround"
>  
>  # we include gcc above, we dont need virtual/libc

How is PV know before the kernel is built? The line below has a
workaround for that, so I guess it also needs one in PROVIDES, no?
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNVTcdMkyGM64RGpERAqZtAJ9gV1L+A2Ph+3aH1/aKr9PGlUeQCwCcCUUE
TlXU4/M8l7ycdmwm+7a8VL0=
=JO+0
-----END PGP SIGNATURE-----



