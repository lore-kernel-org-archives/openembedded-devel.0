Received: from vms173017pub.verizon.net ([206.46.173.17])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1Njb80-0002dx-GE
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Feb 2010 17:27:27 +0100
Received: from gandalf.denix.org ([unknown] [71.251.51.225])
	by vms173017.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0KY9003GL48OZGX1@vms173017.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Mon,
	22 Feb 2010 10:24:29 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 31C8014AF60; Mon,
	22 Feb 2010 11:24:24 -0500 (EST)
Date: Mon, 22 Feb 2010 11:24:24 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20100222162424.GA27420@denix.org>
References: <1266766352-28786-1-git-send-email-rep.dot.nop@gmail.com>
MIME-version: 1.0
In-reply-to: <1266766352-28786-1-git-send-email-rep.dot.nop@gmail.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.17
X-SA-Exim-Mail-From: denis@denix.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] git: add SRC_URI name
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
X-List-Received-Date: Mon, 22 Feb 2010 16:27:27 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Sun, Feb 21, 2010 at 04:32:32PM +0100, Bernhard Reutner-Fischer wrote:
> Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
> ---
>  recipes/git/git.inc |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/recipes/git/git.inc b/recipes/git/git.inc
> index 644e159..fd7b708 100644
> --- a/recipes/git/git.inc
> +++ b/recipes/git/git.inc
> @@ -2,7 +2,7 @@ DESCRIPTION = "The git revision control system used by the Linux kernel develope
>  SECTION = "console/utils"
>  LICENSE = "GPL"
>  
> -SRC_URI = "http://www.kernel.org/pub/software/scm/git/git-${PV}.tar.bz2"
> +SRC_URI = "http://www.kernel.org/pub/software/scm/git/git-${PV}.tar.bz2;name=git"

Is there a patch to add checksums in corresponding recipes to use the name? Or 
what is the purpose of adding one?

-- 
Denys


