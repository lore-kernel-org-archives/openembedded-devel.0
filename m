Received: from [68.230.241.39] (helo=fed1rmmtao107.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1Ljcc4-0005Jh-WC
	for openembedded-devel@openembedded.org; Tue, 17 Mar 2009 17:58:23 +0100
Received: from fed1rmimpo02.cox.net ([70.169.32.72]) by fed1rmmtao107.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP id
	<20090317165714.BIIP10385.fed1rmmtao107.cox.net@fed1rmimpo02.cox.net>
	for <openembedded-devel@openembedded.org>;
	Tue, 17 Mar 2009 12:57:14 -0400
Received: from localhost ([68.230.63.214]) by fed1rmimpo02.cox.net with bizsmtp
	id UGxD1b0044dMFYL04GxDLb; Tue, 17 Mar 2009 12:57:13 -0400
X-Authority-Analysis: v=1.0 c=1 a=GN_yKGkEFO0A:10 a=74_OhrOYAAAA:8
	a=4KWNPUysKpfnuzsMjkAA:9 a=zEsT1Xv0uf7f2txDm5NyF_NTqCgA:4
	a=LY0hPdMaydYA:10
X-CM-Score: 0.00
Date: Tue, 17 Mar 2009 09:57:13 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20090317165710.GL26343@smtp.west.cox.net>
References: <49BF280A.7090705@tait.co.nz>
	<20090317050424.GJ26343@smtp.west.cox.net>
	<1237308009.20770.11.camel@homestead>
MIME-Version: 1.0
In-Reply-To: <1237308009.20770.11.camel@homestead>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
X-SA-Exim-Connect-IP: 68.230.241.39
X-SA-Exim-Mail-From: trini@kernel.crashing.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=AWL,BAYES_00,RDNS_NONE,
	WHOIS_NETSOLPR autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Git SRC_TARBALL_STASH filename
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
X-List-Received-Date: Tue, 17 Mar 2009 16:58:38 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 17, 2009 at 04:40:09PM +0000, Shane Dixon wrote:

> Does SRC_TARBALL_STASH replace the PREMIRRORS variable?  I used to use a
> variable in my local.conf that was similar to the following:
> 
> PREMIRRORS = "(ftp|https?)$://.*/.*/ http://server.com/openembedded/"
> 
> Is SRC_TARBALL_STASH the better way to do this?

I believe the problem is that you need to set both to cover all cases.

-- 
Tom Rini


