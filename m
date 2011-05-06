Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QIPrT-0005UN-QE for openembedded-devel@lists.openembedded.org;
	Fri, 06 May 2011 20:34:48 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QIPor-0000cH-Sn for openembedded-devel@lists.openembedded.org;
	Fri, 06 May 2011 20:32:05 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 May 2011 20:32:05 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 May 2011 20:32:05 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 06 May 2011 20:31:54 +0200
Message-ID: <iq1eqq$od$1@dough.gmane.org>
References: <1304688822-31538-1-git-send-email-pprakash@ti.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <1304688822-31538-1-git-send-email-pprakash@ti.com>
X-Enigmail-Version: 1.0.1
Subject: Re: [PATCH] gst-ffmpeg: Add support for NEON optimization on armv7a
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
X-List-Received-Date: Fri, 06 May 2011 18:34:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 06-05-11 15:33, Punya Prakash wrote:
> * Patch gst-ffmpeg configure script to allow passing extra config options
> 	* without this change parsinig of configuration for FFmpeg/libav fails for parameters like --with-ffmpeg-extra-configure="--extra-cflags='-mfpu=neon -mfloat-abi=softfp'"
> * note: this patch has been accepted upstream to the mainline project
> 	* commit cc9d778844078d0eb2c23c7a11f7f855d013bca5
> 	* Target Milestone HEAD 0.10.12

I have a comment and a nitpick, let's start with the nitpick first:

> +EXTRA_OECONF_armv7a = ' --with-ffmpeg-extra-configure="  --target-os=linux --extra-cflags='-march=armv7-a -mfpu=neon -mfloat-abi=softfp'"'

You're hardcoding linux and fb abi, which is bad.

Now the the comment:

This patch is useless, we link to the external libav (EXTRA_OECONF = "
- --with-system-ffmpeg"), which is built with the correct options. So this
patch has no effect and the way it's trying to achieve it is wrong, so:

NAK

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNxD6aMkyGM64RGpERAqzYAJ9Hy9QLRDLiKKtjcT/rtZrSrzYRqQCgr74M
wBFPHk+vCnXe1K+kS0MzIDE=
=H6dO
-----END PGP SIGNATURE-----



