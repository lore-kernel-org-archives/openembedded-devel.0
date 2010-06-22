Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1ORCeC-0005fi-Cb
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Jun 2010 01:12:54 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1ORCZj-0001qf-Df from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Jun 2010 16:08:15 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Tue, 22 Jun 2010 16:08:15 -0700
Received: from [172.30.80.158] ([172.30.80.158]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Tue, 22 Jun 2010 17:08:14 -0600
Message-ID: <4C21425B.9090409@mentor.com>
Date: Tue, 22 Jun 2010 16:08:11 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4C213A4F.9070705@mentor.com>
In-Reply-To: <4C213A4F.9070705@mentor.com>
X-OriginalArrivalTime: 22 Jun 2010 23:08:14.0165 (UTC)
	FILETIME=[CAABF050:01CB125F]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH, RFC] Link with $ORIGIN, mangle only when that's too hard, get it all
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
X-List-Received-Date: Tue, 22 Jun 2010 23:12:54 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Tom Rini wrote:
> The following changes relocatable.bbclass to an always for native (and 
> disabled for cross) to an opt-in for hard to get right recipes.
> 
> With this, cross / native things like with $ORIGIN directly, for the 
> common case.  We do this as an in addition to so that programs that run 
> before install still work fine.  In addition doing this makes sure that 
> the initial RPATH will be long enough, even in the cross case, that we 
> can patch in a correct $ORIGIN[1].
> 
> Advantages? Less tasks, one less must have host utility (*cough*3rd 
> party yum repos*cough*).  Having an exists but not right second known 
> part of RPATH ensures cross recipes are now chrpath/patchelf patchable 
> and gets us one step closer to pstaging being relocatable (will have to 
> run some tests to look at the last corner cases).  Disadvantages? One 
> "ugly" escape sequence in bitbake.conf.

So for the moment, I need to retract this.  As soon as we hit a legacy 
do_stage, we go off and mangle everyone.  So more incentive to clear all 
of those out from -cross / -native :)  And as an aside, relocatable 
should use the relative function we have.  Will include that next time.

-- 
Tom Rini
Mentor Graphics Corporation


