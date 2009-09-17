Received: from [206.46.173.15] (helo=vms173015pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1Mo5Ys-0007YT-Ip
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Sep 2009 03:13:29 +0200
Received: from gandalf.denix.org ([71.255.235.240]) by vms173015.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KQ300F6WCOSV4Q0@vms173015.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	16 Sep 2009 20:12:41 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 4CE0A14AF5F; Wed,
	16 Sep 2009 21:12:28 -0400 (EDT)
Date: Wed, 16 Sep 2009 21:12:28 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090917011228.GC3599@denix.org>
References: <1252770347-2632-1-git-send-email-k.kooi@student.utwente.nl>
MIME-version: 1.0
In-reply-to: <1252770347-2632-1-git-send-email-k.kooi@student.utwente.nl>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.15
X-SA-Exim-Mail-From: denis@denix.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: Koen Kooi <koen@openembedded.org>, Steve Sakoman <steve@sakoman.com>
Subject: Re: [STABLE][PATCH] ebtables: fix GNU_HASH error
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
X-List-Received-Date: Thu, 17 Sep 2009 01:13:29 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Sat, Sep 12, 2009 at 05:45:47PM +0200, Koen Kooi wrote:
> From: Steve Sakoman <steve@sakoman.com>
> 
> 
> Signed-off-by: Koen Kooi <koen@openembedded.org>

Acked-by: Denys Dmytriyenko <denis@denix.org>

> ---
>  recipes/ebtables/ebtables_2.0.6.bb |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)
> 
> diff --git a/recipes/ebtables/ebtables_2.0.6.bb b/recipes/ebtables/ebtables_2.0.6.bb
> index 33ad2b9..c4fc1c3 100644
> --- a/recipes/ebtables/ebtables_2.0.6.bb
> +++ b/recipes/ebtables/ebtables_2.0.6.bb
> @@ -4,6 +4,8 @@ LICENSE = "GPL"
>  SECTION = "console/network"
>  PR = "r2"
>  
> +TARGET_CC_ARCH += "${LDFLAGS}"
> +
>  SRC_URI = "${SOURCEFORGE_MIRROR}/ebtables/ebtables-v${PV}.tar.gz \
>             file://gcc34.patch;patch=1 \
>             file://gcc4.patch;patch=1 \
> -- 
> 1.6.1
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


