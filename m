Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1ODj0Y-0001ag-KU
	for openembedded-devel@lists.openembedded.org;
	Sun, 16 May 2010 20:56:15 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o4GIqGCx001323;
	Sun, 16 May 2010 19:52:16 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 01129-03; Sun, 16 May 2010 19:52:12 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o4GIq35L001317
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Sun, 16 May 2010 19:52:06 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: Tom Rini <tom_rini@mentor.com>
In-Reply-To: <1273881865.8005.205.camel@trini-m4400>
References: <AANLkTil89_7H3CIZOSZd9QjKE-Cf6mv5B7xpFCqaM8oM@mail.gmail.com>
	<1273859746.22943.454.camel@trini-m4400>
	<AANLkTimDt7fVT14jNofov1ESwO2M_CvBAe6RsdvzZicE@mail.gmail.com>
	<1273881865.8005.205.camel@trini-m4400>
Date: Sun, 16 May 2010 11:52:01 -0700
Message-ID: <1274035921.24454.68.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-Virus-Scanned: amavisd-new at rpsys.net
X-SA-Exim-Connect-IP: 93.97.173.237
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=AWL,BAYES_00,RDNS_DYNAMIC,
	TVD_RCVD_IP autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Issues with parallel build? (Was: gtk+native missing dep ?)
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
X-List-Received-Date: Sun, 16 May 2010 18:56:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2010-05-14 at 17:04 -0700, Tom Rini wrote:
> On Fri, 2010-05-14 at 23:21 +0200, Andrea Adami wrote: 
> > Short resume:
> > 
> > i repeatdly see (Angstrom) console-image failing *from scratch*
> > because gtk+native do_compile errors out with:
> > 
> >  Cannot load module
> > /oe/build/tmp/work/i686-linux/gtk+-native-2.20.0-r8.0/gtk+-2.20.0/modules/input/im-xim.la:
> > /oe/build/tmp/work/i686-linux/gtk+-native-2.20.0-r8.0/gtk+-2.20.0/mo
> > dules/input/.libs/im-xim.so: undefined symbol: g_realloc_n
> > | /oe/build/tmp/work/i686-linux/gtk+-native-2.20.0-r8.0/gtk+-2.20.0/modules/input/im-xim.la
> > does not export GTK+ IM module API:
> > /oe/build/tmp/work/i686-linux/gtk+-native-2.20.0-r8.0
> > 
> > g_realloc_n is defined in glib-2.0
> > 
> > I've inspected the workdir and I've noticed  "atk-native"  and
> > "pango-native" builds were not finished when gtk+-native broke.
> > Both atk-native and pango-native (and cairo-native, which was built)
> > have glib-2 as explicit dependency, so something seems wrong...
> 
> So, it really sounds like a bitbake bug.  Doing a bitbake -e on gtk
> +-native gives:
> DEPENDS_virtclass-native="autoconf-native automake-native libtool-native
> gnu-config-native coreutils-native libpng-native atk-native pango-native
> cairo-native libxrender-native libxext-native"
> DEPENDS="autoconf-native automake-native libtool-native
> gnu-config-native coreutils-native libpng-native atk-native pango-native
> cairo-native libxrender-native libxext-native"
> 
> So it's supposed to be waiting on all of that stuff, but it's not.  And
> I'm sure RP will need to know what version of bitbake you're using.

There is insufficient evidence here to point at any one thing. I will
say that the threading dependency code has been around for a while and
most bugs like this turn out to be issues in the metadata, not bitbake.

When you say they were "not finished", what do you mean exactly?

Its normal they would still be packaging for example whilst gtk+ builds
since any dependency is on the populate_sysroot task of
pango-native/atk-native.

Cheers,

Richard





