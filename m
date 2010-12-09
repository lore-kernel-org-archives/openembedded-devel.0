Received: from mail.reciva.com ([62.7.80.110] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1PQkDu-0001KZ-HF
	for openembedded-devel@lists.openembedded.org;
	Thu, 09 Dec 2010 18:24:07 +0100
Received: from [192.168.106.10] (helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1PQkCS-0008Mr-N8
	for openembedded-devel@lists.openembedded.org;
	Thu, 09 Dec 2010 17:22:36 +0000
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <philb@gnu.org>) id 1PQkCS-0008N5-HX
	for openembedded-devel@lists.openembedded.org;
	Thu, 09 Dec 2010 17:22:36 +0000
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4D01084A.1040103@gmail.com>
References: <1291225269-21801-1-git-send-email-harvey.tim@gmail.com>
	<4D01084A.1040103@gmail.com>
Date: Thu, 09 Dec 2010 17:22:36 +0000
Message-ID: <1291915356.20979.495.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
X-Broken-Reverse-DNS: no host name found for IP address 192.168.106.10
X-SA-Exim-Connect-IP: 62.7.80.110
X-SA-Exim-Mail-From: philb@gnu.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=AWL,BAYES_00,SPF_SOFTFAIL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCHv2] avrdude: update SRC_URI and fix deps
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
X-List-Received-Date: Thu, 09 Dec 2010 17:24:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2010-12-09 at 08:48 -0800, Tim Harvey wrote:
> On 12/01/2010 09:41 AM, Tim Harvey wrote:
> > * SRC_URI updated to new location
> > * Makefile.am patched to fix missing dep causing parallel make issue
> >
> > Signed-off-by: Tim Harvey<harvey.tim@gmail.com>
> > ---
> >   recipes/avrdude/avrdude.inc        |    5 ++++-
> >   recipes/avrdude/avrdude/make.patch |   14 ++++++++++++++
> >   2 files changed, 18 insertions(+), 1 deletions(-)
> >   create mode 100644 recipes/avrdude/avrdude/make.patch
> >
> > diff --git a/recipes/avrdude/avrdude.inc b/recipes/avrdude/avrdude.inc
> > index 679c4ba..4679c7a 100644
> > --- a/recipes/avrdude/avrdude.inc
> > +++ b/recipes/avrdude/avrdude.inc
> > @@ -5,7 +5,10 @@ LICENSE = "GPLv2"
> >
> >   DEPENDS = "virtual/libusb0 ncurses"
> >
> > -SRC_URI = "http://savannah.nongnu.org/download/avrdude/avrdude-${PV}.tar.gz"
> > +SRC_URI = " \
> > +   http://savannah.nongnu.org/releases/avrdude/avrdude-${PV}.tar.gz \
> > +   file://make.patch \
> > +   "
> >
> >   inherit autotools
> >
> > diff --git a/recipes/avrdude/avrdude/make.patch b/recipes/avrdude/avrdude/make.patch
> > new file mode 100644
> > index 0000000..30b3b1d
> > --- /dev/null
> > +++ b/recipes/avrdude/avrdude/make.patch
> > @@ -0,0 +1,14 @@
> > +fix missing deps causing build failure on parallel make
> > +Index: avrdude-5.10/Makefile.am
> > +===================================================================
> > +--- avrdude-5.10.orig/Makefile.am	2010-12-01 09:17:41.675507203 -0800
> > ++++ avrdude-5.10/Makefile.am	2010-12-01 09:17:44.474882497 -0800
> > +@@ -155,6 +155,8 @@
> > +
> > + sysconf_DATA = avrdude.conf
> > +
> > ++config.c: config_gram.h
> > ++
> > + install-exec-local: backup-avrdude-conf
> > +
> > + distclean-local:
> 
> can someone ack/nak this?  This should get into master if there are no 
> objections.

Yeah, looks fine to me.

Acked-by: Phil Blundell <philb@gnu.org>

p.




