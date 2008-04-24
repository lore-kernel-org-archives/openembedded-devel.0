Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1Jp9Lw-0006R4-CE
	for openembedded-devel@openembedded.org; Thu, 24 Apr 2008 23:51:40 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m3OLpUwA023269
	for <openembedded-devel@openembedded.org>;
	Thu, 24 Apr 2008 22:51:30 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 23052-05 for <openembedded-devel@openembedded.org>;
	Thu, 24 Apr 2008 22:51:25 +0100 (BST)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m3OLpKoa023262
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Thu, 24 Apr 2008 22:51:20 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <f96d234e0804241325l64a85878q905dc02eb177266d@mail.gmail.com>
References: <f96d234e0804241325l64a85878q905dc02eb177266d@mail.gmail.com>
Date: Thu, 24 Apr 2008 22:51:21 +0100
Message-Id: <1209073881.5108.79.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: bitbake -c rebuild not running all tasks
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
X-List-Received-Date: Thu, 24 Apr 2008 21:51:40 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 2008-04-24 at 16:25 -0400, Cliff Brake wrote:
> I'm trying to sort out the xorg fonts stuff, and am running into an
> issue where "bitbake -c rebuild" does not re-run all tasks when
> rebuilding font-util.  It seems to me that bitbake should be running
> all tasks including configure, compile, etc.
> 
> I'm using bitbake 1.8 HEAD, and a week old or so version of OE.  I'll
> try the OE HEAD as soon as I get a build to finish.

There is a clue here:

> NOTE: package font-util-1_1.0.1-r2: task do_prepackaged_stage: started
> NOTE: Uninstalling any existing package from staging...
> Removing package staging-font-util-geode-angstrom-linux from root...
> NOTE: Following speedup
> 
> Installing staging-font-util-geode-angstrom-linux (1.0.1-r2) to root...
> Configuring staging-font-util-geode-angstrom-linux
> NOTE: package font-util-1_1.0.1-r2: task do_prepackaged_stage: completed

You have packaged staging enabled, it found the staging package and used
it, "accelerating" the build. 

When we run clean, the do_clean_append() in packaged-staging.bbclass
takes care of removing the staging package but it didn't. I can tell you
why too, basically rebuild is totally flawed with bitbake 1.8 HEAD and
some of the recent core changes :(.

Please don't use the rebuild command for now, use -c clean and then
rerun it. I will think about this problem but its a nasty tricky to
solve one. The best idea I have so far is we always have a clean task
that runs before any other, it just only does something in certain cases
governed by stamps.

Cheers,

Richard




