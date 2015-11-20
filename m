Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 566976018D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Nov 2015 17:35:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id tAKHZaPI008050
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Nov 2015 09:35:36 -0800 (PST)
Received: from Marks-MacBook-Pro.local (172.25.36.227) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.248.2; Fri, 20 Nov 2015 09:35:35 -0800
Reply-To: <openembedded-devel@lists.openembedded.org>
References: <1448040759-137627-1-git-send-email-mark.hatle@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <564F59E7.9010006@windriver.com>
Date: Fri, 20 Nov 2015 11:35:35 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:38.0)
	Gecko/20100101 Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1448040759-137627-1-git-send-email-mark.hatle@windriver.com>
Subject: Re: [meta-networking][PATCH 1/2 v4] netmap-modules: make deterministic builds for drivers
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 20 Nov 2015 17:35:36 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

V4:

Based on Martin's feedback, I reworked this and split the commit into two pieces.

V3: (not previously sent to the list)

renamed 'dri_' to 'driver_' as we already had some confusion that these were
'direct rendering interface' drivers and how were they in networking.. :P

--Mark

On 11/20/15 11:32 AM, Mark Hatle wrote:
> From: Jackie Huang <jackie.huang@windriver.com>
> 
> The driver builds are optional, but for deterministic builds,
> we should should be able to explicitly enable/disable the
> builds for them in a proper place (maybe in BSP).
> 
> We use PACKAGECONFIG for listing enabled drivers but can't use
> it's arguments since there is no option for each driver, and
> the options for drivers are:
>  --no-drivers    do not compile any driver
>  --no-drivers=   do not compile the given drivers (comma sep.)
>  --drivers=      only compile the given drivers (comma sep.)
> 
> So add additional logic to add proper configs to EXTRA_OECONF
> 
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> ---
>  .../recipes-kernel/netmap/netmap-modules_git.bb    | 48 +++++++++++++++++++++-
>  1 file changed, 47 insertions(+), 1 deletion(-)
> 
> diff --git a/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb b/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb
> index 7405d51..c4f54e9 100644
> --- a/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb
> +++ b/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb
> @@ -20,7 +20,53 @@ EXTRA_OECONF = "--kernel-dir=${STAGING_KERNEL_BUILDDIR} \
>                  --driver-suffix="-netmap" \
>                  "
>  
> -EXTRA_OECONF += "--no-drivers=ixgbe,virtio_net.c"
> +# The driver builds are optional, but for deterministic builds,
> +# we should be able to explicitly enable/disable the builds
> +# for them in a proper place (maybe in BSP).
> +# We use PACKAGECONFIG for listing enabled drivers but can't use
> +# it's arguments since there is no option for each driver, and
> +# the options for drivers are:
> +#  --no-drivers    do not compile any driver
> +#  --no-drivers=   do not compile the given drivers (comma sep.)
> +#  --drivers=      only compile the given drivers (comma sep.)
> +#
> +# So use the following python code to add proper configs to
> +# EXTRA_OECONF and skip arch test for kernel modules.
> +#
> +# The default is no-drivers, and all supported drivers are listed
> +# as PACKAGECONFIG flags.
> +PACKAGECONFIG ??= ""
> +
> +# List all supported drivers, get from "./configure --show-drivers",
> +# Add "driver_" prefix for easy distinguishing from other configure
> +# options.
> +PACKAGECONFIG[driver_ixgbe] = ",,,"
> +PACKAGECONFIG[driver_igb] = ",,,"
> +PACKAGECONFIG[driver_e1000e] = ",,,"
> +PACKAGECONFIG[driver_e1000] = ",,,"
> +PACKAGECONFIG[driver_veth.c] = ",,,"
> +PACKAGECONFIG[driver_forcedeth.c] = ",,,"
> +PACKAGECONFIG[driver_virtio_net.c] = ",,,"
> +PACKAGECONFIG[driver_r8169.c] = ",,,"
> +
> +python __anonymous () {
> +    pkgconfigs = d.getVar("PACKAGECONFIG", True).split()
> +    pkgconfigflags = d.getVarFlags("PACKAGECONFIG").keys()
> +
> +    # This is needed since there may be non-driver flags in PACKAGECONFIG
> +    all_drivers_list = []
> +    for f in pkgconfigflags:
> +        if f.startswith('driver_'):
> +            all_drivers_list.append(f)
> +    drivers_list = []
> +    for i in pkgconfigs:
> +        if i in all_drivers_list:
> +            drivers_list.append(i[len('driver_'):])
> +
> +    config_drivers = "--drivers=" + ",".join(drivers_list)
> +    extra_oeconf_drivers = bb.utils.contains_any('PACKAGECONFIG', all_drivers_list, config_drivers, '--no-drivers', d)
> +    d.appendVar("EXTRA_OECONF", extra_oeconf_drivers)
> +}
>  
>  LDFLAGS := "${@'${LDFLAGS}'.replace('-Wl,-O1', '')}"
>  LDFLAGS := "${@'${LDFLAGS}'.replace('-Wl,--as-needed', '')}"
> 


