Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QS2t2-0006Oe-1f for openembedded-devel@lists.openembedded.org;
	Thu, 02 Jun 2011 10:04:12 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QS2py-00012d-OC for openembedded-devel@lists.openembedded.org;
	Thu, 02 Jun 2011 10:01:02 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Jun 2011 10:01:02 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Jun 2011 10:01:02 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 02 Jun 2011 10:00:50 +0200
Message-ID: <is7fvi$1rh$1@dough.gmane.org>
References: <1306957245-7248-1-git-send-email-pprakash@ti.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <1306957245-7248-1-git-send-email-pprakash@ti.com>
X-Enigmail-Version: 1.0.1
Subject: Re: [PATCH] mcf-camera-app: Add new recipe for matrix camera streaming application
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
X-List-Received-Date: Thu, 02 Jun 2011 08:04:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 01-06-11 21:40, Punya Prakash wrote:
> * Support for media controller framework
> 	* Create and set-up link
>  	* Configuration of format for each pad
>  	* Streaming for specified duration
> 
> Signed-off-by Punya Prakash <pprakash@ti.com>

> +++ b/recipes/ti/mcf-camera-app_1.0.bb
> +PLATFORM_am37x-evm = "am3715"
> +PLATFORM_beagleboard = "am3715"

> +do_compile() {
> +	export CROSS_COMPILE=${TARGET_PREFIX}
> +	make LINUXKERNEL_INSTALL_DIR="${STAGING_KERNEL_DIR}" PLATFORM="${PLATFORM}"

So it seems to be machine specific, you need PACKAGE_ARCH =
$MACHINE_ARCH. And please use oe_runmake.

> +INSANE_SKIP_${PN} = "True"

Since this is in internal app we can fix, this won't go in before the QA
errors have been fixed.
If for some unforeseen reason the QA errors can't be fixed, you should
at least add a comment what the errors are and why they can't get fixed.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFN50MyMkyGM64RGpERAr6iAKCZvA/Y3qqN12+SSxZT3c+PZqPOrQCgrs/a
ugfQQJ1GpVgpRFZ39Akp7gQ=
=FEPN
-----END PGP SIGNATURE-----



