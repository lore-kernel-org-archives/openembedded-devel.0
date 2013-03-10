Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UEnKi-0007WY-Dd
	for openembedded-devel@lists.openembedded.org;
	Sun, 10 Mar 2013 21:59:09 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 10 Mar 2013 13:42:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,819,1355126400"; d="scan'208";a="268103461"
Received: from unknown (HELO helios.localnet) ([10.255.13.12])
	by azsmga001.ch.intel.com with ESMTP; 10 Mar 2013 13:42:26 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Sun, 10 Mar 2013 20:42:25 +0000
Message-ID: <3813608.lTKvSajpAY@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.1 (Linux/3.5.0-25-generic; KDE/4.10.1; i686; ; )
In-Reply-To: <20130309063059.GA9724@jama.dyndns-home.com>
References: <1362768637-29343-1-git-send-email-otavio@ossystems.com.br>
	<1500617.PjPkZjIiXc@helios>
	<20130309063059.GA9724@jama.dyndns-home.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [meta-oe][PATCH] polkit: Remove authentication override as it is handled in OE-Core
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
X-List-Received-Date: Sun, 10 Mar 2013 20:59:16 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Saturday 09 March 2013 07:30:59 Martin Jansa wrote:
> On Fri, Mar 08, 2013 at 10:48:17PM +0000, Paul Eggleton wrote:
> > On Friday 08 March 2013 15:50:37 Otavio Salvador wrote:
> > > OE-Core now handles the detection of authentication so we don't need
> > > to do it here. The bbappend file is kept to provide the upgrade path
> > > only, or the revision would go backwards.
> > > 
> > > Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> > > ---
> > > 
> > >  meta-oe/recipes-extended/polkit/polkit_0.104.bbappend | 9 +--------
> > >  1 file changed, 1 insertion(+), 8 deletions(-)
> > > 
> > > diff --git a/meta-oe/recipes-extended/polkit/polkit_0.104.bbappend
> > > b/meta-oe/recipes-extended/polkit/polkit_0.104.bbappend index
> > > ea82e37..ceb2b6b 100644
> > > --- a/meta-oe/recipes-extended/polkit/polkit_0.104.bbappend
> > > +++ b/meta-oe/recipes-extended/polkit/polkit_0.104.bbappend
> > > @@ -1,8 +1 @@
> > > -PRINC := "${@int(PRINC) + 4}"
> > > -
> > > -POLKITAUTH ??= "consolekit"
> > > -
> > > -PACKAGECONFIG += "${POLKITAUTH}"
> > > -PACKAGECONFIG[systemd] = "--enable-systemd,--disable-systemd,systemd"
> > > -# there is no --enable/--disable option for consolekit and it's not
> > > picked
> > > by shlibs, so add it to RDEPENDS -PACKAGECONFIG[consolekit] =
> > > ",,,consolekit"
> > > +PRINC := "${@int(PRINC) + 5}"
> > 
> > Can't we just bump PR in OE-Core?
> 
> we dont know which oe-core and meta-oe revisions are used together and
> this needs to be applied in both at the same time.. so no, we need to
> wait for PE/PV change in oe-core.

I guess you're probably right. Yet another reason to never add any more 
bbappends to meta-oe.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


