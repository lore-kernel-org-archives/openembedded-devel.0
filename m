Received: from vms173007pub.verizon.net ([206.46.173.7])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1Q79NI-000557-GR
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Apr 2011 18:45:04 +0200
Received: from gandalf.denix.org ([unknown] [108.18.140.4])
	by vms173007.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LJ600KJUUF2IF90@vms173007.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Tue,
	05 Apr 2011 11:42:43 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id E618814AF5B; Tue,
	05 Apr 2011 12:42:37 -0400 (EDT)
Date: Tue, 05 Apr 2011 12:42:37 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20110405164237.GI7168@denix.org>
References: <1302005404-21580-1-git-send-email-heroor@gmail.com>
	<1302005404-21580-3-git-send-email-heroor@gmail.com>
MIME-version: 1.0
In-reply-to: <1302005404-21580-3-git-send-email-heroor@gmail.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
Cc: Siddharth Heroor <heroor@ti.com>
Subject: Re: [PATCH 3/4] ti-sysbios: Update Installer unpack commands.
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
X-List-Received-Date: Tue, 05 Apr 2011 16:45:04 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Apr 05, 2011 at 05:40:03PM +0530, Siddharth Heroor wrote:
> From: Siddharth Heroor <heroor@ti.com>
> 
> * New versions of TI Sys/Bios use a different installer unpack
>   command.
> * Bump PR.
> 
> Signed-off-by: Siddharth Heroor <heroor@ti.com>

Acked-by: Denys Dmytriyenko <denys@ti.com>

> ---
>  recipes/ti/ti-sysbios.inc |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes/ti/ti-sysbios.inc b/recipes/ti/ti-sysbios.inc
> index 84a76a4..046b6fe 100644
> --- a/recipes/ti/ti-sysbios.inc
> +++ b/recipes/ti/ti-sysbios.inc
> @@ -7,14 +7,14 @@ require ti-paths.inc
>  require ti-staging.inc
>  require ti-eula-unpack.inc
>  
> -PR = "r1"
> +PR = "r2"
>  
>  S = "${WORKDIR}/bios_${PV}"
>  
>  SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/bios/sysbios/${PV}/exports/bios_setuplinux_${PV}.bin;name=sysbiosbin"
>  
>  BINFILE="bios_setuplinux_${PV}.bin"
> -TI_BIN_UNPK_CMDS="Y: qY:workdir:Y"
> +TI_BIN_UNPK_CMDS="Y: q:workdir:Y"
>  
>  do_install() {
>      install -d ${D}${SYSBIOS_INSTALL_DIR_RECIPE}
> -- 
> 1.7.0.4
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


