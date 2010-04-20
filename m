Received: from vms173007pub.verizon.net ([206.46.173.7])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1O4GB0-0002UG-Fj
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Apr 2010 18:19:57 +0200
Received: from gandalf.denix.org ([unknown] [71.251.58.177])
	by vms173007.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0L1600G7YNUHCT41@vms173007.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Tue,
	20 Apr 2010 11:15:58 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 465EC14AF60; Tue,
	20 Apr 2010 12:15:53 -0400 (EDT)
Date: Tue, 20 Apr 2010 12:15:53 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20100420161553.GA12219@denix.org>
References: <1271752342-17886-1-git-send-email-vjensen@gmx.de>
MIME-version: 1.0
In-reply-to: <1271752342-17886-1-git-send-email-vjensen@gmx.de>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.7
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Vitus Jensen <vjensen@gmx.de>
Subject: Re: [PATCH] base.bbclass: base_do_compile() accepts	GNUmakefile as Makefile
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
X-List-Received-Date: Tue, 20 Apr 2010 16:19:57 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Apr 20, 2010 at 10:32:22AM +0200, Vitus Jensen wrote:
> GNU make will look for GNUmakefile, makefile and Makefile.  GNUmakefile
> isn't recommended but used by some programs, e.g. canutils.
> 
> Signed-off-by: Vitus Jensen <vjensen@gmx.de>

Acked-by: Denys Dmytriyenko <denis@denix.org>

> ---
>  classes/base.bbclass |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/classes/base.bbclass b/classes/base.bbclass
> index d3bfa76..e738693 100644
> --- a/classes/base.bbclass
> +++ b/classes/base.bbclass
> @@ -310,7 +310,7 @@ base_do_configure() {
>  addtask compile after do_configure
>  do_compile[dirs] = "${S} ${B}"
>  base_do_compile() {
> -	if [ -e Makefile -o -e makefile ]; then
> +	if [ -e Makefile -o -e makefile -o -e GNUmakefile ]; then
>  		oe_runmake || die "make failed"
>  	else
>  		oenote "nothing to compile"
> -- 
> 1.5.6.5
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


