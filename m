Return-Path: <paul.eggleton@linux.intel.com>
X-Greylist: delayed 766 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 30 Apr 2014 15:52:06 UTC
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id E44FF65DDD
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Apr 2014 15:52:06 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 30 Apr 2014 08:39:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,959,1389772800"; d="scan'208";a="503776773"
Received: from cgwithan-mobl.gar.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.122.50])
	by orsmga001.jf.intel.com with ESMTP; 30 Apr 2014 08:38:59 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Mihaela Sendrea <mihaela.sendrea@enea.com>
Date: Wed, 30 Apr 2014 16:38:58 +0100
Message-ID: <41147236.pkX3ds0scg@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.12.5 (Linux/3.13.10-200.fc20.x86_64; KDE/4.12.4; x86_64; ;
	)
In-Reply-To: <1398870272-18014-2-git-send-email-mihaela.sendrea@enea.com>
References: <1398870272-18014-1-git-send-email-mihaela.sendrea@enea.com>
	<1398870272-18014-2-git-send-email-mihaela.sendrea@enea.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH v2 2/2] netperf: enable SCTP support
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
X-List-Received-Date: Wed, 30 Apr 2014 15:52:12 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Mihaela,

On Wednesday 30 April 2014 17:04:32 Mihaela Sendrea wrote:
> Signed-off-by: Mihaela Sendrea <mihaela.sendrea@enea.com>
> ---
>  meta-networking/recipes-support/netperf/netperf_2.6.0.bb |    5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/meta-networking/recipes-support/netperf/netperf_2.6.0.bb
> b/meta-networking/recipes-support/netperf/netperf_2.6.0.bb index
> 45760ad..73a819c 100644
> --- a/meta-networking/recipes-support/netperf/netperf_2.6.0.bb
> +++ b/meta-networking/recipes-support/netperf/netperf_2.6.0.bb
> @@ -27,6 +27,11 @@ CFLAGS_append = " -DDO_UNIX -DDO_IPV6 -D_GNU_SOURCE"
>  CFLAGS_append = "${@base_contains('DISTRO_FEATURES', 'largefile', \
>      ' -D_FILE_OFFSET_BITS=64', '', d)}"
> 
> +PACKAGECONFIG += "sctp"

Can you explain why we should now enable this by default?

Also, even assuming we do, the default value of PACKAGECONFIG should be set 
using ?=, so that it can be easily overridden.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

