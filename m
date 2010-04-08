Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1Nzpf4-0000vn-85
	for openembedded-devel@lists.openembedded.org;
	Thu, 08 Apr 2010 13:12:38 +0200
Received: from w0952.wlan.rz.tu-bs.de ([134.169.203.190] helo=excalibur)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1Nzpbm-0000YD-RC by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Apr 2010 13:09:17 +0200
Received: from stefan by excalibur with local (Exim 4.71)
	(envelope-from <stefan@excalibur.local>) id 1Nzpbm-0004Pe-92
	for openembedded-devel@lists.openembedded.org;
	Thu, 08 Apr 2010 13:09:14 +0200
Date: Thu, 8 Apr 2010 13:09:14 +0200
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100408110914.GG27376@excalibur.local>
References: <alpine.DEB.1.10.1004081018050.3264@vitus.devnet.local>
	<alpine.DEB.1.10.1004081030010.3264@vitus.devnet.local>
	<20100408085916.GB27376@excalibur.local>
	<alpine.DEB.1.10.1004081113570.3264@vitus.devnet.local>
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.1.10.1004081113570.3264@vitus.devnet.local>
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 78.47.116.19
X-SA-Exim-Mail-From: stefan@datenfreihafen.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_HELO_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] dfu-programmer: USB Device Firmware Upgrade utility (special atmel-version)
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
X-List-Received-Date: Thu, 08 Apr 2010 11:12:39 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

On Thu, 2010-04-08 at 11:32, Vitus Jensen wrote:
> On Thu, 8 Apr 2010, Stefan Schmidt wrote:
> 
> > On Thu, 2010-04-08 at 10:32, Vitus Jensen wrote:
> >> On Thu, 8 Apr 2010, Vitus Jensen wrote:
> >>>
> >>> Add recipes for version 0.5.2 and for the head of the SVN repository.
> >>>
> >>> Signed-off-by: Vitus Jensen <vjensen@gmx.de>
> >>> ---
> >>> conf/checksums.ini                             |    4 ++++
> >>> recipes/dfu-programmer/dfu-programmer_0.5.2.bb |   17 +++++++++++++++++
> >>> recipes/dfu-programmer/dfu-programmer_svn.bb   |   20 ++++++++++++++++++++
> >>> 3 files changed, 41 insertions(+), 0 deletions(-)
> >>> create mode 100644 recipes/dfu-programmer/dfu-programmer_0.5.2.bb
> >>> create mode 100644 recipes/dfu-programmer/dfu-programmer_svn.bb
> >>
> >> I know that nowerdays the checksums are inside the recipe.  But we
> >> are working on the stable/2009 branch were it isn't done this way
> >> (or not supported?).  Please accept as is.
> >
> > This patch was targetted for the stable branch? If yes please indicate this in
> > the subject of the patch. You would need to get your patch into OE.dev first
> > before it can go into stable IIRC, but I leave it to the stable developers to
> > comment on this.
> 
> Well, everything we do is done in the stable/2009 branch because we need 
> the stability.  We cherry-pick from .dev (which is getting harder because 
> of the staging changes) and add new programs and machines.  I would like 
> to publish the changes but they have to be for .dev (policy) and mostly 
> identically to what is used here (because I don't want to maintain 2 
> images for the devices).

As I said, no hard feelings. But it likely that the versions in .dev and stable
will drift away rom each other anyway.
 
> > Having one patch for .dev with the checksum in the recipe and one for stable
> > with the sum in the ini file would also be fine I think. No hard feelings on
> > this though.
> 
> Will try out checksums inside the recipe in the stable/2009 branch.  I 
> think the support for it is only depending on bitbake versions, right?

I would think it is a combination from bitbake and classes inside the OE tree,
but I can't tell for sure.

> > An updated patch for the AUTOREV issue is still needed.
> 
> Well... the repository get updates every few months, mostly to support new 
> chips.  So the possibility is high that someone needs _svn.bb because of 
> he wants to program a newer atmel and I don't feel like deciding which 
> chip support to include or not.  I've included it to make it simple to get 
> the absolute newest programmer, for me 0.5.2 is enough.

Understoof. Sadly having AUTOREV set makes it hard for different people to have
a consistent build. Therefor we normally only enable it within local.conf

> Should I drop _svn.bb or use the head revision of today?

As you prefer. I'm not going to use dfu-programmer just giving some review on
your patch.

regards
Stefan Schmidt


