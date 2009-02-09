Received: from [74.125.44.154] (helo=yx-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mturquette@gmail.com>) id 1LWfZK-00015B-Px
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Feb 2009 00:29:39 +0100
Received: by yx-out-1718.google.com with SMTP id 36so122823yxh.42
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Feb 2009 15:28:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:cc:content-type:content-transfer-encoding;
	bh=2CZspt8OIlORt1+hTv2CnfTwqI5nf+FLzNX8hMEdOEA=;
	b=eyinBeXFDwdbsSZHDOQ0TTcoAy6AB1CVaNaPLGOcixIRbo3UTPWcEEoIXVpBctQS+j
	6uIP0T9fex9IMP9FxMpbAo0Dbz7cv1fgyeEynGf261IvmuQnb+mqQrnl/lQC2t9271kw
	GiWYzAK0GhQv+ONUSMNQ1ILmRrewC3CLu1fFs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=rOOxd+v+0Bi6ZbFvvsNNFWh6NamIIaSG1WIJfsq5kCtCDFfSOJDurxHwR/2T2a59w1
	dsI3/3Y9Uyd0KGg3SjYMfGp+pJ3/0ZEbLd7ZXkOtDYpWsw2oC0UQfZF/cRZNcogI9qAd
	/rLiUYOPYkyzsoyUGZd+bO1dVQZ3q+tsib26Y=
MIME-Version: 1.0
Received: by 10.150.178.9 with SMTP id a9mr2994829ybf.52.1234222124577; Mon, 
	09 Feb 2009 15:28:44 -0800 (PST)
Date: Mon, 9 Feb 2009 17:28:44 -0600
Message-ID: <59e7e6f90902091528o73d594c0y132770d49b1c9b61@mail.gmail.com>
From: Mike Turquette <mturquette@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: rob@ti.com
Subject: debian packaging
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
X-List-Received-Date: Mon, 09 Feb 2009 23:29:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi all,

I'm trying to understand more about debian packaging in OE.  I know
that OE can churn out dpkg's as a result, but does OE have a way to
intelligently make use of source code that has a 'debian' directory
complete with rules and all of that?

By 'intelligently' I mean can OE determine what DEPENDS and RDEPENDS
should be, based on the dpkg control info and can it figure out what
needs to go into staging?  I'm hoping for something analogous to
autotools.bbclass which uses stuff in the source (instead of the
recipe) to figure out much of the configuration and decision-making.

Thanks much,
Mike


