Received: from vms173011pub.verizon.net ([206.46.173.11])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1OHJZP-0004X2-5V
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 May 2010 18:35:04 +0200
Received: from gandalf.denix.org ([unknown] [71.255.238.44])
	by vms173011.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0L31002GOCIQGGQ9@vms173011.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	26 May 2010 11:30:32 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 474E814AF60; Wed,
	26 May 2010 12:30:25 -0400 (EDT)
Date: Wed, 26 May 2010 12:30:25 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20100526163025.GH23464@denix.org>
References: <1274879375-19626-1-git-send-email-chase.maupin@ti.com>
	<1274879375-19626-2-git-send-email-chase.maupin@ti.com>
	<1274879375-19626-3-git-send-email-chase.maupin@ti.com>
	<1274879375-19626-4-git-send-email-chase.maupin@ti.com>
	<1274879375-19626-5-git-send-email-chase.maupin@ti.com>
MIME-version: 1.0
In-reply-to: <1274879375-19626-5-git-send-email-chase.maupin@ti.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.11
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Chase Maupin <chase.maupin@ti.com>
Subject: Re: [PATCHv2 5/7] metadata: Fix documentation errors
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
X-List-Received-Date: Wed, 26 May 2010 16:35:04 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, May 26, 2010 at 08:09:33AM -0500, Chase Maupin wrote:
> * Fixed up typos and other errors in the documentation.
> 
> Signed-off-by: Chase Maupin <chase.maupin@ti.com>

Acked-by: Denys Dmytriyenko <denis@denix.org>

> ---
>  docs/usermanual/chapters/metadata.xml |   18 +++++++++---------
>  1 files changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/docs/usermanual/chapters/metadata.xml b/docs/usermanual/chapters/metadata.xml
> index bbf6f73..794c66c 100644
> --- a/docs/usermanual/chapters/metadata.xml
> +++ b/docs/usermanual/chapters/metadata.xml
> @@ -95,7 +95,7 @@
>  
>      <para>OpenEmbedded has files ending with <emphasis>.conf</emphasis>,
>      <emphasis>.inc</emphasis>, <emphasis>.bb</emphasis>
> -    and<emphasis>.bbclass</emphasis>. The syntax and semantics of these files
> +    and <emphasis>.bbclass</emphasis>. The syntax and semantics of these files
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
> 1.6.0.4
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


