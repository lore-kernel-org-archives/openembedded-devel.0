Return-Path: <maxin.john@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id B252077085
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Oct 2015 11:40:40 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 15 Oct 2015 04:40:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,685,1437462000"; d="scan'208";a="827554528"
Received: from mbabyjoh-mobl.fi.intel.com ([10.237.72.71])
	by fmsmga002.fm.intel.com with ESMTP; 15 Oct 2015 04:40:40 -0700
Date: Thu, 15 Oct 2015 09:54:19 +0300
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20151015065419.GA13754@mbabyjoh-mobl.fi.intel.com>
References: <1444905967-8862-1-git-send-email-erkka.kaaria@intel.com>
MIME-Version: 1.0
In-Reply-To: <1444905967-8862-1-git-send-email-erkka.kaaria@intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-java][PATCH] cacao-initial-native: Fix sed matching
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
X-List-Received-Date: Thu, 15 Oct 2015 11:40:42 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi,

On Thu, Oct 15, 2015 at 01:46:07PM +0300, Erkka K‰‰ri‰ wrote:
> The recipe uses sed to patch src/scripts/java.in so that it execs cacao-initial
> instead of cacao. However, if configure step is run again, -initial is appended
> again to the string, leading to 'exec cacao-initial-initial'. This causes the
> build to fail.
> 
> This is fixed by changing the sed command to consider larger portion of the
> source string. This ensures that the -initial is only appended once.
> 
> Signed-off-by: Erkka K‰‰ri‰ <erkka.kaaria@intel.com>
> ---
>  recipes-core/cacao/cacao-initial-native_0.98.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/recipes-core/cacao/cacao-initial-native_0.98.bb b/recipes-core/cacao/cacao-initial-native_0.98.bb
> index 72c6246..ec7fbdb 100644
> --- a/recipes-core/cacao/cacao-initial-native_0.98.bb
> +++ b/recipes-core/cacao/cacao-initial-native_0.98.bb
> @@ -35,7 +35,7 @@ export JAR="fastjar"
>  
>  do_configure_append() {
>    # Fix the executable name in the wrapper script.
> -  sed -i -e "s|exec cacao|exec cacao-initial|" src/scripts/java.in
> +  sed -i -e "s|exec cacao \\$|exec cacao-initial \\$|" src/scripts/java.in
>  }
>  
>  SRC_URI[md5sum] = "8b8907c8b925761c9410bcadb9705346"
> -- 
> 2.1.4

Good catch. Pushed, Thanks!

Best Regards,
Maxin

