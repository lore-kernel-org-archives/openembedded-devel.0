Received: from [68.230.241.44] (helo=fed1rmmtao102.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1Lpnhz-00043y-3u
	for openembedded-devel@openembedded.org; Fri, 03 Apr 2009 20:01:42 +0200
Received: from fed1rmimpo02.cox.net ([70.169.32.72]) by fed1rmmtao102.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP
	id <20090403175901.VBUG6112.fed1rmmtao102.cox.net@fed1rmimpo02.cox.net>
	for <openembedded-devel@openembedded.org>;
	Fri, 3 Apr 2009 13:59:01 -0400
Received: from localhost ([68.230.63.214]) by fed1rmimpo02.cox.net with bizsmtp
	id b5z11b00S4dMFYL045z112; Fri, 03 Apr 2009 13:59:02 -0400
X-Authority-Analysis: v=1.0 c=1 a=pnWKL9YdgUKSsCWWT-UA:9
	a=ZdzZKDp1X39sfW1GLmmPEhap7rYA:4 a=LY0hPdMaydYA:10
X-CM-Score: 0.00
Date: Fri, 3 Apr 2009 10:59:01 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: OpenEmbedded Devel List <openembedded-devel@openembedded.org>
Message-ID: <20090403175901.GA11095@smtp.west.cox.net>
MIME-Version: 1.0
User-Agent: Mutt/1.5.18 (2008-05-17)
X-SA-Exim-Connect-IP: 68.230.241.44
X-SA-Exim-Mail-From: trini@kernel.crashing.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=AWL,BAYES_40,FAKE_REPLY_C,
	RDNS_NONE autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: gcc-cross-kernel-3.3.4
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
X-List-Received-Date: Fri, 03 Apr 2009 18:01:42 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 01, 2009 at 09:48:56AM -0000, =?utf-8?b?SsO2cmcgQmFra2VyIDxqb2VyZ0BoYWtrZXIuZGU+?= wrote:

> Yes, you're right. Changed patch is attached.
[snip]
> diff -Nur openembedded/recipes/gcc/gcc-cross-kernel-3.3.4_3.3.4.bb build/recipes/gcc/gcc-cross-kernel-3.3.4_3.3.4.bb
> --- openembedded/recipes/gcc/gcc-cross-kernel-3.3.4_3.3.4.bb	2009-03-21 10:44:02.000000000 +0100
> +++ build/recipes/gcc/gcc-cross-kernel-3.3.4_3.3.4.bb	2009-03-21 17:39:11.000000000 +0100
> @@ -1,2 +1,3 @@
>  require gcc-cross-initial_${PV}.bb
>  require gcc-cross-kernel.inc
> +SRC_URI_append = "file://gcc334-collect2_file_open_args.patch;patch=1"

Grabbed this as mbox from patchwork, so I hope this gets followed-up
right.  The patch is good, but we should be doing this for all 3.3.4's
we have left.  I'll take care of that and push shortly.  Thanks.

-- 
Tom Rini


