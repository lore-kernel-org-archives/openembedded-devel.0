Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id B9D246C0C0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Jul 2019 10:08:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45lTCJ57Twz23;
	Fri, 12 Jul 2019 12:08:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1562926109;
	bh=EaaY5ZIjze3f2fVVC7UmUItjICZEInf7M8yqdAMON+0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iaQb0O0T6CgnUjW+0KGzENtOQJe5/9/buLKtEltlMVntf2L/eN9SaJRAtarXaZp+s
	a26mEty/MRoYFnMJ0z8cClQlM689m0qUoUL2EmtEhhjfwSAiAyOEM3TbUNSTyG2s2W
	RNIZxA0A/uuwlz8yWPOzZDt6N8zZJsX0u86XuaumOK/gqbG9WKJSLWEJQ+aRRSzkhq
	cgGuMgeRHbTi5Ov6T1DhTTHcsYvtfL8K7TigQZG510ukUfPSBgmCcjSgJLQNgwKlmr
	uxrWTWJSWx0fpcSXbUIq5BCoEKaifPDMEtjhi2Qsb5s87ewNMYviu5E5D+wl4A/duX
	ZcBV+lsNdPXEQQW7bJYopJLRqCF7Sk5HdP1Dg1gHJ4tHLIZD1bQ85/74qDtsdGY+kx
	lxp6HipL6mRsUqx08X6RfBmbjQZBk2+kSU16JsZ6rYMpjFENApsHvH7RuiWwnPrKG9
	RoqzzgT/3r3iJ2CjoMgfg9GYi0Pa43tC0/7grP8iBIesiIr8PlktcmAKdLJg2NZijJ
	M+54Ee/8CHcCcuMOEEmP36hrg3g1e1QNmAD6ZscPwMRu1LDjMuq7dmCT4fLkiP1YYU
	mMnbSbVwl1+TQBCCzn5Y+okT2uSq36Iay7HBo99JePf+uyU43CMZ16rJSTtBJFLR2K
	2aSSeIlbrYqfD1Tus6JeR2HA=
Date: Fri, 12 Jul 2019 13:08:26 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Parthiban Nallathambi <parthitce@gmail.com>
Message-ID: <20190712100826.GB21468@localhost>
References: <20190712100135.456990-1-parthitce@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20190712100135.456990-1-parthitce@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] python3-matplotlib: add version 3.1.1
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
X-List-Received-Date: Fri, 12 Jul 2019 10:08:29 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Fri, Jul 12, 2019 at 12:01:35PM +0200, Parthiban Nallathambi wrote:
> Signed-off-by: Parthiban Nallathambi <parthitce@gmail.com>
> ---
>  .../python/python-matplotlib.inc                | 17 +++++++++++++++++
>  .../python/python3-matplotlib_3.1.1.bb          |  2 ++
>  2 files changed, 19 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/python-matplotlib.inc
>  create mode 100644 meta-python/recipes-devtools/python/python3-matplotlib_3.1.1.bb
> 
> diff --git a/meta-python/recipes-devtools/python/python-matplotlib.inc b/meta-python/recipes-devtools/python/python-matplotlib.inc
> new file mode 100644
> index 000000000..fb5ec9d6a
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python-matplotlib.inc
> @@ -0,0 +1,17 @@
> +SUMMARY = "matplotlib: plotting with Python"
> +DESCRIPTION = "\
> +Matplotlib is a Python 2D plotting library which produces \
> +publication-quality figures in a variety of hardcopy formats \
> +and interactive environments across platforms."
> +HOMEPAGE = "https://github.com/matplotlib/matplotlib"
> +LICENSE = "BSD-2-Clause"
> +LIC_FILES_CHKSUM = "file://LICENSE/LICENSE;md5=afec61498aa5f0c45936687da9a53d74"
> +
> +DEPENDS = "python3-numpy-native python3-numpy freetype libpng python3-dateutil python3-pytz"
> +RDEPENDS_${PN} = "python3-numpy freetype libpng python3-dateutil python3-pytz"
> +
> +SRC_URI[md5sum] = "f894af5564a588e880644123237251b7"
> +SRC_URI[sha256sum] = "1febd22afe1489b13c6749ea059d392c03261b2950d1d45c17e3aed812080c93"
> +
> +PYPI_PACKAGE = "matplotlib"
> +inherit pypi
> diff --git a/meta-python/recipes-devtools/python/python3-matplotlib_3.1.1.bb b/meta-python/recipes-devtools/python/python3-matplotlib_3.1.1.bb
> new file mode 100644
> index 000000000..bbeebe20c
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-matplotlib_3.1.1.bb
> @@ -0,0 +1,2 @@
> +inherit setuptools3
> +require python-matplotlib.inc

There is no benefit in using an .inc when it isn't used by more than one 
other file.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


