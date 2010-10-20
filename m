Received: from vms173005pub.verizon.net ([206.46.173.5])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1P8i6P-0002e8-SM
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Oct 2010 01:29:51 +0200
Received: from gandalf.denix.org ([unknown] [71.255.228.135])
	by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LAM00JBM3WIUWN0@vms173005.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	20 Oct 2010 18:29:08 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 798DB14AF64; Wed,
	20 Oct 2010 19:29:06 -0400 (EDT)
Date: Wed, 20 Oct 2010 19:29:06 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20101020232906.GY11514@denix.org>
References: <AANLkTikrgw76+iAr8n3a3Kv+1joHN0ZAKTMcmOvNXrbU@mail.gmail.com>
	<1287257081-25608-1-git-send-email-Martin.Jansa@gmail.com>
	<131E5DFBE7373E4C8D813795A6AA7F0803110B3131@dlee06.ent.ti.com>
	<AANLkTimWmTWAkCPAabOagq2S5gtfMztov8xiBcK7q_Vh@mail.gmail.com>
	<131E5DFBE7373E4C8D813795A6AA7F0803110B3140@dlee06.ent.ti.com>
	<20101019192458.GB6202@denix.org>
MIME-version: 1.0
In-reply-to: <20101019192458.GB6202@denix.org>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.5
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: clarson@kergoth.com, martin.jansa@gmail.com
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
X-List-Received-Date: Wed, 20 Oct 2010 23:29:51 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Oct 19, 2010 at 03:24:58PM -0400, Denys Dmytriyenko wrote:
> On Tue, Oct 19, 2010 at 02:18:25PM -0500, Maupin, Chase wrote:
> > > > I saw this issue in my overlay of having a "::" in my OVERRIDES which
> > > > caused my parsing to fail in angstrom.inc.  Applying this fix from
> > > Martin
> > > > resolves the parsing issue.  My OVERRIDES appear to be in the correct
> > > order
> > > > with this change:
> > > 
> > > Can you explain this?  "caused my parsing to fail" is not very useful
> > > information.  What exactly failed?
> > 
> > Chris,
> > 
> > Sorry, I thought this was an understood issue.  I have put the error output 
> > I got below.  Basically, when I got to line 509 of data.py the variables had 
> > the following values:
> > 
> > vars = set(['__functions_', '_', '__functions__'])
> > 
> > var = '__functions__'
> > 
> > overrides = ['pn-angstrom', 'fail-fast', 'build-linux', 'arm', 'INVALID', 'angstrom-2008.1', '', 'am37x-evm', 'local']
> >  
> > o = ''
> > 
> > OVERRIDES = 'pn-angstrom:fail-fast:build-linux:arm:INVALID:angstrom-2008.1::am37x-evm:local'
> > 
> > The current override being evaluated was the '' one.
> > 
> > The line being evaluated in my overlay was USERDISTRO := "${DISTRO}" in my 
> > copy of angstrom.inc
> 
> Chris,
> 
> FYI, the below "RuntimeError: Set changed size during iteration" exception 
> happens in bitbake 1.8.18 but not the 1.10/mainline.

Chris, Martin,

After more debugging, it seems the problem is caused by using bitbake 1.8.18 
and conf/collections.inc at the same time, as that version of bitbake chokes 
on empty override "::", when it gets re-spawned from collections.inc. If I 
replace the use of COLLECTIONS with direct BBFILES/BBFILE_* assignments, bitbake 
parses everything just fine. It is reproducible right now on the latest OE 
mainline with bitbake 1.8.18 by just adding "require conf/collections.inc" in 
local.conf or bitbake.conf.

I see that Martin's patch was marked as "Superseded" and archived - is there a 
new patch coming? Or are there any side-effects of this patch? I would 
definitely like to push this patch ASAP to address our immediate problem. 
Thanks.

-- 
Denys


