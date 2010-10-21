Received: from vms173017pub.verizon.net ([206.46.173.17])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1P8lAj-0003XF-Tx
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Oct 2010 04:46:30 +0200
Received: from gandalf.denix.org ([unknown] [71.255.228.135])
	by vms173017.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LAM00BCAD0BN0Y2@vms173017.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	20 Oct 2010 21:45:48 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 6056B14AF64; Wed,
	20 Oct 2010 22:45:47 -0400 (EDT)
Date: Wed, 20 Oct 2010 22:45:47 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20101021024547.GZ11514@denix.org>
References: <AANLkTikrgw76+iAr8n3a3Kv+1joHN0ZAKTMcmOvNXrbU@mail.gmail.com>
	<1287257081-25608-1-git-send-email-Martin.Jansa@gmail.com>
	<131E5DFBE7373E4C8D813795A6AA7F0803110B3131@dlee06.ent.ti.com>
	<AANLkTimWmTWAkCPAabOagq2S5gtfMztov8xiBcK7q_Vh@mail.gmail.com>
	<131E5DFBE7373E4C8D813795A6AA7F0803110B3140@dlee06.ent.ti.com>
	<20101019192458.GB6202@denix.org> <20101020232906.GY11514@denix.org>
	<AANLkTikb49yz4h3O==qzv8S+WhP6uqT79zqpqEtRMpwK@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <AANLkTikb49yz4h3O==qzv8S+WhP6uqT79zqpqEtRMpwK@mail.gmail.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.17
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] bitbake.conf: don't append MACHINE_OVERRIDES to	OVERRIDES when it's empty
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
X-List-Received-Date: Thu, 21 Oct 2010 02:46:30 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Oct 20, 2010 at 04:34:32PM -0700, Chris Larson wrote:
> On Wed, Oct 20, 2010 at 4:29 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> 
> > I see that Martin's patch was marked as "Superseded" and archived - is
> > there a
> > new patch coming? Or are there any side-effects of this patch? I would
> > definitely like to push this patch ASAP to address our immediate problem.
> >
> 
> The original problem with empty overrides was the FILESPATH issue, which was
> fixed by the commit that sanitized FILESPATH, hence the superseded.  Clearly
> there's another issue with them, so this patch is necessary.  Feel free to
> apply it with modification and push it, we can always drop it when we bump
> the minimum bitbake version to 1.10.x.

Thanks. I will push this patch shortly - I actually have it in my local 
repository applied, but I'm now facing another issue and trying to solve it 
first...

-- 
Denys


