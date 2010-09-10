Received: from mail.reciva.com ([109.169.29.93] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1OuBY8-0005ct-QI
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 Sep 2010 23:54:25 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.10])
	by crown.reciva.com with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1OuBXR-0007cz-Uh
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 Sep 2010 22:53:42 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <131E5DFBE7373E4C8D813795A6AA7F080310BFAF59@dlee06.ent.ti.com>
References: <1283453522-8408-1-git-send-email-fransmeulenbroeks@gmail.com>
	<AANLkTinC5biQ7FcBD86SUssEytzhjyiK5hEzdLdaM_6P@mail.gmail.com>
	<1284024609.28520.1446.camel@mill.internal.reciva.com>
	<AANLkTimLWtJhYn009OchBss+LJpNx9Pt+nDZ=GGyu=a7@mail.gmail.com>
	<131E5DFBE7373E4C8D813795A6AA7F080310BFAA13@dlee06.ent.ti.com>
	<AANLkTikLhZ-vsO34S30T5RekoaKJpwyECmjyryY8d6wV@mail.gmail.com>
	<20100910183714.GE28148@denix.org>
	<1284153610.4698.32.camel@lenovo.internal.reciva.com>
	<131E5DFBE7373E4C8D813795A6AA7F080310BFAF59@dlee06.ent.ti.com>
Date: Fri, 10 Sep 2010 23:53:57 +0100
Message-ID: <1284159237.4698.65.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.2 
X-SA-Exim-Connect-IP: 109.169.29.93
X-SA-Exim-Mail-From: philb@gnu.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=AWL,BAYES_00,SPF_SOFTFAIL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] base.bbclass: fix soc-family test
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
X-List-Received-Date: Fri, 10 Sep 2010 21:54:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2010-09-10 at 15:27 -0500, Maupin, Chase wrote:
> First thanks for the response.  There a quite a few recipes that use this or plan to use it.  Kernel recipes, several of the recipes in the "recipes/ti" directory.  I guess as a person who actually uses this I have a bias here.  I hope you can understand though that this is variable found usefulness as an override and that is why it was extended to also work for COMPATIBLE_MACHINE.

I certainly don't doubt that SOC_FAMILY is useful to you and that the
code in base.bbclass serves a purpose.  There are three things, though,
that I'm not yet entirely convinced about:

a) whether SOC_FAMILY is sufficiently useful to other (i.e. non-TI)
folks to merit inclusion in base.bbclass, and is going to remain that
way; and

b) whether the high-level goals of SOC_FAMILY cannot be met in some more
generic fashion; and

c) if the answer to both (a) and (b) is yes, whether this functionality
genuinely needs to be in base.bbclass and can't be implemented somewhere
more specific.

The main reason for my uneasiness about (a) is that, although it might
appear that the concept of a "SoC family" is quite tightly defined
today, at least within the TI universe, experience suggests that the
boundaries of any given family tend to become a bit blurred over time.
Soft cores and IP blocks have a habit of being reused in new designs
which suddenly differ in some important way from the original parts for
which they were created and, unless you have a very clear definition
upfront for what constitutes the "family", you can suddenly end up with
machines which appear to be half in and half out, or which want to be
members of two families simultaneously.

As far as (b) goes, I was mostly wondering whether you could do
something with MACHINE_FEATURES.  I think I would be generally receptive
to a patch which added a variable along the general lines of
REQUIRED_MACHINE_FEATURES = "omap-core ti-rfbi ..." and which would
cause SkipPackage to be raised if all the required things didn't appear
in MACHINE_FEATURES at runtime.  Alternatively, I wonder whether you can
do some more free-form grouping of machines within the
COMPATIBLE_MACHINE syntax which doesn't involve introducing a new
variable to base.bbclass.

Finally, regarding (c), I think the question does still stand as to
whether the recipes which have SOC_FAMILY dependencies couldn't just
inherit some sort of ti-compatibility-check.bbclass which would perform
the appropriate tests.  That would allow you to do whatever you wanted
without needing to trouble base.bbclass, and you could bash it any way
you liked without needing to get code review :-)

The thing about OVERRIDES is another issue again.  Adding a new thing to
the global OVERRIDES is definitely not to be done lightly: it introduces
new namespace hazards (i.e. inadvertently triggering the override
because your MACHINE or DISTRO happens to be named the same), and it
also introduces an extra processing overhead in every parse operation.
Again, I am not keen to see this happen unless it is obvious that the
same thing can't be done better in another way.

p.




