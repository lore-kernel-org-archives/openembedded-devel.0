Received: from vms173013pub.verizon.net ([206.46.173.13])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1PJ8rU-00064C-Tg
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Nov 2010 19:05:33 +0100
Received: from gandalf.denix.org ([unknown] [71.251.55.54])
	by vms173013.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LC300J7JE6B7AB2@vms173013.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Thu,
	18 Nov 2010 12:04:00 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id B055B14AF64; Thu,
	18 Nov 2010 13:03:46 -0500 (EST)
Date: Thu, 18 Nov 2010 13:03:46 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20101118180346.GA18493@denix.org>
References: <1290002140-17255-1-git-send-email-eric@eukrea.com>
MIME-version: 1.0
In-reply-to: <1290002140-17255-1-git-send-email-eric@eukrea.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.13
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] amend.bbclass: handle PACKAGE_ARCH change in an	amend.inc
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
X-List-Received-Date: Thu, 18 Nov 2010 18:05:34 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Nov 17, 2010 at 02:55:40PM +0100, Eric B??nard wrote:
> * setting PACKAGE_ARCH = "${MACHINE_ARCH}" in and amend.inc actually
> leads to a packaga with the correct machine arch but the
> work/stage/stamp dirs are not correct because MULTIMACH_ARCH is not
> updated after amend.inc is parsed.
> 
> * this patch updates MULTIMACH_ARCH if PACKAGE_ARCH is changed in
> amend.inc
> 
> Signed-off-by: Eric B??nard <eric@eukrea.com>

Thanks! We have faced this issue before.

Acked-by: Denys Dmytriyenko <denis@denix.org>

> ---
>  classes/amend.bbclass |    7 +++++++
>  1 files changed, 7 insertions(+), 0 deletions(-)
> 
> diff --git a/classes/amend.bbclass b/classes/amend.bbclass
> index a03de64..da60611 100644
> --- a/classes/amend.bbclass
> +++ b/classes/amend.bbclass
> @@ -42,5 +42,11 @@ python () {
>              depends = set()
>          depends |= set(newdata)
>      d.setVar("__depends", depends)
> +
> +    mach_arch = bb.data.getVar('MACHINE_ARCH', d, 1)
> +    pkg_arch = bb.data.getVar('PACKAGE_ARCH', d, 1)
> +    multi_arch = bb.data.getVar('MULTIMACH_ARCH', d, 1)
> +    if pkg_arch and pkg_arch == mach_arch and pkg_arch != multi_arch:
> +        multi_arch = pkg_arch
> +        bb.data.setVar('MULTIMACH_ARCH', multi_arch, d)
>  }
> -- 
> 1.7.2.3
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


