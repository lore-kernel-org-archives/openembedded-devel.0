Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 193257C68F
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Apr 2019 08:56:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 44Z0Ls6QKYz4T;
	Wed,  3 Apr 2019 10:56:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1554281814;
	bh=j5nrAy8rqa+ei8wEv2yHcWbIu+Pg6PGpQ74k8aKXjWg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rqKInGOw8OIUA5rtUg5+7ZqOqpCfwGZqYHtYqQFC1WTDwgI22jBTvCYgi92JBcq8W
	LyeLD6vjpy5SEFnx9q+NWpxo5E4iVSsPoGHnvP0sJSlFJIcFPHI1iPxZ2K9tBRQ8Mn
	Y+DghfkCogSpBIqglZyg+lotptrdZvKhKCSodbo78n4L5FJ2PwRNXK7wGxKk7XmEBh
	nuN6bIsZ6KtJ7feAb2e0ZJ51j3aL56TiliOEGClRjBT/5ulrLvxPPDiGBmxcciQgPw
	uvb+95FS6DwA8OoCwS1WINWYJrqQtCTRxf3Mp+gcvCJYe/je1n/SzurHufFSCGE9Ad
	OYDx85qLzPN1U08YchXKJV2q/UqCJ06tU15j1R/tF+BjAem64u4O6WAfFxvL9vkCrc
	F3N6ZGvUZidwcOPzk2WtXCDDJpyoVMODfsOQTvk2d4x1p7hEVxb7TAA51IFhL5bQXP
	e8C87511uRZGdO7tCaFGCYK+AV98OpkAiE1+niLCs4tVcaMznDgWIkqxT5gugbtv8/
	3Op97sOhrBuNmznO8Rzeqm/m2sf+uUvUdOCP4YAUPamo08AIfawMCBTrLEnXoVehyG
	/BctzrHn41AfF/i3s0iSgaeWudrVF6O8yEAWAwqA6wXV5YDGb8YWfnKL+Upz6APdtJ
	Y82mFp78fDJesPyYKLI8SLPI=
Date: Wed, 3 Apr 2019 11:56:51 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Vincent Prince <vincent.prince.fr@gmail.com>
Message-ID: <20190403085651.GA6467@localhost>
References: <1554280123-19112-1-git-send-email-vincent.prince.fr@gmail.com>
	<1554280123-19112-2-git-send-email-vincent.prince.fr@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1554280123-19112-2-git-send-email-vincent.prince.fr@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 2/3] cppzmq: bump version 4.2.3 => 4.3.1
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
X-List-Received-Date: Wed, 03 Apr 2019 08:56:54 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Apr 03, 2019 at 10:28:42AM +0200, Vincent Prince wrote:
> Signed-off-by: Vincent Prince <vincent.prince.fr@gmail.com>
> ---
>  meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb b/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb
> index 9aff59c..2f99417 100644
> --- a/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb
> +++ b/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb
> @@ -4,8 +4,8 @@ LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=db174eaf7b55a34a7c89551197f66e94"
>  DEPENDS = "zeromq"
>  
> -SRCREV = "6aa3ab686e916cb0e62df7fa7d12e0b13ae9fae6"
> -PV = "4.2.3+git${SRCPV}"
> +SRCREV = "213da0b04ae3b4d846c9abc46bab87f86bfb9cf4"
> +PV = "4.3.1+git${SRCPV}"
>...

These are the actual releases, PV should not say +git${SRCPV}
for them.

Not a bug you introduced, but can be fixed now.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


