Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 010146D73C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Apr 2019 06:11:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 44pCkx2m72z4V;
	Tue, 23 Apr 2019 08:11:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1555999897;
	bh=S50/OAjxX//cC7kzzTu2JMf8/eVJokb+zV5RBJtJNU4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a1IZyVkF8faL4CaA6gdOYA/D9R6ILcg9GrcoG/8cFv8hCxymd2f6U5fXK82A5wZ78
	Hp56A7yWUjn4K/iMYoUuupmEon2sEZqaPYl86VhxpbShadeKSetLcJHbpoecrfo2vW
	Ov7FuJ2HNT0ipx05YaRT4Titfyr6Pgc2Fpq5MiblvtG1+DL9cPmFB9nXOGebQMOKYW
	Wrq6WB66fXr2WtGU+ERcHzgCKvBMJm6bO2mvgYVTd9yB0IU/WQAmYbYcdBILE+wTb/
	30B0mRpBlUC4cqqzSSeO89JgLN0p2Jmz2Medwr5af8ftkz7FOifIIDTpNVCcgwJVcY
	N/YZNQ0W24H2NcFG02u17rMhD5wn6PoVIy7QPEgJW6RvIMrDSkD4xQ++YkSOzZL3b/
	i5q9fz9tPQWLTeDkhxSJaPGn02rXAPgBOO70FJaXxTm+5ETac2l3koaWIl7tW5JPeZ
	hdiUc7wySEytMPJlEmvmNoU8SohmUh37tPwTRE23lyxTVX2csUEglEksWjjQMY9+3w
	MS0VhK1/OpGrxhNRBKr6wBAVC9j7e2AXE/3vZ2YX+sDh0kDgH0RdEzZGnQPvCxJVzZ
	vNk9WrX23xhwOPmmMjqJaCCZn3MNvS51hbnwI/z4GVjwatptCF7BI2WgyL9uBBNMMs
	qtOSTte+EhosQM9CgcjH5aCc=
Date: Tue, 23 Apr 2019 09:11:34 +0300
From: Adrian Bunk <bunk@stusta.de>
To: mingli.yu@windriver.com
Message-ID: <20190423061134.GE18826@localhost>
References: <20190422072218.94167-1-mingli.yu@windriver.com>
MIME-Version: 1.0
In-Reply-To: <20190422072218.94167-1-mingli.yu@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] hwdata: Upgrade to 0.322
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
X-List-Received-Date: Tue, 23 Apr 2019 06:11:37 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Mon, Apr 22, 2019 at 12:22:18AM -0700, mingli.yu@windriver.com wrote:
> From: Mingli Yu <mingli.yu@windriver.com>
> 
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  meta-oe/recipes-support/hwdata/hwdata_git.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-oe/recipes-support/hwdata/hwdata_git.bb b/meta-oe/recipes-support/hwdata/hwdata_git.bb
> index 8e8dbf5c8..f04e5c8d4 100644
> --- a/meta-oe/recipes-support/hwdata/hwdata_git.bb
> +++ b/meta-oe/recipes-support/hwdata/hwdata_git.bb
> @@ -5,8 +5,8 @@ SECTION = "System/Base"
>  LICENSE = "GPL-2.0+"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=1556547711e8246992b999edd9445a57"
>  
> -PV = "0.316+git${SRCPV}"
> -SRCREV = "803819aef862ded2ce0737cd3cf642c633b68c35"
> +PV = "0.322+git${SRCPV}"
> +SRCREV = "a65d28807d8f2446faa4734c758d1607f0a56ded"
>  SRC_URI = "git://github.com/vcrhonek/${BPN}.git"
>...

PV shouldn't contain +git when SRCREV is exactly the release.
That's already present in the old version, but should be fixed.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


