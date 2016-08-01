Return-Path: <maxin.john@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 9084465CBB
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Aug 2016 10:56:45 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 01 Aug 2016 03:56:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,454,1464678000"; d="scan'208";a="1017482775"
Received: from mbabyjoh-desk.fi.intel.com (HELO
	mbabyjoh-desk.ger.corp.intel.com) ([10.237.72.71])
	by fmsmga001.fm.intel.com with ESMTP; 01 Aug 2016 03:56:46 -0700
Date: Mon, 1 Aug 2016 13:56:27 +0300
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160801105626.GA30794@mbabyjoh-desk.ger.corp.intel.com>
References: <1469427417-45044-1-git-send-email-sven.ebenfeld@vaillant-group.com>
	<D56C992E15F8814CADE76D2D1AABFF603E43E242@vaderu05.vaillant.vhgroup.lan>
MIME-Version: 1.0
In-Reply-To: <D56C992E15F8814CADE76D2D1AABFF603E43E242@vaderu05.vaillant.vhgroup.lan>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-java][PATCH v3] openjdk-8: ignore wrong GCCVERSION-flag
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
X-List-Received-Date: Mon, 01 Aug 2016 10:56:49 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Sven,

On Mon, Aug 01, 2016 at 06:19:05AM +0000, Ebenfeld, Sven wrote:
> What is about this patch?
> I see it's archived but not merged. My builds of the fido branch are failing
> without this patch.

Pushed to master-next. Sorry for the delay.

> Best Regards,
> 
> Sven Ebenfeld
> IRE-S CoC Connectivity & Controls - Technology Advisor Network Technologies
> & Security
> Vaillant

Best Regards,
Maxin

> 
> -----Original Message-----
> From: Sven Ebenfeld [mailto:sven.ebenfeld@vaillant-group.com] 
> Sent: Monday, July 25, 2016 8:17 AM
> To: openembedded-devel@lists.openembedded.org
> Cc: Ebenfeld, Sven <sven.ebenfeld@vaillant-group.com>
> Subject: [meta-java][PATCH v3] openjdk-8: ignore wrong GCCVERSION-flag
> 
> During my recipe parsing, GCCVERSION in the cross case seems to be 'l' this
> leads to a ValueError during recipe parsing. Therefore check type before
> trying to parse the version flag.
> 
> Signed-off-by: Sven Ebenfeld <sven.ebenfeld@vaillant-group.com>
> ---
>  recipes-core/openjdk/openjdk-8-common.inc | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes-core/openjdk/openjdk-8-common.inc
> b/recipes-core/openjdk/openjdk-8-common.inc
> index 7ad802a..c2f9eb4 100644
> --- a/recipes-core/openjdk/openjdk-8-common.inc
> +++ b/recipes-core/openjdk/openjdk-8-common.inc
> @@ -271,8 +271,10 @@ def version_specific_cflags(d):
>          # doesn't work anyway.
>          version = d.getVar('GCCVERSION', expand=True)[0]
>  
> -    extraflags = d.getVar('FLAGS_GCC%d' % int(version), True) or ''
> -    return extraflags
> +    if version.isdigit():
> +        extraflags = d.getVar('FLAGS_GCC%d' % int(version), True) or ''
> +        return extraflags
> +    return ''
>  
>  CFLAGS_append = " ${@version_specific_cflags(d)}"
>  CXXFLAGS_append = " ${@version_specific_cflags(d)}"
> --
> 1.9.1
> 



> -- 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


