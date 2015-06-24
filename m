Return-Path: <Maxin.John@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 6FD3C607BB
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jun 2015 08:14:43 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 24 Jun 2015 10:14:43 +0200
Received: by sestofb10.enea.se (Postfix, from userid 4454)	id 219A828BA1E;
	Wed, 24 Jun 2015 10:14:43 +0200 (CEST)
Date: Wed, 24 Jun 2015 10:14:43 +0200
From: "Maxin B. John" <maxin.john@enea.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20150624081443.GA17507@sestofb10.enea.se>
References: <20150623142924.GA1887@windriver.com>
MIME-Version: 1.0
In-Reply-To: <20150623142924.GA1887@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Received-SPF: None (SESTOEX03.enea.se: maxin.john@enea.com does not
	designate permitted sender hosts)
Subject: Re: [meta-java][PATCH] openjdk-7: fix icedtea-crosscompile-fix.patch
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
X-List-Received-Date: Wed, 24 Jun 2015 08:14:46 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Hi,

On Tue, Jun 23, 2015 at 10:29:24AM -0400, Amy Fong wrote:
> >From ed2cca0045c597a28ce4ea3f9ce220c97a2a05fe Mon Sep 17 00:00:00 2001
> From: Amy Fong <amy.fong@windriver.com>
> Date: Mon, 22 Jun 2015 14:50:20 -0400
> Subject: [PATCH] openjdk-7: fix patch
> 
> Fixing what looks like a hand edited patch error
> 
> Signed-off-by: Amy Fong <amy.fong@windriver.com>
> ---
>  recipes-core/openjdk/openjdk-7-75b13/icedtea-crosscompile-fix.patch | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/recipes-core/openjdk/openjdk-7-75b13/icedtea-crosscompile-fix.patch b/recipes-core/openjdk/openjdk-7-75b13/icedtea-crosscompile-fix.patch
> index 250f8a4..5e8e479 100644
> --- a/recipes-core/openjdk/openjdk-7-75b13/icedtea-crosscompile-fix.patch
> +++ b/recipes-core/openjdk/openjdk-7-75b13/icedtea-crosscompile-fix.patch
> @@ -139,7 +139,7 @@ index 69e1177..dc7f8e6 100644
>   CFLAGS_REQUIRED_hppa    +=
>   CFLAGS_REQUIRED_i586    += -fno-omit-frame-pointer -D_LITTLE_ENDIAN
>   CFLAGS_REQUIRED_ia64    += -fno-omit-frame-pointer -D_LITTLE_ENDIAN
> - @@ -359,7 +337,7 @@ LDFLAGS_COMMON  += $(LDFLAGS_DEFS_OPTION)
> +@@ -359,7 +337,7 @@ LDFLAGS_COMMON  += $(LDFLAGS_DEFS_OPTION)
>   #
>   # -L paths for finding and -ljava
>   #
> -- 

Pushed to master. Thanks!

Best Regards,
Maxin

