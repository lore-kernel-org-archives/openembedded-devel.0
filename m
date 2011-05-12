Received: from vms173003pub.verizon.net ([206.46.173.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1QKY5x-0006qH-M7
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 May 2011 17:46:33 +0200
Received: from gandalf.denix.org ([unknown] [108.18.140.4])
	by vms173003.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LL300CY2ABQL289@vms173003.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Thu,
	12 May 2011 10:43:15 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 5750214AF5B; Thu,
	12 May 2011 11:43:02 -0400 (EDT)
Date: Thu, 12 May 2011 11:43:02 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20110512154302.GC21678@denix.org>
References: <1305065862-22878-1-git-send-email-Chase.Maupin@ti.com>
MIME-version: 1.0
In-reply-to: <1305065862-22878-1-git-send-email-Chase.Maupin@ti.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: Re: [PATCH] pcsc-lite: make configuration file a separate	package
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
X-List-Received-Date: Thu, 12 May 2011 15:46:33 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, May 10, 2011 at 05:17:42PM -0500, Chase Maupin wrote:
> * Move the reader.conf file to be part of a separate package
>   so that it is not installed by default.
> * This is done because individual readers that implements an
>   IFDHandler library need to be able to install their reader.conf
>   file in the /etc/reader.conf.d directory.  Without this change

Chase,

Sorry, it did not occur to me yesterday, when helping with the patch, but I 
just realised now that /etc/reader.conf.d (like any other dir.d denotion) 
should expect a set of config files and not just one specific one.

So, I started checking the sources and the ChangeLog from pcsc-lite and got it 
confirmed - you can pretty much drop a set of files into that directory and 
all of them will be parsed for the configuration. So, since the default file 
is only a template with all the configuration commented out, you should be 
safe to install your own config files in that directory with different names. 
That way you don't need any changes to the pcsc-lite recipe...

One of the relative enties from ChangeLog:
- Add the ability to parse all the configuration files of a directory
  instead of just one configuration file. update-reader.conf is then now
  obsolete.

-- 
Denys

>   those packages will conflict with the reader.conf file installed
>   by the pcsc-lite package:
>     * NOTE: the reader.conf file in the package is a commented out
>             template file, not an actual working configuration
>             file.
> * Using this change IFDHandler packages can use RCONFLICT with
>   the pcsc-lite-collateral package to let users know that these
>   packages cannot co-exist.
> * Mark the configuration file an such so that when the package is
>   updated the user's changes are not lost.
> * Bump the PR.
> 
> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> ---
>  recipes/pcsc-lite/pcsc-lite_1.5.2.bb |    5 +++++
>  1 files changed, 5 insertions(+), 0 deletions(-)
> 
> diff --git a/recipes/pcsc-lite/pcsc-lite_1.5.2.bb b/recipes/pcsc-lite/pcsc-lite_1.5.2.bb
> index b4af08d..88401b6 100644
> --- a/recipes/pcsc-lite/pcsc-lite_1.5.2.bb
> +++ b/recipes/pcsc-lite/pcsc-lite_1.5.2.bb
> @@ -5,6 +5,8 @@ LICENSE = "BSD"
>  DEPENDS = "hal"
>  RDEPENDS_${PN} = "hal"
>  
> +PR = "r1"
> +
>  SRC_URI = "https://alioth.debian.org/frs/download.php/2795/pcsc-lite-${PV}.tar.bz2 \
>             file://pcscd.init "
>  
> @@ -26,8 +28,11 @@ do_install() {
>  }
>  
>  PACKAGES =+ "libpcsclite"
> +PACKAGES =+ "${PN}-collateral"
>  
>  FILES_libpcsclite = "${libdir}/libpcsclite.so.*"
> +FILES_${PN}-collateral = "${sysconfdir}/reader.conf.d/*"
> +CONFFILES_${PN}-collateral = "${sysconfdir}/reader.conf.d/*"
>  
>  SRC_URI[md5sum] = "d7d466621bec39354351f09349f6374c"
>  SRC_URI[sha256sum] = "a0c11b0b5cc46d4c4ec499b875cfdc4e766fdf12fe2f6ea635e1b11ab7b8821e"
> -- 
> 1.7.0.4
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


