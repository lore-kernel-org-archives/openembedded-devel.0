Received: from smtp206.alice.it ([82.57.200.102])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <GNUtoo@no-log.org>) id 1Ovc0U-0001EE-3Y
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 Sep 2010 22:21:47 +0200
Received: from [192.168.1.178] (79.54.144.55) by smtp206.alice.it (8.5.124.08)
	(authenticated as editempo)
	id 4C1A268C05513C66 for openembedded-devel@lists.openembedded.org;
	Tue, 14 Sep 2010 22:14:55 +0200
From: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1284494140-30606-1-git-send-email-morphis@gravedo.de>
References: <1284494140-30606-1-git-send-email-morphis@gravedo.de>
Date: Tue, 14 Sep 2010 22:14:51 +0200
Message-ID: <1284495291.4786.3.camel@gnutoo-laptop>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-SA-Exim-Connect-IP: 82.57.200.102
X-SA-Exim-Mail-From: GNUtoo@no-log.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] fsogsmd: set PACKAGE_ARCH_palmpre = "${MACHINE_ARCH}"
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
X-List-Received-Date: Tue, 14 Sep 2010 20:21:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2010-09-14 at 21:55 +0200, Simon Busch wrote:
> Set PACKAGE_ARCH for palmpre as we add some palmpre specific stuff for the palmpre machine
> and no other machine needs this actually.
> 
> Signed-off-by: Simon Busch <morphis@gravedo.de>
> ---
>  recipes/freesmartphone/fsogsmd_git.bb |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/recipes/freesmartphone/fsogsmd_git.bb b/recipes/freesmartphone/fsogsmd_git.bb
> index d377d7a..f6e046b 100644
> --- a/recipes/freesmartphone/fsogsmd_git.bb
> +++ b/recipes/freesmartphone/fsogsmd_git.bb
> @@ -12,6 +12,7 @@ EXTRA_OECONF_append = "\
>  "
>  
>  # On the palmpre we need the msmcomm daemon to talk to the modem
> +PACKAGE_ARCH_palmpre = "${MACHINE_ARCH}"
>  DEPENDS_append_palmpre = " msmcommd-specs"
>  RDEPENDS_append_palmpre = " msmcommd"
>  EXTRA_OECONF_append_palmpre = " --enable-modem-qualcomm-palm"

Acked-by: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>




