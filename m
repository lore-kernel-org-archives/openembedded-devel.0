Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id B08F7778FE
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Mar 2017 18:45:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id C6E9C20BA7;
	Tue, 14 Mar 2017 18:45:53 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 4Y6EFjavqiE3; Tue, 14 Mar 2017 18:45:53 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id A5A53209A4;
	Tue, 14 Mar 2017 18:45:52 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 477921623E8; Tue, 14 Mar 2017 14:45:52 -0400 (EDT)
Date: Tue, 14 Mar 2017 14:45:52 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: kai.kang@windriver.com
Message-ID: <20170314184552.GL15664@denix.org>
References: <20170313032921.8669-1-kai.kang@windriver.com>
	<20170313032921.8669-2-kai.kang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <20170313032921.8669-2-kai.kang@windriver.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 1/5] fuse: update HOMEPAGE and SRC_URI
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
X-List-Received-Date: Tue, 14 Mar 2017 18:45:54 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 13, 2017 at 11:29:17AM +0800, kai.kang@windriver.com wrote:
> From: Kai Kang <kai.kang@windriver.com>
> 
> The homepage of fuse is redirected to github. So update HOMEPAGE and
> SRC_URI.
> 
> Correct license LGPLv2 with LGPLv2.1 at same time.
> 
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  meta-filesystems/recipes-support/fuse/fuse_2.9.4.bb | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/meta-filesystems/recipes-support/fuse/fuse_2.9.4.bb b/meta-filesystems/recipes-support/fuse/fuse_2.9.4.bb
> index 153fcb4..b34efa1 100644
> --- a/meta-filesystems/recipes-support/fuse/fuse_2.9.4.bb
> +++ b/meta-filesystems/recipes-support/fuse/fuse_2.9.4.bb
> @@ -4,13 +4,13 @@ DESCRIPTION = "FUSE (Filesystem in Userspace) is a simple interface for userspac
>                 also aims to provide a secure method for non privileged users to \
>                 create and mount their own filesystem implementations. \
>                "
> -HOMEPAGE = "http://fuse.sf.net"
> +HOMEPAGE = "https://github.com/libfuse/libfuse"
>  SECTION = "libs"
> -LICENSE = "GPLv2 & LGPLv2"
> +LICENSE = "GPLv2 & LGPLv2.1"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
>                      file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
>  
> -SRC_URI = "${SOURCEFORGE_MIRROR}/fuse/fuse-${PV}.tar.gz \
> +SRC_URI = "https://github.com/libfuse/libfuse/releases/download/fuse_2_9_4/${BP}.tar.gz \

Can you use ${@d.getVar('PV').replace('.', '_')} in the path here ^^^^^^^^^
Similar to what you did in lmsensors...


>             file://gold-unversioned-symbol.patch \
>             file://aarch64.patch \
>             file://0001-fuse-fix-the-return-value-of-help-option.patch \
> -- 
> 2.10.1
> 
> -- 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

