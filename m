Received: from smtp-out12.tpgi.com.au ([220.244.226.122]
	helo=mail12.tpgi.com.au) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marc@cpdesign.com.au>) id 1PuutE-00076X-Qu
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Mar 2011 23:51:30 +0100
X-TPG-Junk-Checked: Yes
X-TPG-Junk-Status: Message not scanned because user authenticated using SMTP
	AUTH
X-TPG-Antivirus: Passed
X-TPG-Abuse: host=220-244-174-13.static.tpgi.com.au; ip=220.244.174.13;
	date=Thu, 3 Mar 2011 09:24:24 +1100;
	auth=jN+vu9lIznpdsLAI8D8JiNICYhl1zChPtcoQj/CnROE=
Received: from dev1.localnet (220-244-174-13.static.tpgi.com.au
	[220.244.174.13]) (authenticated bits=0)
	by mail12.tpgi.com.au (envelope-from marc@cpdesign.com.au)
	(8.14.3/8.14.3) with ESMTP id p22MOM5n001074; 
	Thu, 3 Mar 2011 09:24:24 +1100
From: Marc Reilly <marc@cpdesign.com.au>
Organization: Creative Product Designs
To: openembedded-devel@lists.openembedded.org
Date: Thu, 3 Mar 2011 09:24:09 +1100
User-Agent: KMail/1.13.5 (Linux/2.6.34.7-0.7-desktop; KDE/4.4.4; x86_64; ; )
References: <1298984498-27148-1-git-send-email-eng1@koblersystems.de>
In-Reply-To: <1298984498-27148-1-git-send-email-eng1@koblersystems.de>
MIME-Version: 1.0
Message-Id: <201103030924.09980.marc@cpdesign.com.au>
Subject: Re: [pcm043 1/2] New machine pcm043 Phytec phyCORE-i.MX35
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 02 Mar 2011 22:51:30 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

Hi Jan,

> +DEPENDS_pcm043 = "${STDDEPENDS} libgles-mx31 tslib"
> +EXTRA_OECONF_pcm043 = "${BASE_CONF} --with-flavour=eglnative"
> +PACKAGE_ARCH_pcm043 = "${MACHINE_ARCH}"
> +LDFLAGS_append_pcm043 = " -lpvrNULLWSEGL -lstdc++ "
> +
>  INC_PR = "r3"
> 
>  inherit autotools pkgconfig gtk-doc
> diff --git a/recipes/images/illume-image.bb
> b/recipes/images/illume-image.bb index 7e16c93..e01ef27 100644
> --- a/recipes/images/illume-image.bb
> +++ b/recipes/images/illume-image.bb
> @@ -122,6 +122,7 @@ GLES_INSTALL_append_omap3evm     = "libgles-omap3"
>  #GLES_INSTALL_append_overo        = "libgles-omap3"
>  GLES_INSTALL_append_mx31ads      = "libgles-mx31"
>  GLES_INSTALL_append_mx31litekit  = "libgles-mx31"
> +GLES_INSTALL_append_pcm043      = "libgles-mx31"

Where can I find the recipe for libgles-mx31? 

Cheers
Marc

(Apologies for not being able to add constructive feedback for your patches - 
but I wouldn't know it they are correct or not :) )


