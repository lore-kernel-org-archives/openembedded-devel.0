Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1PBNAN-0003Km-80
	for openembedded-devel@lists.openembedded.org;
	Thu, 28 Oct 2010 09:44:55 +0200
Received: from p5b0371e5.dip.t-dialin.net ([91.3.113.229] helo=excalibur.local)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1PBN9f-0008Re-31 by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Oct 2010 09:44:13 +0200
Received: from stefan by excalibur.local with local (Exim 4.72)
	(envelope-from <stefan@excalibur.local>) id 1PBN9c-0007PK-Gr
	for openembedded-devel@lists.openembedded.org;
	Thu, 28 Oct 2010 09:44:08 +0200
Date: Thu, 28 Oct 2010 09:44:07 +0200
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101028074407.GK3311@excalibur.local>
References: <4CC14738.9070309@nedap.com>
	<20101028062422.GJ3311@excalibur.local>
	<AANLkTim8XTQBvv0vsZ6w4RwFWHDC3cnxa-NAa7BZcZUK@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTim8XTQBvv0vsZ6w4RwFWHDC3cnxa-NAa7BZcZUK@mail.gmail.com>
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 78.47.116.19
X-SA-Exim-Mail-From: stefan@datenfreihafen.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] cacaoh: patches to get do_install do its work
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
X-List-Received-Date: Thu, 28 Oct 2010 07:44:55 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

On Wed, 2010-10-27 at 23:36, Khem Raj wrote:
> On Wed, Oct 27, 2010 at 11:24 PM, Stefan Schmidt
> <stefan@datenfreihafen.org> wrote:
> >
> > On Fri, 2010-10-22 at 10:11, Jaap de Jong wrote:
> >> From 60a5f60af4ad65112452f98d99350fce45332e8e Mon Sep 17 00:00:00 2001
> >> From: Jaap de Jong <jaap.dejong@nedap.com>
> >> Date: Fri, 22 Oct 2010 09:28:25 +0200
> >> Subject: [PATCH] cacaoh: patches to get do_install do its work
> >>
> >> Signed-off-by: Jaap de Jong <jaap.dejong@nedap.com>
> >
> > This patch broke the openjdk-6 testing build for me. Openjdk did not compile due
> > to missing header files.
> >
> > This is with angstrom-2008.1 so no libtool 2.4. I guess that you are using
> > angstrom-2010 and therefor the 2.4 libtool?
> >
> 
> I tested it with both 2.2 ad 2.4 libtools but what Enrico suggested
> might be a better fix.

Hmm, that works against my theory. :)

I need to wait until my build on master is ready and if it fails as well I try
to implement Enricos suggestion.

regards
Stefan Schmidt


