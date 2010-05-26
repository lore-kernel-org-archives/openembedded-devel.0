Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1OHHqa-0005n5-Od
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 May 2010 16:44:42 +0200
Received: from p5b035a88.dip.t-dialin.net ([91.3.90.136] helo=excalibur)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1OHHmQ-0007AQ-BU by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 May 2010 16:40:25 +0200
Received: from stefan by excalibur with local (Exim 4.71)
	(envelope-from <stefan@excalibur.local>) id 1OHAQh-0007RH-65
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 May 2010 08:49:27 +0200
Date: Wed, 26 May 2010 08:49:27 +0200
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100526064927.GI22917@excalibur.local>
References: <1274854676-5931-1-git-send-email-koen@openembedded.org>
	<1274854676-5931-5-git-send-email-koen@openembedded.org>
MIME-Version: 1.0
In-Reply-To: <1274854676-5931-5-git-send-email-koen@openembedded.org>
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 78.47.116.19
X-SA-Exim-Mail-From: stefan@datenfreihafen.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=AWL,BAYES_00,
	DATE_IN_PAST_06_12,SPF_HELO_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 5/7] Usermanual/metadata: Fix documentation errors
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
X-List-Received-Date: Wed, 26 May 2010 14:44:43 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, 2010-05-26 at 08:17, Koen Kooi wrote:
> From: Chase Maupin <chase.maupin@ti.com>
> 
> * Fixed up typos and other errors in the documentation.
> 
> Signed-off-by: Chase Maupin <chase.maupin@ti.com>
> Signed-off-by: Koen Kooi <k-kooi@ti.com>

Non-native speaker ack:
Acked-by: Stefan Schmidt <stefan@datenfreihafen.org>

> ---
>  docs/usermanual/chapters/metadata.xml |   18 +++++++++---------
>  1 files changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/docs/usermanual/chapters/metadata.xml b/docs/usermanual/chapters/metadata.xml
> index bbf6f73..2b65454 100644
> --- a/docs/usermanual/chapters/metadata.xml
> +++ b/docs/usermanual/chapters/metadata.xml
> @@ -95,7 +95,7 @@
>  
>      <para>OpenEmbedded has files ending with <emphasis>.conf</emphasis>,
>      <emphasis>.inc</emphasis>, <emphasis>.bb</emphasis>
> -    and<emphasis>.bbclass</emphasis>. The syntax and semantics of these files
> +    and <emphasis>.bbclass</emphasis>. The syntax and semantic of these files
>      are best described in the <ulink
>      url="http://bitbake.berlios.de/manual"><application>BitBake</application>
>      manual</ulink>.</para>
> @@ -111,7 +111,7 @@
>    <section id="metadata_writing_data">
>      <title>Writing Meta Data (Adding packages)</title>
>  
> -    <para>This page will guide you trough the effort of writing a .bb file or
> +    <para>This page will guide you through the effort of writing a .bb file or
>      <emphasis>recipe</emphasis> in BitBake speak.</para>
>  
>      <para>Let's start with the easy stuff, like the package description,
> @@ -128,23 +128,23 @@ DEPENDS = "gtk+"
>  RDEPENDS = "cool-ttf-fonts"
>                  </screen> The package needs gtk+ to build ('DEPENDS') and
>      requires the 'cool-ttf-fonts' package to run ('RDEPENDS'). OE will add
> -    run-time dependencies on libraries on its own via the so called
> -    <emphasis>shlibs</emphasis>-code, but you need to specify everything other
> +        run-time dependencies on libraries on its own via the so called
> +    <emphasis>shlibs</emphasis>-code, but you need to specify everything else
>      by yourself, which in this case is the 'cool-ttf-fonts' package.</para>
>  
>      <para>After entering all this OE will know what to build before trying to
>      build your application, but it doesn't know where to get it yet. So let's
>      add the source location: <screen>
>  SRC_URI = "http://www.host.com/foo/files/${P}.tar.bz2;md5sum=yoursum"
> -                </screen> This will tell the fetcher to where to download the
> +                </screen> This will tell the fetcher where to download the
>      sources from and it will check the integrity using md5sum if you provided
>      the appropriate <emphasis>yoursum</emphasis>. You can make one by doing
>      <screen>md5sum foo-1.9.tar.bz2</screen> and replacing
>      <emphasis>yoursum</emphasis> with the md5sum on your screen. A typical
> -    md5sum will look like this: <screen>a6434b0fc8a54c3dec3d6875bf3be8mtn </screen>Notice
> -    the <emphasis>${P}</emphasis> variable, that one holds the package name,
> -    <emphasis>${PN}</emphasis> in BitBake speak and the package version,
> -    <emphasis>${PV}</emphasis> in BitBake speak. It's a short way of writing
> +    md5sum will look like this: <screen>a6434b0fc8a54c3dec3d6875bf3be868 </screen>Notice
> +    the <emphasis>${P}</emphasis> variable holds the package name 
> +    (<emphasis>${PN}</emphasis> in BitBake speak) and the package version 
> +    (<emphasis>${PV}</emphasis> in BitBake speak). It's a short way of writing
>      <emphasis>${PN}-${PV}</emphasis>. Using this notation means you can copy
>      the recipe when a new version is released without having to alter the
>      contents. You do need to check if everything is still correct, because new
> -- 
> 1.7.0
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


