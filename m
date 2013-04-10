Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UPy57-0002pZ-AY
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Apr 2013 18:41:17 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 10 Apr 2013 09:23:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,447,1363158000"; d="scan'208";a="225599578"
Received: from unknown (HELO helios.localnet) ([10.255.14.51])
	by AZSMGA002.ch.intel.com with ESMTP; 10 Apr 2013 09:23:30 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Koen Kooi <koen@dominion.thruhere.net>,
	openembedded-devel@lists.openembedded.org
Date: Wed, 10 Apr 2013 17:23:29 +0100
Message-ID: <1839154.lsnjsSQGOt@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.2 (Linux/3.5.0-27-generic; KDE/4.10.2; i686; ; )
In-Reply-To: <1365610462-29689-3-git-send-email-koen@dominion.thruhere.net>
References: <1365610462-29689-1-git-send-email-koen@dominion.thruhere.net>
	<1365610462-29689-3-git-send-email-koen@dominion.thruhere.net>
MIME-Version: 1.0
Subject: Re: [meta-oe][PATCH 3/8] python-tornado: update to top of 2.2 branch
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
X-List-Received-Date: Wed, 10 Apr 2013 16:41:28 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 10 April 2013 18:14:17 Koen Kooi wrote:
> Drags in a few bugfixes needed for gateone
> 
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
>  meta-oe/recipes-devtools/python/python-tornado_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-oe/recipes-devtools/python/python-tornado_git.bb
> b/meta-oe/recipes-devtools/python/python-tornado_git.bb index
> 00d0bbb..82a94e6 100644
> --- a/meta-oe/recipes-devtools/python/python-tornado_git.bb
> +++ b/meta-oe/recipes-devtools/python/python-tornado_git.bb
> @@ -3,8 +3,8 @@ LICENSE = "Apache"
>  LIC_FILES_CHKSUM = "file://README;md5=e7fb9954003d7cd93322ccf282210d1c"
> 
>  PV = "2.2"
> -SRCREV = "02bc76155de5bf4dca243e4d0c019c0ac4c8b3be"
>  PR = "r1"
> +SRCREV = "c501917eba46dec30b1f2ef12497dffc4beec505"
>  SRC_URI = "git://github.com/facebook/tornado.git;branch=branch2.2 \
>             file://0001-disable-AI_ADDRCONFIG-flag.patch \
>            "

Shouldn't PV include SRCPV here? Looking at the repo I'm guessing PV ought to 
be "2.2.1+git${SRCPV}"

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


