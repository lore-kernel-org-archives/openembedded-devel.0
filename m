Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f172.google.com (mail-wr0-f172.google.com
	[209.85.128.172])
	by mail.openembedded.org (Postfix) with ESMTP id AB3F871E5F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Feb 2017 21:39:36 +0000 (UTC)
Received: by mail-wr0-f172.google.com with SMTP id i10so159712085wrb.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Feb 2017 13:39:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=GdpA+IY26Uk85cHvsgztQgsX7ZfRJ4dQrg1Mw4lJ83Q=;
	b=Ld8ESBKfg8L7Sa2cMMg73vcwk5aR8aVrWRobRNeaVkl5kfdgZdPhEYyr2nq49eIB3U
	UAvKMoH9NJ+vCHV+sx9pn4LUKAwue3UsljGbZfhRNyBFY7e013gjTNWKC2rPFGDtSHXJ
	p/CxFcVQhrSRLqHMCZ/vfQoXlLMoijRcgsbh1uO96zHWZdVs5QlURoaeE8AFqYu4iAOO
	gaFWcr9xP0z75IhWa8mien2KymXrQvtnGE1i4DET/N4IgGy9yPhCXKphTjFKhKHERXy5
	AITgTBBJVu4fYlD3Q2QsrhnnBobYEqD9Me+ymhWOKBbV/JhOiUD2Mv6ghTM5k6+rTiBu
	SGHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=GdpA+IY26Uk85cHvsgztQgsX7ZfRJ4dQrg1Mw4lJ83Q=;
	b=FOo52cGFeXB66gDBEyTLtZjf7iCJATdbQ0G025q/oZK6EX9p0r9uxpr6FmU3y3fmbV
	cWBhe5S8m4QUuqyFVfyVkAm0nWz7Y72MG6/+iu3YLlvK5WaCy7zMvvMZZo0jxCMqyGn1
	q+EycMkCglXocq8+0i+paRbN0f1VyUE7Bh07GJbY+3EXexj6AU/QRczUl35zepJZUl6i
	7ywU3u4SpRxkRqc903wQp06r8qZSlE8QAstyGXwybT7ErqBldkxii/DFRPEOuqLnKkgT
	pyTWlQuCvbWcnZg6KPrEIVslLAPhhv2mEwQNGQ+WjGuWLvdIwOsXZQhSR2ZwalIO4ZNK
	+amQ==
X-Gm-Message-State: AMke39mQkk3r517qHB/opUtvMX4JH/pO9QK/uyG05CxvRlmlBQ0a2imIHJuau8u/M/OaCZwfkOMz5YuakiMRxg==
X-Received: by 10.223.150.34 with SMTP id b31mr22349159wra.196.1487021976335; 
	Mon, 13 Feb 2017 13:39:36 -0800 (PST)
MIME-Version: 1.0
Received: by 10.80.148.174 with HTTP; Mon, 13 Feb 2017 13:39:35 -0800 (PST)
In-Reply-To: <1487019728-19329-3-git-send-email-max.krummenacher@toradex.com>
References: <1487019728-19329-1-git-send-email-max.krummenacher@toradex.com>
	<1487019728-19329-3-git-send-email-max.krummenacher@toradex.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 13 Feb 2017 22:39:35 +0100
Message-ID: <CA+chaQe+tq9r35iW6JMgLDuPV+v82zmPrPTaK359NQeTdzRodw@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Max Krummenacher <max.krummenacher@toradex.com>
Subject: Re: [meta-oe][PATCH][master-next 3/4] pywbem: depend on python-m2crypto-native and its rdepends
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
X-List-Received-Date: Mon, 13 Feb 2017 21:39:36 -0000
Content-Type: text/plain; charset=UTF-8

Did you test this change? You added it to inherit not DEPENDS..

On Mon, Feb 13, 2017 at 10:02 PM, Max Krummenacher <max.oss.09@gmail.com>
wrote:

> This fixed the build, remove blacklist also.
>
> Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
> ---
>  meta-oe/recipes-extended/pywbem/pywbem_0.8.0.bb | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
>
> diff --git a/meta-oe/recipes-extended/pywbem/pywbem_0.8.0.bb
> b/meta-oe/recipes-extended/pywbem/pywbem_0.8.0.bb
> index 8b5394e..14d4e69 100644
> --- a/meta-oe/recipes-extended/pywbem/pywbem_0.8.0.bb
> +++ b/meta-oe/recipes-extended/pywbem/pywbem_0.8.0.bb
> @@ -16,14 +16,13 @@ HOMEPAGE = "http://pywbem.sf.net/"
>  LICENSE = "LGPLv2"
>  LIC_FILES_CHKSUM = "file://pywbem/LICENSE.txt;md5=
> fbc093901857fcd118f065f900982c24"
>  SECTION = "Development/Libraries"
> -DEPENDS = "python-m2crypto-native"
>  SRC_URI = "http://jaist.dl.sourceforge.net/project/${BPN}/${BPN}/${
> BP}/${BP}-dev.r704.zip"
>  SRC_URI[md5sum] = "84072451dcdd1aa9ee82363848faf7ad"
>  SRC_URI[sha256sum] = "898035866d3cc741bbcd62c4ac26e6
> 33ad07b7c11d89db2472b9f923f3fd3ed8"
>
>  S = "${WORKDIR}/${BP}-dev"
>
> -inherit setuptools python-dir
> +inherit setuptools python-m2crypto-native
>
>  do_install_append() {
>      mv ${D}${bindir}/wbemcli.py ${D}${bindir}/pywbemcli
> @@ -34,6 +33,3 @@ do_install_append() {
>  }
>
>  BBCLASSEXTEND = "native"
> -
> -PNBLACKLIST[pywbem] ?= "Fails to build with RSS
> http://errors.yoctoproject.org/Errors/Details/130596/"
> -PNBLACKLIST[pywbem] ?= "Fails to build with RSS
> http://errors.yoctoproject.org/Errors/Details/130681/"
> --
> 2.6.6
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

