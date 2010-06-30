Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OTvXI-0003Wa-Un
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Jun 2010 13:33:01 +0200
Received: by fxm12 with SMTP id 12so356564fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Jun 2010 04:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=A3z6g2jUxa8wV4bn8HhIUGHab2qcAEgbrq1K6tH/Ol8=;
	b=JJGQZ+vrbILI+jVXin5sMpI++GTBnYxqHzsSkqFCvgKhT4DUvWHksMHVyp1VwqeOv/
	Fdve9F3hTxZrxPcjycu2YSDS4vuso/MnW1vMIhvtlOCtp/TgW97Ac5r395cS6+GvLsfB
	Vo+40f2IHViqlwYrQqfh6LJtLTHSfPwZJ9ssY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=LRmjYfhjCZtBBK7ecFFtGFB6EaaXLjmdmBb47R0W9RBLNeg1OUM+QX40qdSiVutEuP
	56pFnmYusigHURWs6sSkCf0waRRzajNoneFcjnNf8LYpfoBiWw8ewbz/Hiv7bhst+5dM
	lUFYSj1oI+sTs+LjiHGkClqclbDG8Xi932Wjc=
Received: by 10.223.116.134 with SMTP id m6mr5394775faq.61.1277897297132;
	Wed, 30 Jun 2010 04:28:17 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id e16sm55880414fak.8.2010.06.30.04.28.16
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 30 Jun 2010 04:28:16 -0700 (PDT)
Date: Wed, 30 Jun 2010 13:27:23 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100630112723.GH12539@jama>
References: <1277552779-12490-1-git-send-email-Martin.Jansa@gmail.com>
	<AANLkTikPwgZUakbZFu0Rlmqr-_0NZ5jXwa-R3BTaeOVB@mail.gmail.com>
	<1277896602.2345.1332.camel@mill.internal.reciva.com>
MIME-Version: 1.0
In-Reply-To: <1277896602.2345.1332.camel@mill.internal.reciva.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] preferred-xorg-versions: remove include files for old releases
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
X-List-Received-Date: Wed, 30 Jun 2010 11:33:01 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 30, 2010 at 12:16:42PM +0100, Phil Blundell wrote:
> On Wed, 2010-06-30 at 13:06 +0200, Martin Jansa wrote:
> > On Sat, Jun 26, 2010 at 1:46 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> > > * git grep shows that all distributions (in OE tree) moved to
> > >  preferred-xorg-versions-X11R7.5.inc already
> > > * would be nice to encourage everybody to use most tested X11R7.5 or
> > >  no preferred-xorg-versions at all (we can keep latest versions working
> > >  and use D_P -1 for stuff which needs more testing first)
> > > * replace preferred-xorg-versions.inc with link always adjusted to
> > >  latest relase (is there any problem with symlink in OE tree?)
> > > * this would also make easier to remove really old versions when it's
> > >  hard to test some changes (like converting libx11 staging)
> 
> Rather than the symlink, how about adding:
> 
> PREFERRED_XORG_VERSION ?= "X11R7.5"
> 
> in some generic place, and encouraging distros to include
> preferred-xorg-versions-${PREFERRED_XORG_VERSION}.inc if they so desire?

Yes this looks like better solution. Thanks

> I don't have much of a view on deleting the old include files.  On the
> one hand it seems a bit of a shame to remove them, since they aren't
> doing any harm (and, being .incs, aren't even adding to parse time).
> But I don't use them myself and I find it hard to get very excited about
> the issue.

I don't use them too, so the most important points are

* encourage everybody to use most tested X11R7.5
* easier remove recipes of really old versions or "not latest minor"

Regards,
-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


