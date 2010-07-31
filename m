Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1OfL1h-0003da-Mw
	for openembedded-devel@lists.openembedded.org;
	Sun, 01 Aug 2010 00:59:34 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o6VMxCoW024613
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 31 Jul 2010 23:59:12 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 24316-05 for <openembedded-devel@lists.openembedded.org>;
	Sat, 31 Jul 2010 23:59:08 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o6VMx6Xq024607
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 31 Jul 2010 23:59:06 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <AANLkTiketBU=4fc1w37V-34Ge1HHRbxxB8hCdX2w+vRh@mail.gmail.com>
References: <4C523E6D.8040109@mentor.com>
	<AANLkTiketBU=4fc1w37V-34Ge1HHRbxxB8hCdX2w+vRh@mail.gmail.com>
Date: Sat, 31 Jul 2010 23:59:00 +0100
Message-ID: <1280617140.1297.71.camel@rex>
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
Subject: Re: [PATCH][v4] Make multi-machine toolchains to co-exist (revised again)
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
X-List-Received-Date: Sat, 31 Jul 2010 22:59:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2010-07-29 at 23:36 -0700, Khem Raj wrote:
> On Thu, Jul 29, 2010 at 7:52 PM, Tom Rini <tom_rini@mentor.com> wrote:
> > Hey all,
> >
> > As one of the folks who suggested something else, here's my take.
> >
> > We modify the prefix for cross stuff to dump everything into
> > MULTIMACH_TARGET_SYS in the sysroot.
> >
> > Pro: It should work for all the cases
> > Con: We're back to having a 'special' directory of cross stuff
> > Pro: It's separate but still valid for $ORIGIN mangling, which is the
> > other problem we had before.
> >
> > I've got a qemuarm console-image and then beagleboard console-image build
> > going now and that's going to take time.
> >
> > Signed-off-by: Tom Rini <tom_rini@mentor.com>
> 
> hah indecently I have been testing similar patch per our discussions on IRC
> but trying to get program-transform-name to generate unique compiler names
> which can coexist in <native sysroot>/usr/bin meanwhile I work on that this
> portion looks ok to go in.
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

I've been trying to catch up with this issue and where OE is at now I'm
back. Could someone summarise where we're at please as reading through
the email threads which keep changing subject hasn't really educated me
much :/ Did changing the triplet work out or not?

In Poky I've got the putting the toolchain into:

native-sysroot/usr/bin/<package-triplet>/${TARGET_SYS}-foo

and this seems to be working out okay after a slightly bumpy ride...

Cheers,

Richard





