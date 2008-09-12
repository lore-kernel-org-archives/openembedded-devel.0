Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>)
	id 1KeF1n-0005ve-UE; Fri, 12 Sep 2008 22:14:04 +0200
Received: from ip-89-168-141-231.cust.homechoice.net ([89.168.141.231]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>)
	id 1KeEyo-0005pL-OP; Fri, 12 Sep 2008 21:11:02 +0100
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20080912192123.GF29676@smtp.west.cox.net>
References: <20080912160657.GE29676@smtp.west.cox.net>
	<gaeef7$cvi$1@ger.gmane.org> <20080912192123.GF29676@smtp.west.cox.net>
Date: Fri, 12 Sep 2008 21:10:46 +0100
Message-Id: <1221250246.4641.237.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Cc: openembedded-devel@openembedded.org
Subject: Re: [Bug 4549] A number of xorg dev packages are uninstallable
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
X-List-Received-Date: Fri, 12 Sep 2008 20:14:04 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 2008-09-12 at 12:21 -0700, Tom Rini wrote:
> On Fri, Sep 12, 2008 at 09:04:07PM +0200, Koen Kooi wrote:
> > Tom Rini wrote:
> >> [ This is all also available at
> >> http://bugs.openembedded.net/show_bug.cgi?id=4549 ]
> >>
> >> A number of xorg dev packages (both literally -dev and util-macros) are
> >> uninstallable on the target.  The problem is that by default (with ipk)
> >> any given -dev package will depend on the main package, for example
> >> xproto-dev depends on xproto.  But in these packages case, there is no
> >> main package (no xproto).  The following patch fixes the issue.
> >
> > No, it doesn't, your patch actually *breaks* the depends chaining, the  
> > real fix would be to do ALLOW_EMPTY_${PN} = "1" in the recipes.
> 
> Well, they did all suddenly actually install.  I'll rework the patch per
> your suggestion, make sure that works too and re-post.  Thanks.

Actually, I think your original patch was the right thing.  I can't
think of any benefit from having a pile of empty ??proto packages; they
obviously don't contain any files, and they won't have any meaningful
dependencies either, so it seems like they would just be a waste of
space.

Of course, even better would be to teach package.bbclass to spot this
situation and not output the spurious dependency in the first place.  I
don't think that should be terribly difficult to arrange, since it knows
by the time population is finished whether it is going to generate a
binary for ${PN} or not, and this gives plenty of time to adjust the
dependencies on ${PN}-dev.

p.



