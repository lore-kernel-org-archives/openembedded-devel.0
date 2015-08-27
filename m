Return-Path: <obi@opendreambox.org>
X-Greylist: delayed 394 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 27 Aug 2015 08:48:20 UTC
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id CBDD576D72
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Aug 2015 08:48:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 89AC43159E4D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Aug 2015 10:41:45 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id t8MnbUeZLWu9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Aug 2015 10:41:43 +0200 (CEST)
Received: from [172.22.22.61] (55d47af0.access.ecotel.net [85.212.122.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 99BF23159DFA
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Aug 2015 10:41:43 +0200 (CEST)
Message-ID: <55DECD46.2020602@opendreambox.org>
Date: Thu, 27 Aug 2015 10:41:42 +0200
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1440650132-10281-1-git-send-email-TicoTimo@gmail.com>
In-Reply-To: <1440650132-10281-1-git-send-email-TicoTimo@gmail.com>
Subject: Re: [meta-multimedia][PATCH] vlc: fix for libtool error
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
X-List-Received-Date: Thu, 27 Aug 2015 08:48:21 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Hallo Tim,

On 27.08.2015 06:35, Tim Orling wrote:
> Patch recommended by:
>   Rafaël Carré funman@videolan.org
> 
> Signed-off-by: Tim Orling <TicoTimo@gmail.com>
> ---
>  meta-multimedia/recipes-multimedia/vlc/vlc.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc.inc b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
> index bf7ce0c..c4548c7 100644
> --- a/meta-multimedia/recipes-multimedia/vlc/vlc.inc
> +++ b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
> @@ -63,7 +63,7 @@ do_configure_prepend() {
>  
>  do_configure_append() {
>      sed -i -e s:'$(MOC) $(DEFS) $(CPPFLAGS)':'$(MOC) $(DEFS)'\ -I${B}/include\ -DSYS_LINUX:g ${B}/modules/gui/qt4/Makefile
> -    sed -i -e s:'${top_builddir_slash}libtool':${TARGET_SYS}-libtool:g ${B}/doltlibtool
> +    sed -i -e s:'${top_builddir_slash}libtool':'${top_buildir_slash}'${TARGET_SYS}-libtool:g ${B}/doltlibtool
                                                              ^
this looks like a typo (missing d).

Regards,
Andreas


