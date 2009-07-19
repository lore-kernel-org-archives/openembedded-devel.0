Received: from [85.214.48.103] (helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1MSY1W-0002NP-Uh
	for openembedded-devel@lists.openembedded.org;
	Sun, 19 Jul 2009 17:09:58 +0200
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id EDD352200144
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Jul 2009 16:56:08 +0200 (CEST)
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id E97C22200122
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Jul 2009 16:56:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=5.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.2.5
Received: from rhein.familie-heinold.de (g225005209.adsl.alicedsl.de
	[92.225.5.209]) by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Jul 2009 16:56:07 +0200 (CEST)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id 37E1F3C082; Sun, 19 Jul 2009 16:56:07 +0200 (CEST)
Date: Sun, 19 Jul 2009 16:56:07 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090719145606.GA7131@rhein.zuhause.netz>
References: <E1MRnPa-00054l-4v@melo.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <E1MRnPa-00054l-4v@melo.openembedded.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: [oe-commits] Koen Kooi : schroedinger: fix packaging
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
X-List-Received-Date: Sun, 19 Jul 2009 15:09:59 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 17, 2009 at 01:23:42PM +0000, git version control wrote:
> Module: openembedded.git
> Branch: org.openembedded.dev
> Commit: 852d21c0369f8b499931098fdc55eea59116402f
> URL:    http://gitweb.openembedded.net/?p=openembedded.git&a=commit;h=852d21c0369f8b499931098fdc55eea59116402f
> 
> Author: Koen Kooi <koen@openembedded.org>
> Date:   Fri Jul 17 13:53:28 2009 +0200
> 
> schroedinger: fix packaging
> 
> ---
> 
>  recipes/schroedinger/schroedinger_1.0.5.bb |    6 +++++-
>  1 files changed, 5 insertions(+), 1 deletions(-)
> 
> diff --git a/recipes/schroedinger/schroedinger_1.0.5.bb b/recipes/schroedinger/schroedinger_1.0.5.bb
> index 66d24c1..476c296 100644
> --- a/recipes/schroedinger/schroedinger_1.0.5.bb
> +++ b/recipes/schroedinger/schroedinger_1.0.5.bb
> @@ -1,8 +1,12 @@
>  require schroedinger.inc
>  
> -PR = "r2"
> +PR = "r3"
>  
>  inherit autotools_stage
>  
>  AUTOTOOLS_STAGE_PKGCONFIG = "1"
>  
> +PACKAGES =+ "gst-plugin-schroedinger-dbg gst-plugin-schroedinger-dev gst-plugin-schroedinger"
> +FILES_gst-plugin-schroedinger = "${libdir}/gstreamer-0.10/*.so"
> +FILES_gst-plugin-schroedinger-dbg = "${libdir}/gstreamer-0.10/.debug"
> +FILES_gst-plugin-schroedinger-dev = "${libdir}/gstreamer-0.10/*.*a"

Hi,

why you are switching this stuff back? If you want gst-plugins from schroedinger, please use gst-plugin-schroedinger recipe. If
gst-plugin-schroedinger recipe dont work you can blame me. I split the recipe because it made no sin when you build ffmpeg only,
that half of gnome and gstreamer is build because of this dependency.

Bye Henning


