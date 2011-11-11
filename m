Received: from vms173019pub.verizon.net ([206.46.173.19])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1RP0fx-0003JR-E1
	for openembedded-devel@lists.openembedded.org;
	Sat, 12 Nov 2011 00:38:25 +0100
Received: from gandalf.denix.org ([unknown] [96.240.135.93])
	by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LUI009ILS12JH52@vms173019.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Fri,
	11 Nov 2011 17:31:56 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id E346614AF5D; Fri,
	11 Nov 2011 18:31:49 -0500 (EST)
Date: Fri, 11 Nov 2011 18:31:49 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20111111233149.GF20602@denix.org>
References: <1321046081-26585-1-git-send-email-michael_e_brown@dell.com>
MIME-version: 1.0
In-reply-to: <1321046081-26585-1-git-send-email-michael_e_brown@dell.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
Cc: Michael Brown <Michael_E_Brown@dell.com>
Subject: Re: [PATCH] gcc-4.6: fix toolchain build for SH4
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
X-List-Received-Date: Fri, 11 Nov 2011 23:38:25 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Fri, Nov 11, 2011 at 03:14:41PM -0600, michael_e_brown@dell.com wrote:
> From: Michael Brown <Michael_E_Brown@Dell.com>
> 
> Signed-off-by: Michael Brown <Michael_E_Brown@dell.com>

This is a wrong mailing list for this patch - it needs to go to 
openembedded-core instead.

-- 
Denys


> Port patch from base openembedded. Since 4.6 already has fixes for config.gcc,
> the fix only requires a one line change to gcc-cross4.inc.
> 
> The patch was imported from the OpenEmbedded git server
> (git://git.openembedded.org/openembedded) as of commit id
> 3aa8afe97e9cf1340feb9c4442a6ed88b7e32c96.
> 
> gcc-4.5: Fix toolchain builds for SH4/SH3
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-devtools/gcc/gcc-cross4.inc |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)
> 
> diff --git a/meta/recipes-devtools/gcc/gcc-cross4.inc b/meta/recipes-devtools/gcc/gcc-cross4.inc
> index ea20a24..4a20818 100644
> --- a/meta/recipes-devtools/gcc/gcc-cross4.inc
> +++ b/meta/recipes-devtools/gcc/gcc-cross4.inc
> @@ -1 +1,3 @@
>  require gcc-cross.inc
> +
> +EXTRA_OECONF_append_sh4 = " --with-multilib-list= --enable-incomplete-targets "
> -- 
> 1.7.6.4
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


