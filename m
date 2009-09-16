Received: from [84.21.108.25] (helo=ns.penguin.cz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1MnxIf-0007cR-B9
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Sep 2009 18:24:12 +0200
Received: from localhost (localhost [127.0.0.1])
	by ns.penguin.cz (Postfix) with ESMTP id DC2E01409725
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Sep 2009 18:17:22 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at ns.penguin.cz
Received: from ns.penguin.cz ([127.0.0.1])
	by localhost (ns.penguin.cz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q7dsDLYTp7Yw
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Sep 2009 18:17:22 +0200 (CEST)
Received: from [10.20.1.86] (nat.scz.novell.com [213.151.88.252])
	by ns.penguin.cz (Postfix) with ESMTP id C0DF31409724
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Sep 2009 18:17:22 +0200 (CEST)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4AB0BB33.7050304@dresearch.de>
References: <4AB0BB33.7050304@dresearch.de>
Date: Wed, 16 Sep 2009 18:23:37 +0200
Message-Id: <1253118217.5902.58.camel@hammer.suse.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.27.91 
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
X-List-Received-Date: Wed, 16 Sep 2009 16:24:12 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Steffen Sledz wrote:
> We're using automake (1.10.2) on our target machine for rapid prototyping.
> 
> Calling "autoreconf --install" results in this error:
> 
>  /usr/bin/env: perl -w: No such file or directory
>  autoreconf: aclocal failed with exit status: 127

I see this problem on Zaurus as well.

> My interpretation is that execve looks e.g. for an executable named "/usr/bin/perl -w" and not for "/usr/bin/perl" with option "-w". A look into /usr/bin/aclocal shows this shebang line:

Yes.

> I'm not sure if this is wrong or /usr/bin/env is buggy.

Well. I was thinking so as well. But if you call /usr/bin/env perl -w
from the command line, then it works as expected. In #! line it does not
work. Neither in busybox env nor in coreutils env. It's probably
expected behavior and the problem is introduced by
recipes/autoconf/autoconf-2.63/path_prog_fixes.patch.

We would probably need ac_cv_path_ magic, exactly as it is done in
recipes/libtool. It seems to work properly for both native and target.

-- 
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



