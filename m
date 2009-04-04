Received: from [68.230.241.39] (helo=fed1rmmtao107.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1Lq8Wo-0007BS-2O
	for openembedded-devel@openembedded.org; Sat, 04 Apr 2009 18:15:50 +0200
Received: from fed1rmimpo03.cox.net ([70.169.32.75]) by fed1rmmtao107.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP id
	<20090404161249.PZKN10385.fed1rmmtao107.cox.net@fed1rmimpo03.cox.net>
	for <openembedded-devel@openembedded.org>;
	Sat, 4 Apr 2009 12:12:49 -0400
Received: from localhost ([68.230.63.214]) by fed1rmimpo03.cox.net with bizsmtp
	id bUCm1b00T4dMFYL04UCmuH; Sat, 04 Apr 2009 12:12:49 -0400
X-Authority-Analysis: v=1.0 c=1 a=Ji7YCslGg5QA:10 a=Q4-j1AaZAAAA:8
	a=b2ZvGRdsAAAA:8 a=5fUq1tb1lFzOxzYb-94A:9 a=tZqrir38XB_fH8u9LeoA:7
	a=7ecmup3eJsWMnEtPuXHGXkZoLeUA:4 a=LY0hPdMaydYA:10
X-CM-Score: 0.00
Date: Sat, 4 Apr 2009 09:12:46 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20090404161246.GO30840@smtp.west.cox.net>
References: <20090403221352.GH30840@smtp.west.cox.net>
	<20090403223236.GL30840@smtp.west.cox.net>
	<gr6vdd$dmd$2@ger.gmane.org>
MIME-Version: 1.0
In-Reply-To: <gr6vdd$dmd$2@ger.gmane.org>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
X-SA-Exim-Connect-IP: 68.230.241.39
X-SA-Exim-Mail-From: trini@kernel.crashing.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=AWL,BAYES_00,RDNS_NONE
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Fix relocation of our SDK toolchains
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
X-List-Received-Date: Sat, 04 Apr 2009 16:16:02 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Apr 04, 2009 at 08:40:46AM +0200, Koen Kooi wrote:
> On 04-04-09 00:32, Tom Rini wrote:
>> This is also at
>> http://patchwork.openembedded.org/bundle/trini/trini-relocatible-sdk/
>> now and I plan on pushing this stuff in Tuesday AM (same time as the
>> wireless-tools change).
>
> Core changes are not allowed to go in using the "silent approval" method.

That reminds me I guess, I should probably sign up to own the SDK stuff.

> Have you also looked at Chris' stuff at  
> http://cgit.openembedded.net/cgit.cgi?url=openembedded/commit/&h=kergoth/autotools&id=3631765365fb9db48df5a2c936c8d46f79b5c283 

Looks interesting.  Denys reminded me that there's a few other things
(libtool doesn't appear to have any sysroot support) needed before
everything in the SDK can just be moved around at will.

-- 
Tom Rini


