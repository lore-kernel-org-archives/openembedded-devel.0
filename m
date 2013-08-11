Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 18B9961013
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Aug 2013 20:41:43 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 11 Aug 2013 13:41:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,858,1367996400"; d="scan'208";a="384647003"
Received: from unknown (HELO helios.localnet) ([10.252.122.238])
	by fmsmga002.fm.intel.com with ESMTP; 11 Aug 2013 13:41:33 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 11 Aug 2013 21:41:32 +0100
Message-ID: <8194550.0BPKn9U7hO@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-27-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <1376187025-22368-1-git-send-email-mark.asselstine@windriver.com>
References: <1376187025-22368-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Cc: Mark Asselstine <mark.asselstine@windriver.com>,
	joe.macdonald@windriver.com
Subject: Re: [meta-networking][PATCH] dnsmasq: don't expect systemd support to be set
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
X-List-Received-Date: Sun, 11 Aug 2013 20:41:44 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Mark,

On Saturday 10 August 2013 22:10:25 Mark Asselstine wrote:
> If you don't have 'systemd' set in your DISTRO_FEATURES 'dnsmasq' will
> fail to package due to a QA error;
> 
> ERROR: QA Issue: dnsmasq: Files/directories were installed but not shipped
>   /lib
> 
> Check for systemd in DISTRO_FEATURES before performing installation
> instructions related to systemd.
> 
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
>  meta-networking/recipes-support/dnsmasq/dnsmasq.inc | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
> b/meta-networking/recipes-support/dnsmasq/dnsmasq.inc index
> 0f5b273..b9e7ff6 100644
> --- a/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
> +++ b/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
> @@ -31,8 +31,10 @@ do_install () {
>      install -m 644 ${WORKDIR}/dnsmasq.conf ${D}${sysconfdir}/
>      install -m 755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/dnsmasq
> 
> -    install -d ${D}${systemd_unitdir}/system
> -    install -m 0644 ${WORKDIR}/dnsmasq.service
> ${D}${systemd_unitdir}/system +    if ${@base_contains('DISTRO_FEATURES',
> 'systemd', 'true', 'false', d)}; then +        install -d
> ${D}${systemd_unitdir}/system
> +        install -m 0644 ${WORKDIR}/dnsmasq.service
> ${D}${systemd_unitdir}/system +    fi
> 
>      if [ "${@base_contains('PACKAGECONFIG', 'dbus', 'dbus', '', d)}" != ""
> ]; then install -d ${D}${sysconfdir}/dbus-1/system.d

There's already a global fix for this in OE-Core:

http://cgit.openembedded.org/openembedded-core/commit/meta/classes/systemd.bbclass?id=ac5d20f4adac69ea1702694fb50849c9e465b443

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

