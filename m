Received: from ibawizard.net
	([82.208.49.253] helo=mengele.ibawizard.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ynezz@mengele.ibawizard.net>) id 1PEdZN-0007OC-IV
	for openembedded-devel@lists.openembedded.org;
	Sat, 06 Nov 2010 08:52:13 +0100
Received: by mengele.ibawizard.net (Postfix, from userid 1002)
	id 0160F1D36171; Sat,  6 Nov 2010 08:51:18 +0100 (CET)
Date: Sat, 6 Nov 2010 08:51:18 +0100
From: Petr =?iso-8859-2?Q?=A9tetiar?= <ynezz@true.cz>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101106075118.GM15069@ibawizard.net>
References: <1288776534.3980.33.camel@mattotaupa> <4CD1A210.5000007@telus.net>
	<1288999268.4113.51.camel@mattotaupa>
MIME-Version: 1.0
In-Reply-To: <1288999268.4113.51.camel@mattotaupa>
User-Agent: Mutt/1.5.18 (2008-05-17)
X-SA-Exim-Connect-IP: 82.208.49.253
X-SA-Exim-Mail-From: ynezz@mengele.ibawizard.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: vlc_1.1.4.1: Why is `lua5.1-native` not added to	`DEPENDS` automatically? (was: [PATCH] vlc_1.1.4.1: add `lua5.1` to	`DEPENDS`)
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
X-List-Received-Date: Sat, 06 Nov 2010 07:52:13 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Paul Menzel <paulepanter@users.sourceforge.net> [2010-11-06 00:21:08]:

> Indeed in all my tests there is no `luac` staged.
> This should be done by adding `lua5.1-native` to `DEPENDS` as you
> suggested. But I am wondering why `lua5.1` is not providing `luac`. Is
> there a problem with the `lua5.1` recipe [4][5]?

The question is, why there's no luac for you :-) It's working for me (tm), see bellow. 

ynezz@ntbk:/media/data/devel/oe/ts72xx.git/tmp/work$ ls armv4t-angstrom-linux-*/lua5.1-5.1.4-r9/packages-split/lua5.1/usr/bin/*
armv4t-angstrom-linux-gnueabi/lua5.1-5.1.4-r9/packages-split/lua5.1/usr/bin/lua
armv4t-angstrom-linux-gnueabi/lua5.1-5.1.4-r9/packages-split/lua5.1/usr/bin/luac
armv4t-angstrom-linux-uclibceabi/lua5.1-5.1.4-r9/packages-split/lua5.1/usr/bin/lua
armv4t-angstrom-linux-uclibceabi/lua5.1-5.1.4-r9/packages-split/lua5.1/usr/bin/luac

-- ynezz


