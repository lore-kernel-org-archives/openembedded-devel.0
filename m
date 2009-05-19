Received: from [71.6.201.124] (helo=easi.embeddedalley.com)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <trini@embeddedalley.com>) id 1M6TB7-000127-RI
	for openembedded-devel@openembedded.org; Tue, 19 May 2009 19:32:38 +0200
Received: (qmail 4816 invoked from network); 19 May 2009 17:25:13 -0000
Received: from easi.embeddedalley.com (HELO localhost) (easi@71.6.201.124)
	by easi.embeddedalley.com with SMTP; 19 May 2009 10:25:13 -0700
Date: Tue, 19 May 2009 10:25:13 -0700
From: Tom Rini <trini@embeddedalley.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090519172513.GO23842@smtp.west.cox.net>
References: <1242094570-12734-1-git-send-email-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1242094570-12734-1-git-send-email-raj.khem@gmail.com>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: [PATCH] python-native_2.6.1.bb: Add zlib-native to DEPENDS
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
X-List-Received-Date: Tue, 19 May 2009 17:32:39 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 11, 2009 at 07:16:10PM -0700, Khem Raj wrote:

> 	Do not use --with-zlib instead depend on zlib-native

Acked-by: Tom Rini <trini@embeddedalley.com>

And please push this soon, I need to propose adding readline-native :)

> ---
>  recipes/python/python-native_2.6.1.bb |    3 +--
>  1 files changed, 1 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes/python/python-native_2.6.1.bb b/recipes/python/python-native_2.6.1.bb
> index febe271..ca567a1 100644
> --- a/recipes/python/python-native_2.6.1.bb
> +++ b/recipes/python/python-native_2.6.1.bb
> @@ -1,5 +1,5 @@
>  require python.inc
> -DEPENDS = "openssl-native bzip2-full-native"
> +DEPENDS = "openssl-native bzip2-full-native zlib-native"
>  
>  SRC_URI = "\
>    http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.bz2 \
> @@ -22,7 +22,6 @@ EXTRA_OEMAKE = '\
>    STAGING_LIBDIR=${STAGING_LIBDIR_NATIVE} \
>    STAGING_INCDIR=${STAGING_INCDIR_NATIVE} \
>  '
> -EXTRA_OECONF += "--with-zlib"
>  
>  do_stage_append() {
>  	install -m 0755 Parser/pgen ${STAGING_BINDIR_NATIVE}/pgen
> -- 
> 1.6.0.4
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> 

-- 
Tom Rini


