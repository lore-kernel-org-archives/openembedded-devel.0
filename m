Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1MUnZN-0002I1-PY
	for openembedded-devel@openembedded.org; Sat, 25 Jul 2009 22:10:13 +0200
Received: (qmail 10766 invoked by uid 813007); 25 Jul 2009 19:55:43 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 25 Jul 2009 19:55:43 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 25 Jul 2009 21:55:16 +0200
User-Agent: KMail/1.12.0 (Linux/2.6.31-rc3-00104-g3553fe1; KDE/4.2.96; x86_64; ;
	)
References: <alpine.LFD.2.00.0907250800110.9021@localhost>
	<200907251452.41374.holger+oe@freyther.de>
	<alpine.LFD.2.00.0907250858080.9674@localhost>
In-Reply-To: <alpine.LFD.2.00.0907250858080.9674@localhost>
MIME-Version: 1.0
Message-Id: <200907252155.18359.marcin@juszkiewicz.com.pl>
Subject: Re: getting bitbake-1.8.12 for the org.openembedded.dev branch?
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
X-List-Received-Date: Sat, 25 Jul 2009 20:10:14 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Dnia sobota, 25 lipca 2009 o 15:01:20 Robert P. J. Day napisa=C5=82(a):

Greame already replied but I want to write as stable/2009 creator.

> the problem is that the precedent has already been set by having
> bitbake in the stable/2009 branch and, based on the principle of least
> surprise, you shouldn't suddenly yank something out of a branch if
> developers are used to seeing it there.
>
> for consistency, either bitbake should be included in an OE checkout,
> or it shouldn't.  it shouldn't depend on which branch you're working
> with.  that way lies confusion.

Bitbake is moving target. OE.dev can be used with Bitbake 1.8.12 release=20
or Bitbake 1.8 branch or Bitbake trunk (master on git server or 1.9.x in=20
numbering).=20

We do not know what tomorrow will bring - maybe OE.dev will start to=20
require Bitbake 1.8.14 as minimal version and will work fine with HEAD=20
of 1.9 (aka master) branch. This will require developers to update their=20
Bitbake to newer.=20

=46or stable/2009 branch we require 1.8.12 version as it was minimal=20
version required by OE.dev branch at that time. We do not know will it=20
work with 1.8.14 or any newer release - maybe it will, maybe it will=20
generate unbootable images. Thats why Bitbake was added in that branch.

Again: OE.dev works with many versions of Bitbake and developer can=20
choose any of working ones (1.8.12, 1.8-HEAD, master-HEAD) for his=20
builds. For stable/2009 we support only included 1.8.12 version.

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




