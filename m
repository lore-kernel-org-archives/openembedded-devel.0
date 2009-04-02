Received: from [216.145.245.200] (helo=mx04.dls.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mwester@dls.net>) id 1LpNaa-0008SB-AA
	for openembedded-devel@openembedded.org; Thu, 02 Apr 2009 16:08:28 +0200
Received: from [209.242.7.134] (helo=[192.168.231.111])
	by mx04.dls.net with esmtpa (Exim 4.69)
	(envelope-from <mwester@dls.net>) id 1LpNYF-0006kU-0n
	for openembedded-devel@openembedded.org; Thu, 02 Apr 2009 09:05:51 -0500
Message-ID: <49D4C641.8080907@dls.net>
Date: Thu, 02 Apr 2009 09:05:53 -0500
From: "Mike (mwester)" <mwester@dls.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.8.1.21) Gecko/20090302 Thunderbird/2.0.0.21 Mnenhy/0.7.6.0
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <49D17F70.8020109@dls.net> <49D42B0B.4020505@dls.net>
	<gr1ujt$ga$1@ger.gmane.org>
In-Reply-To: <gr1ujt$ga$1@ger.gmane.org>
X-SA-Exim-Connect-IP: 216.145.245.200
X-SA-Exim-Mail-From: mwester@dls.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=AWL,BAYES_00,RDNS_NONE,
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
X-List-Received-Date: Thu, 02 Apr 2009 14:08:36 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Koen Kooi wrote:
> On 02-04-09 05:03, Mike (mwester) wrote:
>> Mike (mwester) wrote:
>>> I'd like to propose that we remove the "DEFAULT_PREFERENCE = "-1"" line
>>> from openssl-native_0.9.8j.bb.
>>>
>>> This is causing a problem in select cases (for example, python-native
>>> fails "import md5"), because we build and stage openssl 0.9.8j, but the
>>> corresponding -native that gets built and staged is openssl 0.9.7g.
>>>
>>> The 0.9.8j version is currently selected as the PREFERRED_VERSION in the
>>> preferred-om-2008-versions.inc file, as well as for SlugOS.  I've
>>> successfully built it on both 32 and 64 bit hosts.
>>>
>>> Unless there are objections, I'll commit a fix in a couple of days.
>>
>> Fix committed. (To dev, not to the new stable branch.)
>>
>> WARNING!  The "correct" thing to do would probably be to bump up the PR
>> on all recipes that might include, directly or indirectly, openssh libs
>> -- thus forcing them all to link against the new version...
>>
>> However, that seemed to be an awful lot of packages, and given that at
>> least some of the distros already have over-rides to select matching
>> versions for openssl and openssl-native, this would seem to cause more
>> problems than it would solve.
>>
>> So anticipate that your builds may fail if a new version of openssl is
>> built; the failure mode would be the inability for the app to find the
>> old version of the library in the staging area.
> 
> You mean like this:
> /OE/angstrom-dev/staging/x86_64-linux/usr/bin/edje_cc: error while
> loading shared libraries: libssl.so.0.9.7: cannot open shared object
> file: No such file or directory
> 
> Could you please do things properly and bump PR for the affected recipes?

I explained why I didn't.

I appreciate your comment, none-the-less; to be honest, I fixed this for
SlugOS and was happy with the result for me.  I was instructed to fix
this for everyone at the behest of one of the other core devs, despite
my misgivings over the disruption such a change would have -- disruption
that would have happened one way or another, regardless of whether I
bumped every ^&&^*&#%! PR in OE.

So clearly my initial thought was correct -- only the core members are
permitted to break anything.

Your feedback is filed, and will be prominently displayed (in commit
notices if necessary) to justify my preferred practice of making
SlugOS-private fixes.

Have a nice day.

Mike (mwester)


