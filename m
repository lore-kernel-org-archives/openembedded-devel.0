Return-Path: <maxin.john@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 07C246013D
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Jul 2016 11:34:50 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 06 Jul 2016 04:34:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,318,1464678000"; d="scan'208";a="1011743015"
Received: from mbabyjoh-desk.fi.intel.com (HELO
	mbabyjoh-desk.ger.corp.intel.com) ([10.237.72.71])
	by orsmga002.jf.intel.com with ESMTP; 06 Jul 2016 04:34:50 -0700
Date: Wed, 6 Jul 2016 14:35:01 +0300
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160706113500.GA29191@mbabyjoh-desk.ger.corp.intel.com>
References: <1467666791-14819-1-git-send-email-fabio.berton@ossystems.com.br>
MIME-Version: 1.0
In-Reply-To: <1467666791-14819-1-git-send-email-fabio.berton@ossystems.com.br>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-java][PATCH] rxtx: Add remove-libtool class to remove all .la files
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
X-List-Received-Date: Wed, 06 Jul 2016 11:34:52 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Mon, Jul 04, 2016 at 06:13:11PM -0300, Fabio Berton wrote:
> Class remove-libtool adds a postfunc to do_install to remove all .la
> files installed by libtool, so that they are absent from both the
> sysroots and target packages.
> 
> Fix error:
> ERROR: rxtx-2.2.0-r2 do_populate_sysroot: QA Issue: librxtxRaw.la
>   failed sanity test (workdir) in path
>   ../build/tmp/work/cortexa9hf-neon-emcontrols-linux-gnueabi/
>   rxtx/2.2.0-r2/sysroot-destdir/usr/lib/jni [la]
> ERROR: rxtx-2.2.0-r2 do_populate_sysroot: QA staging was broken by the
>   package built above
> ERROR: rxtx-2.2.0-r2 do_populate_sysroot: Function failed: do_qa_staging
> 
> Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
> ---
>  recipes-extended/rxtx/rxtx_2.2.0.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/recipes-extended/rxtx/rxtx_2.2.0.bb b/recipes-extended/rxtx/rxtx_2.2.0.bb
> index 564df32..c3fbc13 100644
> --- a/recipes-extended/rxtx/rxtx_2.2.0.bb
> +++ b/recipes-extended/rxtx/rxtx_2.2.0.bb
> @@ -28,7 +28,7 @@ S = "${WORKDIR}/rxtx-2.2pre2"
>  
>  INSANE_SKIP_${JPN} += "dev-so"
>  
> -inherit autotools-brokensep java-library
> +inherit autotools-brokensep java-library remove-libtool

As mentioned in the below thread, remove-libtool class is supposed to be
distro inheritted and generally not a per-recipe one.

http://comments.gmane.org/gmane.comp.handhelds.openembedded/73840

Since this fixes a valid QA error, pushed to master-next.

>  PACKAGE_ARCH = "${TUNE_PKGARCH}"
>  
>  JARFILENAME = "RXTXcomm.jar"
> --

Best Regards,
Maxin

