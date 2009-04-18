Received: from [206.46.173.5] (helo=vms173005pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1LvErr-0008K6-Oe
	for openembedded-devel@lists.openembedded.org;
	Sat, 18 Apr 2009 20:02:19 +0200
Received: from gandalf.denix.org ([71.255.242.201]) by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KIB00HXN5VV36Z1@vms173005.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Sat,
	18 Apr 2009 12:57:37 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 7113F6B83B5; Sat,
	18 Apr 2009 13:57:31 -0400 (EDT)
Date: Sat, 18 Apr 2009 13:57:31 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090418175731.GB8535@denix.org>
References: <1240039366-5095-1-git-send-email-k.kooi@student.utwente.nl>
MIME-version: 1.0
In-reply-to: <1240039366-5095-1-git-send-email-k.kooi@student.utwente.nl>
User-Agent: Mutt/1.5.16 (2007-06-09)
Cc: Koen Kooi <koen@openembedded.org>
Subject: Re: [STABLE][PATCH] libelf: fix another GNU_HASH issues while	building libelf
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
X-List-Received-Date: Sat, 18 Apr 2009 18:02:20 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Sat, Apr 18, 2009 at 09:22:46AM +0200, Koen Kooi wrote:
> From: Carsten Haitzler (Rasterman <raster@rasterman.com>
> 
> 
> Signed-off-by: Koen Kooi <koen@openembedded.org>

Acked-by: Denys Dmytriyenko <denis@denix.org>

> ---
>  recipes/libelf/libelf_0.8.6.bb |    3 +++
>  1 files changed, 3 insertions(+), 0 deletions(-)
> 
> diff --git a/recipes/libelf/libelf_0.8.6.bb b/recipes/libelf/libelf_0.8.6.bb
> index 4bd548e..f0903d7 100644
> --- a/recipes/libelf/libelf_0.8.6.bb
> +++ b/recipes/libelf/libelf_0.8.6.bb
> @@ -2,6 +2,7 @@ DESCRIPTION = "libelf is an ELF object file access library. \
>  The elf library provides routines to access, and manipulate, Elf object files."
>  LICENSE = "LGPL"
>  SECTION = "libs"
> +PR = "r1"
>  
>  SRC_URI = "http://www.mr511.de/software/libelf-${PV}.tar.gz \
>             http://www.stud.uni-hannover.de/~michael/software/libelf-${PV}.tar.gz"
> @@ -10,6 +11,8 @@ inherit autotools
>  
>  PARALLEL_MAKE = ""
>  
> +TARGET_CC_ARCH += "${LDFLAGS}"
> +
>  do_configure_prepend () {
>  	if test ! -e acinclude.m4; then
>  		cp aclocal.m4 acinclude.m4
> -- 
> 1.5.6.5
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


