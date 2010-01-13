Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NV9Ut-0006Nc-Qc for openembedded-devel@lists.openembedded.org;
	Wed, 13 Jan 2010 21:07:22 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1NV9Sm-0002Zl-TF
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Jan 2010 21:05:08 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jan 2010 21:05:08 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jan 2010 21:05:08 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 13 Jan 2010 20:53:15 +0100
Message-ID: <hil8ba$835$5@ger.gmane.org>
References: <1263313440-14774-1-git-send-email-marcin@juszkiewicz.com.pl>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.7) Gecko/20100112 Shredder/3.0.2pre
In-Reply-To: <1263313440-14774-1-git-send-email-marcin@juszkiewicz.com.pl>
X-Enigmail-Version: 1.0
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [STABLE][PATCH] classpath-native: disable-gjdoc, it calls antlr and fails without antlr installed on buildhost (runantlr from antlr-native is found by configure, but antlr.jar from staging doesn't work)
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
X-List-Received-Date: Wed, 13 Jan 2010 20:07:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Acked-by: Koen Kooi <koen@openembedded.org>

On 12-01-10 17:24, Marcin Juszkiewicz wrote:
> From: Martin Jansa <Martin.Jansa@gmail.com>
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> Signed-off-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
> ---
>  recipes/classpath/classpath-native.inc       |    1 +
>  recipes/classpath/classpath-native_0.97.2.bb |    2 +-
>  recipes/classpath/classpath-native_0.98.bb   |    2 +-
>  3 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes/classpath/classpath-native.inc b/recipes/classpath/classpath-native.inc
> index e7570c4..35a2485 100644
> --- a/recipes/classpath/classpath-native.inc
> +++ b/recipes/classpath/classpath-native.inc
> @@ -30,6 +30,7 @@ EXTRA_OECONF = "\
>    --disable-gtk-peer \
>    --disable-plugin \
>    --disable-dssi \
> +  --disable-gjdoc \
>    --enable-examples \
>    --enable-tools \
>    --includedir=${STAGING_INCDIR}/classpath \
> diff --git a/recipes/classpath/classpath-native_0.97.2.bb b/recipes/classpath/classpath-native_0.97.2.bb
> index 4de5602..b026f40 100644
> --- a/recipes/classpath/classpath-native_0.97.2.bb
> +++ b/recipes/classpath/classpath-native_0.97.2.bb
> @@ -1,6 +1,6 @@
>  require classpath-native.inc
>  
> -PR = "r6"
> +PR = "r7"
>  
>  # The code affected by the javanet-local patch
>  # is usually not compiled. However if someone changes
> diff --git a/recipes/classpath/classpath-native_0.98.bb b/recipes/classpath/classpath-native_0.98.bb
> index 6659178..a924b8a 100644
> --- a/recipes/classpath/classpath-native_0.98.bb
> +++ b/recipes/classpath/classpath-native_0.98.bb
> @@ -3,7 +3,7 @@ require classpath-native.inc
>  # Deadlocks occur on at least amd64 hosts.
>  DEFAULT_PREFERENCE = "-1"
>  
> -PR = "r2"
> +PR = "r3"
>  
>  # The code affected by the javanet-local patch
>  # is usually not compiled. However if someone changes

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLTiSrMkyGM64RGpERAmeGAKCoFZG2dXBWBd7shkM2GLqNPZ7t6wCeLPwy
jCNhbK/4VMRNnO4MTr26Kx0=
=3/3x
-----END PGP SIGNATURE-----



