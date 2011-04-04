Received: from vms173017pub.verizon.net ([206.46.173.17])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1Q6dkD-0001CU-Ox
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Apr 2011 08:58:37 +0200
Received: from gandalf.denix.org ([unknown] [108.18.140.4])
	by vms173017.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LJ4007XF8M8G280@vms173017.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Mon,
	04 Apr 2011 01:56:32 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 2809714AF6C; Mon,
	04 Apr 2011 02:56:32 -0400 (EDT)
Date: Mon, 04 Apr 2011 02:56:32 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20110404065632.GI23178@denix.org>
References: <1301760796-10105-1-git-send-email-c-hernandez8@ti.com>
MIME-version: 1.0
In-reply-to: <1301760796-10105-1-git-send-email-c-hernandez8@ti.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
Cc: Carlos Hernandez <c-hernandez8@ti.com>
Subject: Re: [PATCH 1/1] lmbench: rename 'line' binary as 'lm_line'
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
X-List-Received-Date: Mon, 04 Apr 2011 06:58:38 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Sat, Apr 02, 2011 at 12:13:16PM -0400, Carlos Hernandez wrote:
> Both lmbench and util-linux-ng packages provide own /usr/bin/line binaries.
> Even though the binaries name is the same, their functionality is different.
> This patch renames lmbench's line binary as lm_line to avoid conflicts with
> util-linux-ng.
> script/config-run is also modified (patch) to call lm_line instead of line.
> Signed-off-By: Carlos Hernandez <c-hernandez8@ti.com>

Acked-by: Denys Dmytriyenko <denys@ti.com>

> ---
>  recipes/lmbench/lmbench/rename-line-binary.patch |   11 +++++++++++
>  recipes/lmbench/lmbench_3.0-a9.bb                |    6 ++++--
>  2 files changed, 15 insertions(+), 2 deletions(-)
>  create mode 100644 recipes/lmbench/lmbench/rename-line-binary.patch
> 
> diff --git a/recipes/lmbench/lmbench/rename-line-binary.patch b/recipes/lmbench/lmbench/rename-line-binary.patch
> new file mode 100644
> index 0000000..997143b
> --- /dev/null
> +++ b/recipes/lmbench/lmbench/rename-line-binary.patch
> @@ -0,0 +1,11 @@
> +--- patches/scripts/config-run	2006-11-26 15:11:04.000000000 -0500
> ++++ patches/scripts/config-run	2011-04-01 09:35:50.000000000 -0400
> +@@ -224,7 +224,7 @@ fi
> + 
> + echo "Hang on, we are calculating your cache line size."
> + ../bin/$OS/msleep 250
> +-LINE_SIZE=`../bin/$OS/line -M ${MB}M`
> ++LINE_SIZE=`../bin/$OS/lm_line -M ${MB}M`
> + export LINE_SIZE
> + echo "OK, it looks like your cache line is $LINE_SIZE bytes."
> + echo ""
> diff --git a/recipes/lmbench/lmbench_3.0-a9.bb b/recipes/lmbench/lmbench_3.0-a9.bb
> index 1e2598a..65771a4 100644
> --- a/recipes/lmbench/lmbench_3.0-a9.bb
> +++ b/recipes/lmbench/lmbench_3.0-a9.bb
> @@ -3,12 +3,13 @@ DESCRIPTION = "Tools for performance analysis."
>  LICENSE = "GPL"
>  RDEPENDS_${PN} = "debianutils"
>  
> -PR = "r2"
> +PR = "r3"
>  
>  inherit autotools
>  
>  SRC_URI = "${SOURCEFORGE_MIRROR}/lmbench/lmbench-${PV}.tgz \
> -	   file://lmbench-run"
> +	   file://lmbench-run \
> +          file://rename-line-binary.patch"
>  SRC_URI[md5sum] = "b3351a3294db66a72e2864a199d37cbf"
>  SRC_URI[sha256sum] = "cbd5777d15f44eab7666dcac418054c3c09df99826961a397d9acf43d8a2a551"
>  
> @@ -56,6 +57,7 @@ do_install () {
>  	install -m 0755 ${S}/scripts/lmbench ${D}${bindir}
>  	install -d ${D}${datadir}/lmbench/scripts
>  	install -m 0755 ${S}/scripts/* ${D}${datadir}/lmbench/scripts
> +	mv ${D}${bindir}/line ${D}${bindir}/lm_line
>  }
>  
>  FILES_${PN} += "${datadir}/lmbench"
> -- 
> 1.7.0.4
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


