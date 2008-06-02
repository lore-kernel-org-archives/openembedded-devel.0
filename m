Received: from [78.47.116.26] (helo=drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickey@vanille-media.de>) id 1K3AXl-0008SJ-Pb
	for openembedded-devel@lists.openembedded.org;
	Mon, 02 Jun 2008 15:57:49 +0200
Received: from andromeda (e180191059.adsl.alicedsl.de [85.180.191.59])
	by drlauer-research.com (Postfix) with ESMTP id 786A1584BCF
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Jun 2008 15:55:05 +0200 (CEST)
From: Michael 'Mickey' Lauer <mickey@vanille-media.de>
Organization: Vanille-Media
To: openembedded-devel@lists.openembedded.org
Date: Mon, 2 Jun 2008 15:53:33 +0200
User-Agent: KMail/1.9.9
References: <1212402369.5008.6.camel@dax.rpnet.com>
	<1212405013.5008.19.camel@dax.rpnet.com>
In-Reply-To: <1212405013.5008.19.camel@dax.rpnet.com>
MIME-Version: 1.0
Message-Id: <200806021553.33860.mickey@vanille-media.de>
Subject: Re: Merging multimachine.bbclass into the OE.dev core
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Mon, 02 Jun 2008 13:57:50 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Monday 02 June 2008 13:10:13 Richard Purdie wrote:
> On Mon, 2008-06-02 at 11:26 +0100, Richard Purdie wrote:
> > multimachine has been a kind of second class citizen for a long time
> > having been maintained in its own class.  We now have things like sdk
> > generation which implicitly depend on multimachine being used. I can't
> > think of any reason people wouldn't want to use it and it allows extra
> > flexibility without imposing any added limitations.
> >
> > Is it time we merged it into the core classes and made it the default?
> >
> > The one drawback is it will force an effective wipe tmp for anyone who
> > wasn't using it before.
>
> Its been pointed out that some people only use one target and therefore
> don't like the longer paths when they don't need them.
>
> I'd propose adding a singlemachine.bbclass which gives the old behaviour
> although people using that would do so at their own risk from the
> meta-toolchain and sdk.bbclass perspectives.

Yep, very good.

:M:


