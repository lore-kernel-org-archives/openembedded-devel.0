Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TfsxU-0006AP-Mx
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Dec 2012 14:54:48 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 04 Dec 2012 05:40:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,215,1355126400"; d="scan'208";a="228755159"
Received: from unknown (HELO helios.localnet) ([10.252.122.195])
	by orsmga001.jf.intel.com with ESMTP; 04 Dec 2012 05:40:21 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 04 Dec 2012 13:40:18 +0000
Message-ID: <7833825.xrKqcL15qf@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9.3 (Linux/3.5.0-18-generic; KDE/4.9.3; i686; ; )
In-Reply-To: <1353085842-4528-1-git-send-email-dromede@gmail.com>
References: <1353085842-4528-1-git-send-email-dromede@gmail.com>
MIME-Version: 1.0
Subject: Re: [PATCH] [meta-handheld] kexecboot-handhelds.inc: Add explicit support for 16 bit displays.
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
X-List-Received-Date: Tue, 04 Dec 2012 13:54:48 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 16 November 2012 18:10:42 dromede@gmail.com wrote:
> From: Marko Katic <dromede.gmail.com>
> 
> All machines referenced in kexecboot-handhelds.inc have 16 bit displays.
> Kexecboot will by default enable support for 1,2,4,16,18,24 and 32 bit
> displays.
> 
> Add compile time options that only enable 16 bit support for these machines.
> This should slightly reduce the size of the kexecboot binary.
> 
> Signed-off-by: Marko Katic <dromede.gmail.com>
> ---
>  recipes-bsp/kexecboot/kexecboot-handhelds.inc |   12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/recipes-bsp/kexecboot/kexecboot-handhelds.inc
> b/recipes-bsp/kexecboot/kexecboot-handhelds.inc index ab3deca..9030797
> 100644
> --- a/recipes-bsp/kexecboot/kexecboot-handhelds.inc
> +++ b/recipes-bsp/kexecboot/kexecboot-handhelds.inc
> @@ -1,6 +1,6 @@
> -EXTRA_OECONF_akita = "--enable-zaurus --enable-delay=2
> --enable-evdev-rate=1000,250 --enable-fbui-width=480" -EXTRA_OECONF_c7x0 =
> "--enable-zaurus --enable-delay=2 --enable-evdev-rate=1000,250
> --enable-fbui-width=480" -EXTRA_OECONF_spitz = "--enable-zaurus
> --enable-delay=3 --enable-evdev-rate=1000,250 --enable-fbui-width=480"
> -EXTRA_OECONF_poodle = "--enable-zaurus --enable-delay=2
> --enable-evdev-rate=1000,250" -EXTRA_OECONF_tosa = "--enable-zaurus
> --enable-delay=2 --enable-evdev-rate=1000,250" -EXTRA_OECONF_collie =
> "--enable-delay=2 --enable-evdev-rate=1000,250" +EXTRA_OECONF_akita =
> "--enable-zaurus --enable-delay=2 --enable-evdev-rate=1000,250
> --enable-fbui-width=480 --enable-bpp=16" +EXTRA_OECONF_c7x0 =
> "--enable-zaurus --enable-delay=2 --enable-evdev-rate=1000,250
> --enable-fbui-width=480 --enable-bpp=16" +EXTRA_OECONF_spitz =
> "--enable-zaurus --enable-delay=3 --enable-evdev-rate=1000,250
> --enable-fbui-width=480 --enable-bpp=16" +EXTRA_OECONF_poodle =
> "--enable-zaurus --enable-delay=2 --enable-evdev-rate=1000,250
> ---enable-bpp=16" +EXTRA_OECONF_tosa = "--enable-zaurus --enable-delay=2
> --enable-evdev-rate=1000,250 --enable-bpp=16" +EXTRA_OECONF_collie =
> "--enable-delay=2 --enable-evdev-rate=1000,250 --enable-bpp=16"

Merged to meta-handheld master, thanks.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


