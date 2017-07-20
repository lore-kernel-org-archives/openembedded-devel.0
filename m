Return-Path: <martin.jansa@gmail.com>
Received: from mail-yw0-f170.google.com (mail-yw0-f170.google.com
	[209.85.161.170])
	by mail.openembedded.org (Postfix) with ESMTP id D6A426003C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Jul 2017 13:34:53 +0000 (UTC)
Received: by mail-yw0-f170.google.com with SMTP id v193so12848544ywg.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Jul 2017 06:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=KEkH/iWoJ1SpgSbqYadXn2kcBIefVklL+0HlcJPV6do=;
	b=iFnaq1Hdrvm1FVPvBo2wMZjEc6W3N2xN078yCSOWYYmYEik3lOsrE4jZKNdRlD9bYs
	ZoTUsxlDAHGbQnrHZLkS5whayRQiALOPCk6E5v3nPmZwuUBWUhWur+8dn9XgJ3qtdQL8
	q9gPjVvemXJH23xJD5UaQxKC+RiiycJwTxL1nkRH6GebqPb3tiZDvyOl5Dyl2iAWp52U
	ZuJJiPBUakd3RUSGbcaqh38/A2QvfoufyZH728I7G4Xe4736rzq882TY5Zso1jbpTW6U
	gGqcWXjR3b2JqR325YNCsoypMqODHie1CmxZVP0/1gciNVeYklZglOGrbVeWb/Uz9uBN
	391g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=KEkH/iWoJ1SpgSbqYadXn2kcBIefVklL+0HlcJPV6do=;
	b=eZelUKLwhL3Oseg8ojd7Nd5oHjQeIiSa3xEX3hKBL8AgH7qp068jPmZPc0Vlr4BKXg
	dRmqDShum1+ZtFyIA6r9ZAONe98ixwHACkq7lTYF+l+Wwn9t9UbDnsRbSsY7nA+6F8wZ
	ciGOUAl9DNdrRiJhVuZZE9QZOh4xOOZVUjeVnC0KnjYhfHL1upgxfwDP/t798CPw88HA
	PlWZ0ie312lISdCLVQ4NT+1mgbM2dO9FkKXIwJZEVsYcBtwBKr/BNWdvkwBk8a+K3TjA
	WBh/1bSRlOhvpftw4+nrMHFZXVHMWu/VP4RZXOvfgdbeUWrnrdJBauEL0biyMu2aU9b0
	mnaA==
X-Gm-Message-State: AIVw113WrI8hFpPKoTE+Q4d+ZN9oYPRs3S9ktN4Lu1vpwBfg4N3phoEI
	JfzfM6b+HkGb6lTkNpGAt6U4uENYiA==
X-Received: by 10.13.194.1 with SMTP id e1mr2687004ywd.64.1500547173470; Thu,
	20 Jul 2017 03:39:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.77.4 with HTTP; Thu, 20 Jul 2017 03:39:33 -0700 (PDT)
In-Reply-To: <20170711063102.10384-1-raj.khem@gmail.com>
References: <20170711063102.10384-1-raj.khem@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 20 Jul 2017 12:39:33 +0200
Message-ID: <CA+chaQfPrnGpgXibiSt9NS4qKH+eQt53oNcm+i-k=eAYWUscbg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH] qwt-qt5: Fix rpath issues
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
X-List-Received-Date: Thu, 20 Jul 2017 13:34:54 -0000
Content-Type: text/plain; charset="UTF-8"

I still see QA warning from this one just on .debug file now:


qwt-qt5-6.1.3: qwt-qt5-dbg: found library in wrong location:
/usr/plugins/designer/.debug/libqwt_designer_plugin.so [libdir]


On Tue, Jul 11, 2017 at 8:31 AM, Khem Raj <raj.khem@gmail.com> wrote:

> It errors out
> usr/plugins/designer/libqwt_designer_plugin.so [rpaths]
> QA Issue: qwt-qt5-plugins: found library in wrong location:
> /usr/plugins/designer/libqwt_designer_plugin.so
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  recipes-qt/qwt/qwt-qt5.inc                |  5 +++--
>  recipes-qt/qwt/qwt-qt5/remove_rpath.patch | 17 +++++++++++++++++
>  2 files changed, 20 insertions(+), 2 deletions(-)
>  create mode 100644 recipes-qt/qwt/qwt-qt5/remove_rpath.patch
>
> diff --git a/recipes-qt/qwt/qwt-qt5.inc b/recipes-qt/qwt/qwt-qt5.inc
> index ee4fbd7..90bd9f7 100644
> --- a/recipes-qt/qwt/qwt-qt5.inc
> +++ b/recipes-qt/qwt/qwt-qt5.inc
> @@ -8,9 +8,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=
> dac2743472b0462ff3cfb4af42051c88"
>  DEPENDS = "qtbase qtsvg qttools"
>
>  SRC_URI = "${SOURCEFORGE_MIRROR}/qwt/qwt-${PV}.tar.bz2;name=qwt \
> +           file://remove_rpath.patch \
>            "
> -#           file://qwt6.patch
> -#           file://qwt6-fix-linking-with-ld-gold.patch"
>
>  S = "${WORKDIR}/qwt-${PV}"
>
> @@ -45,3 +44,5 @@ FILES_${PN}-plugins = "${prefix}/plugins/designer/*.so"
>  FILES_${PN}-dbg += "${prefix}/plugins/designer/.debug"
>  FILES_${PN}-doc += "${prefix}/doc"
>
> +INSANE_SKIP_${PN}-plugins += "libdir"
> +
> diff --git a/recipes-qt/qwt/qwt-qt5/remove_rpath.patch
> b/recipes-qt/qwt/qwt-qt5/remove_rpath.patch
> new file mode 100644
> index 0000000..14b65d6
> --- /dev/null
> +++ b/recipes-qt/qwt/qwt-qt5/remove_rpath.patch
> @@ -0,0 +1,17 @@
> +Remove rpath from library, it points to build area which is not
> +ok
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +
> +Index: qwt-6.1.3/designer/designer.pro
> +===================================================================
> +--- qwt-6.1.3.orig/designer/designer.pro
> ++++ qwt-6.1.3/designer/designer.pro
> +@@ -83,7 +83,6 @@ contains(QWT_CONFIG, QwtDesigner) {
> +         # compile the path for finding the Qwt library
> +         # into the plugin. Not supported on Windows !
> +
> +-        QMAKE_RPATHDIR *= $${QWT_INSTALL_LIBS}
> +         qwtAddLibrary($${QWT_OUT_ROOT}/lib, qwt)
> +
> +         contains(QWT_CONFIG, QwtDll) {
> --
> 2.13.2
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

