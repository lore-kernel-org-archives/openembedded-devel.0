Received: from mail.reciva.com ([82.71.203.194] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1Np2QS-00035e-Rz
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Mar 2010 17:36:57 +0100
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1Np2Nb-0001nl-UG
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Mar 2010 16:34:00 +0000
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <philb@gnu.org>) id 1Np2Nb-0007pP-Kk
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Mar 2010 16:33:59 +0000
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20100309115905.GM31945@jama>
References: <20100309075331.GL31945@jama>
	<1268130988.14566.922.camel@mill.internal.reciva.com>
	<20100309115905.GM31945@jama>
Date: Tue, 09 Mar 2010 16:33:56 +0000
Message-ID: <1268152436.14566.1040.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.2 
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: philb@gnu.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,SPF_SOFTFAIL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] Make some big but only formal change before next stable - SRCPV
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
X-List-Received-Date: Tue, 09 Mar 2010 16:36:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2010-03-09 at 12:59 +0100, Martin Jansa wrote:
> On Tue, Mar 09, 2010 at 10:36:28AM +0000, Phil Blundell wrote:
> > On Tue, 2010-03-09 at 08:53 +0100, Martin Jansa wrote:
> > > My SRCPV migration branch is quickly rotting.. but I'm willing to
> > > check/do it again, because resolving conflicts with every small change
> > > in git recipe takes me more time than merging SRCPV to oe.dev would
> > > take.
> > 
> > At the risk of sounding like a terrible dimwit, I am still not entirely
> > clear on why you can't just do something like
> 
> Feeling the same here now..
> 
> > PKGV = "0.0+git${@bb.fetch.get_srcrev(d)}.${PV}"
> 
> How this should work?
> 
> is PV at the end typo from PR or do you really mean that srcrev has higher
> priority than PV?

Yes, I would have thought you would want the srcrev to have higher
priority than PV.  In fact, you probably don't even want to have PV in
there at all.  You certainly wouldn't want PR in there since that goes
in ${PKGR}.

p.




