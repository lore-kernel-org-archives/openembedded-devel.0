Received: from zmta01.irigo.dk ([193.200.44.52])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <eha@doredevelopment.dk>) id 1PS4Pn-0006XZ-SO
	for openembedded-devel@lists.openembedded.org;
	Mon, 13 Dec 2010 10:09:52 +0100
Received: from localhost (localhost.localdomain [127.0.0.1])
	by zmta01.irigo.dk (Postfix) with ESMTP id 96CEE142C678F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Dec 2010 10:08:16 +0100 (CET)
X-Virus-Scanned: amavisd-new at zmta01.irigo.dk
Received: from zmta01.irigo.dk ([127.0.0.1])
	by localhost (zmta01.irigo.dk [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 02d612ChSBzv
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Dec 2010 10:08:12 +0100 (CET)
Received: from [192.168.18.32] (unknown [77.233.226.4])
	by zmta01.irigo.dk (Postfix) with ESMTP id 202D8142C678E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Dec 2010 10:08:12 +0100 (CET)
From: Esben Haabendal <eha@doredevelopment.dk>
To: openembedded-devel@lists.openembedded.org
Organization: =?ISO-8859-1?Q?Dor=E9Development?= ApS
Date: Mon, 13 Dec 2010 10:08:11 +0100
Message-ID: <1292231291.3072.39.camel@eha>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
X-SA-Exim-Connect-IP: 193.200.44.52
X-SA-Exim-Mail-From: eha@doredevelopment.dk
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Really package based staging
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
X-List-Received-Date: Mon, 13 Dec 2010 09:09:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

As part of some work we have been doing here at Dor=C3=A9Development sinc=
e
spring 2010, I would like to share with the OpenEmbedded community my
idea on how build dependencies could/should be handled.

I hope that some will take the time to consider the underlying
concepts and think of where it might be lead to.

The basic idea is:

For each recipe being build (ie. each ${WORKDIR}), a complete stage
directory is being setup completely from scratch, built entirely from
"normal" packages.  A typical stage directory will thus contain a mix
of native packages, cross packages and machine/target packages (the
sysroot part of this staging), unpacked to a defined directory layout.

For recipe developers, this means that ${DEPENDS} must be specified in
the form of the packages needed, and not the recipes needed.  You
cannot depend on a recipe, only the packages it provides.  This is
obviously fundamentally different to how ${DEPENDS} is specified in
existing OpenEmbedded recipes.

This way we don't have to have a lot of special handling of staging
and build dependencies.  It is mostly "business as usual" as we know
it when building fx. a target filesystem. KISS.

With this per-recipe staging, there are no more race conditions
related to shared staging/sysroot.

There is no need to care about packaging for both build and run-time
usage, reducing both the amount of code needed to handle this, and the
diskspace consumed in tmp/.

The concept is fully working, with code available at
http://www.gitorious.org/oe-lite

A lot of existing OpenEmbedded features are not supported by OE-lite,
as the focus has been exclusively on building "deeply-embedded" Linux
system images for industrial use.  But the concept above is not the
root to any of these omissions.

Also, if you dig into the OE-lite code, you will find other
differentiators in OE-lite, but they are not directly related to the
subject of this mail.

I am fully aware that it will require significant effort to extend
this concept to OpenEmbedded as a whole, but I strongly believe that
it would be worth the effort in the long run.  Also, I don't see a way
to do this in "microsteps", as it will require a specific point in
time where the metadata should be changed over to this new way of
defining build dependencies. Alternatively, something like OE-lite
that is significantly smaller in scope than OpenEmbedded will at least
be here.

So what do you think?

Best regards,
Esben Haabendal



