Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QaNdk-0001qZ-1U for openembedded-devel@lists.openembedded.org;
	Sat, 25 Jun 2011 09:50:52 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QaNaD-0000uR-4x for openembedded-devel@lists.openembedded.org;
	Sat, 25 Jun 2011 09:47:13 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sat, 25 Jun 2011 09:47:13 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 25 Jun 2011 09:47:13 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Sat, 25 Jun 2011 09:46:58 +0200
Message-ID: <iu43pi$k11$1@dough.gmane.org>
References: <1308964444-2595-1-git-send-email-agnel.joel@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <1308964444-2595-1-git-send-email-agnel.joel@gmail.com>
X-Enigmail-Version: 1.0.1
Subject: Re: [PATCH] ti-dmai: Fixes for Display and Capture.
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
X-List-Received-Date: Sat, 25 Jun 2011 07:50:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 25-06-11 03:14, Joel A Fernandes wrote:
> These patches fix issues with display and capture in ti-dmai that cause it to break with recent kernels.

Thanks, I applied your patch, but one of them might need an update later on:

> +From 5e59be7d0d5d3d90e9bbc5d1bb5829ad8482fbf0 Mon Sep 17 00:00:00 2001
> +From: Joel A Fernandes <agnel.joel@gmail.com>
> +Date: Fri, 24 Jun 2011 17:04:10 -0500
> +Subject: [PATCH 4/4] DMAI: Use the correct capture device node.
> +
> +Signed-off-by: Joel A Fernandes <agnel.joel@gmail.com>
> +---
> + linux/Capture.c |    2 +-
> + 1 files changed, 1 insertions(+), 1 deletions(-)
> +
> +diff --git a/packages/ti/sdo/dmai/linux/Capture.c b/packages/ti/sdo/dmai/linux/Capture.c
> +index e7a081e..a2614e7 100644
> +--- a/packages/ti/sdo/dmai/linux/Capture.c
> ++++ b/packages/ti/sdo/dmai/linux/Capture.c
> +@@ -120,7 +120,7 @@ const Capture_Attrs Capture_Attrs_OMAP3530_DEFAULT = {
> +     -1,
> +     -1,
> +     -1,
> +-    "/dev/video0",
> ++    "/dev/video2",
> +     FALSE,
> +     VideoStd_AUTO,
> +     -1,

This is still dependant in which order modules get loaded, so like with
the output patch it would be better to iterate over

/sys/class/video4linux/video*/name

And look for the usual suspects (e.g. "OMAP3 ISP CCDC output" on omap3).
I'm not sure how well that works on other platforms, which I why this
patch went in as is :)

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFOBZJyMkyGM64RGpERAgcGAKCGQ/R8hzFpOLaeMQYmvsKEvu2wWACeL70H
ipxR1rKruT7mLTJtpSdKHLU=
=Q0F8
-----END PGP SIGNATURE-----



