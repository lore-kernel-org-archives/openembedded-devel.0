Received: from [68.230.241.40] (helo=fed1rmmtao106.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1LrIv4-0006OU-Fb
	for openembedded-devel@openembedded.org; Tue, 07 Apr 2009 23:34:02 +0200
Received: from fed1rmimpo03.cox.net ([70.169.32.75]) by fed1rmmtao106.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP id
	<20090407213020.ZWZY22254.fed1rmmtao106.cox.net@fed1rmimpo03.cox.net>
	for <openembedded-devel@openembedded.org>;
	Tue, 7 Apr 2009 17:30:20 -0400
Received: from localhost ([68.230.63.214]) by fed1rmimpo03.cox.net with bizsmtp
	id clWM1b0074dMFYL04lWM4x; Tue, 07 Apr 2009 17:30:21 -0400
X-Authority-Analysis: v=1.0 c=1 a=c7uaSC4PyioA:10 a=GSOq1Z3Aw2sA:10
	a=Ywdq5CjlT_DYP7m3zaQA:9 a=lP_kfC2I3F2hJHzJw-zcdDXi594A:4
	a=LY0hPdMaydYA:10
X-CM-Score: 0.00
Date: Tue, 7 Apr 2009 14:30:20 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20090407213020.GJ2195@smtp.west.cox.net>
References: <1237835454.6521.9.camel@northpole> <grg0jf$sem$1@ger.gmane.org>
	<49DB935B.3000907@2mi.com.br>
	<20090407183328.GH2195@smtp.west.cox.net>
	<49DBA326.4060401@2mi.com.br>
	<20090407195639.GI2195@smtp.west.cox.net>
	<49DBC0A7.7040406@2mi.com.br>
MIME-Version: 1.0
In-Reply-To: <49DBC0A7.7040406@2mi.com.br>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
X-SA-Exim-Connect-IP: 68.230.241.40
X-SA-Exim-Mail-From: trini@kernel.crashing.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=AWL,BAYES_00,RDNS_NONE
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: libxml2-native build against host zlib.h
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
X-List-Received-Date: Tue, 07 Apr 2009 21:34:37 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 07, 2009 at 06:07:51PM -0300, Jader H. Silva wrote:
[snip]
> I'm using ubuntu 8.04, zlib1g-dev package is installed.
> I can compile it without problems in a machine where zlib1g-dev is not  
> installed.
>
> Attached there's the log.do_compile and config.log.nok originated from a  
> failed compilation and config.log from a successful compilation after my  
> patch was applied.

On the failing machine can you either do CCACHE="" or ccache -C to dump
the cache and try again?

-- 
Tom Rini


