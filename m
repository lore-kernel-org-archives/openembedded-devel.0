Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 67A917844A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jun 2017 10:00:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v5GA0HN7017919
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 16 Jun 2017 03:00:17 -0700 (PDT)
Received: from [128.224.162.160] (128.224.162.160) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 16 Jun 2017 03:00:17 -0700
To: Martin Jansa <martin.jansa@gmail.com>
References: <20170616030445.19533-1-liezhi.yang@windriver.com>
	<CA+chaQckrnWx9sMqP+f0HTziGgWBB-8qMFtrYdSLBxEFiD4=fA@mail.gmail.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <fb65895e-ee05-ebb4-3318-e1a2738eed2a@windriver.com>
Date: Fri, 16 Jun 2017 18:00:15 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <CA+chaQckrnWx9sMqP+f0HTziGgWBB-8qMFtrYdSLBxEFiD4=fA@mail.gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-filesystems][PATCH] fuse: fix SRC_URI
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
X-List-Received-Date: Fri, 16 Jun 2017 10:00:19 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 06/16/2017 04:13 PM, Martin Jansa wrote:
> It's already in master for last 2 days:
> http://git.openembedded.org/meta-openembedded/commit/?id=d3dd8bc3721f3958eb7ddeb026f7221d48daa986

Sorry, I didn't see that before I sent the patch.

// Robert

>
> On Fri, Jun 16, 2017 at 4:04 AM, Robert Yang <liezhi.yang@windriver.com
> <mailto:liezhi.yang@windriver.com>> wrote:
>
>     ${P} -> ${BP}, otherwise it would fail when multilib.
>
>     Signed-off-by: Robert Yang <liezhi.yang@windriver.com
>     <mailto:liezhi.yang@windriver.com>>
>     ---
>      meta-filesystems/recipes-support/fuse/fuse_2.9.7.bb <http://fuse_2.9.7.bb>
>     | 2 +-
>      1 file changed, 1 insertion(+), 1 deletion(-)
>
>     diff --git a/meta-filesystems/recipes-support/fuse/fuse_2.9.7.bb
>     <http://fuse_2.9.7.bb> b/meta-filesystems/recipes-support/fuse/fuse_2.9.7.bb
>     <http://fuse_2.9.7.bb>
>     index e66f3cd..87292fe 100644
>     --- a/meta-filesystems/recipes-support/fuse/fuse_2.9.7.bb <http://fuse_2.9.7.bb>
>     +++ b/meta-filesystems/recipes-support/fuse/fuse_2.9.7.bb <http://fuse_2.9.7.bb>
>     @@ -10,7 +10,7 @@ LICENSE = "GPLv2 & LGPLv2"
>      LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
>                          file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
>
>     -SRC_URI =
>     "https://github.com/libfuse/libfuse/releases/download/${P}/${P}.tar.gz
>     <https://github.com/libfuse/libfuse/releases/download/${P}/${P}.tar.gz> \
>     +SRC_URI =
>     "https://github.com/libfuse/libfuse/releases/download/${BP}/${BP}.tar.gz
>     <https://github.com/libfuse/libfuse/releases/download/${BP}/${BP}.tar.gz> \
>                 file://gold-unversioned-symbol.patch \
>                 file://aarch64.patch \
>                 file://0001-fuse-fix-the-return-value-of-help-option.patch \
>     --
>     2.10.2
>
>     --
>     _______________________________________________
>     Openembedded-devel mailing list
>     Openembedded-devel@lists.openembedded.org
>     <mailto:Openembedded-devel@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>     <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>
>
>

