Received: from [71.6.201.124] (helo=easi.embeddedalley.com)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <trini@embeddedalley.com>) id 1M5OSj-0000QC-Jg
	for openembedded-devel@openembedded.org; Sat, 16 May 2009 20:18:22 +0200
Received: (qmail 29066 invoked from network); 16 May 2009 18:11:16 -0000
Received: from easi.embeddedalley.com (HELO localhost) (easi@71.6.201.124)
	by easi.embeddedalley.com with SMTP; 16 May 2009 11:11:16 -0700
Date: Sat, 16 May 2009 11:11:16 -0700
From: Tom Rini <trini@embeddedalley.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090516181116.GC23842@smtp.west.cox.net>
References: <20090515183512.GZ7973@smtp.west.cox.net>
	<1242497080-28506-1-git-send-email-khimov@altell.ru>
	<1242497080-28506-2-git-send-email-khimov@altell.ru>
MIME-Version: 1.0
In-Reply-To: <1242497080-28506-2-git-send-email-khimov@altell.ru>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: [PATCH 2/3] (e)glibc-package: set LD_LIBRARY_PATH on	binary locale generation
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
X-List-Received-Date: Sat, 16 May 2009 18:18:22 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, May 16, 2009 at 10:04:39PM +0400, Roman I Khimov wrote:

> Locale generation might fail with SIGSEGV if host libs get messed with target
> libs, that might easily happen via /etc/ld.so.cache when building x86(_64)
> target on x86(_64) host. So explicitly specify LD_LIBRARY_PATH to prevent that.

Acked-by: Tom Rini <trini@embeddedalley.com>

> ---
>  recipes/eglibc/eglibc-package.bbclass |    3 ++-
>  recipes/glibc/glibc-package.bbclass   |    3 ++-
>  2 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes/eglibc/eglibc-package.bbclass b/recipes/eglibc/eglibc-package.bbclass
> index 01f698a..241499f 100644
> --- a/recipes/eglibc/eglibc-package.bbclass
> +++ b/recipes/eglibc/eglibc-package.bbclass
> @@ -309,11 +309,12 @@ python package_do_split_gconvs () {
>  		bb.data.setVar('PACKAGES', '%s %s' % (pkgname, bb.data.getVar('PACKAGES', d, 1)), d)
>  
>  		treedir = base_path_join(bb.data.getVar("WORKDIR", d, 1), "locale-tree")
> +		ldlibdir = "%s/lib" % treedir
>  		path = bb.data.getVar("PATH", d, 1)
>  		i18npath = base_path_join(treedir, datadir, "i18n")
>  
>  		localedef_opts = "--force --old-style --no-archive --prefix=%s --inputfile=%s/i18n/locales/%s --charmap=%s %s" % (treedir, datadir, locale, encoding, name)
> -		cmd = "PATH=\"%s\" I18NPATH=\"%s\" %s -L %s %s/bin/localedef %s" % (path, i18npath, qemu, treedir, treedir, localedef_opts)
> +		cmd = "PATH=\"%s\" I18NPATH=\"%s\" %s -L %s -E LD_LIBRARY_PATH=%s %s/bin/localedef %s" % (path, i18npath, qemu, treedir, ldlibdir, treedir, localedef_opts)
>  		bb.note("generating locale %s (%s)" % (locale, encoding))
>  		if os.system(cmd):
>  			raise bb.build.FuncFailed("localedef returned an error (command was %s)." % cmd)
> diff --git a/recipes/glibc/glibc-package.bbclass b/recipes/glibc/glibc-package.bbclass
> index 8db8c5c..46f809e 100644
> --- a/recipes/glibc/glibc-package.bbclass
> +++ b/recipes/glibc/glibc-package.bbclass
> @@ -273,6 +273,7 @@ python package_do_split_gconvs () {
>  		bb.data.setVar('PACKAGES', '%s %s' % (pkgname, bb.data.getVar('PACKAGES', d, 1)), d)
>  
>  		treedir = base_path_join(bb.data.getVar("WORKDIR", d, 1), "locale-tree")
> +		ldlibdir = "%s/lib" % treedir
>  		path = bb.data.getVar("PATH", d, 1)
>  		i18npath = base_path_join(treedir, datadir, "i18n")
>  
> @@ -282,7 +283,7 @@ python package_do_split_gconvs () {
>  		if not qemu_options:
>  			qemu_options = bb.data.getVar('QEMU_OPTIONS', d, 1)
>  		
> -		cmd = "PATH=\"%s\" I18NPATH=\"%s\" %s -L %s %s %s/bin/localedef %s" % (path, i18npath, qemu, treedir, qemu_options, treedir, localedef_opts)
> +		cmd = "PATH=\"%s\" I18NPATH=\"%s\" %s -L %s -E LD_LIBRARY_PATH=%s %s %s/bin/localedef %s" % (path, i18npath, qemu, treedir, ldlibdir, qemu_options, treedir, localedef_opts)
>  		bb.note("generating locale %s (%s)" % (locale, encoding))
>  		if os.system(cmd):
>  			raise bb.build.FuncFailed("localedef returned an error (command was %s)." % cmd)
> -- 
> 1.6.3.1
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> 

-- 
Tom Rini


