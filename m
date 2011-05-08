Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QIsWQ-0005KI-K2
	for openembedded-devel@lists.openembedded.org;
	Sun, 08 May 2011 03:10:58 +0200
Received: by pzk36 with SMTP id 36so2003820pzk.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 May 2011 18:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id
	:mail-followup-to:references:mime-version:content-type
	:content-disposition:in-reply-to:user-agent;
	bh=38ebEKkYxFqUEAHkbUOHHPB8p/Y822jV6ypk1slIjlw=;
	b=KRFXodngXlvQEAkxPRzpHlRMTmv+IJ2rCRoZNjNadvR+W8pGlKrovJ4jgTug2GfrMI
	9aa8lGegQ6FUUTLQ3NFi7ky5Ej+7eyA1vu9zMXnikqgusOT4LwOtob3mnPssH0EmU40C
	yIti/xEs23GMoG6p/KskzQNNTgdiDqZKIF9VU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	b=a3F5RhTVK+ka5pQVhZhP3BkuBWlGnVJSt/Ns81vGCYy+StvIT5mbBS+M2C/aZMeLjg
	s9gMF9UirQAfY+u9vRURBShjwwByPxpejQEsh9Z4Hj0sSA0W0pc1+46VMBOMdaYC+Ysj
	fBA3VjMVhr0+zUpRv2yOlfdT7XATp+kV9T3/Y=
Received: by 10.68.17.163 with SMTP id p3mr7266878pbd.323.1304816434074;
	Sat, 07 May 2011 18:00:34 -0700 (PDT)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id k7sm3122668pbe.32.2011.05.07.18.00.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 07 May 2011 18:00:32 -0700 (PDT)
Date: Sat, 7 May 2011 17:59:52 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110508005952.GC20352@sakrah.homelinux.org>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <1304524618-4864-1-git-send-email-robert@erafx.com>
MIME-Version: 1.0
In-Reply-To: <1304524618-4864-1-git-send-email-robert@erafx.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH] x264_r2245: fix DEPENDS for x86
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
X-List-Received-Date: Sun, 08 May 2011 01:10:58 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (04/05/11 11:56), Bob Foerster wrote:
> The recipe intended to add "yasm-native" to the dependencies on x86,
> but it set DEPENDS_x86 = "yasm-native" which obliterated the base
> dependencies. On a fresh build, this package was failing since it
> was trying to build before the compiler was ready.
> 
> Depends is now set with DEPENDS_append_x86, which leaves the base
> dependencies intact.
> 
> Signed-off-by: Bob Foerster <robert@erafx.com>
> ---
>  recipes/vlc/x264_r2245.bb |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/recipes/vlc/x264_r2245.bb b/recipes/vlc/x264_r2245.bb
> index 0cffea3..8c2b5b4 100644
> --- a/recipes/vlc/x264_r2245.bb
> +++ b/recipes/vlc/x264_r2245.bb
> @@ -23,7 +23,7 @@ X264_ECFLAGS_mipsel = "-fPIC"
>  X264_DISABLE_ASM = "--disable-asm"
>  # use assembler written functions for those archs supporting this
>  X264_DISABLE_ASM_x86 = ""
> -DEPENDS_x86 = "yasm-native"
> +DEPENDS_append_x86 = "yasm-native"
                         ^
you need a space 

Otherwise looks ok
>  
>  EXTRA_OECONF = '--enable-shared ${X264_DISABLE_ASM} --extra-cflags="${X264_ECFLAGS}"'
>  
> -- 
> 1.7.1
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

-- 
-Khem


