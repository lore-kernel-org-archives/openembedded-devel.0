Received: from [84.21.108.25] (helo=ns.penguin.cz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1JY91f-0008H0-4j
	for openembedded-devel@lists.openembedded.org;
	Sun, 09 Mar 2008 01:04:30 +0100
Received: from localhost (localhost [127.0.0.1])
	by ns.penguin.cz (Postfix) with ESMTP id A4AD01417180;
	Sun,  9 Mar 2008 01:01:57 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at ns.penguin.cz
Received: from ns.penguin.cz ([127.0.0.1])
	by localhost (ns.penguin.cz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hW3z1e2W8h5Z; Sun,  9 Mar 2008 01:01:57 +0100 (CET)
Received: from [192.168.1.2] (7-165-207-85.strcechy.adsl-llu.static.bluetone.cz
	[85.207.165.7])
	by ns.penguin.cz (Postfix) with ESMTP id A007E1416BDE;
	Sun,  9 Mar 2008 01:01:56 +0100 (CET)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1204903807.23228.91.camel@hammer.suse.cz>
References: <E1JXdfA-0002tB-NY@linuxtogo.org>
	<20080307143903.0df8f8b9@cimmeria>
	<1204903807.23228.91.camel@hammer.suse.cz>
Date: Sun, 09 Mar 2008 01:02:42 +0100
Message-Id: <1205020963.15970.26.camel@utx.utx.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.0 
X-SA-Exim-Connect-IP: 84.21.108.25
X-SA-Exim-Mail-From: utx@penguin.cz
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: angstrom-distro-users <angstrom-distro-users@linuxtogo.org>
Subject: Sharp CE-RH1 CE-RH2 remote support for Akita, please test (was:	...disable rc patch for akita...)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 09 Mar 2008 00:04:30 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

As I promised, there is a new version of sharpsl_rc drive, which should
support:
CE-RH2 on spitz (tested and works)
CE-RH2 on akita (status unknown)
CE-RH1 on c7x0 (status unknown)

Images, modules, patches (temporary URL):
http://www.penguin.cz/~utx/zaurus/images_ce-rhx/

Please test and let me know the result.

c7x0 users and users of older akita/spitz kernels has to reflash kernel,
others need only replace sharpsl_rc module by a new one.

To test it, you should see key numbers in syslog (dmesg -c; their
meaning should correspond with /usr/include/linux/input.h).

If you have latest build of X, you should also see them in xev.

Graeme Gregory wrote:
> On Fri, 07 Mar 2008 15:35:08 +0100
> "koen commit" <openembedded-commits@lists.openembedded.org> wrote:
> 
> > linux-rp 2.6.24: disable rc patch for akita - it doesn't apply and
> > only handles spitz

There is actual only a one-line conflict depending on status of
htcuni.patch, trivial to fix. I can move conflicting line few lines away
to not be dependent on htcuni. I would like to move remote patches to
the generic part of RP kernels, as they can't break other platforms.

> > * again, no backport, since this is unsuitable for .dev
> > 
> If one of the akita maintainers want to fix this then the OE RH-2 remote
> is currently sitting on my desk unused.
Stanislav Brabec wrote:
> Oops. SPITZ_SCP2_AKIN_PULLUP is Spitz specific.

I used AKITA_IOEXP_AKIN_PULLUP for Akita and for c7x0 backported button
levels from 2.4 kernel, so CE-RH1 sould be working there as well.

I guess that tosa has no remote support, and collie/poodle may it have.


________________________________________________________________________
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



