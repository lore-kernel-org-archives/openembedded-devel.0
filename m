Received: from [68.230.241.44] (helo=fed1rmmtao102.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1LrEZ6-000077-Ap
	for openembedded-devel@openembedded.org; Tue, 07 Apr 2009 18:54:35 +0200
Received: from fed1rmimpo03.cox.net ([70.169.32.75]) by fed1rmmtao102.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP
	id <20090407165125.ECUH6112.fed1rmmtao102.cox.net@fed1rmimpo03.cox.net>
	for <openembedded-devel@openembedded.org>;
	Tue, 7 Apr 2009 12:51:25 -0400
Received: from localhost ([68.230.63.214]) by fed1rmimpo03.cox.net with bizsmtp
	id cgrQ1b0084dMFYL04grQDA; Tue, 07 Apr 2009 12:51:24 -0400
X-Authority-Analysis: v=1.0 c=1 a=3yNiNCsWiaUA:10 a=w5m77Bwnh3kA:10
	a=FP58Ms26AAAA:8 a=o5LalZJVMI4DEGFeaSMA:9
	a=hhXdlK7P3iJp9UIpBVMAGWbmYk8A:4 a=LY0hPdMaydYA:10
X-CM-Score: 0.00
Date: Tue, 7 Apr 2009 09:51:24 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20090407165123.GE2195@smtp.west.cox.net>
References: <d2b9ea600904070016j5826cdbex6271177286c66c87@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <d2b9ea600904070016j5826cdbex6271177286c66c87@mail.gmail.com>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
X-SA-Exim-Connect-IP: 68.230.241.44
X-SA-Exim-Mail-From: trini@kernel.crashing.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=AWL,BAYES_00,RDNS_NONE
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [STABLE][PATCH v2] mingw-binutils: update to 2.19.1
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
X-List-Received-Date: Tue, 07 Apr 2009 16:54:35 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 07, 2009 at 09:16:28AM +0200, Esben Haabendal wrote:

[snip]
> +[http://downloads.sourceforge.net/mingw/binutils-2.19.1-src.tar.gz]
> +md5=ad3f2b5fdcd599a772ad75fec2c384d8
> +sha256=2df529b1ac0a621efb87b5b53dbc0167c566f8bebbd6a8ce19964b05845fd2e7

You need to run the 'contrib/source-checker/oe-checksums-sorter.py'
after adding a new checksum.  Roughly
/contrib/source-checker/oe-checksums-sorter.py conf/checksums.ini > t &&
mv t conf/checksums.ini.

> diff --git a/recipes/binutils/mingw-binutils-canadian-cross_2.19.1.bb
> b/recipes/binutils/mingw-binutils-canadian-cross_2.19.1.bb
> new file mode 100644
> index 0000000..130dea5
> --- /dev/null
> +++ b/recipes/binutils/mingw-binutils-canadian-cross_2.19.1.bb
> @@ -0,0 +1,10 @@
> +require mingw-binutils_${PV}.bb
> +require binutils-canadian-cross.inc
> +
> +DEFAULT_PREFERENCE_sdk-mingw32 = "1"

This should just be DEFAULT_PREFERENCE_mingw32 = "1".  Or just left out
as we aren't setting this to -1 for anything else.

> diff --git a/recipes/binutils/mingw-binutils_2.19.1.bb
> b/recipes/binutils/mingw-binutils_2.19.1.bb
> new file mode 100644
> index 0000000..19d1077
> --- /dev/null
> +++ b/recipes/binutils/mingw-binutils_2.19.1.bb
> @@ -0,0 +1,12 @@
> +PR = "r1"

First PR should be r0, and the PR line left out in this case.  This also
looks a whole lot like the older one, so perhaps the best thing to do
here would be to rename the old one to mingw-binutils.inc and just
include that in mingw-binutils_version.bb (which iirc does need to
exist).

> +DEFAULT_PREFERENCE = "0"

Then drop this, or set to -1.  I forget off the top of my head if
something will go wrong and try and use this for non-canadian stuff if
we don't have a -1 here..

Finally, the way Stable works, as I read it, is that the patch goes into
dev first then stable.  Not at the same time.

-- 
Tom Rini


