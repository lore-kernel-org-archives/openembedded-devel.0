Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f173.google.com (mail-yk0-f173.google.com
	[209.85.160.173])
	by mail.openembedded.org (Postfix) with ESMTP id 6FCAB60DD7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Oct 2014 18:29:04 +0000 (UTC)
Received: by mail-yk0-f173.google.com with SMTP id 200so1379856ykr.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Oct 2014 11:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=ABX+p9lubCiCQUD27Ojmh2uS4WWH9jEHluCpllgKCBU=;
	b=NlBEjr7RJjrQs/rKraAmL7OAzvJfF5XDJRNLAj8OUf1kK+STCikX5W8yVAojjY1Gaj
	eARIWVBXsNRxx1zjStHLc00VBLMfk3jpK19jwwT2/Lk/r3MVEZrIDF7fjDPkr9D/piTb
	K3hEnIzAZ/nktw3Nv2FtzZzPkDkty3NXHpWdVUBuWLtkOxWQeKBTguVf++vB8dnKoC8h
	6Z6YKtOBH6oTqPFx0uZuGLmFwgGhsIWXDxQ9aehxogBdNXvqohdrvJBHJsUsNiFKQc8+
	KBdmol2Bw6PHzfy7E0aphwbvvkz6hRUsaGmRAkTcy+6hd0+W22IV+ylX0LPtNDFhE24H
	xE7A==
MIME-Version: 1.0
X-Received: by 10.236.66.40 with SMTP id g28mr4098484yhd.6.1413484144973; Thu,
	16 Oct 2014 11:29:04 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.172.8 with HTTP; Thu, 16 Oct 2014 11:29:04 -0700 (PDT)
In-Reply-To: <a3d23e946f0b810a0157935930d68f2d3112c3eb.1413449871.git.anders@chargestorm.se>
References: <cover.1413449871.git.anders@chargestorm.se>
	<a3d23e946f0b810a0157935930d68f2d3112c3eb.1413449871.git.anders@chargestorm.se>
Date: Thu, 16 Oct 2014 15:29:04 -0300
X-Google-Sender-Auth: oEB-FoSXK86G2QkHvCeG1PjUeYo
Message-ID: <CAP9ODKreuLcJGRRVxrBy-Yg0ca=TBZN350Qjha4qVx-LaMDojA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Cc: Anders Darander <anders@chargestorm.se>
Subject: Re: [meta-qt5][PATCH 1/1] nativesdk-qtbase: make it possible to keep additional libraries
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 16 Oct 2014 18:29:06 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Oct 16, 2014 at 6:07 AM, Anders Darander <anders@chargestorm.se> wrote:
> In some usecases for the nativesdk, you might need some build tools that are built upon Qt5. This means
> that we're having a need to keep more of the libraries build by nativsdk-qtbase. This patch adds the
> infrastructure to support that
>
> Signed-off-by: Anders Darander <anders@chargestorm.se>
> ---
>  recipes-qt/qt5/nativesdk-qtbase.inc | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/recipes-qt/qt5/nativesdk-qtbase.inc b/recipes-qt/qt5/nativesdk-qtbase.inc
> index faecc64..ed98c80 100644
> --- a/recipes-qt/qt5/nativesdk-qtbase.inc
> +++ b/recipes-qt/qt5/nativesdk-qtbase.inc
> @@ -193,6 +193,16 @@ do_configure() {
>      bin/qmake ${OE_QMAKE_DEBUG_OUTPUT} ${S} -o Makefile || die "Configuring qt with qmake failed. EXTRA_OECONF was ${EXTRA_OECONF}"
>  }
>
> +# Set the EXTRA_QTLIB variable to e.g. Xml, in order to net remove libQt5Xml.so.*

... onder to *not* remove ...

> +EXTRA_QTLIB ?= ""
> +
> +python __anonymous () {
> +    templibs = ""
> +    for e in d.getVar("EXTRA_QTLIB", True).split():
> +        templibs = "%s -not -name 'libQt5%s.so*' -and" % (templibs, e)
> +    d.setVar("QTLIBSPRESERVE", templibs)
> +}
> +
>  do_install() {
>      # Fix install paths for all
>      find -name "Makefile*" | xargs sed -i "s,(INSTALL_ROOT)${STAGING_DIR_NATIVE}${STAGING_DIR_NATIVE},(INSTALL_ROOT)${STAGING_DIR_NATIVE},g"
> @@ -215,6 +225,7 @@ do_install() {
>             ${D}${libdir}/pkgconfig
>      find ${D}${libdir} -maxdepth 1 -name 'lib*' -and \
>                                     -not -name 'libQt5Core.so*' -and \
> +                                   ${QTLIBSPRESERVE} \
>                                     -not -name 'libQt5Bootstrap.a' \
>                                     -exec rm '{}' ';'
>  }
> --
> 1.8.4.5
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel



-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

