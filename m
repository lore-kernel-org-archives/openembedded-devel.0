Received: from [206.46.173.17] (helo=vms173017pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1M29jl-0002jm-Hd
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 May 2009 21:58:34 +0200
Received: from gandalf.denix.org ([71.251.49.215]) by vms173017.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KJA00EETHUXCZBK@vms173017.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Thu,
	07 May 2009 14:52:14 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 199226B8004; Thu,
	07 May 2009 15:52:09 -0400 (EDT)
Date: Thu, 07 May 2009 15:52:09 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090507195209.GC5394@denix.org>
References: <4A03277B.1090402@cbnco.com>
	<1241720835-17998-1-git-send-email-msmith@cbnco.com>
	<1241720835-17998-2-git-send-email-msmith@cbnco.com>
	<1241720835-17998-3-git-send-email-msmith@cbnco.com>
MIME-version: 1.0
In-reply-to: <1241720835-17998-3-git-send-email-msmith@cbnco.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: [PATCH 3/3] grub: split menu.lst into a separate package, grub-config.
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
X-List-Received-Date: Thu, 07 May 2009 19:58:35 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, May 07, 2009 at 02:27:15PM -0400, Michael Smith wrote:
> This makes it easier for overlays to override the configuration.
> 
> Signed-off-by: Michael Smith <msmith@cbnco.com>
> ---
>  recipes/grub/files/menu.lst     |    6 ++++++
>  recipes/grub/grub-0.97/menu.lst |    6 ------
>  recipes/grub/grub-config_1.0.bb |   13 +++++++++++++

Oh, I meant a separate package, not recipe. But then again, grub directory is 
not crowded yet... :)

>  recipes/grub/grub_0.97.bb       |   12 +++++-------
>  4 files changed, 24 insertions(+), 13 deletions(-)
>  create mode 100644 recipes/grub/files/menu.lst
>  delete mode 100644 recipes/grub/grub-0.97/menu.lst
>  create mode 100644 recipes/grub/grub-config_1.0.bb

-- 
Denys


