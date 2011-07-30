Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QnD8t-0007K4-Ag
	for openembedded-devel@lists.openembedded.org;
	Sat, 30 Jul 2011 19:16:25 +0200
Received: by iyj12 with SMTP id 12so5693297iyj.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Jul 2011 10:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:organization:user-agent:in-reply-to
	:references:mime-version:content-transfer-encoding:content-type;
	bh=Ra7Gbb4P/R9r6drMYaGSvoxt22ZrYGimHXfb6ISeNz8=;
	b=Unu372H7MFX+4uWLsh2ofnTHWR89N5PyWsDAbNJBFqJmG58TCHfKluXPLZ5qSvhLkX
	sW0riNLVOrIQ/Ft4CYeEuyTpbJufSy57SW5SExb3UP1wcSbPrdmLqtsDEPdjUJaNw8Ju
	9YxjIxqVGt0ZK3S1TEumY/2DbWSfQlLmOyM9c=
Received: by 10.142.1.12 with SMTP id 12mr1772006wfa.19.1312045650479;
	Sat, 30 Jul 2011 10:07:30 -0700 (PDT)
Received: from perseus.localnet (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id g4sm3426037pbj.41.2011.07.30.10.07.28
	(version=SSLv3 cipher=OTHER); Sat, 30 Jul 2011 10:07:28 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 30 Jul 2011 10:07:25 -0700
Message-ID: <1536968.X2sCWL0zD8@perseus>
Organization: Sakrah
User-Agent: KMail/4.7.0  (Linux/2.6.38-10-generic; KDE/4.7.0; i686; ; )
In-Reply-To: <4E30F83B.3080907@dresearch-fe.de>
References: <4E301F87.8040609@dresearch-fe.de>
	<CABcZANnYw1Njsi=8BUr0=Mf-O78VEXF9XJQy5-Oqm66+=A7nQQ@mail.gmail.com>
	<4E30F83B.3080907@dresearch-fe.de>
MIME-Version: 1.0
Subject: Re: understanding overlays
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
X-List-Received-Date: Sat, 30 Jul 2011 17:16:25 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday, July 28, 2011 07:48:43 AM Steffen Sledz wrote:
> On 27.07.2011 18:12, Chris Larson wrote:
> > On Wed, Jul 27, 2011 at 7:24 AM, Steffen Sledz <sledz@dresearch-fe.de> 
wrote:
> >> I'm not really familiar with the oe/bitbake overlay details. So please
> >> forgive me if this is a faq. ;-)
> >> 
> >> Is the overlay package or file based?
> >> 
> >> Or in other words is the following scenario possible?
> >> 
> >> base layer:
> >>  recipes/
> >>  
> >>    foo/
> >>    
> >>      foo.inc
> >>      foo_x.y.z.bb
> >> 
> >> overlay:
> >>  recipes/
> >>  
> >>    foo/
> >>    
> >>      foo.inc
> >> 
> >> And than build foo-x.y.z with the foo.inc from the overlay.
> > 
> > That depends. If the .bb does 'require foo.inc', then no, it will use
> > the local one. If it does 'require recipes/foo/foo.inc', then yes, it
> > will use the overlay one, assuming the overlay is before the main
> > layer in your BBLAYERS.
> 
> Thx. What about files referenced e.g. in SRC_URI? I assume that always the
> ones from the 'highest' layer are used. Right?

It will consider the BBFILE_PRIORITY for recipe files. but .inc and other 
metadata are searched in order of paths in BBPATH

-- 
Khem Raj


