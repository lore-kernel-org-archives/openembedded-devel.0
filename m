Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NthHj-0000xB-C9 for openembedded-devel@lists.openembedded.org;
	Mon, 22 Mar 2010 14:03:16 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NthEh-0002b0-K1 for openembedded-devel@lists.openembedded.org;
	Mon, 22 Mar 2010 14:00:03 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Mar 2010 14:00:03 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Mar 2010 14:00:03 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 22 Mar 2010 13:33:50 +0100
Message-ID: <ho7o3e$nb2$5@dough.gmane.org>
References: <1269255925-13112-1-git-send-email-marcin@juszkiewicz.com.pl>
	<1269255925-13112-3-git-send-email-marcin@juszkiewicz.com.pl>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.8) Gecko/20100314 Shredder/3.0.4pre
In-Reply-To: <1269255925-13112-3-git-send-email-marcin@juszkiewicz.com.pl>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH][STABLE] procps_3.2.7.bb: Fix compilation when usr/bin is same as /bin
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
X-List-Received-Date: Mon, 22 Mar 2010 13:03:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Acked-by: Koen Kooi <koen@openembedded.org>

On 22-03-10 12:05, Marcin Juszkiewicz wrote:
> From: Khem Raj <raj.khem@gmail.com>
> 
> * On DISTROs like micro where bindir and base_bindir are
>   same, procps does not compile because it wants to install
>   binaries in both places. We have to pass the variable to
>   make file since it does not use autotools.
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  recipes/procps/procps_3.2.7.bb |    5 ++++-
>  1 files changed, 4 insertions(+), 1 deletions(-)
> 
> diff --git a/recipes/procps/procps_3.2.7.bb b/recipes/procps/procps_3.2.7.bb
> index 6da975a..b31b683 100644
> --- a/recipes/procps/procps_3.2.7.bb
> +++ b/recipes/procps/procps_3.2.7.bb
> @@ -1,6 +1,6 @@
>  require procps.inc
>  
> -PR = "r8"
> +PR = "r9"
>  
>  inherit update-rc.d
>  
> @@ -23,6 +23,9 @@ CONFFILES_${PN} = "${sysconfdir}/sysctl.conf"
>  
>  EXTRA_OEMAKE = "CFLAGS=-I${STAGING_INCDIR} \
>                  CPPFLAGS=-I${STAGING_INCDIR} \
> +		usr/bin=${D}${bindir}/ \
> +		bin=${D}${base_bindir}/ \
> +		usr/proc/bin=${D}${bindir}/ \
>                  LDFLAGS="${LDFLAGS}" \
>                  CURSES=-lncurses \
>                  install='install -D' \

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLp2OuMkyGM64RGpERArDhAJ9VL4hiSYnMVZNdQ7uIY4uXlGBuLgCcC/lp
DEhNIWHzpVzpyR1CGEdfHPU=
=7o67
-----END PGP SIGNATURE-----



