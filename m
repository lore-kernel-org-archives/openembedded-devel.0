Received: from [84.21.108.25] (helo=ns.penguin.cz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1MWUl0-00025c-Fa
	for openembedded-devel@lists.openembedded.org;
	Thu, 30 Jul 2009 14:29:14 +0200
Received: from localhost (localhost [127.0.0.1])
	by ns.penguin.cz (Postfix) with ESMTP id 810FF1409713;
	Thu, 30 Jul 2009 14:17:32 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at ns.penguin.cz
Received: from ns.penguin.cz ([127.0.0.1])
	by localhost (ns.penguin.cz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FNy18VHmxe49; Thu, 30 Jul 2009 14:17:32 +0200 (CEST)
Received: from [10.20.1.86] (nat.scz.novell.com [213.151.88.252])
	by ns.penguin.cz (Postfix) with ESMTP id 3CA2C1416BA2;
	Thu, 30 Jul 2009 14:17:32 +0200 (CEST)
From: Stanislav Brabec <utx@penguin.cz>
To: Marc Olzheim <zlo@zlo.nu>
In-Reply-To: <20090730114922.GA29793@zlo.nu>
References: <BLU137-W15C50162BE2D466B2B3182D44C0@phx.gbl>
	<1244144325.6678.0.camel@port4>
	<BLU137-W9D00E1434DB12273A400AD4480@phx.gbl>
	<1244206438.6643.46.camel@port4>
	<BLU137-W29570FDEF1300363D893E4D4450@phx.gbl>
	<1244635240.28486.7.camel@hammer.suse.cz>
	<20090730105711.GA29595@zlo.nu>
	<1248952464.21030.110.camel@hammer.suse.cz>
	<20090730114922.GA29793@zlo.nu>
Date: Thu, 30 Jul 2009 14:14:13 +0200
Message-Id: <1248956053.21030.133.camel@hammer.suse.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.27.2 
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Commit 2e0fa4918d643ce6ec0299cd31cfe1c346e4bce3 breaks libtool's do_configure [PATCH]
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
X-List-Received-Date: Thu, 30 Jul 2009 12:29:14 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Marc Olzheim wrote:

> (/home/marcolz/src/iphion-new-oe3/embbuild/tmp/work/i686-oe-linux/libtool-cross-2.2.6a-r0/temp/log.do_configure.22690)
> | export: 929: -E: bad variable name

> My local bash version is:
> 
> GNU bash, version 3.2.39(1)-release (i486-pc-linux-gnu)

OK. Next time I will not use unquoted ${a=b c}. Some shells don't like
it.

Committed-By: Stanislav Brabec <utx@penguin.cz>

Just curious, is your /bin/sh link to bash? I am not able to reproduce:

~> sh --version
malloc: using debugging hooks
GNU bash, version 3.2.39(1)-release (x86_64-suse-linux-gnu)
Copyright (C) 2007 Free Software Foundation, Inc.
~> export a=${a=b c}
~> echo $a
b c

-- 
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



