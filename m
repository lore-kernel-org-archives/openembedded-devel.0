Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OfqlT-0003o5-62
	for openembedded-devel@lists.openembedded.org;
	Mon, 02 Aug 2010 10:52:55 +0200
Received: by fxm12 with SMTP id 12so1660176fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Aug 2010 01:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:cc:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=9Xkms6MeTSZOWB/6sM+8V3WusZzozua5WF6QLJwW170=;
	b=kIotloE0q+O6YeC2QGms9W/x4qoyYuiMAlkn4/WN2w6y+E/I93OoIuY8TLtO9CYdGA
	aavCMO9elxebQ9mS4ahkUQf3k5R/gbtjk6ifqTov9YoHAw9RdopPd0EnrAzMqNZk0n47
	JIkarN0ldXpOs1vXQHTfMYMffISIgC4lnn3UE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=TdR8hmEuk7s4nLtyKrATXJslEcrcFHRxqw6AG+bIbDHGmu6gIjIk1JHFc1AsH76WVT
	BG5epUl157bgEF70AXbb/VfA8cYWI5negr7wUxYTjz2JG95U2HFgdLbOqXJjjTP3pyuH
	g0kHl/7yGUe4MA/0Y9du3pi0Ly7u3NHTfasms=
Received: by 10.223.113.135 with SMTP id a7mr5406372faq.40.1280739146891;
	Mon, 02 Aug 2010 01:52:26 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id l12sm1920800fan.1.2010.08.02.01.52.25
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 02 Aug 2010 01:52:25 -0700 (PDT)
Date: Mon, 2 Aug 2010 10:52:20 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100802085220.GB20683@jama>
References: <1276068782-23257-1-git-send-email-mad_soft@inbox.ru>
	<20100718075638.GC16225@jama>
MIME-Version: 1.0
In-Reply-To: <20100718075638.GC16225@jama>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 0/3] Recipe for MuPDF
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
X-List-Received-Date: Mon, 02 Aug 2010 08:52:56 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Jul 18, 2010 at 09:56:38AM +0200, Martin Jansa wrote:
> On Wed, Jun 09, 2010 at 11:32:59AM +0400, Dmitry Artamonow wrote:
> > Hi!
> > 
> > Here's recipe for MuPDF (X11 pdf viewer and toolkit) and its dependencies.
> > Viewer doesn't have any fancy GUI - just a plain window with rendered PDF,
> > but it's a good thing on small screens embedded devices usually have,
> > as no screen space is wasted on buttons, etc. Viewer is perfectly
> > controllable from keyboard (and keyboardless devices like PDAs usually
> > have some joystick which is enough to navigate through pages, and other
> > tasks can be performed from on-screen keyboard). Also pdf contents is
> > scrollable by finger/stylus/mouse. And last, but not least - viewer is
> > VERY fast, much faster than poppler/xpdf-based solutions. I never thought
> > I can get such a speed of PDF-rendering on ARM-based machine.
> > 
> > Build tested for armv4(h3600), armv5(hx4700), armv7(beagleboard), x86(qemux86)
> > Run tested on armv5 machine (hx4700)
> 
> Hi, is there PATCHv2 series with Khem's suggestions fixed?
> 
> Would be nice to have it in oe.dev.

Please....

-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


