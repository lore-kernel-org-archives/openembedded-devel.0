Received: from vms173005pub.verizon.net ([206.46.173.5])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1S7CV5-0002Bh-Ag
	for openembedded-devel@lists.openembedded.org;
	Mon, 12 Mar 2012 22:09:51 +0100
Received: from gandalf.denix.org ([unknown] [71.178.225.66])
	by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M0S00MJNIDADCN1@vms173005.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Mon,
	12 Mar 2012 16:00:49 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 900DB2016E; Mon,
	12 Mar 2012 17:00:46 -0400 (EDT)
Date: Mon, 12 Mar 2012 17:00:46 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20120312210046.GC9300@denix.org>
References: <1331273267-17295-1-git-send-email-daniel.zauner@me.com>
MIME-version: 1.0
In-reply-to: <1331273267-17295-1-git-send-email-daniel.zauner@me.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH v2 [2011.03-maintenance]] Changed the Source-URI from (currently?) dead openmoko SVN-Server to new git-repository at git.yoctoproject.org
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
X-List-Received-Date: Mon, 12 Mar 2012 21:09:51 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

Two comments:

1. The patch description got messed up and went all in the Subject. Don't use 
nested square brackets [[]], use them in sequence [][] or just one of those.

2. Use -M flag to git-format-patch so it catches the rename and makes the 
patch readable again.

-- 
Denys


On Fri, Mar 09, 2012 at 07:07:47AM +0100, Daniel Zauner wrote:
> Signed-off-by: Daniel Zauner <daniel.zauner@me.com>
> ---
>  recipes/opkg-utils/opkg-utils_git.bb |   27 +++++++++++++++++++++++++++
>  recipes/opkg-utils/opkg-utils_svn.bb |   25 -------------------------
>  2 files changed, 27 insertions(+), 25 deletions(-)
>  create mode 100644 recipes/opkg-utils/opkg-utils_git.bb
>  delete mode 100644 recipes/opkg-utils/opkg-utils_svn.bb
> 
> diff --git a/recipes/opkg-utils/opkg-utils_git.bb b/recipes/opkg-utils/opkg-utils_git.bb
> new file mode 100644
> index 0000000..6adc7c1
> --- /dev/null
> +++ b/recipes/opkg-utils/opkg-utils_git.bb
> @@ -0,0 +1,27 @@
> +DESCRIPTION = "OPKG Package Manager Utilities"
> +SECTION = "base"
> +HOMEPAGE = "http://wiki.openmoko.org/wiki/Opkg"
> +PRIORITY = "optional"
> +LICENSE = "GPLv2"
> +RDEPENDS_${PN} = "python"
> +RDEPENDS_${PN}_virtclass-native = ""
> +SRCREV = "002d29bc605d7c2d02e4cf20a43c5277c15f5597"
> +PV = "0.1.8+gitr${SRCPV}"
> +PR = "r0"
> +
> +SRC_URI = "git://git.yoctoproject.org/opkg-utils;protocol=git \
> +           file://index-ignore-filenotfound.patch \
> +           file://arfile_header_split.patch \
> +           file://mtime-int.patch"
> +
> +S = "${WORKDIR}/git"
> +
> +# Avoid circular dependencies from package_ipk.bbclass
> +PACKAGES_virtclass-native = ""
> +
> +do_install() {
> +        oe_runmake PREFIX=${prefix} DESTDIR=${D} install
> +}
> +
> +BBCLASSEXTEND = "native"
> +TARGET_CC_ARCH += "${LDFLAGS}"
> diff --git a/recipes/opkg-utils/opkg-utils_svn.bb b/recipes/opkg-utils/opkg-utils_svn.bb
> deleted file mode 100644
> index 6b8d3ea..0000000
> --- a/recipes/opkg-utils/opkg-utils_svn.bb
> +++ /dev/null
> @@ -1,25 +0,0 @@
> -DESCRIPTION = "OPKG Package Manager Utilities"
> -SECTION = "base"
> -HOMEPAGE = "http://wiki.openmoko.org/wiki/Opkg"
> -PRIORITY = "optional"
> -RDEPENDS_${PN} = "python"
> -RDEPENDS_${PN}_virtclass-native = ""
> -SRCREV = "4747"
> -PV = "0.1.8+svnr${SRCPV}"
> -PR = "r6"
> -
> -SRC_URI = "svn://svn.openmoko.org/trunk/src/host/;module=opkg-utils;proto=http \
> -           file://index-ignore-filenotfound.patch \
> -           file://mtime-int.patch"
> -
> -S = "${WORKDIR}/opkg-utils"
> -
> -# Avoid circular dependencies from package_ipk.bbclass
> -PACKAGES_virtclass-native = ""
> -
> -do_install() {
> -        oe_runmake PREFIX=${prefix} DESTDIR=${D} install
> -}
> -
> -BBCLASSEXTEND = "native"
> -TARGET_CC_ARCH += "${LDFLAGS}"
> -- 
> 1.7.2.5
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


