Return-Path: <maxin.john@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id F2CBB60620
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Aug 2016 12:58:01 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga103.jf.intel.com with ESMTP; 24 Aug 2016 05:58:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,570,1464678000"; d="scan'208";a="870423396"
Received: from mbabyjoh-desk.fi.intel.com (HELO
	mbabyjoh-desk.ger.corp.intel.com) ([10.237.72.71])
	by orsmga003.jf.intel.com with ESMTP; 24 Aug 2016 05:58:00 -0700
Date: Wed, 24 Aug 2016 15:57:29 +0300
From: "Maxin B. John" <maxin.john@intel.com>
To: Kyle Russell <bkylerussell@gmail.com>
Message-ID: <20160824125729.GB13684@mbabyjoh-desk.ger.corp.intel.com>
References: <1471643882-14235-1-git-send-email-bkylerussell@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1471643882-14235-1-git-send-email-bkylerussell@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-java][PATCH 1/2] rhino-native should depend on classpath-native
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
X-List-Received-Date: Wed, 24 Aug 2016 12:58:02 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Kyle,

On Fri, Aug 19, 2016 at 05:58:01PM -0400, Kyle Russell wrote:
> rhino's do_compile task passes
> ${STAGING_DATADIR_NATIVE}/classpath/glibj.zip to javac.  This glibj.zip
> archive comes from the classpath-native package.
> 
> Signed-off-by: Kyle Russell <bkylerussell@gmail.com>
> ---
>  recipes-core/rhino/rhino_1.7r4.bb | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/recipes-core/rhino/rhino_1.7r4.bb b/recipes-core/rhino/rhino_1.7r4.bb
> index 7898d23..30d5a62 100644
> --- a/recipes-core/rhino/rhino_1.7r4.bb
> +++ b/recipes-core/rhino/rhino_1.7r4.bb
> @@ -2,6 +2,8 @@ DESCRIPTION = "Lexical analyzer generator for Java"
>  LICENSE = "MPL-2.0"
>  LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=8e2372bdbf22c99279ae4599a13cc458"
>  
> +DEPENDS_class-native += "classpath-native"
> +
>  BBCLASSEXTEND = "native"
>  
>  inherit java-library

Pushed to master-next. Thanks.

Best Regards,
Maxin

