Received: from mail.reciva.com ([62.7.80.110] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1P2mLR-0002I1-JS
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Oct 2010 16:48:52 +0200
Received: from [192.168.106.10] (helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1P2m5u-0000Np-Se
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Oct 2010 15:32:46 +0100
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <philb@gnu.org>) id 1P2m5u-0003El-Mf
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Oct 2010 15:32:46 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4CA9D3A0.8080706@dresearch.de>
References: <i8cf7aMAN_POSIXLY_CORRECT=1@dough.gmane.org>
	<1286194192-22256-1-git-send-email-sledz@dresearch.de>
	<i8cjiv$806$1@dough.gmane.org>  <4CA9D3A0.8080706@dresearch.de>
Date: Mon, 04 Oct 2010 15:32:46 +0100
Message-ID: <1286202766.3770.17.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.1.2 
X-Broken-Reverse-DNS: no host name found for IP address 192.168.106.10
X-SA-Exim-Connect-IP: 62.7.80.110
X-SA-Exim-Mail-From: philb@gnu.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=AWL,BAYES_00,SPF_SOFTFAIL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH v4] epiphany-2.30.2: unbreak build by adding ca-certificates dependencies
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
X-List-Received-Date: Mon, 04 Oct 2010 14:48:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2010-10-04 at 15:16 +0200, Steffen Sledz wrote:
> Am 04.10.2010 15:07, schrieb Koen Kooi:
> > To double check: is it gplv2 or gplv2+ (aka "or later"?)
> 
> No really sure. The source tree contains a COPYING file containing "GNU GENERAL PUBLIC LICENSE Version 2, June 1991".
> 
> So it's "GPLv2" or "GPLv2+"?

The COPYING file isn't what you want to be looking at, really.  That
will just be a copy of one particular version of the GPL and doesn't
necessarily mean that the package can't be distributed under other
licenses.

According to the copyright file from Debian's epiphany-browser package,
it's GPLv2+.  Specifically:

    This package is free software; you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation; either version 2 of the License, or
    (at your option) any later version.

except that:

        The contents of the help/ directory are licensed under the GNU
        FDL
        version 1.1 and above. 

p.




