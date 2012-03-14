Received: from vms173007pub.verizon.net ([206.46.173.7])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1S7dCh-0007uf-15
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Mar 2012 02:40:39 +0100
Received: from gandalf.denix.org ([unknown] [71.178.225.66])
	by vms173007.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M0U007CVMSSHME2@vms173007.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Tue,
	13 Mar 2012 19:31:40 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 27EE8201F9; Tue,
	13 Mar 2012 20:31:39 -0400 (EDT)
Date: Tue, 13 Mar 2012 20:31:39 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20120314003139.GD22672@denix.org>
References: <20120313175009.GA12674@bill-the-cat>
	<1331661831-1684-1-git-send-email-daniel.zauner@me.com>
MIME-version: 1.0
In-reply-to: <1331661831-1684-1-git-send-email-daniel.zauner@me.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH v3][2011.03-maintenance] Changed the Source-URI from (currently?) dead openmoko SVN-Server to new git-repository at git.yoctoproject.org
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
X-List-Received-Date: Wed, 14 Mar 2012 01:40:39 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

Well, this time it's better, but you still didn't make the description 
properly. Did you forget to provide a short one-liner and then after an empty 
line a more descriptive changelog?

Please follow the Guidelines at:
http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines

-- 
Denys


On Tue, Mar 13, 2012 at 07:03:51PM +0100, Daniel Zauner wrote:
> Signed-off-by: Daniel Zauner <daniel.zauner@me.com>
> ---
>  .../{opkg-utils_svn.bb => opkg-utils_git.bb}       |   12 +++++++-----
>  1 files changed, 7 insertions(+), 5 deletions(-)
>  rename recipes/opkg-utils/{opkg-utils_svn.bb => opkg-utils_git.bb} (68%)
> 
> diff --git a/recipes/opkg-utils/opkg-utils_svn.bb b/recipes/opkg-utils/opkg-utils_git.bb
> similarity index 68%
> rename from recipes/opkg-utils/opkg-utils_svn.bb
> rename to recipes/opkg-utils/opkg-utils_git.bb
> index 6b8d3ea..6adc7c1 100644
> --- a/recipes/opkg-utils/opkg-utils_svn.bb
> +++ b/recipes/opkg-utils/opkg-utils_git.bb
> @@ -2,17 +2,19 @@ DESCRIPTION = "OPKG Package Manager Utilities"
>  SECTION = "base"
>  HOMEPAGE = "http://wiki.openmoko.org/wiki/Opkg"
>  PRIORITY = "optional"
> +LICENSE = "GPLv2"
>  RDEPENDS_${PN} = "python"
>  RDEPENDS_${PN}_virtclass-native = ""
> -SRCREV = "4747"
> -PV = "0.1.8+svnr${SRCPV}"
> -PR = "r6"
> +SRCREV = "002d29bc605d7c2d02e4cf20a43c5277c15f5597"
> +PV = "0.1.8+gitr${SRCPV}"
> +PR = "r0"
>  
> -SRC_URI = "svn://svn.openmoko.org/trunk/src/host/;module=opkg-utils;proto=http \
> +SRC_URI = "git://git.yoctoproject.org/opkg-utils;protocol=git \
>             file://index-ignore-filenotfound.patch \
> +           file://arfile_header_split.patch \
>             file://mtime-int.patch"
>  
> -S = "${WORKDIR}/opkg-utils"
> +S = "${WORKDIR}/git"
>  
>  # Avoid circular dependencies from package_ipk.bbclass
>  PACKAGES_virtclass-native = ""
> -- 
> 1.7.2.5
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


