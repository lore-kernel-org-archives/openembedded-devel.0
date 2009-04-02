Received: from [68.230.241.42] (helo=fed1rmmtao104.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1LpSMF-0002LI-RN
	for openembedded-devel@openembedded.org; Thu, 02 Apr 2009 21:13:52 +0200
Received: from fed1rmimpo02.cox.net ([70.169.32.72]) by fed1rmmtao104.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP id
	<20090402191119.NMKC16134.fed1rmmtao104.cox.net@fed1rmimpo02.cox.net>
	for <openembedded-devel@openembedded.org>;
	Thu, 2 Apr 2009 15:11:19 -0400
Received: from localhost ([68.230.63.214]) by fed1rmimpo02.cox.net with bizsmtp
	id ajBJ1b0084dMFYL04jBJEK; Thu, 02 Apr 2009 15:11:18 -0400
X-Authority-Analysis: v=1.0 c=1 a=wACDQLuiM8MA:10 a=m2ervYgq_Q4A:10
	a=gLpkaHEsGui4RcjbgnMA:9 a=jaZCZ9gPs8OvJVPg56uBTlO0bLMA:4
	a=LY0hPdMaydYA:10
X-CM-Score: 0.00
Date: Thu, 2 Apr 2009 12:11:18 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20090402191118.GC30840@smtp.west.cox.net>
References: <20090402185006.GA12552@denix.org>
MIME-Version: 1.0
In-Reply-To: <20090402185006.GA12552@denix.org>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
X-SA-Exim-Connect-IP: 68.230.241.42
X-SA-Exim-Mail-From: trini@kernel.crashing.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=AWL,BAYES_00,RDNS_NONE
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: package_ipk.bbclass fails due to a wrong version of a	package
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
X-List-Received-Date: Thu, 02 Apr 2009 19:13:53 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 02, 2009 at 02:50:06PM -0400, Denys Dmytriyenko wrote:

> Hi,
> 
> I've been debugging this issue for a while now w/o much success.
> 
> We have following recipes in play:
> curl_7.19.0.bb
> curl-native_7.18.2.bb
> curl-sdk_7.18.2.bb
> 
> None of those set PV explicitly, so they are picked up from the filename.

Hmm, if you throw in a -v -DDD and log all the output, do you see both
curl_7.18.2.bb being loaded (for -sdk) and curl_7.19.0.bb (for target)
being loaded up?

-- 
Tom Rini


