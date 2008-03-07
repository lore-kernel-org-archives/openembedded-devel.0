Received: from [82.119.242.94] (helo=mail.suse.cz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>)
	id 1JXeXt-0008RD-Rv; Fri, 07 Mar 2008 16:31:43 +0100
Received: from [10.20.1.86] (hammer.suse.cz [10.20.1.86])
	by mail.suse.cz (Postfix) with ESMTP id BE5C862808D;
	Fri,  7 Mar 2008 16:30:07 +0100 (CET)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20080307143903.0df8f8b9@cimmeria>
References: <E1JXdfA-0002tB-NY@linuxtogo.org>
	<20080307143903.0df8f8b9@cimmeria>
Date: Fri, 07 Mar 2008 16:30:07 +0100
Message-Id: <1204903807.23228.91.camel@hammer.suse.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.0 
X-SA-Exim-Connect-IP: 82.119.242.94
X-SA-Exim-Mail-From: utx@penguin.cz
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=AWL,RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] org.oe.angstrom-2007.12-stable linux-rp	2.6.24: disable rc patch for akita - it doesn't apply and only handles spitz
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
X-List-Received-Date: Fri, 07 Mar 2008 15:31:43 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Graeme Gregory wrote:
> On Fri, 07 Mar 2008 15:35:08 +0100
> "koen commit" <openembedded-commits@lists.openembedded.org> wrote:
> 
> > linux-rp 2.6.24: disable rc patch for akita - it doesn't apply and
> > only handles spitz
> > * again, no backport, since this is unsuitable for .dev
> > 
> If one of the akita maintainers want to fix this then the OE RH-2 remote
> is currently sitting on my desk unused.
> 
> >From what I remeber akita is just a couple of gpio different for the
> remote than spitz so this should be low hanging fruit.

Oops. SPITZ_SCP2_AKIN_PULLUP is Spitz specific.

I will create a patch but I cannot test it. Any volunteer?

-- 
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



