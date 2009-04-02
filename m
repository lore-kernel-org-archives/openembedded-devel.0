Received: from [216.145.245.200] (helo=mx04.dls.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mwester@dls.net>) id 1LpDFe-0007YR-87
	for openembedded-devel@openembedded.org; Thu, 02 Apr 2009 05:06:02 +0200
Received: from [209.242.7.134] (helo=[192.168.231.111])
	by mx04.dls.net with esmtpa (Exim 4.69)
	(envelope-from <mwester@dls.net>) id 1LpDDL-0000HR-Rx
	for openembedded-devel@openembedded.org; Wed, 01 Apr 2009 22:03:35 -0500
Message-ID: <49D42B0B.4020505@dls.net>
Date: Wed, 01 Apr 2009 22:03:39 -0500
From: "Mike (mwester)" <mwester@dls.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.8.1.21) Gecko/20090302 Thunderbird/2.0.0.21 Mnenhy/0.7.6.0
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <49D17F70.8020109@dls.net>
In-Reply-To: <49D17F70.8020109@dls.net>
X-SA-Exim-Connect-IP: 216.145.245.200
X-SA-Exim-Mail-From: mwester@dls.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=5.0 tests=AWL,BAYES_00,RDNS_NONE,
	SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] make preferred openssl version match for -native recipe
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
X-List-Received-Date: Thu, 02 Apr 2009 03:06:04 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Mike (mwester) wrote:
> I'd like to propose that we remove the "DEFAULT_PREFERENCE = "-1"" line
> from openssl-native_0.9.8j.bb.
> 
> This is causing a problem in select cases (for example, python-native
> fails "import md5"), because we build and stage openssl 0.9.8j, but the
> corresponding -native that gets built and staged is openssl 0.9.7g.
> 
> The 0.9.8j version is currently selected as the PREFERRED_VERSION in the
> preferred-om-2008-versions.inc file, as well as for SlugOS.  I've
> successfully built it on both 32 and 64 bit hosts.
> 
> Unless there are objections, I'll commit a fix in a couple of days.

Fix committed. (To dev, not to the new stable branch.)

WARNING!  The "correct" thing to do would probably be to bump up the PR
on all recipes that might include, directly or indirectly, openssh libs
-- thus forcing them all to link against the new version...

However, that seemed to be an awful lot of packages, and given that at
least some of the distros already have over-rides to select matching
versions for openssl and openssl-native, this would seem to cause more
problems than it would solve.

So anticipate that your builds may fail if a new version of openssl is
built; the failure mode would be the inability for the app to find the
old version of the library in the staging area.

Quite frankly, I found it easier to just blow away tmpdir on the
nslu2-linux autobuilders; they needed a fresh start anyway. ;-)

And now python-native works correctly.

Regards,
Mike (mwester)


