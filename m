Return-Path: <prvs=7309f93ae=Richard.Leitner@skidata.com>
Received: from mail2.skidata.com (mail2.skidata.com [91.230.2.91])
	by mail.openembedded.org (Postfix) with ESMTP id CEB7E78889
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Jul 2018 05:36:03 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.51,368,1526335200"; 
   d="scan'208";a="1560193"
To: <openembedded-devel@lists.openembedded.org>
References: <20180717192023.77954-1-mmcclain@uplogix.com>
From: Richard Leitner <richard.leitner@skidata.com>
Message-ID: <e10e814a-c8ce-3edd-015e-72ce90397b2b@skidata.com>
Date: Wed, 18 Jul 2018 07:36:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180717192023.77954-1-mmcclain@uplogix.com>
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex3srv.skidata.net (192.168.111.81) To
	sdex5srv.skidata.net (192.168.111.83)
Subject: Re: [meta-java][PATCH] openjdk-8: 'do_unpack_remove_X11_wrappers' confuses pyro bitbake parser
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
X-List-Received-Date: Wed, 18 Jul 2018 05:36:04 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi,
thank you for your patch! Please see my comments below...

On 07/17/2018 09:20 PM, Matthew McClain wrote:
> Renaming the function to anything else allows the recipe to be parsed.  The
> problem appears to be the word "_remove_".  This affects both the sumo and
> master branches.

In the subject you say it causes problems with the pyro branch, but here 
you say sumo and master... So which branches are really affected? Can 
you please adapt the title/commit-message accordingly?

Do you (or somebody else here) have any clue why the "remove" keyword 
triggers such a problem (since pyro?).

If I get it right the mentioned parsing error only occurs when we have 
no X11 (in PACKAGECONFIG). Is that true? Can you please mention it in 
the commit message?

> 
> Signed-off-by: Matthew McClain <mmcclain@uplogix.com>
> ---
>   recipes-core/openjdk/openjdk-8-common.inc | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes-core/openjdk/openjdk-8-common.inc b/recipes-core/openjdk/openjdk-8-common.inc
> index b2020c3..fbb10be 100644
> --- a/recipes-core/openjdk/openjdk-8-common.inc
> +++ b/recipes-core/openjdk/openjdk-8-common.inc
> @@ -39,7 +39,7 @@ do_unpack_extract_submodules () {
>       tar xjf ${WORKDIR}/${NASHORN_FILE} --transform "s,-${NASHORN_CHANGESET},,g"
>   }
>   
> -do_unpack_remove_X11_wrappers() {
> +do_unpack_delete_X11_wrappers() {
>       find ${S}/jdk/src/solaris/classes/sun/awt/X11 -maxdepth 1 -name '*.java' -delete
>   }
>   
> @@ -153,7 +153,7 @@ def jdk_configure_options(d):
>       return options[3]
>   
>   do_unpack[postfuncs] += "do_unpack_extract_submodules"
> -do_unpack[postfuncs] += "${@bb.utils.contains('PACKAGECONFIG', 'x11', '', 'do_unpack_remove_X11_wrappers', d)}"
> +do_unpack[postfuncs] += "${@bb.utils.contains('PACKAGECONFIG', 'x11', '', 'do_unpack_delete_X11_wrappers', d)}"
>   
>   do_configure_prepend() {
>           export ${@jdk_environment_options(d)}
> 

Otherwise the patch itself looks fine to me.

Thank you!

regards;Richard.L

