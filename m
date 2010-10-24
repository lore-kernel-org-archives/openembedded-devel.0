Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1PA6h4-00033z-Km
	for openembedded-devel@lists.openembedded.org;
	Sun, 24 Oct 2010 21:57:30 +0200
Received: from [192.168.0.101] (91-64-127-39-dynip.superkabel.de
	[91.64.127.39])
	by gandharva.secretlabs.de (Postfix) with ESMTPA id 0638D1B10C0B;
	Sun, 24 Oct 2010 19:58:14 +0000 (UTC)
Message-ID: <4CC48F7C.2000403@freyther.de>
Date: Sun, 24 Oct 2010 21:56:44 +0200
From: Holger Freyther <holger+oe@freyther.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.9) Gecko/20100921 Fedora/3.1.4-1.fc14 Lightning/1.0b2
	Thunderbird/3.1.4
MIME-Version: 1.0
To: bitbake-dev@lists.berlios.de, 
 openembedded-devel@lists.openembedded.org
References: <1285368419-12062-1-git-send-email-raj.khem@gmail.com>	<AANLkTimhhvUqQZSicuDE7qEHFdxUJjJJSv=ZioFwwdR8@mail.gmail.com>	<AANLkTikvA4DOf7uwKUq2myNZMdOPZiOf_B73Kr=USOjZ@mail.gmail.com>	<AANLkTi=8ZBZmU68NYZO3HkkLVJ09y+jhr0pWrd=bt=32@mail.gmail.com>
	<AANLkTimjYwr6vn5Makva7yciDA2_4KoiM=K7EtQQkYCf@mail.gmail.com>
In-Reply-To: <AANLkTimjYwr6vn5Makva7yciDA2_4KoiM=K7EtQQkYCf@mail.gmail.com>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [Bitbake-dev] [PATCH] fetchers: Use tar --exclude pattern to remove SCM files
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
X-List-Received-Date: Sun, 24 Oct 2010 19:57:32 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 10/24/2010 08:35 PM, Khem Raj wrote:

>>
>> this is used in all efl recipes and I've noticed it in elementary only
>> because python-elementary depends on such new version.
> 
> Do you have a list of recipes which use this ? I am sure with git it
> will be hard to use such a thing
> as the git revs are random and simlarily many other SCMs


Speaking as upstream co-author of OpenBSC. We are using something like this to
get the revision from the last tag of the repository. If someone is doing a
make dist(check) we will copy a special version file into the tar.gz and use
that instead.

From an upstream point of view I think it is acceptable to say that the ones
that build stuff from a SCM (in contrast to a tarball) should have the files
of the SCM around...

PS: I liked the --exclude patch a lot too...


