Received: from [87.193.137.78] (helo=mail.extern.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@DResearch.DE>) id 1Md1ba-0007B7-Lx
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 Aug 2009 14:46:31 +0200
Received: from consult.extern.dresearch.de (consult.extern.DResearch.DE
	[87.193.137.68])
	by mail.extern.dresearch.de (Postfix) with ESMTP id CEE2E16E233
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Aug 2009 14:29:33 +0200 (CEST)
Received: from hiob.intern.dresearch.de (unknown [87.193.137.50])
	by consult.extern.dresearch.de (Postfix) with ESMTP id 8E0FE2A4271
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Aug 2009 14:29:33 +0200 (CEST)
Received: from [127.0.0.1] ([10.32.10.2]) by hiob.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.3959); Mon, 17 Aug 2009 14:29:09 +0200
Message-ID: <4A894D0A.2080105@dresearch.de>
Date: Mon, 17 Aug 2009 14:28:58 +0200
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Thunderbird 2.0.0.22 (Windows/20090605)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <69E6C70090A0A14498CC98FAE5E06B6E3CF94F@hiob.intern.dresearch.de>	<4A7960FC.6030608@dresearch.de>
	<4A83C454.3010001@dresearch.de>
	<Pine.LNX.4.64.0908130730390.3621@juice.ott.cti.com>
In-Reply-To: <Pine.LNX.4.64.0908130730390.3621@juice.ott.cti.com>
X-OriginalArrivalTime: 17 Aug 2009 12:29:09.0421 (UTC)
	FILETIME=[51C795D0:01CA1F36]
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
X-List-Received-Date: Mon, 17 Aug 2009 12:46:35 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Michael Smith schrieb:
> Heh, I guess there's a limit on #! line length.
> 
> include/linux/binfmts.h:#define BINPRM_BUF_SIZE 128

<grrrrrr> This looks like a limit from the last millenium. </grrrrrr>

But you're rigth. This seems to be the problem.

> I guess you could try to make your build directory name a bit shorter, or 
> hack up pod2man to use #!/usr/bin/env perl.

I choose to shrink my directory path names, because a short look throught the staging area should, that there are a some other scripts with the same problem.

But that's really really ugly. Especially this undetermined behaviour.

Steffen




