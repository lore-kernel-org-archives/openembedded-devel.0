Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UE6LO-0004lU-AD
	for openembedded-devel@lists.openembedded.org;
	Sat, 09 Mar 2013 00:05:02 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 08 Mar 2013 14:48:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,810,1355126400"; d="scan'208";a="211441389"
Received: from unknown (HELO helios.localnet) ([10.255.13.25])
	by AZSMGA002.ch.intel.com with ESMTP; 08 Mar 2013 14:48:18 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Date: Fri, 08 Mar 2013 22:48:17 +0000
Message-ID: <1500617.PjPkZjIiXc@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10 (Linux/3.5.0-24-generic; KDE/4.10.0; i686; ; )
In-Reply-To: <1362768637-29343-1-git-send-email-otavio@ossystems.com.br>
References: <1362768637-29343-1-git-send-email-otavio@ossystems.com.br>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] polkit: Remove authentication override as it is handled in OE-Core
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
X-List-Received-Date: Fri, 08 Mar 2013 23:05:06 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 08 March 2013 15:50:37 Otavio Salvador wrote:
> OE-Core now handles the detection of authentication so we don't need
> to do it here. The bbappend file is kept to provide the upgrade path
> only, or the revision would go backwards.
> 
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>  meta-oe/recipes-extended/polkit/polkit_0.104.bbappend | 9 +--------
>  1 file changed, 1 insertion(+), 8 deletions(-)
> 
> diff --git a/meta-oe/recipes-extended/polkit/polkit_0.104.bbappend
> b/meta-oe/recipes-extended/polkit/polkit_0.104.bbappend index
> ea82e37..ceb2b6b 100644
> --- a/meta-oe/recipes-extended/polkit/polkit_0.104.bbappend
> +++ b/meta-oe/recipes-extended/polkit/polkit_0.104.bbappend
> @@ -1,8 +1 @@
> -PRINC := "${@int(PRINC) + 4}"
> -
> -POLKITAUTH ??= "consolekit"
> -
> -PACKAGECONFIG += "${POLKITAUTH}"
> -PACKAGECONFIG[systemd] = "--enable-systemd,--disable-systemd,systemd"
> -# there is no --enable/--disable option for consolekit and it's not picked
> by shlibs, so add it to RDEPENDS -PACKAGECONFIG[consolekit] =
> ",,,consolekit"
> +PRINC := "${@int(PRINC) + 5}"

Can't we just bump PR in OE-Core?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


