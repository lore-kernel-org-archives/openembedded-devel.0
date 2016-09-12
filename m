Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 83D81731FC
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Sep 2016 08:20:49 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u8C8KoiA019628
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Sep 2016 01:20:50 -0700 (PDT)
Received: from [128.224.162.240] (128.224.162.240) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 12 Sep 2016 01:20:49 -0700
To: <openembedded-devel@lists.openembedded.org>
References: <20160911073720.15288-1-Martin.Jansa@gmail.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <e3d0879e-43a1-a5ea-bda5-bda3a4ef9a99@windriver.com>
Date: Mon, 12 Sep 2016 16:20:48 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <20160911073720.15288-1-Martin.Jansa@gmail.com>
Subject: Re: [meta-oe][PATCH] xfsprogs: blacklist, needs upgrade to stay compatible with default kernel
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
X-List-Received-Date: Mon, 12 Sep 2016 08:20:51 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit


Hi Martin,

I sent an upgrade for xfsprogs just now:

[oe] [meta-filesystems][PATCH 1/2] xfsprogs: 3.2.3 -> 4.7.0

// Robert

On 09/11/2016 03:37 PM, Martin Jansa wrote:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta-filesystems/recipes-utils/xfsprogs/xfsprogs_3.2.3.bb | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_3.2.3.bb b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_3.2.3.bb
> index f38239c..460a898 100644
> --- a/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_3.2.3.bb
> +++ b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_3.2.3.bb
> @@ -50,3 +50,6 @@ do_install () {
>      # needed for xfsdump
>      oe_runmake install-dev
>  }
> +
> +# http://errors.yoctoproject.org/Errors/Details/83236/
> +PNBLACKLIST[xfsprogs] ?= "BROKEN: Needs upgrade to 4.5.0 version to be compatible with Kernel uapi changes from 4.5"
>

