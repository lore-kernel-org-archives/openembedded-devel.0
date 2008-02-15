Received: from [66.249.92.168] (helo=ug-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <pmiscml@gmail.com>) id 1JQ2v3-0008Ts-IW
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Feb 2008 16:56:11 +0100
Received: by ug-out-1314.google.com with SMTP id i24so1571316ugd.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Feb 2008 07:55:52 -0800 (PST)
Received: by 10.66.251.3 with SMTP id y3mr1406591ugh.88.1203090952600;
	Fri, 15 Feb 2008 07:55:52 -0800 (PST)
Received: from widy.localdomain ( [88.252.162.97])
	by mx.google.com with ESMTPS id b23sm17704348ugd.10.2008.02.15.07.55.49
	(version=SSLv3 cipher=OTHER); Fri, 15 Feb 2008 07:55:51 -0800 (PST)
Date: Fri, 15 Feb 2008 17:56:07 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20080215175607.2a63ba93@widy.localdomain>
In-Reply-To: <47B5A9A4.3040400@dls.net>
References: <E1JPfb1-0006hO-Ll@linuxtogo.org>
	<74d0deb30802140817g153c4fe3if16cd9eabe67c9f3@mail.gmail.com>
	<200802151245.30040.mickey@vanille-media.de>
	<fp48t2$i8$1@ger.gmane.org> <47B5A9A4.3040400@dls.net>
X-Mailer: Claws Mail 3.0.2 (GTK+ 2.12.5; i686-pc-linux-gnu)
Mime-Version: 1.0
X-SA-Exim-Connect-IP: 66.249.92.168
X-SA-Exim-Mail-From: pmiscml@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [oe-commits] org.oe.dev anki: fix parse error
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
X-List-Received-Date: Fri, 15 Feb 2008 15:56:11 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hello,

On Fri, 15 Feb 2008 09:03:00 -0600
"Mike (mwester)" <mwester@dls.net> wrote:

> Rolf Leggewie wrote:
> > Michael 'Mickey' Lauer wrote:
> >   
> >> export PV is valid syntax, but needs bitbake >= 1.8.8.
> >>
> >> If you think it's too early to depend on this, then you can
> >> substitute with
> >>
> >> export PV := "${PV}"
> >>     
> >
> > I think depending on 1.8.10 is fine and indeed, this might be a good
> > test to make sure everybody updates ;-)
> >
> >   
> 
> I recall a series of discussions some months ago regarding the topic
> of making OE an easier tool for other distro developers, companies,
> or individuals to use.  Requiring a bitbake upgrade to accommodate a 
> single-line in a single recipe that can easily be expressed in a
> fashion compatible with the existing bitbake versions installed, well
> that just seem to fly in the face of that earlier discussion.
> 
> Here's one vote for against forcing a complete bitbake upgrade on
> other communities:
> -1 from me!

That's for sure valid point, but hard to enforce in .dev. Now that we
have a stable branch again, it shouldn't be underestimated: entities
valuing stability over all, should consider using it (and
participating in its maintenance ;-) ).

[]

-- 
Best regards,
 Paul                          mailto:pmiscml@gmail.com


