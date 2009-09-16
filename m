Received: from [87.193.137.78] (helo=mail.extern.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@DResearch.DE>) id 1MntRJ-0005h5-Ai
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Sep 2009 14:16:52 +0200
Received: from consult.extern.dresearch.de (consult.extern.DResearch.DE
	[87.193.137.68])
	by mail.extern.dresearch.de (Postfix) with ESMTP id 3354316E244;
	Wed, 16 Sep 2009 12:17:55 +0200 (CEST)
Received: from hiob.intern.dresearch.de (unknown [87.193.137.50])
	by consult.extern.dresearch.de (Postfix) with ESMTP id DA9ED2A4285;
	Wed, 16 Sep 2009 12:17:54 +0200 (CEST)
Received: from [127.0.0.1] ([10.32.10.2]) by hiob.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.3959); Wed, 16 Sep 2009 12:18:34 +0200
Message-ID: <4AB0BB33.7050304@dresearch.de>
Date: Wed, 16 Sep 2009 12:17:23 +0200
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Thunderbird 2.0.0.23 (Windows/20090812)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-OriginalArrivalTime: 16 Sep 2009 10:18:34.0843 (UTC)
	FILETIME=[0C665AB0:01CA36B7]
X-SA-Exim-Connect-IP: 87.193.137.78
X-SA-Exim-Mail-From: sledz@DResearch.DE
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: automake/aclocal or env problem?
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
X-List-Received-Date: Wed, 16 Sep 2009 12:16:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

We're using automake (1.10.2) on our target machine for rapid prototyping.

Calling "autoreconf --install" results in this error:

 /usr/bin/env: perl -w: No such file or directory
 autoreconf: aclocal failed with exit status: 127

An strace shows this:

[pid  1258] execve("/usr/local/bin/perl -w", ["perl -w", "/usr/bin/aclocal", "--output=aclocal.m4t"], [/* 15 vars */]) = -1 ENOENT (No such file or directory)
[pid  1258] execve("/usr/bin/perl -w", ["perl -w", "/usr/bin/aclocal", "--output=aclocal.m4t"], [/* 15 vars */]) = -1 ENOENT (No such file or directory)
[pid  1258] execve("/bin/perl -w", ["perl -w", "/usr/bin/aclocal", "--output=aclocal.m4t"], [/* 15 vars */]) = -1 ENOENT (No such file or directory)
[pid  1258] execve("/usr/local/sbin/perl -w", ["perl -w", "/usr/bin/aclocal", "--output=aclocal.m4t"], [/* 15 vars */]) = -1 ENOENT (No such file or directory)
[pid  1258] execve("/usr/sbin/perl -w", ["perl -w", "/usr/bin/aclocal", "--output=aclocal.m4t"], [/* 15 vars */]) = -1 ENOENT (No such file or directory)
[pid  1258] execve("/sbin/perl -w", ["perl -w", "/usr/bin/aclocal", "--output=aclocal.m4t"], [/* 15 vars */]) = -1 ENOENT (No such file or directory)
[pid  1258] execve("/opt/bin/perl -w", ["perl -w", "/usr/bin/aclocal", "--output=aclocal.m4t"], [/* 15 vars */]) = -1 ENOENT (No such file or directory)
[pid  1258] execve("/opt/avr/bin/perl -w", ["perl -w", "/usr/bin/aclocal", "--output=aclocal.m4t"], [/* 15 vars */]) = -1 ENOENT (No such file or directory)
[pid  1258] write(2, "/usr/bin/env: ", 14/usr/bin/env: ) = 14
[pid  1258] write(2, "perl -w", 7perl -w)      = 7
[pid  1258] write(2, ": No such file or directory", 27: No such file or directory) = 27
[pid  1258] write(2, "\n", 1

My interpretation is that execve looks e.g. for an executable named "/usr/bin/perl -w" and not for "/usr/bin/perl" with option "-w". A look into /usr/bin/aclocal shows this shebang line:

 #!/usr/bin/env perl -w                                                                                                           
 # -*- perl -*-                                                                                                                   
 # Generated from aclocal.in; do not edit by hand.

I'm not sure if this is wrong or /usr/bin/env is buggy.

Steffen

PS: A few lines later /usr/bin/aclocal contains pathes into the staging area. This should be fixed too.




