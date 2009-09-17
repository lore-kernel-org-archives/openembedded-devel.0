Received: from [84.21.108.25] (helo=ns.penguin.cz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1MoP11-0006lK-TD
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Sep 2009 23:59:51 +0200
Received: from localhost (localhost [127.0.0.1])
	by ns.penguin.cz (Postfix) with ESMTP id EB3DA1409731
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Sep 2009 23:53:05 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at ns.penguin.cz
Received: from ns.penguin.cz ([127.0.0.1])
	by localhost (ns.penguin.cz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1ciZ9bqxtDPN
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Sep 2009 23:53:05 +0200 (CEST)
Received: from [192.168.1.2] (7-165-207-85.strcechy.adsl-llu.static.bluetone.cz
	[85.207.165.7]) by ns.penguin.cz (Postfix) with ESMTP id BEDC81416BA5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Sep 2009 23:53:05 +0200 (CEST)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1253118217.5902.58.camel@hammer.suse.cz>
References: <4AB0BB33.7050304@dresearch.de>
	<1253118217.5902.58.camel@hammer.suse.cz>
Date: Thu, 17 Sep 2009 23:59:15 +0200
Message-Id: <1253224755.9453.2.camel@utx.utx.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.1.1 
X-SA-Exim-Connect-IP: 84.21.108.25
X-SA-Exim-Mail-From: utx@penguin.cz
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: automake/aclocal or env problem?
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
X-List-Received-Date: Thu, 17 Sep 2009 21:59:51 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Stanislav Brabec wrotr:
>Steffen Sledz wrote:
> > I'm not sure if this is wrong or /usr/bin/env is buggy.
> 
> Well. I was thinking so as well. But if you call /usr/bin/env perl -w
> from the command line, then it works as expected. In #! line it does not
> work. Neither in busybox env nor in coreutils env. It's probably
> expected behavior and the problem is introduced by
> recipes/autoconf/autoconf-2.63/path_prog_fixes.patch.
> 
> We would probably need ac_cv_path_ magic, exactly as it is done in
> recipes/libtool. It seems to work properly for both native and target.

I hope that this is a fix that does not break anything:
http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=33cee0586991e235d0fe3d984f822ef2f310e7c3

The construction
if ${@['true', 'false'][bb.data.inherits_class('native', d)]}
seems to be cleaner than tricks used in libtool. I am just testing the
same approach for libtool recipes.


________________________________________________________________________
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



