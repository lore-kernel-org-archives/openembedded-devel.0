Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 759A460650
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 May 2014 14:52:13 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 02 May 2014 07:52:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,972,1389772800"; d="scan'208";a="532524952"
Received: from mmckenna-mobl2.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.122.53])
	by fmsmga002.fm.intel.com with ESMTP; 02 May 2014 07:52:08 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Mihaela Sendrea <mihaela.sendrea@enea.com>
Date: Fri, 02 May 2014 15:52:07 +0100
Message-ID: <8234117.L0pQ3vJCRc@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.12.5 (Linux/3.13.10-200.fc20.x86_64; KDE/4.12.4; x86_64; ;
	)
In-Reply-To: <1399037801-2347-2-git-send-email-mihaela.sendrea@enea.com>
References: <1399037801-2347-1-git-send-email-mihaela.sendrea@enea.com>
	<1399037801-2347-2-git-send-email-mihaela.sendrea@enea.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH v3 2/2] netperf: enable SCTP support
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
X-List-Received-Date: Fri, 02 May 2014 14:52:16 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Mihaela,

On Friday 02 May 2014 15:36:41 Mihaela Sendrea wrote:
> Signed-off-by: Mihaela Sendrea <mihaela.sendrea@enea.com>
> ---
>  meta-networking/recipes-support/netperf/netperf_2.6.0.bb |    3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/meta-networking/recipes-support/netperf/netperf_2.6.0.bb
> b/meta-networking/recipes-support/netperf/netperf_2.6.0.bb index
> 45760ad..64e3be0 100644
> --- a/meta-networking/recipes-support/netperf/netperf_2.6.0.bb
> +++ b/meta-networking/recipes-support/netperf/netperf_2.6.0.bb
> @@ -27,6 +27,9 @@ CFLAGS_append = " -DDO_UNIX -DDO_IPV6 -D_GNU_SOURCE"
>  CFLAGS_append = "${@base_contains('DISTRO_FEATURES', 'largefile', \
>      ' -D_FILE_OFFSET_BITS=64', '', d)}"
> 
> +PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'sctp', 'sctp', '',
> d)}" 

Do you anticipate a number of other recipes enabling and disabling SCTP 
support? Typically we only add DISTRO_FEATURES where that's the case, rather 
than just for individual recipes (that's why PACKAGECONFIG was created.)

> +PACKAGECONFIG[sctp] =
> "--enable-sctp,--disable-sctp,lksctp-tools,kernel-module-sctp" 

Sorry to be a pain, I should have noticed this earlier - but the result of 
this will be that the recipe breaks if sctp is enabled but sctp functionality 
is compiled into the kernel rather than being a module. Since PACKAGECONFIG 
doesn't directly support adding RRECOMMENDS I'm afraid you'll need to set it 
separately based on whether sctp is in PACKAGECONFIG.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

