Received: from 3a.49.1343.static.theplanet.com
	([67.19.73.58] helo=pug.o-hand.com ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <josh@linux.intel.com>) id 1Nzttr-0003it-EA
	for openembedded-devel@lists.openembedded.org;
	Thu, 08 Apr 2010 17:44:15 +0200
Received: from [10.250.128.186] (unknown [158.43.2.102])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by pug.o-hand.com (Postfix) with ESMTP id A805E12EC119
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Apr 2010 11:05:21 -0500 (CDT)
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <hp6qck$di5$2@dough.gmane.org>
References: <1270135981.4993.128.camel@rex> <hp4s4q$40a$1@dough.gmane.org>
	<1270243792.4993.180.camel@rex>  <hp6qck$di5$2@dough.gmane.org>
Date: Thu, 08 Apr 2010 16:40:45 +0100
Message-ID: <1270741245.17534.121.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 (2.28.3-1.fc12) 
X-SA-Exim-Connect-IP: 67.19.73.58
X-SA-Exim-Mail-From: josh@linux.intel.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Request for branch merge
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
X-List-Received-Date: Thu, 08 Apr 2010 15:44:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2010-04-03 at 09:23 +0200, Koen Kooi wrote: 
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> On 02-04-10 23:29, Richard Purdie wrote:
> > On Fri, 2010-04-02 at 15:40 +0200, Koen Kooi wrote:
> >> While testing (rebased on top of this mornings OE, bitbake master) I'm
> >> getting messages like this:
> >>
> >> //OE/angstrom-dev/sysroots/x86_64-linux/usr/lib/python2.6/lib-dynload/strop.so:
> >> RPATH=/OE/angstrom-dev/sysroots/x86_64-linux/usr/lib
> >> //OE/angstrom-dev/sysroots/x86_64-linux/usr/lib/python2.6/lib-dynload/strop.so:
> >> new RPATH: $ORIGIN/../../../../usr/lib
> >> open: Permission denied
> >> elf_open: Invalid argument

This looks like we're calling chrpath -l against a non-readable file, as
Richard suggested. Unfortunately it's not the echoed path which is the
problem, the path for which the open/elf_open warnings are triggered is
not echoed...

I've a patch to test the access to the file and temporarily set read and
write permissions on it if needed.

I'm just running this updated tree over a build of console-image now.

Cheers,
Joshua
-- 
Joshua Lock
        Intel Open Source Technology Centre





