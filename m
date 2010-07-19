Received: from ns0.zlo.nu ([85.17.141.90] helo=mzh.zlo.nu)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcolz@zlo.nu>) id 1OaoOb-0001vB-9z
	for openembedded-devel@lists.openembedded.org;
	Mon, 19 Jul 2010 13:20:30 +0200
Received: by mzh.zlo.nu (Postfix, from userid 1000)
	id 832D21414B; Mon, 19 Jul 2010 13:10:40 +0200 (CEST)
Date: Mon, 19 Jul 2010 13:10:40 +0200
From: Marc Olzheim <zlo@zlo.nu>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100719111040.GA5607@zlo.nu>
References: <1279531554-31896-1-git-send-email-zlo@zlo.nu>
MIME-Version: 1.0
In-Reply-To: <1279531554-31896-1-git-send-email-zlo@zlo.nu>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 85.17.141.90
X-SA-Exim-Mail-From: marcolz@zlo.nu
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] libpng: Add add 1.2.44, new version and new native version importing several security fixes.
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
X-List-Received-Date: Mon, 19 Jul 2010 11:20:30 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 19, 2010 at 11:25:54AM +0200, Marc Olzheim wrote:
> From: Marc Olzheim <marc@iphion.nl>
> 
> ---
>  recipes/libpng/libpng-native_1.2.44.bb |    6 ++++++
>  recipes/libpng/libpng_1.2.44.bb        |    8 ++++++++
>  2 files changed, 14 insertions(+), 0 deletions(-)
>  create mode 100644 recipes/libpng/libpng-native_1.2.44.bb
>  create mode 100644 recipes/libpng/libpng_1.2.44.bb
> 
> diff --git a/recipes/libpng/libpng-native_1.2.44.bb b/recipes/libpng/libpng-native_1.2.44.bb
> new file mode 100644
> index 0000000..3c36b52
> --- /dev/null
> +++ b/recipes/libpng/libpng-native_1.2.44.bb
> @@ -0,0 +1,6 @@
> +require libpng_${PV}.bb
> +require libpng-native.inc
> +
> +PR = "r1"
> +
> +FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/libpng-${PV}"
> diff --git a/recipes/libpng/libpng_1.2.44.bb b/recipes/libpng/libpng_1.2.44.bb
> new file mode 100644
> index 0000000..e607f76

Hmm, I should have stripped the PR = "r1" line of course...

Marc


