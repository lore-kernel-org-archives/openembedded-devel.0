Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ua0-f195.google.com (mail-ua0-f195.google.com
	[209.85.217.195])
	by mail.openembedded.org (Postfix) with ESMTP id AC43A73243
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Aug 2016 21:16:05 +0000 (UTC)
Received: by mail-ua0-f195.google.com with SMTP id s91so4685869uas.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Aug 2016 14:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=z/58ujdVAFA5ldvUcqoWB8cLAESEpMcaz5gIbxH472o=;
	b=lGkh64npMVBM3Dc94T2rABeHOcNpXi4fgk4u4z9hYcvR+wlBREZijIlWyyWyrnWjUr
	fsNtsgzBnWaZ4qnjG8+/3rT3FDEi2CQnVrDhesYh0BlZjBcBrBbHsNqXyDC6uOf3tDxX
	lYEikY6LgJqD+X+kyDsFNVotGUIUBcdn1hI4qvj4o5CggCtOb+lgUBfzZu7Dy3Yqet1J
	YdKF6JW6yQ1Ip3yj3zj+Ag+5+g2rrtKJR12EAlVCPZAOuZoBGqyaFYylnXFGydi3P6qc
	CaeCFamq5pKnLevdUOAew1jtC+QelPINHJFV/0OYPEGOCJMKqx4YQmi+bno14H8Pi+Cb
	E+sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=z/58ujdVAFA5ldvUcqoWB8cLAESEpMcaz5gIbxH472o=;
	b=MbKeflNeSSXNFFl7w3y7aHbK8L/RHD1gUPrt/dpWu7aYv0EhLfOnJWDxRrEj4jseA/
	6c++N+TSDTH1KV+KUvq1ZRKRbH/2vRLAm2nDFUZOOWIQw8cn7gJkyoN2VaqS8pwVSGuv
	6LUqZPy+9YMDNEBkeJAUIobuATBFdPbUoXXuTCWLOCzON9ue/k4ik+YsaVsq0WtkspbU
	b6hlUdGmNhTh+r6uJULy/+Grxh1tRcLhjsN1cL98W2EAg+f6IPWleSwppopIfAFwIXae
	BB1eppsksXKX2zclXPwWtBndB8YsoUvM6N6ygwJV9tj6hyET3ogiPfYBh5M4EkxP6ceE
	/LMg==
X-Gm-Message-State: AE9vXwPytP5t/MgxQboLjCabNPwhkeG1ZcPFHucOceGv8XOJLB0OcD9BbnW8hjgja02dnZgeEKhrRxBvZhk7GQ==
X-Received: by 10.176.4.134 with SMTP id 6mr7308150uaw.51.1472678165469; Wed,
	31 Aug 2016 14:16:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.65.130 with HTTP; Wed, 31 Aug 2016 14:16:04 -0700 (PDT)
In-Reply-To: <20160831194106.14065-10-Martin.Jansa@gmail.com>
References: <20160831194106.14065-1-Martin.Jansa@gmail.com>
	<20160831194106.14065-10-Martin.Jansa@gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Wed, 31 Aug 2016 23:16:04 +0200
Message-ID: <CALbNGRSYfGe6FNkrMHVLyfCwBht7keoG4JXYVeqPUyOER+uCGA@mail.gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 10/11] geany-plugins: blacklist because of QA issues
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
X-List-Received-Date: Wed, 31 Aug 2016 21:16:08 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Aug 31, 2016 at 9:41 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> geany-plugins_1.27.bb: LICENSE_geany-plugins-pairtaghighlighter includes licenses (BSD-2-Clause) that are not listed in LICENSE
>
> geany-plugins-1.27: geany-plugins: Files/directories were installed but not shipped in any package:
>   /usr/lib/geany/git-changebar.so
> Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
> geany-plugins: 1 installed and not shipped files. [installed-vs-shipped]
>
> geany-plugins-1.27: geany-plugins-scope rdepends on libvte9, but it isn't a build dependency, missing vte9 in DEPENDS or PACKAGECONFIG? [build-deps]
> geany-plugins-1.27: geany-plugins-debugger rdepends on libvte9, but it isn't a build dependency, missing vte9 in DEPENDS or PACKAGECONFIG? [build-deps]
> geany-plugins-1.27: geany-plugins-multiterm rdepends on libvte9, but it isn't a build dependency, missing vte9 in DEPENDS or PACKAGECONFIG? [build-deps]
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta-oe/recipes-devtools/geany/geany-plugins_1.27.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta-oe/recipes-devtools/geany/geany-plugins_1.27.bb b/meta-oe/recipes-devtools/geany/geany-plugins_1.27.bb
> index b56d8f4..0e333c7 100644
> --- a/meta-oe/recipes-devtools/geany/geany-plugins_1.27.bb
> +++ b/meta-oe/recipes-devtools/geany/geany-plugins_1.27.bb
> @@ -218,3 +218,5 @@ RDEPENDS_${PN}-xmlsnippets = "${PN}"
>  PACKAGES =+ "${PLUGINS}"
>  RDEPENDS_${PN} = "${PLUGINS}"
>  ALLOW_EMPTY_${PN} = "1"
> +
> +PNBLACKLIST[geany-plugins] ?= "Causes multiple QA errors and LICENSE warnings"
> --
> 2.9.2
>
Are we blacklisting for warnings now or am I missing something?

Andreas

