Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id DA72E77FF9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Jun 2017 01:42:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v5S1gWSI009395
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Jun 2017 18:42:35 -0700 (PDT)
Received: from [172.25.44.7] (172.25.44.7) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 27 Jun 2017 18:42:32 -0700
To: <openembedded-devel@lists.openembedded.org>
References: <1498612870-16566-1-git-send-email-Randy.MacLeod@windriver.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <d72d6264-8b6c-33ae-9fe8-c784e266a864@windriver.com>
Date: Tue, 27 Jun 2017 21:42:31 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.1
MIME-Version: 1.0
In-Reply-To: <1498612870-16566-1-git-send-email-Randy.MacLeod@windriver.com>
X-Originating-IP: [172.25.44.7]
Subject: Re: [PATCH] binutils: update SRCREV to fix powerpc gold link bug -- wrong list, ignore.
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
X-List-Received-Date: Wed, 28 Jun 2017 01:42:35 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 2017-06-27 09:21 PM, Randy MacLeod wrote:
> Update to the latest commit on the 2.28 branch to pick up:
>     a3e00a8 [GOLD] Avoid duplicate PLT stub symbols on ppc32
> along with several backported bug fixes for arm*, etc.
> 
> This resolves the systemd link error for qemuppc
> with the error message:
>     .../powerpc-oe-linux-ld.gold:
>     error: invalid STB_LOCAL symbol in external symbols
>     error: linker defined: multiple definition of '00000001.plt_call.memcpy+8000'
>     command line: previous definition here
> 
> described in:
> 
> [YOCTO #11696]
> 
> Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
> ---
>   meta/recipes-devtools/binutils/binutils-2.28.inc | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-devtools/binutils/binutils-2.28.inc b/meta/recipes-devtools/binutils/binutils-2.28.inc
> index 47bfa1a..52f5d92 100644
> --- a/meta/recipes-devtools/binutils/binutils-2.28.inc
> +++ b/meta/recipes-devtools/binutils/binutils-2.28.inc
> @@ -18,7 +18,8 @@ BINUPV = "${@binutils_branch_version(d)}"
>   
>   UPSTREAM_CHECK_GITTAGREGEX = "binutils-(?P<pver>\d+_(\d_?)*)"
>   
> -SRCREV = "cb44d42ce6ef0c7a4eed7e2a3c272ac102166850"
> +#SRCREV = "cb44d42ce6ef0c7a4eed7e2a3c272ac102166850"
> +SRCREV = "7ea1464297eadebe62aae92ad9bebb33f92c2454"
>   SRC_URI = "\
>        git://sourceware.org/git/binutils-gdb.git;branch=binutils-${BINUPV}-branch;protocol=git \
>        file://0004-Point-scripts-location-to-libdir.patch \
> 


-- 
# Randy MacLeod. SMTS, Linux, Wind River
Direct: 613.963.1350 | 350 Terry Fox Drive, Suite 200, Ottawa, ON, 
Canada, K2K 2W5

