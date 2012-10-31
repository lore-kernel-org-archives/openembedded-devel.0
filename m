Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TTXIB-0008CF-7A
	for openembedded-devel@lists.openembedded.org;
	Wed, 31 Oct 2012 13:21:07 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 31 Oct 2012 05:07:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,687,1344236400"; d="scan'208";a="240768926"
Received: from unknown (HELO helios.localnet) ([10.252.122.123])
	by fmsmga001.fm.intel.com with ESMTP; 31 Oct 2012 05:07:28 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Date: Wed, 31 Oct 2012 12:07:27 +0000
Message-ID: <22912476.o0gAnAerSU@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9.2 (Linux/3.2.0-32-generic-pae; KDE/4.9.2; i686; ; )
In-Reply-To: <1351684903-1276-1-git-send-email-otavio@ossystems.com.br>
References: <1351684903-1276-1-git-send-email-otavio@ossystems.com.br>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] meta-systemd: ntp: Fix ntpdate.service file to use right binary
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
X-List-Received-Date: Wed, 31 Oct 2012 12:21:07 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 31 October 2012 10:01:43 Otavio Salvador wrote:
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>  .../recipes-support/ntp/ntp/ntpdate.service        |    2 +-
>  .../recipes-support/ntp/ntp_4.2.6p5.bbappend       |    2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git
> a/meta-systemd/meta-networking/recipes-support/ntp/ntp/ntpdate.service
> b/meta-systemd/meta-networking/recipes-support/ntp/ntp/ntpdate.service
> index b2bc632..8df9970 100644
> --- a/meta-systemd/meta-networking/recipes-support/ntp/ntp/ntpdate.service
> +++ b/meta-systemd/meta-networking/recipes-support/ntp/ntp/ntpdate.service
> @@ -4,7 +4,7 @@ Before=ntpd.service
> 
>  [Service]
>  Type=oneshot
> -ExecStart=/usr/bin/ntpd -q -g -x
> +ExecStart=/usr/bin/ntpdate pool.ntp.org

We *cannot* use pool.ntp.org for the reasons already discussed.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


