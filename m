Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1NRdAa-0007QE-TK
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Jan 2010 03:59:52 +0100
Received: from tamarin.localnet (123-192-180-176.dynamic.kbronet.com.tw
	[123.192.180.176])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 2A9FC1B10C02
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Jan 2010 02:55:01 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 4 Jan 2010 03:57:33 +0100
User-Agent: KMail/1.12.2 (Linux/2.6.31; KDE/4.3.2; i686; ; )
References: <op.u5zi1ghgmn1qzu@guohr-laptop-ubuntu>
In-Reply-To: <op.u5zi1ghgmn1qzu@guohr-laptop-ubuntu>
MIME-Version: 1.0
Message-Id: <201001040357.33204.holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: why we don't setup a buildbot for openembedded QA?
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
X-List-Received-Date: Mon, 04 Jan 2010 02:59:52 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Monday 04 January 2010 02:42:42 Guo Hongruan wrote:
> Hi guys,
>    I think we had better set up a continuous integration tool buildbot to
> automate the compile/test cycle required to validate changes to the
> project code base.
> 
> It can help openembedded user to save time on failed building.

You make one assumption. You assume that the user config is the same as the 
build slaves (this includes different host distros, host machine, target 
machine, target distro and packages to be built).


> Without buildbot, any volunteers can provide their available machine as
> buildslave and the continuous integration environment will be really
> scalable.

This is not different from the tinderbox setup. On top of the buildbot we do 
get much more information about the build, including the log files of each and 
every task.


The basic problem is there are so many different possible configurations that 
they can not be tested with each commit. What can be done and is done is that 
the paths that are walked frequently will work better than the paths that are 
not walked as frequently. E.g. creating a new distribution will be a lot 
harder than building Angstrom for the Beagleboard.

Now what one should do if one is interested in a specific path is to user the 
tinderclient and regularily build, test (and fix) the path one is interested 
in. For me this includes the meta-toolchain-qte target.


The other is the tinderbox setup will soon gain a waterfall view and then it 
becomes a s social problem to fix the (selected) builds whenever they break.


regards
	holger


