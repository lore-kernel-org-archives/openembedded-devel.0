Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 136136D545
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 May 2019 11:15:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45F4k26xZFz43;
	Thu, 30 May 2019 13:15:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1559214907;
	bh=nHDgz53L/gM43ZBvfnoRm7IVklAVteRrCOfHIYqfEmY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XuNJlQTlulRrJEldJ6bnuhlVkP7Ucverq2QUDyTrJaK9tW+kGBSiny3kHi8lz+es7
	fmERQxiY/CmuNdO6QOi+6QW7RTLilYEIu8BjV2pNmLhjNzjtrOdPF+YvT/UiZTvAZv
	iinGWYEU6+ybWFlFdvX3EFmpsyjKeU7wPoDUCfQwV+yAGRfiRMboV45XoetHWh7BV8
	/GAd9meQkjlnKfXiKqarE2/WtO6omO/T3YO8aeP9oyS44E5mVOsd+wFG7g6+qGiXOt
	14s6hEjNTV/ML/nxFlYy3ETDGPiRgE2nqwsNyo85LIUZTL5m7FxLVVdT4WOOsbFpGS
	EwJ8DD+zDkY7eJJnWHb/31Gvcf+4rs94FGrVcjuUH3cADg+0HlDXfvtpkhmw9Bbctc
	v7mkyZTrDzGIl4jHBjGi8uXLjOnLNVTyJ0vMNx+A1iQu12Db2r/jjem7Q1ekambCuR
	8uvlM3Y2SOQNS5gqDrkdGLqOI26EDIERspQ1lYAI8u+BkYIfyf2+R3/J6OrzDZRSAs
	7arm5SBTA/IhnvDs9cMKQGkseRsYn9k5fu+nou50yqhyG0esMqi6ftE4mfZuWdr2c1
	1sxDxlCeEIo7f5cIPCiZJQ0NcCPDCiomhzvxoCkLpiLuwNRnhGSfXvSg2SxhHMa86y
	X/JwOFSpXKVXgMNv7tArxLfw=
Date: Thu, 30 May 2019 14:14:57 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Paolo Valente <paolo.valente@linaro.org>
Message-ID: <20190530111457.GA20599@localhost>
References: <20190530102539.65935-1-paolo.valente@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20190530102539.65935-1-paolo.valente@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: ulf.hansson@linaro.org, openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] s-suite: push SRCREV to version 3.4
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
X-List-Received-Date: Thu, 30 May 2019 11:15:08 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, May 30, 2019 at 12:25:39PM +0200, Paolo Valente wrote:
> Signed-off-by: Paolo Valente <paolo.valente@linaro.org>
> ---
>  meta-oe/recipes-benchmark/s-suite/s-suite_git.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-oe/recipes-benchmark/s-suite/s-suite_git.bb b/meta-oe/recipes-benchmark/s-suite/s-suite_git.bb
> index 706a55e11..db1945dd0 100644
> --- a/meta-oe/recipes-benchmark/s-suite/s-suite_git.bb
> +++ b/meta-oe/recipes-benchmark/s-suite/s-suite_git.bb
> @@ -2,8 +2,8 @@ SUMMARY = "Small collection of benchmarks for storage I/O"
>  LICENSE = "GPLv2"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=b529aaa6a0c50f15d29f89609b5c22f3"
>  
> -SRCREV = "262227ec9de4be1ab41d9918d32ceb773089f1dd"
> -PV = "3.2+git${SRCPV}"
> +SRCREV = "8d22ab8a4cc1484622c47ac9c5944fb9a61a5c0f"
> +PV = "3.4+git${SRCPV}"
>  SRC_URI = "git://github.com/Algodev-github/S.git;protocol=https;branch=master"
>...

The problem was already there before, but the upgrade gives the 
opportunity to get rid of the +git${SRCPV}, which is incorrect
when exactly the release is packaged.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


