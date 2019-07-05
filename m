Return-Path: <naveen.kumar.saini@intel.com>
X-Greylist: delayed 427 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 05 Jul 2019 02:06:30 UTC
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 270307E539
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Jul 2019 02:06:30 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Jul 2019 18:59:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,453,1557212400"; d="scan'208";a="169558891"
Received: from optimus-prime.png.intel.com (HELO [172.30.199.130])
	([172.30.199.130])
	by orsmga006.jf.intel.com with ESMTP; 04 Jul 2019 18:59:22 -0700
To: Liwei Song <liwei.song@windriver.com>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
References: <1562291023-261126-1-git-send-email-liwei.song@windriver.com>
From: "Saini, Naveen Kumar" <naveen.kumar.saini@intel.com>
Message-ID: <32b2fbe7-f358-474a-d71a-2eb82e9b834e@intel.com>
Date: Fri, 5 Jul 2019 10:01:01 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1562291023-261126-1-git-send-email-liwei.song@windriver.com>
Subject: Re: [meta-oe][PATCH v2] pm-graph: package the pm-graph files
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
X-List-Received-Date: Fri, 05 Jul 2019 02:06:30 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 7/5/19 9:43 AM, Liwei Song wrote:
> package /usr/lib/pm-grap and /bin/* files created by pm-graph
> to aviod "Files were installed but not shipped in any package"
> error.
> 
> Signed-off-by: Liwei Song <liwei.song@windriver.com>
> ---
>   meta-oe/recipes-kernel/pm-graph/pm-graph_5.3.bb | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/meta-oe/recipes-kernel/pm-graph/pm-graph_5.3.bb b/meta-oe/recipes-kernel/pm-graph/pm-graph_5.3.bb
> index ea12e054d3ab..00301298309e 100644
> --- a/meta-oe/recipes-kernel/pm-graph/pm-graph_5.3.bb
> +++ b/meta-oe/recipes-kernel/pm-graph/pm-graph_5.3.bb
> @@ -18,3 +18,6 @@ do_install() {
>   }
>   
>   RDEPENDS_${PN} += "python-core python-threading python-datetime python-subprocess python-compression"
> +
> +FILES_${PN} += "${nonarch_libdir}/pm-graph \
This too not required. Please have a look at
https://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/conf/bitbake.conf

Could you share your error !
> +"
> 

