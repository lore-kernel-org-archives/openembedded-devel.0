Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1U6nwC-0007uh-95
	for openembedded-devel@lists.openembedded.org;
	Sat, 16 Feb 2013 21:01:06 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 16 Feb 2013 11:44:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,678,1355126400"; d="scan'208";a="288105773"
Received: from unknown (HELO helios.localnet) ([10.252.120.76])
	by fmsmga001.fm.intel.com with ESMTP; 16 Feb 2013 11:44:37 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Khem Raj <raj.khem@gmail.com>
Date: Sat, 16 Feb 2013 19:44:35 +0000
Message-ID: <2516837.HYYY156nkD@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10 (Linux/3.5.0-23-generic; KDE/4.10.0; i686; ; )
In-Reply-To: <1360956138-30930-1-git-send-email-raj.khem@gmail.com>
References: <1360956138-30930-1-git-send-email-raj.khem@gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][meta-systemd][PATCH] ntp: Create a separate package for sntp
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
X-List-Received-Date: Sat, 16 Feb 2013 20:01:21 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 15 February 2013 11:22:18 Khem Raj wrote:
> sntp provides the functionality of obsoleted ntpdate
> so we have option of using ntpd as well as sntp
> sntp does the immediate one time sync with time
> server and corrects the tme immediately. it
> replaces ntpdate nicely.
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta-networking/recipes-support/ntp/ntp.inc        |    3 ++-
>  .../meta-networking/recipes-support/ntp/ntp/sntp   |    1 +
>  .../recipes-support/ntp/ntp/sntp.service           |   11 +++++++++++
>  .../recipes-support/ntp/ntp_4.2.6p5.bbappend       |    9 ++++++++-
>  4 files changed, 22 insertions(+), 2 deletions(-)
>  create mode 100644
> meta-systemd/meta-networking/recipes-support/ntp/ntp/sntp create mode
> 100644 meta-systemd/meta-networking/recipes-support/ntp/ntp/sntp.service
> 
> diff --git a/meta-networking/recipes-support/ntp/ntp.inc
> b/meta-networking/recipes-support/ntp/ntp.inc index d93f22d..cec0f22 100644
> --- a/meta-networking/recipes-support/ntp/ntp.inc
> +++ b/meta-networking/recipes-support/ntp/ntp.inc
> @@ -54,7 +54,7 @@ do_install_append() {
>  	ln -s ${bindir}/ntpdate-sync ${D}/${sysconfdir}/network/if-up.d
>  }
> 
> -PACKAGES += "ntpdate ${PN}-tickadj ${PN}-utils"
> +PACKAGES += "ntpdate sntp ${PN}-tickadj ${PN}-utils"
>  # NOTE: you don't need ntpdate, use "ntpd -q -g -x"
> 
>  # ntp originally includes tickadj. It's split off for inclusion in small
> firmware images on platforms @@ -69,6 +69,7 @@ RSUGGESTS_${PN} = "iana-etc"
> 
>  FILES_${PN} = "${bindir}/ntpd ${sysconfdir}/ntp.conf
> ${sysconfdir}/init.d/ntpd ${sbindir} ${libdir}" FILES_${PN}-tickadj =
> "${bindir}/tickadj"
> +FILES_sntp = "${bindir}/sntp"
>  FILES_${PN}-utils = "${bindir}"
>  FILES_ntpdate = "${bindir}/ntpdate
> ${sysconfdir}/network/if-up.d/ntpdate-sync ${bindir}/ntpdate-sync
> ${sysconfdir}/default/ntpdate"
> 
> diff --git a/meta-systemd/meta-networking/recipes-support/ntp/ntp/sntp
> b/meta-systemd/meta-networking/recipes-support/ntp/ntp/sntp new file mode
> 100644
> index 0000000..9529cdf
> --- /dev/null
> +++ b/meta-systemd/meta-networking/recipes-support/ntp/ntp/sntp
> @@ -0,0 +1 @@
> +NTPSERVER="pool.ntp.org"

Argh, no, we cannot use this as a default. We discussed this at length 
earlier.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


