Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LyhXe-0003Yh-5z
	for openembedded-devel@openembedded.org; Tue, 28 Apr 2009 09:15:46 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LyhSg-0003Yt-Qr
	for openembedded-devel@openembedded.org; Tue, 28 Apr 2009 07:10:38 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 28 Apr 2009 07:10:38 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 28 Apr 2009 07:10:38 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 28 Apr 2009 09:10:18 +0200
Message-ID: <gt6a4q$sbd$1@ger.gmane.org>
References: <20090423175928.GE12956@smtp.west.cox.net>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b4pre) Gecko/20090421 Shredder/3.0b3pre
In-Reply-To: <20090423175928.GE12956@smtp.west.cox.net>
Sender: news <news@ger.gmane.org>
Subject: Re: [PATCH] Teach insane.bbclass to ignore SDK packages wrt -dev and .so check
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
X-List-Received-Date: Tue, 28 Apr 2009 07:15:46 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23-04-09 19:59, Tom Rini wrote:
> With the change to make having libfoo.so symlinks in the main package
> become fatal (along with GNU_HASH) SDK stuff is broken now.  At Richard's
> suggestion, the following patch teaches insane.bbclass to not run the
> -dev check on sdk||canadian-sdk recipes.


Acked-by: Koen Kooi <koen@openembedded.org>


> I did this by splitting the devdbg check into two separate checks
> (rather than re-order the checks as we do want to pull dbg stuff out).
> This also clarifies the comments to both.  As an aside, yes we bail out
> if say a file named Kconfig.debug ends up in a package.
>
> Signed-off-by: Tom Rini<trini@embeddedalley.com>
>
> diff --git a/classes/insane.bbclass b/classes/insane.bbclass
> index 584a5f1..cc881dc 100644
> --- a/classes/insane.bbclass
> +++ b/classes/insane.bbclass
> @@ -250,21 +250,35 @@ def package_qa_check_rpath(file,name,d, elf):
>
>       return sane
>
> -def package_qa_check_devdbg(path, name,d, elf):
> +def package_qa_check_dev(path, name,d, elf):
>       """
> -    Check for debug remains inside the binary or
> -    non dev packages containing
> +    Check for ".so" library symlinks in non-dev packages
>       """
>
>       import bb, os
>       sane = True
>
> +    # SDK packages are special.
> +    for s in ['sdk', 'canadian-sdk']:
> +        if bb.data.inherits_class(s, d):
> +            return True
> +
>       if not "-dev" in name:
>           if path[-3:] == ".so" and os.path.islink(path):
>               error_msg = "non -dev package contains symlink .so: %s path '%s'" % \
>                        (name, package_qa_clean_path(path,d))
>               sane = package_qa_handle_error(0, error_msg, name, path, d)
>
> +    return sane
> +
> +def package_qa_check_dbg(path, name,d, elf):
> +    """
> +    Check for ".debug" files or directories outside of the dbg package
> +    """
> +
> +    import bb, os
> +    sane = True
> +
>       if not "-dbg" in name:
>           if '.debug' in path:
>               error_msg = "non debug package contains .debug directory: %s path %s" % \
> @@ -493,9 +507,10 @@ python do_package_qa () {
>       if not packages:
>           return
>
> -    checks = [package_qa_check_rpath, package_qa_check_devdbg,
> +    checks = [package_qa_check_rpath, package_qa_check_dev,
>                 package_qa_check_perm, package_qa_check_arch,
> -              package_qa_check_desktop, package_qa_hash_style]
> +              package_qa_check_desktop, package_qa_hash_style,
> +              package_qa_check_dbg]
>       walk_sane = True
>       rdepends_sane = True
>       for package in packages.split():
>




