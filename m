Received: from [207.164.182.72] (helo=smtp.cbnco.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <msmith@cbnco.com>) id 1MbYoA-0001B0-KZ
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Aug 2009 13:49:33 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id C5B5153A20A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Aug 2009 07:32:55 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 13581-10 for <openembedded-devel@lists.openembedded.org>; 
	Thu, 13 Aug 2009 07:32:55 -0400 (EDT)
Received: from juice.ott.cti.com (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTPSA id A5488539E87
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Aug 2009 07:32:55 -0400 (EDT)
Date: Thu, 13 Aug 2009 07:32:55 -0400 (EDT)
From: Michael Smith <msmith@cbnco.com>
X-X-Sender: michael@juice.ott.cti.com
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4A83C454.3010001@dresearch.de>
Message-ID: <Pine.LNX.4.64.0908130730390.3621@juice.ott.cti.com>
References: <69E6C70090A0A14498CC98FAE5E06B6E3CF94F@hiob.intern.dresearch.de>
	<4A7960FC.6030608@dresearch.de> <4A83C454.3010001@dresearch.de>
MIME-Version: 1.0
X-Virus-Scanned: amavisd-new at cbnco.com
Subject: Re: confusing qemu-native problem
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
X-List-Received-Date: Thu, 13 Aug 2009 11:49:41 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Thu, 13 Aug 2009, Steffen Sledz wrote:

> Steffen Sledz schrieb:
> > head -n1 /home/DRESEARCH/production/METABUILD/2009-08-03-15-24-27--hydraip-build--28595/OpenEmbedded/tmp.3/staging/i686-linux/usr/bin/pod2man

> #!/home/DRESEARCH/production/METABUILD/2009-08-03-15-24-27--hydraip-build--28595/OpenEmbedded/tmp.3/staging/i686-linux/usr/bin/perl

> It looks like someone cut the path to the pod2man script.

Heh, I guess there's a limit on #! line length.

include/linux/binfmts.h:#define BINPRM_BUF_SIZE 128

I guess you could try to make your build directory name a bit shorter, or 
hack up pod2man to use #!/usr/bin/env perl.

Mike


