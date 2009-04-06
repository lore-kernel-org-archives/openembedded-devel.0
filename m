Received: from [68.230.241.45] (helo=fed1rmmtao101.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1LqygV-00011E-Js
	for openembedded-devel@openembedded.org; Tue, 07 Apr 2009 01:57:03 +0200
Received: from fed1rmimpo03.cox.net ([70.169.32.75]) by fed1rmmtao101.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP id
	<20090406235402.TQXX27308.fed1rmmtao101.cox.net@fed1rmimpo03.cox.net>
	for <openembedded-devel@openembedded.org>;
	Mon, 6 Apr 2009 19:54:02 -0400
Received: from localhost ([68.230.63.214]) by fed1rmimpo03.cox.net with bizsmtp
	id cPu21b00G4dMFYL04Pu2PQ; Mon, 06 Apr 2009 19:54:02 -0400
X-Authority-Analysis: v=1.0 c=1 a=0sXtSTLkSA4A:10 a=CEQruDUxg1kA:10
	a=UTx4xwwqMdLW0ksnr1kA:9 a=lQ5aiCovFx4qYFexEcL0yL_iX2gA:4
	a=LY0hPdMaydYA:10
X-CM-Score: 0.00
Date: Mon, 6 Apr 2009 16:54:02 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20090406235402.GA2195@smtp.west.cox.net>
References: <d2b9ea600904061614r2839effbla380925d536c3999@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <d2b9ea600904061614r2839effbla380925d536c3999@mail.gmail.com>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
X-SA-Exim-Connect-IP: 68.230.241.45
X-SA-Exim-Mail-From: trini@kernel.crashing.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=AWL,BAYES_00,RDNS_NONE
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [STABLE][PATCH] mingw-binutils: update to 2.19.1
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
X-List-Received-Date: Mon, 06 Apr 2009 23:57:03 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 07, 2009 at 01:14:07AM +0200, Esben Haabendal wrote:

> Signed-off-by: Esben Haabendal <eha@doredevelopment.dk>
> ---
>  .../mingw-binutils-canadian-cross_2.19.1.bb        |   11 +++++++++++
>  recipes/binutils/mingw-binutils_2.19.1.bb          |   12 ++++++++++++
>  2 files changed, 23 insertions(+), 0 deletions(-)
>  create mode 100644 recipes/binutils/mingw-binutils-canadian-cross_2.19.1.bb
>  create mode 100644 recipes/binutils/mingw-binutils_2.19.1.bb

First, this isn't in .dev yet.  Second..

> diff --git a/recipes/binutils/mingw-binutils-canadian-cross_2.19.1.bb
> b/recipes/binutils/mingw-binutils-canadian-cross_2.19.1.bb
> new file mode 100644
> index 0000000..27e06c6
> --- /dev/null
> +++ b/recipes/binutils/mingw-binutils-canadian-cross_2.19.1.bb
> @@ -0,0 +1,11 @@
> +require mingw-binutils_${PV}.bb
> +require binutils-canadian-cross.inc
> +
> +DEFAULT_PREFERENCE_sdk-mingw32 = "1"
> +DEFAULT_PREFERENCE_sdk-mingw64 = "1"

That's meaningless atm.  Or at least it is for how I've been doing all
of the build tests (SDK_OS=mingw32), it would be just _mingw32 (does
mingw64 work yet?).  Finally, do we really want to make this default
when we're still building gcc-3.4.5?  I wouldn't think so, but I assume
this means a gcc 4 actual release is soon.

Oh, and you forgot to add in checksums :)

-- 
Tom Rini


