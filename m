Received: from vms173019pub.verizon.net ([206.46.173.19])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1NmE3r-0002us-JN
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Mar 2010 23:26:03 +0100
Received: from gandalf.denix.org ([unknown] [71.251.51.225])
	by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0KYM0075NJI4YCF4@vms173019.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Mon,
	01 Mar 2010 16:22:58 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 2B79A14AF60; Mon,
	01 Mar 2010 17:22:52 -0500 (EST)
Date: Mon, 01 Mar 2010 17:22:52 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20100301222252.GE15391@denix.org>
References: <1267478308.4739.245.camel@trini-m4400>
MIME-version: 1.0
In-reply-to: <1267478308.4739.245.camel@trini-m4400>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.19
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=none autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH, RFC] Cleanup / update QEMU related checks
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
X-List-Received-Date: Mon, 01 Mar 2010 22:26:04 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Mon, Mar 01, 2010 at 02:18:28PM -0700, Tom Rini wrote:
> First, we should be performing qemu-native related checks not on ARM,
> but on ENABLE_BINARY_LOCALE_GENERATION (for both the ARM but no
> generation and not ARM but generation) cases.  This clarifies what we do
> in the first sub-check (aside: When can qemu-0.9.x die?).  This changes
> the assume provided check to make sure that at least 'qemu' exists
> (afaict this will exist for distribution packages as well as from-source
> ones where we might not have qemu-arm, if the developer isn't doing arm)
> using the standard check.  Finally (how I wrote it, not how it's in the
> patch), correct (grammar and content) the comment about what GCC
> versions are allowed.  My fault initially for not noticing the gcc
> 3.3.x / 3.2.x stuff in the list.

Heh, I have a local similar change to avoid unnecessary QEMU sanity check, 
when not doing binary locale generation. I wanted to push it later, but your 
fix looks better :)

> Signed-off-by: Tom Rini <tom_rini@mentor.com>

Acked-by: Denys Dmytriyenko <denis@denix.org>


> diff --git a/classes/base.bbclass b/classes/base.bbclass
> index 990e75e..eeff262 100644
> --- a/classes/base.bbclass
> +++ b/classes/base.bbclass
> @@ -1333,16 +1333,15 @@ def check_app_exists(app, d):
>  	return len(which(path, app)) != 0
>  
>  def check_gcc3(data):
> -	# Primarly used by qemu to make sure we have a workable gcc-3.4.x.
> -	# Start by checking for the program name as we build it, was not
> -	# all host-provided gcc-3.4's will work.
> -
> +	# Primarly used by qemu to make sure we have a workable gcc-3.x.
> +	# Start by checking for the program name as we build it as there
> +	# are some distribtuion provided gcc-3.x's that will not work.
>  	gcc3_versions = 'gcc-3.4.6 gcc-3.4.4 gcc34 gcc-3.4 gcc-3.4.7 gcc-3.3
> gcc33 gcc-3.3.6 gcc-3.2 gcc32'
>  
>  	for gcc3 in gcc3_versions.split():
>  		if check_app_exists(gcc3, data):
>  			return gcc3
> -	
> +
>  	return False
>  
>  # Patch handling
> diff --git a/classes/sanity.bbclass b/classes/sanity.bbclass
> index b66c9a9..a78e8ed 100644
> --- a/classes/sanity.bbclass
> +++ b/classes/sanity.bbclass
> @@ -83,8 +83,10 @@ def check_sanity(e):
>  
>  	required_utilities = "patch help2man diffstat texi2html makeinfo cvs
> svn bzip2 tar gzip gawk md5sum"
>  
> -	if data.getVar('TARGET_ARCH', e.data, True) == "arm":
> -		# qemu-native needs gcc 3.x
> +	# If we'll be running qemu, perform some sanity checks
> +	if data.getVar('ENABLE_BINARY_LOCALE_GENERATION', e.data, True):
> +		# Some versions of qemu-native needs gcc 3.x.  Do a special
> +		# check here to allow for host 'gcc' is 3.x.
>  		if "qemu-native" not in assume_provided and "gcc3-native" in
> assume_provided:
>  			gcc_version = commands.getoutput("${BUILD_PREFIX}gcc --version |
> head -n 1 | cut -f 3 -d ' '")
>  
> @@ -93,8 +95,7 @@ def check_sanity(e):
>  				missing = missing + "gcc-3.x (needed for qemu-native),"
>  
>  		if "qemu-native" in assume_provided:
> -			if not check_app_exists("qemu-arm", e.data):
> -				messages = messages + "qemu-native was in ASSUME_PROVIDED but the
> QEMU binaries (qemu-arm) can't be found in PATH"
> +			required_utilities += "qemu"
>  
>  		try:
>  			if os.path.exists("/proc/sys/vm/mmap_min_addr"):
> 
> 
> -- 
> Tom Rini <tom_rini@mentor.com>
> Mentor Graphics Corporation
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


