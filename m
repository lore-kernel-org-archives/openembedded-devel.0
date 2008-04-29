Received: from [82.119.242.94] (helo=mail.suse.cz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1JqpPc-0001X7-9o
	for openembedded-devel@lists.openembedded.org;
	Tue, 29 Apr 2008 14:58:24 +0200
Received: from [10.20.1.86] (hammer.suse.cz [10.20.1.86])
	by mail.suse.cz (Postfix) with ESMTP id 9902C6280D5;
	Tue, 29 Apr 2008 14:57:56 +0200 (CEST)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20080429123310.GA30664@deadlock.dhs.org>
References: <20080428192607.GB28476@deadlock.dhs.org>
	<19c1b8a90804281454m3e3ea43fv2d84596976c0487@mail.gmail.com>
	<20080429123310.GA30664@deadlock.dhs.org>
Date: Tue, 29 Apr 2008 15:01:38 +0200
Message-Id: <1209474099.3949.136.camel@hammer.suse.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.0 
Subject: Re: problem building meta-toolchain for arm/uclibc
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10b4
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
X-List-Received-Date: Tue, 29 Apr 2008 12:58:24 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Sergey 'Jin' Bostandzhyan wrote:

> And there it was staring at me: the -lc thing. When I was grepping for 
> libc.so.6 in the whole work directory I found this:

You could check your config.log for site script inclusion.

If you will see, that site scripts .../site/arm-* are included, it is be
the same problem I described five days ago in the mail "brokenness of
native builds by cross-compile site scripts".

It needs a fox of class/siteinfo.bbclass. Probably don't include
anything if compiling native packages.

-- 
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



