Return-Path: <paul@betafive.co.uk>
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
	[66.111.4.29])
	by mail.openembedded.org (Postfix) with ESMTP id CD9896BA93
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Apr 2019 23:55:14 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id 004662208A;
	Mon, 22 Apr 2019 19:55:13 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
	by compute1.internal (MEProxy); Mon, 22 Apr 2019 19:55:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=betafive.co.uk;
	h=subject:to:references:from:message-id:date:mime-version
	:in-reply-to:content-type:content-transfer-encoding; s=fm1; bh=H
	SkxXi23tTLFSe6ffaZXWUWYQGUvtY7Uz2FDkUL0X5E=; b=VpdnXwr/2+wQJy5UN
	sQze0g/Tzbcrs6U08gQgxFlelcziSQBapYHtHRRbE/UXyjZgFfxfNE7Kiebh1pAW
	T+okv2UsXqZhYaxhYDBY8BXVpGBfnRWUT0d2oc7tA3vLdVkHwdeXAB53B72VBEfD
	d1ZR6MSAYURsWdAFt4KJbrLdKLC7WO1n9bgugcE4qa7qPivr3VspFoQ5UnnhziBY
	HeLHDoXIwVLU3Kc9n3859MksDdjJhabd1Z2rFgNBxjLSgJE68YzQn/W4Dkam52Mu
	u/jJU4oYhiWtqEzfFT525XOnsTbW36FM46rZ7wtRrfRveMfT/M3kafYJwP1WImaH
	LuMEg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; bh=HSkxXi23tTLFSe6ffaZXWUWYQGUvtY7Uz2FDkUL0X
	5E=; b=Qt90eKZN9Z3r3LxtJa/x7GlPOgPIXUjYfadLg5yG4ixGNA4xQik4GCYUG
	6KPA0Cp78imyB8465OflSBwc6eS4mq61C0KDSnnzTtqw4RizcE6FDmrGsYwGi/cg
	PaKRY1UVz7cHxqxn9ojVB4/hS+NLhJSBtO31Ix8u6QCwD+3DcaVh/U/ycMwko17J
	XSISZIo3rgHiMZnijkGlK/u5it4sfQImymxpz3uAQ6SOqqikLxK7Nm8Zo0zFrQQi
	u0wSpjBM/bosLd0LofQkrgNUg/QUTzZu2PWST72Op8jS1G1ToScgo/nL0f1kCykp
	J2KlMyH/AlBMijAQe0vdf+Q6SVQuA==
X-ME-Sender: <xms:YVS-XBCSCz4rdSsRo_OGQZXqf_zpYysj-ZTKNLdWJG6g1-Kg6cTMnw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrgeejgddvtdcutefuodetggdotefrodftvf
	curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
	uegrihhlohhuthemuceftddtnecunecujfgurhepuffvfhfhohfkffgfgggjtgfgsehtke
	ertddtfeejnecuhfhrohhmpefrrghulhcuuegrrhhkvghruceophgruhhlsegsvghtrghf
	ihhvvgdrtghordhukheqnecukfhppeekuddrudekjedrfedvrddufeeknecurfgrrhgrmh
	epmhgrihhlfhhrohhmpehprghulhessggvthgrfhhivhgvrdgtohdruhhknecuvehluhhs
	thgvrhfuihiivgeptd
X-ME-Proxy: <xmx:YVS-XLCXv63dqE8_Myj3EJHqstq0Yb00rZ4r43dNLFYDcRm_0caT0w>
	<xmx:YVS-XCltzHoRtY13nUgvlrjJA76G5I_s_swAWqYra57_Cw7oN0DRLA>
	<xmx:YVS-XJglcVkG6r6ONLyXm0MyXGsqA0tpwW1V33KzPM3pLm5m20wTfw>
	<xmx:YVS-XLlSpVIXLE3gsW7atfafLHVkmU0yRRK9sRs3DyFAgjmt3tO8UA>
Received: from [192.168.2.138] (138.32.187.81.in-addr.arpa [81.187.32.138])
	by mail.messagingengine.com (Postfix) with ESMTPA id ED677E4788;
	Mon, 22 Apr 2019 19:55:12 -0400 (EDT)
To: =?UTF-8?Q?Andreas_M=c3=bcller?= <schnitzeltony@gmail.com>,
	openembedded-devel@lists.openembedded.org
References: <20190422234617.5419-1-schnitzeltony@gmail.com>
From: Paul Barker <paul@betafive.co.uk>
Organization: Beta Five Ltd
Message-ID: <e9587755-4b63-90cf-1738-930b808da883@betafive.co.uk>
Date: Tue, 23 Apr 2019 00:55:11 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <20190422234617.5419-1-schnitzeltony@gmail.com>
Subject: Re: [PATCH] vlc: rework qt PACKAGECONFIG
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
X-List-Received-Date: Mon, 22 Apr 2019 23:55:15 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

On 23/04/2019 00:46, Andreas Müller wrote:
> * qt4 support is gone -> move to qt5
> * enable qt5 gui in case meta-qt5 is in layers (it is more or less useless
>    without gui)
> * while at it remove noop libtool copy
> 
> Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
> ---
> V1 -> V2: Aargh again typo in commit messeage...
>   .../recipes-multimedia/vlc/vlc.inc            | 25 ++++++++++++-------
>   1 file changed, 16 insertions(+), 9 deletions(-)
> 
> diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc.inc b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
> index 19ac8206c..6ba1444b5 100644
> --- a/meta-multimedia/recipes-multimedia/vlc/vlc.inc
> +++ b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
> @@ -36,12 +36,18 @@ EXTRA_OECONF = "\
>       --enable-realrtsp \
>       --disable-libtar \
>       --enable-avcodec \
> -    ac_cv_path_MOC=${STAGING_BINDIR_NATIVE}/moc4 \
> -    ac_cv_path_RCC=${STAGING_BINDIR_NATIVE}/rcc4 \
> -    ac_cv_path_UIC=${STAGING_BINDIR_NATIVE}/uic4 \
> +    ac_cv_path_MOC=${STAGING_BINDIR_NATIVE}${QT_DIR_NAME}/moc \
> +    ac_cv_path_RCC=${STAGING_BINDIR_NATIVE}${QT_DIR_NAME}/rcc \
> +    ac_cv_path_UIC=${STAGING_BINDIR_NATIVE}${QT_DIR_NAME}/uic \
>   "
>   
> -PACKAGECONFIG ?= " live555 dc1394 dv1394 notify fontconfig freetype dvdread png ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
> +PACKAGECONFIG ?= " \
> +    live555 dc1394 dv1394 notify fontconfig freetype dvdread png \
> +    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
> +    ${@bb.utils.contains('BBFILE_COLLECTIONS', 'qt5-layer', 'qt5', '', d)} \

I don't like this change based on BBFILE_COLLECTIONS, it's just a 
different way of having things change when you add an extra layer. We 
wouldn't want an unconditional bbappend in meta-qt5 to set this and so 
we don't want to set it here when that layer is added.

Perhaps we should have qt5 as a distro feature instead?

> +"
> +
> +inherit ${@bb.utils.contains('PACKAGECONFIG', 'qt5', 'qmake5_paths', '', d)}
>   
>   PACKAGECONFIG[mad] = "--enable-mad,--disable-mad,libmad"
>   PACKAGECONFIG[a52] = "--enable-a52,--disable-a52,liba52"
> @@ -54,7 +60,7 @@ PACKAGECONFIG[opencv] = "--enable-opencv,--disable-opencv,opencv"
>   PACKAGECONFIG[speex] = "--enable-speex,--disable-speex,speex"
>   PACKAGECONFIG[gstreamer] = "--enable-gst-decode,--disable-gst-decode,gstreamer1.0 gstreamer1.0-plugins-base gst-plugins-bad"
>   PACKAGECONFIG[vpx] = "--enable-vpx,--disable-vpx, libvpx"
> -PACKAGECONFIG[qt4] = "--enable-qt,--disable-qt, qt4-x11-free"
> +PACKAGECONFIG[qt5] = "--enable-qt,--disable-qt, qtbase-native qtx11extras qtsvg"
>   PACKAGECONFIG[freerdp] = "--enable-freerdp,--disable-freerdp, freerdp"
>   PACKAGECONFIG[dvbpsi] = "--enable-dvbpsi,--disable-dvbpsi, libdvbpsi"
>   PACKAGECONFIG[samba] = "--enable-smbclient,--disable-smbclient, samba"
> @@ -76,12 +82,13 @@ PACKAGECONFIG[x11] = "--with-x --enable-xcb,--without-x --disable-xcb,  xcb-util
>   PACKAGECONFIG[png] = "--enable-png,--disable-png,libpng"
>   PACKAGECONFIG[vdpau] = "--enable-vdpau,--disable-vdpau,libvdpau"
>   
> -do_configure_prepend() {
> -    cp ${STAGING_DATADIR}/libtool/config.* ${S}/autotools/ || true
> -}
> -
>   do_configure_append() {
>       sed -i -e s:'${top_builddir_slash}libtool':'${top_builddir_slash}'${TARGET_SYS}-libtool:g ${B}/doltlibtool
> +
> +    # moc needs support: precreate build paths
> +    for qtpath in adapters components/epg components/playlist components/sout dialogs managers styles util/buttons; do
> +        mkdir -p "${B}/modules/gui/qt/$qtpath"
> +    done
>   }
>   
>   # This recipe packages vlc as a library as well, so qt4 dependencies
> 

-- 
Paul Barker
Managing Director & Principal Engineer
Beta Five Ltd

