Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1PEg1q-0007V8-2j
	for openembedded-devel@lists.openembedded.org;
	Sat, 06 Nov 2010 11:29:46 +0100
Received: from p5b0349e0.dip.t-dialin.net ([91.3.73.224] helo=excalibur.local)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1PEg0x-0001Sy-RV by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 06 Nov 2010 11:28:54 +0100
Received: from stefan by excalibur.local with local (Exim 4.72)
	(envelope-from <stefan@excalibur.local>) id 1PEg0w-0006U3-7q
	for openembedded-devel@lists.openembedded.org;
	Sat, 06 Nov 2010 11:28:50 +0100
Date: Sat, 6 Nov 2010 11:28:49 +0100
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101106102849.GB6691@excalibur.local>
References: <20100331152003.5828.26495.stgit@ES-J7S4D2J.amer.consind.ge.com>
	<20100331204114.GA14197@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20100331204114.GA14197@gmail.com>
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 78.47.116.19
X-SA-Exim-Mail-From: stefan@datenfreihafen.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] po4a: Add native recipe
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
X-List-Received-Date: Sat, 06 Nov 2010 10:29:46 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

On Wed, 2010-03-31 at 13:41, Khem Raj wrote:
> On (31/03/10 16:20), Martyn Welch wrote:
> > Add a recipe for building a native version of po4a version 0.36.3.
> > 
> > Signed-off-by: Martyn Welch <martyn.welch@ge.com>
> > ---
> > 
> >  recipes/po4a/po4a-native_0.36.3.bb |   12 ++++++++++++
> >  1 files changed, 12 insertions(+), 0 deletions(-)
> > 
> > diff --git a/recipes/po4a/po4a-native_0.36.3.bb b/recipes/po4a/po4a-native_0.36.3.bb
> > new file mode 100644
> > index 0000000..07c9e08
> > --- /dev/null
> > +++ b/recipes/po4a/po4a-native_0.36.3.bb
> > @@ -0,0 +1,12 @@
> > +DESCRIPTION = "Tools for helping translation of documentation"
> > +SECTION = "utility"
> > +PRIORITY = "optional"
> > +LICENSE = "GPL"
> > +DEPENDS = "libmodule-build-perl-native"
> > +PR = "r0"
> > +inherit native
> 
> may be you could use BBCLASSEXTEND to write native part and have recipe
> also for target package. 

Agreed. We need to reduce our set of recipes and BBCLASSEXTEND helps a lot for
the native recipes. Martyn, care to send a reworked patch for this?

regards
Stefan Schmidt


