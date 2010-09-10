Received: from vms173009pub.verizon.net ([206.46.173.9])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1Ou8ps-0000XY-GI
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 Sep 2010 21:00:34 +0200
Received: from gandalf.denix.org ([unknown] [71.251.53.61])
	by vms173009.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0L8J00C97OQWOXMR@vms173009.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Fri,
	10 Sep 2010 13:59:26 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id D171914AF60; Fri,
	10 Sep 2010 14:59:19 -0400 (EDT)
Date: Fri, 10 Sep 2010 14:59:19 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20100910185919.GH28148@denix.org>
References: <1283879144-9127-1-git-send-email-chase.maupin@ti.com>
MIME-version: 1.0
In-reply-to: <1283879144-9127-1-git-send-email-chase.maupin@ti.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.9
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] sourceipk: make extra files inclusion optional
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
X-List-Received-Date: Fri, 10 Sep 2010 19:00:34 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Sep 07, 2010 at 12:05:44PM -0500, Chase Maupin wrote:
> * Make the inclusion of the README and recipe files optional
>   for source ipks.  For some packages the sources owner may not
>   want these additional files added to their sources.
> 
> Signed-off-by: Chase Maupin <chase.maupin@ti.com>

FYI, I pushed this patch last night, as it's a faily separate class and nobody 
seems to use it as of yet.

-- 
Denys


> ---
>  classes/sourceipk.bbclass |   15 ++++++++++++---
>  1 files changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/classes/sourceipk.bbclass b/classes/sourceipk.bbclass
> index 4957e4a..182785b 100644
> --- a/classes/sourceipk.bbclass
> +++ b/classes/sourceipk.bbclass
> @@ -14,6 +14,9 @@
>  #   - SRCIPK_PACKAGE_ARCH   = This variable allows specific recipies to
>  #                             specify an architecture for the sourcetree
>  #                             package is "all" is not appropriate
> +#   - SRCIPK_INC_EXTRAFILES = When set to 1 this variable indicates that
> +#                             the source ipk should contain extra files
> +#                             such as the README file and recipe.
>  #
>  # The default installation directory for the sources is:
>  #   /usr/src/${PN}-src
> @@ -47,6 +50,9 @@ SRCIPK_INSTALL_DIR ?= "/usr/src/${PN}-src"
>  # Default PACKAGE_ARCH for sources is "all"
>  SRCIPK_PACKAGE_ARCH ?= "all"
>  
> +# Default SRCIPK_INCLUDE_EXTRAFILES is to include the extra files
> +SRCIPK_INCLUDE_EXTRAFILES ?= "1"
> +
>  # Create a README file that describes the contents of the source ipk
>  sourceipk_create_readme() {
>      readme="$1/README.${PN}-src"
> @@ -91,7 +97,6 @@ sourceipk_do_create_srcipk() {
>              srcuri="OpenEmbedded"
>          fi
>          echo "Source: $srcuri" >> $control_file
> -
>          #Write the control tarball
>          tar -C $tmp_dir/CONTROL --owner=0 --group=0 -czf $srcipk_dir/control.tar.gz .
>  
> @@ -101,8 +106,12 @@ sourceipk_do_create_srcipk() {
>          # Copy sources for packaging
>          mkdir -p $tmp_dir/${SRCIPK_INSTALL_DIR}
>          cp -rLf ${S}/* $tmp_dir/${SRCIPK_INSTALL_DIR}/
> -        sourceipk_create_readme $tmp_dir/${SRCIPK_INSTALL_DIR}/
> -        cp ${FILE} $tmp_dir/${SRCIPK_INSTALL_DIR}/
> +
> +        if [ ${SRCIPK_INCLUDE_EXTRAFILES} != "0" ]
> +        then
> +            sourceipk_create_readme $tmp_dir/${SRCIPK_INSTALL_DIR}/
> +            cp ${FILE} $tmp_dir/${SRCIPK_INSTALL_DIR}/
> +        fi
>  
>          #Write the data tarball
>          tar -C $tmp_dir --owner=0 --group=0 -czf $srcipk_dir/data.tar.gz .
> -- 
> 1.7.0.4
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


