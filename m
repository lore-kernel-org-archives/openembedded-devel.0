Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 437E96AFB6
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Jul 2013 10:50:25 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga102.ch.intel.com with ESMTP; 04 Jul 2013 03:50:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,994,1363158000"; d="scan'208";a="360432403"
Received: from unknown (HELO helios.localnet) ([10.252.121.242])
	by fmsmga001.fm.intel.com with ESMTP; 04 Jul 2013 03:51:20 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Chunrong Guo <B40290@freescale.com>
Date: Thu, 04 Jul 2013 11:50:24 +0100
Message-ID: <2942656.3ozBKLWcr5@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.4 (Linux/3.8.0-25-generic; KDE/4.10.4; i686; ; )
In-Reply-To: <1372929983-1410-1-git-send-email-B40290@freescale.com>
References: <1372929983-1410-1-git-send-email-B40290@freescale.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org, b40527@freescale.com
Subject: Re: [meta-networking][PATCH] dnsmasq: install .service only with systemd in DISTRO_FEATURES
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 04 Jul 2013 10:50:25 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 04 July 2013 17:26:23 Chunrong Guo wrote:
> Signed-off-by: Chunrong Guo <B40290@freescale.com>
> ---
>  .../recipes-support/dnsmasq/dnsmasq.inc            |    8 +++++---
>  1 files changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
> b/meta-networking/recipes-support/dnsmasq/dnsmasq.inc index
> 0f5b273..0710893 100644
> --- a/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
> +++ b/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
> @@ -30,9 +30,11 @@ do_install () {
>      install -d ${D}${sysconfdir}/ ${D}${sysconfdir}/init.d
> ${D}${sysconfdir}/dnsmasq.d install -m 644 ${WORKDIR}/dnsmasq.conf
> ${D}${sysconfdir}/
>      install -m 755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/dnsmasq
> -
> -    install -d ${D}${systemd_unitdir}/system
> -    install -m 0644 ${WORKDIR}/dnsmasq.service
> ${D}${systemd_unitdir}/system +
> +    if ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)};
> then +        install -d ${D}${systemd_unitdir}/system
> +        install -m 0644 ${WORKDIR}/dnsmasq.service
> ${D}${systemd_unitdir}/system +    fi
> 
>      if [ "${@base_contains('PACKAGECONFIG', 'dbus', 'dbus', '', d)}" != ""
> ]; then install -d ${D}${sysconfdir}/dbus-1/system.d

I think we should really have a global fix for this issue rather than hacking 
up every recipe:

https://bugzilla.yoctoproject.org/show_bug.cgi?id=4309

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

