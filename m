Received: from [141.2.4.18] (helo=mail.tm.informatik.uni-frankfurt.de)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <mickey@tm.informatik.uni-frankfurt.de>)
	id 1GPQy7-0008Nh-Tc for openembedded-devel@lists.openembedded.org;
	Mon, 18 Sep 2006 23:47:59 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.tm.informatik.uni-frankfurt.de (Postfix) with ESMTP id C8132956
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Sep 2006 23:43:56 +0200 (CEST)
Received: from mail.tm.informatik.uni-frankfurt.de ([127.0.0.1])
	by localhost (mail [127.0.0.1]) (amavisd-new, port 10024) with ESMTP
	id 16953-09 for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Sep 2006 23:43:36 +0200 (CEST)
Received: from [141.2.14.64] (gandalf.tm.informatik.uni-frankfurt.de
	[141.2.14.64])
	by mail.tm.informatik.uni-frankfurt.de (Postfix) with ESMTP id 61C1B2BF
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Sep 2006 23:43:36 +0200 (CEST)
From: Michael 'Mickey' Lauer <mickey@tm.informatik.uni-frankfurt.de>
To: openembedded-devel@lists.openembedded.org
Organization: VanilleMedia
Date: Mon, 18 Sep 2006 23:43:36 +0200
Message-Id: <1158615816.14182.13.camel@gandalf.tm.informatik.uni-frankfurt.de>
Mime-Version: 1.0
X-Mailer: Evolution 2.7.2.1-3mdv2007.0 
X-Virus-Scanned: by amavisd-new at tm.informatik.uni-frankfurt.de
Subject: kernel vs. binutils: .exit.text problem
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 18 Sep 2006 21:48:00 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

I'm building a 2.6.17.7 kernel for arm using gcc 4.1.1 and binutils
2.17:

| make[1]: Leaving directory kernel-2.6.17.7 |   LD      .tmp_vmlinux1
| `.exit.text' referenced in section `.init.text' of drivers/built-in.o:
defined in discarded section `.exit.text' of drivers/built-in.o
| make: *** [.tmp_vmlinux1] Error 1

The same kernel is compiled fine (and runs, btw.) w/ binutils 2.15.94.1.

I can't downgrade binutils because the older binutils don't compile
other stuff w/ recent gcc's. binutils 2.16 even SIGSEGVs for some
packages.

Older binutils treated this as a warning, not an error. Do you have any
idea how I could revert binutils 2.17 to this behaviour? Or
alternatively, how can I find and fix the offending
driver in the said kernel?



-- 
Regards,

Michael 'Mickey' Lauer | FreeLancer | http://www.Vanille-Media.de




