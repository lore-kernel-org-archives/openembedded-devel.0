Received: from vms173019pub.verizon.net ([206.46.173.19])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1QBWjN-0005dA-Ar
	for openembedded-devel@lists.openembedded.org;
	Sun, 17 Apr 2011 20:29:58 +0200
Received: from gandalf.denix.org ([unknown] [108.18.140.4])
	by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LJT006UH79UMZW0@vms173019.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Sun,
	17 Apr 2011 13:27:30 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 4C3B714AF5B; Sun,
	17 Apr 2011 14:27:30 -0400 (EDT)
Date: Sun, 17 Apr 2011 14:27:30 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20110417182730.GC4068@denix.org>
References: <1302319620-18223-1-git-send-email-heroor@gmail.com>
	<1302319620-18223-4-git-send-email-heroor@gmail.com>
MIME-version: 1.0
In-reply-to: <1302319620-18223-4-git-send-email-heroor@gmail.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
Cc: Siddharth Heroor <heroor@ti.com>
Subject: Re: [PATCHv3 4/5] ti-syslink-module: Add Syslink version	02.00.00.68 Beta1
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
X-List-Received-Date: Sun, 17 Apr 2011 18:29:58 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Sat, Apr 09, 2011 at 08:56:59AM +0530, Siddharth Heroor wrote:
> From: Siddharth Heroor <heroor@ti.com>
> 
> 
> Signed-off-by: Siddharth Heroor <heroor@ti.com>
> ---
>  ...-syslink-module_02.00.00.67+02.00.00.68beta1.bb |   11 +++++++++++
>  1 files changed, 11 insertions(+), 0 deletions(-)
>  create mode 100644 recipes/ti/ti-syslink-module_02.00.00.67+02.00.00.68beta1.bb

Sid,

Renaming the file with the proper versioning doesn't do any good, when you set 
the actual PV inside the recipe to the wrong value anyway - bitbake and opkg 
will sort by PV and not the recipe name! Hence, you are setting the version to 
02_00_00_68 and what happens when the real 02_00_00_68 gets released?

I did some quick editing and will send the updated patches for #4 and #5 - 
please review and provide feedback. Thanks.

-- 
Denys

> diff --git a/recipes/ti/ti-syslink-module_02.00.00.67+02.00.00.68beta1.bb b/recipes/ti/ti-syslink-module_02.00.00.67+02.00.00.68beta1.bb
> new file mode 100644
> index 0000000..f7bcb35
> --- /dev/null
> +++ b/recipes/ti/ti-syslink-module_02.00.00.67+02.00.00.68beta1.bb
> @@ -0,0 +1,11 @@
> +require ti-syslink-module.inc
> +
> +PV = "02_00_00_68"
> +PVExtra = "_beta1"
> +
> +S = "${WORKDIR}/syslink_${PV}${PVExtra}/ti/syslink/utils/hlos/knl/Linux"
> +SYSLINK_ROOT = "${WORKDIR}/syslink_${PV}${PVExtra}"
> +
> +SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/SysLink/${PV}${PVExtra}/exports/syslink_${PV}${PVExtra}.tar.gz;name=syslinktarball"
> +SRC_URI[syslinktarball.md5sum] = "468034372124f70f82b60cfb5f11c8e8"
> +SRC_URI[syslinktarball.sha256sum] = "ed574dcb3a5477cfbc69a1c9e768d5197291cb057d19fd791e16e1c89af3e8e1"
> -- 
> 1.7.0.4
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


