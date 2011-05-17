Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QMRHA-0004Kr-CC
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 May 2011 22:53:56 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.3])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1QMREO-0006A8-N7
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 May 2011 22:51:04 +0200
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1305663890-20372-1-git-send-email-raj.khem@gmail.com>
References: <1305663890-20372-1-git-send-email-raj.khem@gmail.com>
Date: Tue, 17 May 2011 21:50:57 +0100
Message-ID: <1305665458.18415.96.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [meta-oe][PATCH] uclibc_git.bb: inherit gitpkgv to get PV
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
X-List-Received-Date: Tue, 17 May 2011 20:53:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-05-17 at 13:24 -0700, raj.khem@gmail.com wrote:
> From: Khem Raj <raj.khem@gmail.com>
> 
> use GITPKGVTAG for PV
> Cleanup unused UCLIBC_BASE
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta-oe/recipes-core/uclibc/uclibc_git.bb |    6 +++---
>  1 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/meta-oe/recipes-core/uclibc/uclibc_git.bb b/meta-oe/recipes-core/uclibc/uclibc_git.bb
> index cbc8ab8..05eea00 100644
> --- a/meta-oe/recipes-core/uclibc/uclibc_git.bb
> +++ b/meta-oe/recipes-core/uclibc/uclibc_git.bb
> @@ -6,17 +6,17 @@
>  # UCLIBC_BASE can be set in a distro file, but whether this works depends
>  # on whether the base patches apply to the selected (SRCDATE) svn release.

I guess that comment should also be removed if UCLIBC_BASE is unused.

p.




