Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1N2PVH-0001Ar-JP
	for openembedded-devel@lists.openembedded.org;
	Mon, 26 Oct 2009 14:20:59 +0100
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1N2PU8-0006Ev-CY
	for openembedded-devel@lists.openembedded.org;
	Mon, 26 Oct 2009 13:19:48 +0000
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <pb@reciva.com>) id 1N2PU7-0008O6-1V
	for openembedded-devel@lists.openembedded.org;
	Mon, 26 Oct 2009 13:19:43 +0000
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <ec1f3d400910260325i54971290u914ff2c0a6ca301d@mail.gmail.com>
References: <ec1f3d400910230421r4509e19amc899870bdd640ce5@mail.gmail.com>
	<ec1f3d400910260325i54971290u914ff2c0a6ca301d@mail.gmail.com>
Date: Mon, 26 Oct 2009 13:19:39 +0000
Message-Id: <1256563179.23985.13.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.3 
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: pb@reciva.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [help] openembedded tarball sources on HTTP
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
X-List-Received-Date: Mon, 26 Oct 2009 13:20:59 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

I don't think anybody is publishing a comprehensive set of SCM-derived
source tarballs.  As you say below, oesources.org was the closest to
this but, since its demise, I don't think anybody else has stepped
forwards to fill the vacancy.  Some individual DISTROs do mirror the
sources that they are using, and you might like to check whether your
distro falls into that category, but I don't believe there is any
cross-distribution source mirror at present.  

Indeed, mirroring a full set of tarballs for every conceivable
SRCDATE/SRCREV would be a somewhat daunting undertaking: a more feasible
option would probably be to do an svn-over-http kind of proxy thing,
where a request for something like
http://svnproxy.oe.org/checkout?uri=svn://eleet.org/repository&rev=1234
would run the checkout in real time and hand you back a tarball.  If you
wanted to implement such a thing then it might be feasible to get it
hosted on one of the oe.org machines.

However, most/all recipes do offer at least one released tarball which
you should be able to use rather than checking out from SCM every time.
If you find a particular package whose sources are simply not available
any other way than CVS or SVN then post the details here and someone may
be able to point you at a tarball.

p.

On Mon, 2009-10-26 at 15:55 +0530, RK Raggit wrote:
> anyone with some idea on this .. ? sorry for pushing , but i am kind of
> evaluating OE and would like to know whether this is possible at all ?
> 
> ...unblocking cvs,svn ports is defnitely not an option for me.
> 
> --RK
> 
> On Fri, Oct 23, 2009 at 4:51 PM, RK Raggit <rk.raggit@gmail.com> wrote:
> 
> > Hi there,
> >
> > I am building openembedded recipes but i am behind a proxy that only allows
> > http accesses and blocks cvs,svn ports.
> >
> > I would like to know where i can obtain pristine OE package (tarball)
> > sources from a HTTP link. I tried
> >
> > http://oesources.org/source/current
> >
> > ...but that link does not work. Could someone please guide me the correct
> > link ? I will update my CVS_TARBALL_STASH
> > variable with this link.
> >
> > Thanks
> > RK
> >
> >
> >
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



