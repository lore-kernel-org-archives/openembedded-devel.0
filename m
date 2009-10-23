Received: from [84.21.108.25] (helo=ns.penguin.cz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1N1I08-0003KZ-TP
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Oct 2009 13:08:11 +0200
Received: from localhost (localhost [127.0.0.1])
	by ns.penguin.cz (Postfix) with ESMTP id 11236140972D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Oct 2009 13:03:26 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at ns.penguin.cz
Received: from ns.penguin.cz ([127.0.0.1])
	by localhost (ns.penguin.cz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5Zb0YBOFMi1H
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Oct 2009 13:03:26 +0200 (CEST)
Received: from [10.20.1.86] (nat.scz.novell.com [213.151.88.252])
	by ns.penguin.cz (Postfix) with ESMTP id E4615140971E
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Oct 2009 13:03:24 +0200 (CEST)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <hbru1e$m80$1@ger.gmane.org>
References: <200910230504.57681.holger+oe@freyther.de>
	<1256286976.4529.117.camel@mill.internal.reciva.com>
	<hbrs68$gbd$1@ger.gmane.org> <200910231133.11053.holger+oe@freyther.de>
	<hbru1e$m80$1@ger.gmane.org>
Date: Fri, 23 Oct 2009 13:07:06 +0200
Message-Id: <1256296026.9503.26.camel@hammer.suse.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.0 
X-SA-Exim-Connect-IP: 84.21.108.25
X-SA-Exim-Mail-From: utx@penguin.cz
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Revert "package bbclass: strip static libs as well"
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
X-List-Received-Date: Fri, 23 Oct 2009 11:08:12 -0000
Content-Type: text/plain; charset="ISO-8859-2"
Content-Transfer-Encoding: 7bit

Koen Kooi wrote:
> On 23-10-09 11:33, Holger Hans Peter Freyther wrote:

> > The last bit is that I would like to put /usr/lib/libc_nonshared.a into the
> > libc-dev package
> 
> Glibc has its own custom packaging, which we'll probably need to tweaks 
> as well.

I think that the logic should be:

libfoo.a exists and libfoo.so exists => put .a to -static.

libfoo.a exists and libfoo.so does not exist => put .a to -dev.

This logic will work as most users expect and will need no exception for
glibc.


But I would do even one step forward:

In last 12 years I did not need any of system static library instances.
With exception of bootloader authors, almost nobody else needs static
libraries.

That is why I would like to introduce new global default:
--disable-static (via variable, site config or so).

Only packages that explicitly require or explicitly build the static
library will have them (in -dev or -static sub-package, see above).

Distributions that build all-in-one binary can enable it in the
per-distro config, all other distros will remain without nearly all
static libraries.

-- 
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



