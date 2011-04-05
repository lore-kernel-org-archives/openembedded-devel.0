Received: from vms173003pub.verizon.net ([206.46.173.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1Q79Ma-0004v3-Rp
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Apr 2011 18:44:21 +0200
Received: from gandalf.denix.org ([unknown] [108.18.140.4])
	by vms173003.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LJ600BV9UEE5QE1@vms173003.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Tue,
	05 Apr 2011 11:42:14 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 5EEED14AF5B; Tue,
	05 Apr 2011 12:42:14 -0400 (EDT)
Date: Tue, 05 Apr 2011 12:42:14 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20110405164214.GH7168@denix.org>
References: <1302005404-21580-1-git-send-email-heroor@gmail.com>
	<1302005404-21580-2-git-send-email-heroor@gmail.com>
MIME-version: 1.0
In-reply-to: <1302005404-21580-2-git-send-email-heroor@gmail.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
Cc: Siddharth Heroor <heroor@ti.com>
Subject: Re: [PATCH 2/4] ti-sysbios: Copy installer unpack to recipe	versions.
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
X-List-Received-Date: Tue, 05 Apr 2011 16:44:21 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Apr 05, 2011 at 05:40:02PM +0530, Siddharth Heroor wrote:
> From: Siddharth Heroor <heroor@ti.com>
> 
> * Newer versions of Sys/Bios have a different unpack sequence.
>   This patch is in preparation for a new versions that use the
>   new unpack sequence.
> 
> Signed-off-by: Siddharth Heroor <heroor@ti.com>

Acked-by: Denys Dmytriyenko <denys@ti.com>

> ---
>  recipes/ti/ti-sysbios_6.21.01.16.bb |    1 +
>  recipes/ti/ti-sysbios_6.31.00.18.bb |    1 +
>  2 files changed, 2 insertions(+), 0 deletions(-)
> 
> diff --git a/recipes/ti/ti-sysbios_6.21.01.16.bb b/recipes/ti/ti-sysbios_6.21.01.16.bb
> index f26858a..848ae36 100644
> --- a/recipes/ti/ti-sysbios_6.21.01.16.bb
> +++ b/recipes/ti/ti-sysbios_6.21.01.16.bb
> @@ -5,3 +5,4 @@ PV = "6_21_01_16"
>  SRC_URI[sysbiosbin.md5sum] = "411cd0fac224126ed2a81e67fc79c81a"
>  SRC_URI[sysbiosbin.sha256sum] = "63d2704ff294fe0834411d010d19c0a0bfd0249520f5ee5ddc2c115df2be8ddd"
>  
> +TI_BIN_UNPK_CMDS="Y: qY:workdir:Y"
> diff --git a/recipes/ti/ti-sysbios_6.31.00.18.bb b/recipes/ti/ti-sysbios_6.31.00.18.bb
> index 8bed7f4..a25c924 100644
> --- a/recipes/ti/ti-sysbios_6.31.00.18.bb
> +++ b/recipes/ti/ti-sysbios_6.31.00.18.bb
> @@ -5,3 +5,4 @@ PV = "6_31_00_18"
>  SRC_URI[sysbiosbin.md5sum] = "a37fe51f208d7cb63a6fae09d3285c69"
>  SRC_URI[sysbiosbin.sha256sum] = "2d5cedffdc554e545ee9e233ba760e95b97904f6ea0ca3dbdd56a422b05e2b62"
>  
> +TI_BIN_UNPK_CMDS="Y: qY:workdir:Y"
> -- 
> 1.7.0.4
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


