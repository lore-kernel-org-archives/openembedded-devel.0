Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PBKll-0003wn-3s
	for openembedded-devel@lists.openembedded.org;
	Thu, 28 Oct 2010 07:11:22 +0200
Received: by gwaa11 with SMTP id a11so1000856gwa.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Oct 2010 22:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=004KaN8tzU6UCFSL9cc5qcoSUfyiYd6cRIlhTfd73C8=;
	b=XIzZ+CI6vzqD8qifTqYu9c/V88BkNu2wjg47KrG+4Fp9waAObEjeT8siSlVGKLC9BQ
	swuivfYQVzP09XX/XXJIMLbS97AqCB3T4r2OvzJi1id9WXVZvhBPhRvdP+6zed0TUpl6
	/TT6/8dzPEVkK5fG6NJgnJ8ohDiQzmAB6ogjQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=M/LIn6c5fUEx3l0sfiJfJuPWN0VJQ0sc8EhbfVXbCPMt5rNo42OzzK/dMtZQdnjv/9
	ZZODjKH5Tb/ZzTvFM21TbNPnE9vU+9h/8apkTLQOe/T2b41y/nEBbp7g37VP+whsUTi2
	K38CURppQi026f46yz0s99Yn2uCvwXR2sFf84=
Received: by 10.91.42.4 with SMTP id u4mr2099450agj.57.1288242636397;
	Wed, 27 Oct 2010 22:10:36 -0700 (PDT)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id 28sm668867anv.6.2010.10.27.22.10.35
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 27 Oct 2010 22:10:35 -0700 (PDT)
Date: Wed, 27 Oct 2010 22:10:44 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101028051044.GC31542@gmail.com>
References: <1288241839-7011-1-git-send-email-johnso87@crhc.illinois.edu>
	<1288241839-7011-2-git-send-email-johnso87@crhc.illinois.edu>
MIME-Version: 1.0
In-Reply-To: <1288241839-7011-2-git-send-email-johnso87@crhc.illinois.edu>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH v3] linux-omap-2.6.36rc -- Consistent MAC address for BeagleBoard xM Adding a patch to linux-omap-2.6.36rc for beagleboard. Patch is adapted from one submitted by Mark Crichton to the Beagleboard Google Group (see http://groups.google.com/group/beagleboard/browse_thread/thread/92d41bb344f8939b?fwc=1). BeagleBoard xM now uses the OMAP's die ID as a MAC instead of generating a random one (since it doesn't have an EEPROM to store it), so you have a consistent MAC across boots. Signed-off-by: Matt Johnson <johnso87@crhc.illinois.edu>
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
X-List-Received-Date: Thu, 28 Oct 2010 05:11:22 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (27/10/10 23:57), Matt Johnson wrote:
> ---
>  conf/machine/include/omap3.inc                     |    2 +-
>  ...e-beagleboard-xm-a-consistent-MAC-address.patch |   83 ++++++++++++++++++++
>  recipes/linux/linux-omap_2.6.36rc.bb               |    1 +
>  3 files changed, 85 insertions(+), 1 deletions(-)
>  create mode 100644 recipes/linux/linux-omap-2.6.36rc/0008-give-the-beagleboard-xm-a-consistent-MAC-address.patch
> 
> diff --git a/conf/machine/include/omap3.inc b/conf/machine/include/omap3.inc
> index 76e997d..8b7a391 100644
> --- a/conf/machine/include/omap3.inc
> +++ b/conf/machine/include/omap3.inc
> @@ -4,7 +4,7 @@ TARGET_ARCH = "arm"
>  require conf/machine/include/tune-cortexa8.inc
>  PREFERRED_PROVIDER_virtual/kernel = "linux-omap"
>  # Increase this everytime you change something in the kernel
> -MACHINE_KERNEL_PR = "r90"
> +MACHINE_KERNEL_PR = "r91"

I guess you need to change MACHINE_KERNEL_PR_append to "e+..."
-Khem


