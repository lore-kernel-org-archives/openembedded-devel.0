Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1MPYAQ-0005Rz-M3
	for openembedded-devel@lists.openembedded.org;
	Sat, 11 Jul 2009 10:42:46 +0200
Received: from 88-109-135-155.dynamic.dsl.as9105.com ([88.109.135.155]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1MPXxr-0002xz-S4
	for openembedded-devel@lists.openembedded.org;
	Sat, 11 Jul 2009 09:29:48 +0100
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1247290267-16928-1-git-send-email-msmith@cbnco.com>
References: <1247290267-16928-1-git-send-email-msmith@cbnco.com>
Date: Sat, 11 Jul 2009 09:29:46 +0100
Message-Id: <1247300986.16040.157.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Subject: Re: [PATCH 1/2] package classes: count dotfiles as non-empty
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
X-List-Received-Date: Sat, 11 Jul 2009 08:42:47 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sat, 2009-07-11 at 01:31 -0400, Michael Smith wrote:
> Allow a package to be built that contains only dotfiles or
> dot directories under '/'.
> 
> Signed-off-by: Michael Smith <msmith@cbnco.com>
> ---
>  classes/package.bbclass     |    2 +-
>  classes/package_deb.bbclass |    2 +-
>  classes/package_ipk.bbclass |    2 +-
>  classes/package_tar.bbclass |    2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)

Thanks, I checked this in.  It makes me wonder whether there is some way
that this logic could be abstracted out into package.bbclass rather than
maintained separately for each format, but I guess that's a problem for
another day.

p.




