Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OKl7d-00070a-8R
	for openembedded-devel@lists.openembedded.org;
	Sat, 05 Jun 2010 06:36:38 +0200
Received: by fxm9 with SMTP id 9so1216722fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Jun 2010 21:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=y0Lr6W3BIbARWaMVt4siLMc3UHAZCH+rAAvjdZAgogI=;
	b=ODzPw+lRXhT6RlpIRQukI2+Ro9N+TXRH2aMTI9hzzBkMfqeovjtptdefYz2VaALFiW
	xxjs8S6emIF5kNMqlqVUcK0r0j6z7vq4PPZTWaQcBKSOCSs5ErwX5u4rqymDNIZCUixY
	9vmE4/HscAFLOZzH3aoFG7ToC/v1EC8QknvXA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=NoASJwn0IKqp5JEd6FM1v+uTMFYmPqA7CbM0l29+WGSkgYeCibt6g54NBvuaE15iAg
	lghhG5geVwInM0wwIfK3XbwZwlpMMtUE7QXAXhJYdN+nxOeMGmoU64Kr9Z7EW8gvm5zN
	0HE2f5ZyrGhVDiE5Y7Iu7M385yM7ClLVtd1LE=
Received: by 10.223.44.86 with SMTP id z22mr12634723fae.13.1275712339879;
	Fri, 04 Jun 2010 21:32:19 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id y12sm8522933faj.17.2010.06.04.21.32.18
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 04 Jun 2010 21:32:19 -0700 (PDT)
Date: Sat, 5 Jun 2010 06:32:01 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100605043201.GQ16035@jama>
References: <E1OKZya-0000Xi-O2@melo.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <E1OKZya-0000Xi-O2@melo.openembedded.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [oe-commits] Henning Heinold : jikes: change RDEPENDS so that jikes-native don' t depends on target-classpath
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
X-List-Received-Date: Sat, 05 Jun 2010 04:36:38 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 04, 2010 at 04:42:32PM +0000, git version control wrote:
> Module: openembedded.git
> Branch: org.openembedded.dev
> Commit: 793e0d81c9932c9e9b98d9bad8be968eb3d7022c
> URL:    http://gitweb.openembedded.net/?p=openembedded.git&a=commit;h=793e0d81c9932c9e9b98d9bad8be968eb3d7022c
> 
> Author: Henning Heinold <heinold@inf.fu-berlin.de>
> Date:   Fri Jun  4 18:35:28 2010 +0200
> 
> jikes: change RDEPENDS so that jikes-native don't depends on target-classpath
> 
> ---
> 
>  recipes/jikes/jikes_1.22.bb |   12 ++++++------
>  1 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/recipes/jikes/jikes_1.22.bb b/recipes/jikes/jikes_1.22.bb
> index 8c1a16e..2028d7e 100644
> --- a/recipes/jikes/jikes_1.22.bb
> +++ b/recipes/jikes/jikes_1.22.bb
> @@ -5,16 +5,16 @@ SECTION = "devel"
>  LICENSE = "IBM"
>  PR = "r1"
>  
> -RDEPENDS_${PN} = "classpath"
> -PROVIDES_virtclass-native = ""
> -RDEPENDS_virtclass-native = ""
> -
> -BBCLASSEXTEND = "native"
> -
>  SRC_URI = "${SOURCEFORGE_MIRROR}/jikes/jikes-${PV}.tar.bz2"
>  
>  inherit autotools update-alternatives
>  
> +BBCLASSEXTEND = "native"
> +
> +RDEPENDS = "classpath"

Why not RDEPENDS_${PN}?

Regards,

> +PROVIDES_virtclass-native = ""
> +RDEPENDS_virtclass-native = ""
> +
>  EXTRA_OECONF = "--disable-fp-emulation --enable-source15"
>  
>  # configure script incorrectly defines these when cross compiling for ARM
> 
> 
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits

-- 
Jansa 'JaMa' Martin     jabber: Martin.Jansa@gmail.com


