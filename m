Received: from [81.169.183.159] (helo=coruscant.onosendai.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <zecke@selfish.org>) id 1JW9Xr-00051B-Uv
	for openembedded-devel@lists.openembedded.org;
	Mon, 03 Mar 2008 13:13:29 +0100
Received: from firewall.tw.openmoko.org ([124.219.5.210] helo=tamarin.local)
	by coruscant.onosendai.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.60)
	(envelope-from <zecke@selfish.org>) id 1JW9Wk-00054Q-FQ
	for openembedded-devel@lists.openembedded.org;
	Mon, 03 Mar 2008 13:12:18 +0100
From: Holger Freyther <zecke@selfish.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 3 Mar 2008 13:12:15 +0100
User-Agent: KMail/1.9.9
References: <1204303564.8126.38.camel@dax.rpnet.com>
	<200803030207.40083.zecke@selfish.org>
	<1204537079.8095.19.camel@dax.rpnet.com>
In-Reply-To: <1204537079.8095.19.camel@dax.rpnet.com>
MIME-Version: 1.0
Message-Id: <200803031312.15859.zecke@selfish.org>
X-SA-Exim-Connect-IP: 81.169.183.159
X-SA-Exim-Mail-From: zecke@selfish.org
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: OE Staging ABI Change Warning
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 03 Mar 2008 12:13:30 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Monday 03 March 2008 10:37:59 Richard Purdie wrote:
> Hi Holger,
>
> On Mon, 2008-03-03 at 02:07 +0100, Holger Freyther wrote:
> > On Friday 29 February 2008 17:46:04 Richard Purdie wrote:
> > > OE.dev is now just about ready to switch to using sysroot. The
> > > compilers have been updated to activate sysroot and the fixes I/Poky
> > > have for various pkgconfig issues have been committed. The final change
> > > is to actually change the layout.
> >
> > one small question, how does this impact:
> > 	-The sharp rom and their crappy and ancient 2.95.x toolchain?
> > 	-Any other prebuilt toolchain.
>
> It means they'll need to play a game with symlinks just as we currently
> have in cross-linkage and the "hack" I added into gcc-cross temporarily
> to add a usr symlink in staging.

This needs documentation (updates). I don't see any of us volunteering though.


> Having looked at some old parts of the metadata when fixing up staging
> references, we already have a ton of broken .bb files :(. I was really
> disappointed with the quality in some areas and I honestly don't know
> what to do about this.

There is proposal to start with an empty repository and move things over, 
testing and compiling world, clean up weekends.... more review on checking 
things in.

Back to the point, feel free to check things in.


z.


