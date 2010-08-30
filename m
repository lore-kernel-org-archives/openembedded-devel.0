Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Oq8SS-0006jr-NN
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Aug 2010 19:47:55 +0200
Received: by iwn2 with SMTP id 2so4936661iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Aug 2010 10:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=xpwyhCp3g+rWnYZsvfydsfSU9cjC/9cOpiy/StTwWdo=;
	b=bbyIf4uc/xcyRDIjXIfi1lvTk8JdyWwXuQxTymXM+0dub1By5OtgytuDhJK1BuuxeT
	46Oc5uHcqDxIU4aPP3tNFZ/wqVI4BEksxkZbwtBPgKug3wb5pF8MMhh2YLg6WG/JWKqe
	Keg8w3tR/Mg8PnKTS/QLhuEFrkLrPlb4xeDUA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=W7Uz/WCfroyXET6up9lvz+4JvSvxbCX1rR3X2OGQLGttZImjWMFPctTdmP17NL0RoJ
	rigDUDRdF4BuusYUqImQifF8G65OyETKXNZxG9OjpzC3keT0k2P5BkPaDNpdU53ZjV7J
	0wm1c1NjsICXsYu9HWZqmmSi3T9FKiIz8r89k=
MIME-Version: 1.0
Received: by 10.231.17.1 with SMTP id q1mr5564377iba.17.1283190434650; Mon, 30
	Aug 2010 10:47:14 -0700 (PDT)
Received: by 10.231.205.138 with HTTP; Mon, 30 Aug 2010 10:47:14 -0700 (PDT)
Date: Mon, 30 Aug 2010 19:47:14 +0200
Message-ID: <AANLkTikcbgZQ8EkyCh3a7mby5VbXZ4Hp8bXRORPpZKsY@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: linux-omap-psp-2.6.32 breaks iscsi-target
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
X-List-Received-Date: Mon, 30 Aug 2010 17:47:56 -0000
Content-Type: text/plain; charset=ISO-8859-1

The current beagleboard angstrom and minimal distro's (and maybe
others) use the linux-omap-psp_2.6.32.bb recipe to build the kernel.

This one says:
# This is the v2.6.32_OMAPPSP_03.00.01.06 branch
SRCREV = "a6bad4464f985fdd3bed72e1b82dcbfc004d7869"

# The main PR is now using MACHINE_KERNEL_PR, for omap3 see
conf/machine/include/omap3.inc
MACHINE_KERNEL_PR_append = "+gitr${SRCREV}"

SRC_URI = "git://arago-project.org/git/people/sriram/ti-psp-omap.git;protocol=git;branch=master
\

Building it creates:
linux-omap-psp-2.6.32-r88+gitra6bad4464f985fdd3bed72e1b82dcbfc004d7869

However this is not a sound 2.6.32 tree. It contains this patch
http://arago-project.org/git/people/?p=sriram/ti-psp-omap.git;a=commit;h=c720c7e8383aff1cb219bddf474ed89d850336e3
which was not in the mainstream kernel in 2.6.32

(compare
http://arago-project.org/git/people/?p=sriram/ti-psp-omap.git;a=blob;f=include/net/inet_sock.h;hb=c720c7e8383aff1cb219bddf474ed89d850336e3
with
http://git.kernel.org/?p=linux/kernel/git/stable/linux-2.6.32.y.git;a=blob;f=include/net/inet_sock.h;h=47004f35cc7eaf6f2b3cac2779ea7b7ccd5d9c1f;hb=HEAD
).

The patch mentioned above was integrated in a 2.6.33 rc version.

iscsi-utils uses the inet_sock struct, and contains code to access the
daddr field of this struct. For versions <= .32 daddr is used. for
higher versions inet_daddr is used.
However the omap-psp kernel from arago does contain this patch  but
reports as a .32 kernel causing a compiler errir when compiling
iscsi_target (as the name the recipe expects is not there).

Not sure how to fix it. Changing the test in iscsi-target is not an
option as then it does not work for official .32 kernels.
Probably the best way to fix this is to use the above patch to revert
the change.

anyone a better solution?

Frans


