Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 7759B7315E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Mar 2017 16:20:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id DB1D520BAF;
	Wed, 15 Mar 2017 16:20:14 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 09mDUjh8alvh; Wed, 15 Mar 2017 16:20:14 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B9E8220BAC;
	Wed, 15 Mar 2017 16:20:13 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 4B3281623E7; Wed, 15 Mar 2017 12:20:13 -0400 (EDT)
Date: Wed, 15 Mar 2017 12:20:13 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Andreas =?iso-8859-1?Q?M=FCller?= <schnitzeltony@googlemail.com>
Message-ID: <20170315162013.GM15664@denix.org>
References: <20170308232816.4303-1-schnitzeltony@googlemail.com>
MIME-Version: 1.0
In-Reply-To: <20170308232816.4303-1-schnitzeltony@googlemail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-qt5][PATCH] qtwebengine: show progress for do_compile
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
X-List-Received-Date: Wed, 15 Mar 2017 16:20:14 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

\o/ thanks, it takes forever, so it's nice to have progress status!


On Thu, Mar 09, 2017 at 12:28:16AM +0100, Andreas Müller wrote:
> This was stolen from meta-oe / meson.bbclass - qtwebengine uses ninja for
> build too.
> 
> Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
> ---
>  recipes-qt/qt5/qtwebengine_git.bb | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/recipes-qt/qt5/qtwebengine_git.bb b/recipes-qt/qt5/qtwebengine_git.bb
> index 8e60d72..b945363 100644
> --- a/recipes-qt/qt5/qtwebengine_git.bb
> +++ b/recipes-qt/qt5/qtwebengine_git.bb
> @@ -87,6 +87,8 @@ do_configure() {
>          -after ${EXTRA_QMAKEVARS_POST}
>  }
>  
> +do_compile[progress] = "outof:^\[(\d+)/(\d+)\]\s+"
> +
>  do_install_append() {
>      rmdir ${D}${OE_QMAKE_PATH_PLUGINS}/${BPN} ${D}${OE_QMAKE_PATH_PLUGINS} || true
>      sed -i 's@ -Wl,--start-group.*-Wl,--end-group@@g; s@-L${B}[^ ]* @ @g' ${D}${libdir}/pkgconfig/Qt5WebEngineCore.pc
> -- 
> 2.9.3
> 
> -- 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

