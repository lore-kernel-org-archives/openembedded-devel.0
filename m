Received: from [83.222.23.61] (helo=relay1.mail.masterhost.ru)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1LwYDl-0006re-9i
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Apr 2009 10:54:21 +0200
Received: from [UNAVAILABLE] ([80.246.246.162] helo=mate.localnet)
	by relay1.mail.masterhost.ru with esmtp 
	envelope from <khimov@altell.ru> authenticated with rik@osrc.info
	message id 1LwY9M-000AyN-3R
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Apr 2009 12:49:48 +0400
From: Roman I Khimov <khimov@altell.ru>
Organization: Altell Ltd.
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Apr 2009 12:49:07 +0400
User-Agent: KMail/1.11.2 (Linux/2.6.29; KDE/4.2.2; x86_64; ; )
References: <69E6C70090A0A14498CC98FAE5E06B6E3CF763@hiob.intern.dresearch.de>
	<d1b08f940904200836k6374f731h83342aea89c1f14@mail.gmail.com>
	<69E6C70090A0A14498CC98FAE5E06B6E3CF76B@hiob.intern.dresearch.de>
In-Reply-To: <69E6C70090A0A14498CC98FAE5E06B6E3CF76B@hiob.intern.dresearch.de>
MIME-Version: 1.0
Message-Id: <200904221249.07359.khimov@altell.ru>
Subject: Re: initramfs howto?
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
X-List-Received-Date: Wed, 22 Apr 2009 08:54:21 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wednesday 22 April 2009 11:45:38 Sledz, Steffen wrote:
> Both kernels do have associated modules.
>
> As i understand OE i have to build two images (for Rootfs-A and Rootfs-B).
> But ...
>
> (a) How do i tell those images which kernels (and as a consequence which
> modules) are associated with it?
>
> (b) How do i build Kernel-B with it's initramfs?

As I understand it's not possible to build multiple kernels currently in OE, 
as the packages will be named as "kernel-*" and if versions are the same 
you'll get something completely unusable. Even if not, you'll need to be very 
careful to get it working right.

We're doing multikernel builds here, but in sort of primary-secondary fashion, 
I've split kernel.bbclass into kernel.bbclass and kernel_base.bbclass so that 
kernel.bbclass works exactly as it worked before split, but if you use 
kernel_base the packages won't be renamed, so if you have "linux-smth" recipe 
you'll get "linux-smth-*" packages. Although I should note that our secondary 
kernel doesn't have any modules and we're installing both of them on one 
image.

I can try to make a patch for current OE if interested, unfortunately we 
diverged a little from time overlay was made, so patches from overlay don't 
apply easily. 


