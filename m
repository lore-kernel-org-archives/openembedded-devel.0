Received: from smtpfb1-g21.free.fr ([212.27.42.9])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ydirson@free.fr>) id 1OkjJT-0006ZJ-G0
	for openembedded-devel@lists.openembedded.org;
	Sun, 15 Aug 2010 21:56:12 +0200
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
	by smtpfb1-g21.free.fr (Postfix) with ESMTP id EC6F92CB01
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Aug 2010 21:55:50 +0200 (CEST)
Received: from zimbra44-e7.priv.proxad.net (unknown [172.20.243.194])
	by smtp6-g21.free.fr (Postfix) with ESMTP id 3178C82273
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Aug 2010 21:55:45 +0200 (CEST)
Date: Sun, 15 Aug 2010 21:55:44 +0200 (CEST)
From: ydirson@free.fr
To: openembedded-devel@lists.openembedded.org
Message-ID: <404544342.1017011281902144985.JavaMail.root@zimbra44-e7.priv.proxad.net>
In-Reply-To: <246310099.1016461281901672121.JavaMail.root@zimbra44-e7.priv.proxad.net>
MIME-Version: 1.0
X-Originating-IP: [87.100.101.212]
X-Mailer: Zimbra 5.0 (ZimbraWebClient - FF3.0
	(Linux)/5.0.15_GA_2815.UBUNTU8_64)
X-Authenticated-User: ydirson@free.fr
X-SA-Exim-Connect-IP: 212.27.42.9
X-SA-Exim-Mail-From: ydirson@free.fr
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: orphaned files
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
X-List-Received-Date: Sun, 15 Aug 2010 19:56:12 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hi Frans,

>I've made a list of patch files in recipes (prefixed with file://) and
>compared it with the list of patch files as appear on disk.
>Below is the list of 645 files that do not show up in any recipe and
>as such can be considered as orphaned.
>Proposal is to remove these files after double checking that they are
>indeed not used.
>
>Do people agree with this? If so can I have an ack?
>
>And do we want to have a commit for every file (makes it easy to
>revert an error) or a big commit with all removals?
>(removals per dir are also possible but that process is more difficult
>to automate and hence not my preferred solution.

It would be nice to have a checker script (not like lintian for debian
packages), which would check for such probable or sure errors in packaging.
Having it run when a recipe gets updated would help the person currently
know where to look for improvements, and delaying in this case effective removal
till someone who cares about the recipe can look at it, would probably
cause a gradual improvement of the recipes.  Put another way, that would
be: allow people who care with improving quality to just point the oe project to
directions of improvements, and (when meaningful) let the ones who know
the recipes best decide on the best course of action for that recipe.

Similarly (please excuse my Debian background), publishing the results of
such automated tests on the oe website would allow someone to quickly get a grasp
on the state of a package he cares about, possibly bringing more people to
contribute ?  Have a look at packages.qa.debian.org, http://qa.debian.org/developer.php
and the services aggregated from there for more details.

That also reminds me I thought a couple of days ago that something like the "Debian External
Health Status" system would benefit much to oe, to help contributors to focus.  Maybe something
can even be reused there, we would mostly have to add support for something like debian/watch
files in the oe recipes and do probably-minor changes to the scripts that use them.
See http://dehs.alioth.debian.org/stats.html

Best regards,
-- 
Yann


