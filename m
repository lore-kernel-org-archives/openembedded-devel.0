Received: from [206.46.173.5] (helo=vms173005pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1M1prH-0003ep-1c
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 May 2009 00:44:59 +0200
Received: from gandalf.denix.org ([71.251.49.215]) by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KJ800G5IUWFAWEN@vms173005.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	06 May 2009 17:38:39 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 750106B8004; Wed,
	06 May 2009 18:38:38 -0400 (EDT)
Date: Wed, 06 May 2009 18:38:38 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090506223838.GA15339@denix.org>
References: <0977f5062aba3031df4132b6571b5c88ff4866c8.1241639516.git.msmith@cbnco.com>
	<84090287fafa5bca668308285fcfa06650df22cd.1241639516.git.msmith@cbnco.com>
MIME-version: 1.0
In-reply-to: <84090287fafa5bca668308285fcfa06650df22cd.1241639516.git.msmith@cbnco.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: [PATCH 2/2] grub: allow menu.lst to be overridden using	GRUB_CONFIG_PACKAGE.
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
X-List-Received-Date: Wed, 06 May 2009 22:44:59 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, May 06, 2009 at 03:55:57PM -0400, Michael Smith wrote:
> If GRUB_CONFIG_PACKAGE is set, don't ship menu.lst with grub. Instead,
> RRECOMMEND the config package. This allows overlays to override menu.lst
> in a separate package, rather than copying the whole grub package into
> the overlay.

It was discussed many times here - no USE flags in OE. You'll end up with 2 
grub packages of the same name but with different contents - with menu.lst 
and without.
One of the recent discussions on this topic:
http://thread.gmane.org/gmane.comp.handhelds.openembedded/22715/focus=22731

One way to solve it would be to always have menu.lst as a separate package and 
then replace it with your own from the overlay.

>  SRC_URI = "ftp://alpha.gnu.org/gnu/grub/grub-${PV}.tar.gz \
> -           file://automake-1.10.patch;patch=1 \
> -           file://menu.lst"
> +           file://automake-1.10.patch;patch=1"
> +
> +# Set to the name of a package containing menu.lst to override the one
> +# shipped with this package.
> +GRUB_CONFIG_PACKAGE ?= ""
> +
> +SRC_URI += "${@base_conditional('GRUB_CONFIG_PACKAGE', '', \
> +				'file://menu.lst', '', d)}"
> +
> +RRECOMMENDS += "${GRUB_CONFIG_PACKAGE}"

-- 
Denys


