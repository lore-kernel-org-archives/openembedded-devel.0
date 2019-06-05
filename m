Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 322F17D6A2
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Jun 2019 17:27:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45Jwj7041Yz3L;
	Wed,  5 Jun 2019 19:27:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1559755659;
	bh=0PPtrE2cwYJigXWBGpVCMBIN6injD9EKFwR1ZFE5xh4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G0gSnk1ctDUkJZeHBN/ShJ5dRQw9qtaH+nfL21H2wHcAj/bzoIe1ujIsB9gwaZk6q
	mZoy4eqbsTwhunee5SbIOXLYQVlA+cJWKGZbC0TnoxuK1KzwiZugJ3o8CgmLQdaj8D
	92gw6TEuFxc4RqrU238qbpJ+ZQ8nep346NZDHU2YoShIzK6vSYPyyQDXQBa0VtK3vv
	8aoK8fvrPmj9LITb5h62dKPE1mPYAM3WIr/sWELIYNbDC446b+8T/KpBzGfrlg/1uC
	ECnGRzRFoiFoit+OFgivgYxPnXhQS2oOqAi2Qo1r9cjrL2Ja6xMa9fiL+fsjVAu4Lt
	SFcbyjOEy+OqT8nY6izUu23VgSgCQmUrCRMS+gMWkbBWg0rxB71HjPe2TfLBkoc5AB
	fnSQiwFWUHFDGH08/gqCH+e80bYts1XlLIintxwwKkSpk0NJqA8Rl72s93AHOWwrkd
	OtbfTCnU8Y1eDG3i7hiF112tJbP501X1zzukSjschf0qvYk1fSq1GHQW7f6bpL/aVn
	tlMSUwjtSVYDS82S1MBFzwQ1mE6xpvcqOPK9URw7pNKmeMxpmryXdQ6z19n06R6VRy
	kYgo8nUjzfSaCPHLckFHB9++UT8nZqzaduYsNVwNVWdfImduEspW4pbjxu/vyEQwXy
	+diU5tt32hYTf1Xo/sQ2LWdI=
Date: Wed, 5 Jun 2019 20:27:31 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Pascal Bach <pascal.bach@siemens.com>
Message-ID: <20190605172731.GA7942@localhost>
References: <20190605141114.5576-1-pascal.bach@siemens.com>
MIME-Version: 1.0
In-Reply-To: <20190605141114.5576-1-pascal.bach@siemens.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] protobuf: 3.6.1 -> 3.8.0
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
X-List-Received-Date: Wed, 05 Jun 2019 17:27:39 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Jun 05, 2019 at 04:11:14PM +0200, Pascal Bach wrote:
> Simple update to latest release
> 
> Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
> ---
>  .../protobuf/{protobuf_3.6.1.bb => protobuf_3.8.0.bb}                 | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-oe/recipes-devtools/protobuf/{protobuf_3.6.1.bb => protobuf_3.8.0.bb} (96%)
> 
> diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_3.6.1.bb b/meta-oe/recipes-devtools/protobuf/protobuf_3.8.0.bb
> similarity index 96%
> rename from meta-oe/recipes-devtools/protobuf/protobuf_3.6.1.bb
> rename to meta-oe/recipes-devtools/protobuf/protobuf_3.8.0.bb
> index cf72d9ca7..7148954ce 100644
> --- a/meta-oe/recipes-devtools/protobuf/protobuf_3.6.1.bb
> +++ b/meta-oe/recipes-devtools/protobuf/protobuf_3.8.0.bb
> @@ -12,9 +12,9 @@ DEPENDS_append_class-target = " protobuf-native"
>  
>  PV .= "+git${SRCPV}"

This is (and was previously) exactly the release,
so upgrading gives the opportunity to remove this
misleading +git addition.

> -SRCREV = "48cb18e5c419ddd23d9badcfe4e9df7bde1979b2"
> +SRCREV = "09745575a923640154bcf307fba8aedff47f240a"
>  
> -SRC_URI = "git://github.com/google/protobuf.git;branch=3.6.x \
> +SRC_URI = "git://github.com/google/protobuf.git;branch=master \
>...

branch=3.8.x would look more logical to me here.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


