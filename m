Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1U6ofH-0000ti-Lk
	for openembedded-devel@lists.openembedded.org;
	Sat, 16 Feb 2013 21:47:36 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 16 Feb 2013 12:31:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,678,1355126400"; d="scan'208";a="292063820"
Received: from unknown (HELO helios.localnet) ([10.252.120.76])
	by fmsmga002.fm.intel.com with ESMTP; 16 Feb 2013 12:31:12 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Joe Slater <jslater@windriver.com>
Date: Sat, 16 Feb 2013 20:31:11 +0000
Message-ID: <1911913.2th2JZ7kj7@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10 (Linux/3.5.0-23-generic; KDE/4.10.0; i686; ; )
In-Reply-To: <1360878004-11267-1-git-send-email-jslater@windriver.com>
References: <1360878004-11267-1-git-send-email-jslater@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] arptables: defeat multi-job for install
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
X-List-Received-Date: Sat, 16 Feb 2013 20:47:37 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Joe,

On Thursday 14 February 2013 13:40:04 Joe Slater wrote:
> CQID: 399299
> 
> The make install target is not parallel job
> safe, but doesn't do all that much, so we
> limit make to one job for that.
> 
> The make target is of the form
> 
> install: x y z
> 
> Unfortunately, z depends on y, so if z is started
> before y (almost) completes, we will fail.
> 
> Signed-off-by: Joe Slater <jslater@windriver.com>
> ---
>  recipes-support/arptables/arptables_0.0.3-4.bb |    7 +++++++
>  1 files changed, 7 insertions(+), 0 deletions(-)
> 
> diff --git a/recipes-support/arptables/arptables_0.0.3-4.bb
> b/recipes-support/arptables/arptables_0.0.3-4.bb index 2faccec..de3f62d
> 100644
> --- a/recipes-support/arptables/arptables_0.0.3-4.bb
> +++ b/recipes-support/arptables/arptables_0.0.3-4.bb
> @@ -3,6 +3,8 @@ PRIORITY = "optional"
>  LICENSE = "GPL-2.0"
>  SECTION = "console/network"
> 
> +PR = "r2"
> +
>  RDEPENDS_${PN} += "perl"
> 
>  LIC_FILES_CHKSUM =
> "file://${COREBASE}/meta/files/common-licenses/GPL-2.0;md5=801f80980d171dd6
> 425610833a22dbe6" @@ -20,6 +22,11 @@ do_compile () {
>  	oe_runmake
>  }
> 
> +# the install target is not multi-job safe, but it doesn't do much
> +# so we just install seriatim
> +#

I hope I don't expose my ignorance too much by saying I just learned a new 
word thanks to the above comment... ;)

> +PARALLEL_MAKEINST = "-j1"

Of course this will work but typically we would just set PARALLEL_MAKEINST = 
"" to accomplish this.

More importantly, this appears to be a patch for the meta-networking layer and 
should therefore have [meta-networking] in the subject and use the meta-
networking/ path.

Cheers,
Paul


