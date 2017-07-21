Return-Path: <maxin.john@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id CDF58783FE
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Jul 2017 10:52:16 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Jul 2017 03:52:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,389,1496127600"; d="scan'208";a="881217012"
Received: from mbabyjoh-desk.fi.intel.com (HELO
	mbabyjoh-desk.ger.corp.intel.com) ([10.237.72.84])
	by FMSMGA003.fm.intel.com with ESMTP; 21 Jul 2017 03:52:16 -0700
Date: Fri, 21 Jul 2017 13:53:15 +0300
From: "Maxin B. John" <maxin.john@intel.com>
To: "S. Lockwood-Childs" <sjl@vctlabs.com>,
	openembedded-devel@lists.openembedded.org
Message-ID: <20170721105314.GA31758@mbabyjoh-desk.ger.corp.intel.com>
References: <20170712083634.GZ22446@vctlabs.com>
MIME-Version: 1.0
In-Reply-To: <20170712083634.GZ22446@vctlabs.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-java][PATCH] java-library.bbclass: compatibility with per-recipe sysroots
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
X-List-Received-Date: Fri, 21 Jul 2017 10:52:17 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Wed, Jul 12, 2017 at 01:36:34AM -0700, S. Lockwood-Childs wrote:
> The removebinaries task was intended to remove pre-built .jar and .class files
> from the unpacked source, but when per-recipe sysroots were implemented and
> ended up under WORKDIR, .jar or .class in those sysroots inadvertently started 
> getting killed as well.
> 
> For instance, ${WORKDIR}/recipe-sysroot-native/usr/share/java/ecj-bootstrap.jar
> was deleted when attempting to build jlex-native... which made javac in
> that sysroot rather unhappy.
> 
> Solve by excluding both recipe-sysroot and recipe-sysroot-native dirs
> from the search-and-destroy operation.
> 
> Signed-off-by: S. Lockwood-Childs <sjl@vctlabs.com>
> ---
>  classes/java-library.bbclass | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/classes/java-library.bbclass b/classes/java-library.bbclass
> index 58d5a40..ce1cd28 100644
> --- a/classes/java-library.bbclass
> +++ b/classes/java-library.bbclass
> @@ -50,8 +50,10 @@ ALTJARFILENAMES = "${BPN}.jar"
>  # Java "source" distributions often contain precompiled things
>  # we want to delete first.
>  do_removebinaries() {
> -  find ${WORKDIR} -name "*.jar" -exec rm {} \;
> -  find ${WORKDIR} -name "*.class" -exec rm {} \;
> +  find ${WORKDIR} ! -path "${RECIPE_SYSROOT}/*" ! -path "${RECIPE_SYSROOT_NATIVE}/*" \
> +                  -name "*.jar" -exec rm {} \;
> +  find ${WORKDIR} ! -path "${RECIPE_SYSROOT}/*" ! -path "${RECIPE_SYSROOT_NATIVE}/*" \
> +                  -name "*.class" -exec rm {} \;
>  }
>  
>  addtask removebinaries after do_unpack before do_patch
> -- 
> 1.9.4
>

Thanks, Pushed to master.

Best Regards,
Maxin

