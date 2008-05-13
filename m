Received: from [81.169.183.159] (helo=coruscant.onosendai.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <zecke@selfish.org>) id 1JvqGK-0005ff-UY
	for openembedded-devel@lists.openembedded.org;
	Tue, 13 May 2008 10:53:32 +0200
Received: from world195.mi.fu-berlin.de ([160.45.115.195])
	by coruscant.onosendai.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.69)
	(envelope-from <zecke@selfish.org>) id 1JvqF1-0007h4-4B
	for openembedded-devel@lists.openembedded.org;
	Tue, 13 May 2008 10:52:11 +0200
From: Holger Freyther <zecke@selfish.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 13 May 2008 10:52:11 +0200
User-Agent: KMail/1.9.9
References: <g049dg$2ks$1@ger.gmane.org>
	<c384c5ea0805111546g62514fd0r484f57471997c958@mail.gmail.com>
	<1210576761.4981.1.camel@dax.rpnet.com>
In-Reply-To: <1210576761.4981.1.camel@dax.rpnet.com>
MIME-Version: 1.0
Message-Id: <200805131052.12001.zecke@selfish.org>
Subject: Re: RFC: reverse the name change for org.oe.stable
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10b4
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
X-List-Received-Date: Tue, 13 May 2008 08:53:33 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Monday 12 May 2008 09:19:21 Richard Purdie wrote:
> On Mon, 2008-05-12 at 00:46 +0200, Leon Woestenberg wrote:
> > Yes, do not use _<scm> recipes in stable stuff, a known checkout of
> > the OE stable branch should either build or not for a particular
> > machine/distro/... combo.
> >
> > If I checkout today's stable tree in one year time, it should build.
> > Period.
> >
> > That isn't going to work with _<scm> recipes being active in stable.
>
> Floating SCM versions won't be reproducible, fixed SCM versions will. If
> SCM versions are used they need to be locked to a version.

The reality is that SRCDATE is completely meaningless for at least CVS and 
SVN. Even worse with CVS and SVN the history can be altered and even if you 
checkout e.g. the glibc repo by date you get a different snapshot that you 
got last time you tried.

The sad reality is that only SCMs with a hash as revision number can be 
trusted, for the others we would have to make sure that the mirrors carry the 
checkout as we used it to build the package and to disable checking stuff out 
by date/revnumber in bitbake for a real stable branch.


just my two cents, I might be off topic.
	z.


