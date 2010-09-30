Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1P1QjD-0007b5-Fi
	for openembedded-devel@lists.openembedded.org;
	Thu, 30 Sep 2010 23:31:52 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1P1Qiy-0002DT-ME from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Thu, 30 Sep 2010 14:31:32 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Thu, 30 Sep 2010 14:31:32 -0700
Received: from [172.30.80.12] ([172.30.80.12]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 30 Sep 2010 15:31:33 -0600
Message-ID: <4CA501AC.2090804@mentor.com>
Date: Thu, 30 Sep 2010 14:31:24 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTi=6KMYVWORbcf+BLZYGV6JrscxBEjq-KWXnhzU+@mail.gmail.com>
In-Reply-To: <AANLkTi=6KMYVWORbcf+BLZYGV6JrscxBEjq-KWXnhzU+@mail.gmail.com>
X-OriginalArrivalTime: 30 Sep 2010 21:31:33.0720 (UTC)
	FILETIME=[DAA54580:01CB60E6]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] delete old monotone recipes
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
X-List-Received-Date: Thu, 30 Sep 2010 21:31:52 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Frans Meulenbroeks wrote:
> Dear all,
> 
> As it stands we have 6 monotone recipes:
> 
> monotone-5_0.25.2.bb
> monotone-6_0.27.bb
> monotone-6_0.31.bb
> monotone-6_0.33.bb
> monotone-6_0.34.bb
> monotone-6_0.37.bb
> 
> There are all target-only recipes
> 
> I can imagine it made sense to have a monotone recipe for the target
> when our sources were still in monotone, but I feel that nowadays it
> is less useful
> (apart from the question whether it is useful to have an SCM on an
> embedded system).
> 
> Therefore I would like to bring up the following discussion topics:
> 
> Is there any use to keep the old monotone-6 recipes? (all but 0.37).
> Or should we remove?
> 
> And what about the monotone-5 recipe. Is that still useful?
> 
> And what about the latest monotone-6 recipe? Is that still useful to keep?
> 
> Your opinion is appreciated.

As an aside, I can't find anything called monotone-5 or monotone-6, just 
monotone.  But I'd otherwise suggest the normal rules apply, delete the 
unpinned versions assuming they're all GPLv2.

-- 
Tom Rini
Mentor Graphics Corporation



