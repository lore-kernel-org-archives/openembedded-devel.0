Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1ObH8P-0007KH-I4
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Jul 2010 20:01:43 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1ObH8D-0005FC-Ja from Tom_Rini@mentor.com ;
	Tue, 20 Jul 2010 11:01:29 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Tue, 20 Jul 2010 11:01:29 -0700
Received: from [172.30.80.25] ([172.30.80.25]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Tue, 20 Jul 2010 12:01:28 -0600
Message-ID: <4C45E471.5070004@mentor.com>
Date: Tue, 20 Jul 2010 11:01:21 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-OriginalArrivalTime: 20 Jul 2010 18:01:28.0351 (UTC)
	FILETIME=[93849AF0:01CB2835]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Finishing packaged-staging (this version..)
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
X-List-Received-Date: Tue, 20 Jul 2010 18:01:43 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hey all,

As Koen mentioned in another thread, packaged-staging is "halfway done". 
  So, what's left to get things done good enough for now?  From my point 
of view it's:
- Need to get binconfig scripts into the target directory
- Need to $ORIGIN cross tools

Once that's done we should have fully relocatable pstaging packages and 
at that point we can talk about how to do things better.

poky currently has both of these done, and it involves killing the cross 
directory (roughly, moving it to sysroots/${HOST_OS}).

Anyone see anything else needed before we can have a pstaging that's 
functional enough to use as a baseline for rework?

Richard, any chance someone from your team is going to be working on 
rebasing your changes against oe.dev soon?

Thanks!

-- 
Tom Rini
Mentor Graphics Corporation


