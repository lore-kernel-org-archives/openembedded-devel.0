Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1Ogf9r-0001Zh-G4
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Aug 2010 16:41:28 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o74EfMj3032207;
	Wed, 4 Aug 2010 15:41:22 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 31788-09; Wed,  4 Aug 2010 15:41:18 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o74EfDM5032201
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 4 Aug 2010 15:41:13 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <20100804040949.GA7085@gmail.com>
References: <1279290319.10837.1747.camel@rex>
	<1280842002.16235.83.camel@rex>  <20100804040949.GA7085@gmail.com>
Date: Wed, 04 Aug 2010 15:40:58 +0100
Message-ID: <1280932858.16235.165.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-Virus-Scanned: amavisd-new at rpsys.net
X-SA-Exim-Connect-IP: 93.97.173.237
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=AWL,BAYES_00,RDNS_DYNAMIC,
	TVD_RCVD_IP autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: bitbake-dev <bitbake-dev@lists.berlios.de>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [Bitbake-dev] A new bitbake extension: .bbappend files
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
X-List-Received-Date: Wed, 04 Aug 2010 14:41:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2010-08-03 at 21:09 -0700, Khem Raj wrote:
> On (03/08/10 14:26), Richard Purdie wrote:
> > Whilst I think there were some initial concerns the consensus seemed to
> > be that this was a good thing to have in bitbake, its something that has
> > been on the feature wishlist since day one so I've merged the patch into
> > bitbake master.
> 
> Now this fails.
> 
> $ bitbake -c clean -b virtual:native:/home/kraj/work/oe/openembedded/recipes/zlib/zlib_1.2.3.bb
> Command execution failed: Traceback (most recent call last):
>   File "/home/kraj/work/oe/bitbake/lib/bb/command.py", line 88, in
> runAsyncCommand
>     commandmethod(self.cmds_async, self, options)
>   File "/home/kraj/work/oe/bitbake/lib/bb/command.py", line 174, in
> buildFile
>     command.cooker.buildFile(bfile, task)
>   File "/home/kraj/work/oe/bitbake/lib/bb/cooker.py", line 640, in
> buildFile
>     the_data = self.bb_cache.loadDataFull(fn, self.get_file_appends(fn),
> self.configuration.data)
>   File "/home/kraj/work/oe/bitbake/lib/bb/cooker.py", line 897, in
> get_file_appends
>     if f in self.appendlist:
> AttributeError: BBCooker instance has no attribute 'appendlist'

Sorry, I'd tested with partial expressions in the -b option, not full
paths. I've pushed a fix.

Cheers,

Richard



