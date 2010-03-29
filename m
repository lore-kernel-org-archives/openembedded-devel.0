Received: from smtp-out30.alice.it ([85.33.2.30])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <GNUtoo@no-log.org>) id 1NwFZY-0004M0-Ko
	for openembedded-devel@lists.openembedded.org;
	Mon, 29 Mar 2010 16:04:09 +0200
Received: from FBCMMO04.fbc.local ([192.168.184.135]) by smtp-out30.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 29 Mar 2010 15:57:56 +0200
Received: from FBCMCL01B04.fbc.local ([192.168.69.85]) by FBCMMO04.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 29 Mar 2010 15:57:43 +0200
Received: from [192.168.1.116] ([79.21.202.115]) by FBCMCL01B04.fbc.local with
	Microsoft SMTPSVC(6.0.3790.3959); Mon, 29 Mar 2010 15:57:43 +0200
From: GNUtoo <GNUtoo@no-log.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <b6ebd0a51003280953gef70279i86b2ba504a4ea6ea@mail.gmail.com>
References: <1269794684-1331-1-git-send-email-GNUtoo@no-log.org>
	<1269794684-1331-2-git-send-email-GNUtoo@no-log.org>
	<b6ebd0a51003280953gef70279i86b2ba504a4ea6ea@mail.gmail.com>
Date: Mon, 29 Mar 2010 15:57:41 +0200
Message-ID: <1269871061.2285.6.camel@gnutoo-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-OriginalArrivalTime: 29 Mar 2010 13:57:43.0478 (UTC)
	FILETIME=[CDBC5560:01CACF47]
X-SA-Exim-Connect-IP: 85.33.2.30
X-SA-Exim-Mail-From: GNUtoo@no-log.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] DO_NOT_COMMIT_YET: fastjar: handle cross-compilation
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
X-List-Received-Date: Mon, 29 Mar 2010 14:04:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

> Using the third argument for this sort of thing is not ideal.. in fact, I've
> experimented with patching the autoconf macros to disable it.  
I know,I sent the patch only for explaining better the issue,
I didn't plan at any moment to use that patch.
I just wanted an howto,in order to use the site files.

> The only time
> you should consider using it is when the test is only for a sanity check,
> and its result does not affect behavior.  When the result does affect
> behavior and clearly isn't a sanity check, setting an assumed default
> knowing nothing about the target environment is not the way to go.
I tested the default running the tests,that is to say:
devshell,copy-paste the test,compile them,run them on target.
>   You
> should use the CONFIG_SITE / site files to feed in the test result as
> appropriate for the platform, 
That's exactly what I wanted to do,but unfortunately as I said in the
first mail:
*I'm not confident with it
*I bet it needs review before touching it
*I wouldn't know in which file I should add the changes(Maybe
common-glibc?)
> coupled with wrapping the AC_TRY_RUN call in
> AC_CACHE_CHECK, to ensure it obeys it.
I didn't know that I needed to do that,
thanks a lot,
I'll try to find out how to do it.

Denis.




