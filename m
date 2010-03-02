Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1NmWtG-0002b0-TW
	for openembedded-devel@lists.openembedded.org;
	Tue, 02 Mar 2010 19:32:19 +0100
Received: from p5b035fd5.dip.t-dialin.net ([91.3.95.213] helo=excalibur)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1NmWqV-0002lL-Gz by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 02 Mar 2010 19:29:30 +0100
Received: from stefan by excalibur with local (Exim 4.71)
	(envelope-from <stefan@excalibur.local>) id 1NmWqV-0007TY-0S
	for openembedded-devel@lists.openembedded.org;
	Tue, 02 Mar 2010 19:29:27 +0100
Date: Tue, 2 Mar 2010 19:29:26 +0100
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100302182926.GA28081@excalibur.local>
References: <1266337930-2440-1-git-send-email-aalonso00@gmail.com>
	<19c1b8a91002191026p3b06577ay9375f944daa661c1@mail.gmail.com>
	<20100302105623.GA28921@excalibur.local>
	<hmivaf$h8j$1@dough.gmane.org>
MIME-Version: 1.0
In-Reply-To: <hmivaf$h8j$1@dough.gmane.org>
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
Subject: Re: PACKAGE_ARCH in PACKAGE_ARCHS needed? (bitbake.conf) was: [PATCH 1/4] tune-ppc440.inc: add ppc440 to PACKAGE_EXTRA_ARCHS
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
X-List-Received-Date: Tue, 02 Mar 2010 18:32:20 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

On Tue, 2010-03-02 at 13:11, Koen Kooi wrote:
> On 02-03-10 11:56, Stefan Schmidt wrote:
> > 
> > On Fri, 2010-02-19 at 10:26, Khem Raj wrote:
> >> On Tue, Feb 16, 2010 at 8:32 AM, Adrian Alonso <aalonso00@gmail.com> wrote:
> >>> Signed-off-by: Adrian Alonso <aalonso00@gmail.com>
> >>> ---
> >>>  conf/machine/include/tune-ppc440.inc |    2 +-
> >>>  1 files changed, 1 insertions(+), 1 deletions(-)
> >>>
> >>> diff --git a/conf/machine/include/tune-ppc440.inc b/conf/machine/include/tune-ppc440.inc
> >>> index feca186..0c41db4 100644
> >>> --- a/conf/machine/include/tune-ppc440.inc
> >>> +++ b/conf/machine/include/tune-ppc440.inc
> >>> @@ -1,4 +1,4 @@
> >>>  TARGET_CC_ARCH = "-mcpu=440"
> >>>  BASE_PACKAGE_ARCH = "ppc440"
> >>>  FEED_ARCH = "ppc440"
> >>> -PACKAGE_EXTRA_ARCHS += "ppc440e"
> >>> +PACKAGE_EXTRA_ARCHS += "ppc440 ppc440e"
> >>
> >>
> >> I wonder why this would be needed, I would think that PACKAGE_ARCHS
> >> consists of PACKAGE_EXTRA_ARCHS and PACKAGE_ARCH (which is default
> >> arch constructed from  BASE_PACKAGE_ARCH)
> >> if that was the case then ppc440 would be added to supported archs
> >> list already but it seems there is a disconnect between PACKAGE_ARCH
> >> and  PACKAGE_ARCHS I am not sure if it
> >> is deliberate or an oversight. If it is an oversight then it should be
> >> fixed in bitbake.conf and that would avoid this patch.
> > 
> > Can somebody with more insight in bitbake.conf give us some insight here?
> > 
> > Right now bitbake.conf does not include PACKAGE_ARCH in PACKAGE_ARCHS.
> > 
> > PACKAGE_ARCHS = "all any noarch ${TARGET_ARCH} ${PACKAGE_EXTRA_ARCHS} ${MACHINE}"
> > 
> > If it should stay this way, would Adrian's patch be ok? I would rather get his
> > contributions in then having them sit to long around. Need to keep people
> > motivated. :)
> 
> The patch is OK, but for clarity we should change existing contructs like:
> 
> FEED_ARCH = "armv7a"
> PACKAGE_EXTRA_ARCHS += "armv4 armv4t armv5te armv6 armv7 armv7a"
> BASE_PACKAGE_ARCH = "armv7a"
> 
> to
> 
> BASE_PACKAGE_ARCH = "armv7a"
> FEED_ARCH = "${BASE_PACKAGE_ARCH}"
> PACKAGE_EXTRA_ARCHS += "armv4 armv4t armv5te armv6 armv7
> ${BASE_PACKAGE_ARCH}"
> 
> So the patch in question would become:
> 
> - -PACKAGE_EXTRA_ARCHS += "ppc440e"
> +PACKAGE_EXTRA_ARCHS += "${BASE_PACKAGE_ARCH} ppc440e"

Sounds good to me. Adrian, can you please rework your patch, test it and submit
this onw again?

I'll pick it up with the other patches and push it into the tree.

regards
Stefan Schmidt


