Received: from [84.21.108.25] (helo=ns.penguin.cz ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1Mgklf-0008Ek-VR
	for openembedded-devel@lists.openembedded.org;
	Thu, 27 Aug 2009 21:36:20 +0200
Received: from localhost (localhost [127.0.0.1])
	by ns.penguin.cz (Postfix) with ESMTP id 21CED1416BAC
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Aug 2009 21:10:36 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at ns.penguin.cz
Received: from ns.penguin.cz ([127.0.0.1])
	by localhost (ns.penguin.cz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vr9HgtWFwZow
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Aug 2009 21:10:36 +0200 (CEST)
Received: from [192.168.1.2] (7-165-207-85.strcechy.adsl-llu.static.bluetone.cz
	[85.207.165.7]) by ns.penguin.cz (Postfix) with ESMTP id E90C71416BA5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Aug 2009 21:10:35 +0200 (CEST)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1251370014.27780.13.camel@mill.internal.reciva.com>
References: <4A94E1CC.2090404@gmail.com>
	<1251370014.27780.13.camel@mill.internal.reciva.com>
Date: Thu, 27 Aug 2009 21:18:13 +0200
Message-Id: <1251400693.5879.3.camel@utx.utx.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.1.1 
Subject: Re: [PATCH] enca_1.9.bb: remove unused configure test which	is bound to fail.
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
X-List-Received-Date: Thu, 27 Aug 2009 19:36:20 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Phil Blundell wrote:
> On Wed, 2009-08-26 at 16:48 +0930, Graham Gower wrote:
> > Enca's configure will fail on everything not arm or ix86.
> > 
> > Signed-off-by: Graham Gower <graham.gower@gmail.com>
> > ---
> >  recipes/enca/enca_1.9.bb |    7 ++++++-
> >  site/arm-linux           |    3 ---
> >  site/ix86-common         |    3 ---
> >  3 files changed, 6 insertions(+), 7 deletions(-)
> 
> Looks fine to me.  It does seem a bit weird that enca tests this scanf
> thing and then doesn't use the information but, sure enough, I couldn't
> find any reference to the result anywhere in the source code.

It seems to be a relict from old versions.

Here is a new upstream, and the commit that fixes your problem:
http://gitorious.org/enca/enca/commit/163589d468dee45ab5495a8f4f8058d27da91a91


________________________________________________________________________
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



