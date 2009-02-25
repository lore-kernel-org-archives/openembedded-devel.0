Received: from [216.145.245.197] (helo=mx01.dls.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mwester@dls.net>) id 1LcLWW-0007I8-Dz
	for openembedded-devel@openembedded.org; Wed, 25 Feb 2009 16:18:12 +0100
Received: from [209.242.7.188] (helo=[192.168.231.111])
	by mx01.dls.net with esmtpa (Exim 4.69)
	(envelope-from <mwester@dls.net>) id 1LcLTP-00081L-Pi
	for openembedded-devel@openembedded.org; Wed, 25 Feb 2009 09:15:00 -0600
Message-ID: <49A5606D.3050507@dls.net>
Date: Wed, 25 Feb 2009 09:14:53 -0600
From: "Mike (mwester)" <mwester@dls.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.8.1.19) Gecko/20081209 Thunderbird/2.0.0.19 Mnenhy/0.7.6.0
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <49A4EAFC.3080806@dls.net> <go2tlk$akt$2@ger.gmane.org>
	<1235550209.2621.28.camel@andromeda>
In-Reply-To: <1235550209.2621.28.camel@andromeda>
Subject: Re: fakeroot fails to build
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
X-List-Received-Date: Wed, 25 Feb 2009 15:18:12 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Michael 'Mickey' Lauer wrote:
> Am Mittwoch, den 25.02.2009, 08:57 +0100 schrieb Koen Kooi:
>> On 25-02-09 07:53, Mike (mwester) wrote:
>>> fakeroot fails to build -- any idea how we can fix this?
>> By reverting the merge of the sane-defaults branch that got merged with 
>> zero review
> 
> Ah right, I probably didn't wait long enough. Ok, I might as well revert
> it and continue working in other branches. Is there a command to revert
> merging a whole branch or do I need to call git-revert for every
> revision?

Don't revert everything just because of one fakeroot problem -- I can
work around that by adding (another) PREFERRED_VERSION to use the older one.

This issue is not related to the sane-defaults branch at all; that was
not my point.  This type of build failure has been happening for the
past week or two on a number of recipes -- my posting the fakeroot
failure to the list was just a random selection out of the list of
similar problems.

I'd much prefer to figure out what the specific libtool issue is and fix
that, rather than revert the sane-defaults changes (and by the way, I
did review that branch and did not see anything which seemed problematic
to me, or I would have said something!)

So it sounds like there's not a libtool problem; rather I need to
upgrade to the new libtool entirely then. :-(   That's unfortunate,
really unfortunate timing -- but timing is not an OE issue. :-(

(BTW, the reason libtool got locked down for me is because it made
pkgconfig fail to build, so I might be back with questions on how to
make that work if that failure still exists.)

((Also, are there any non-angstrom distros still left in OE, besides
SlugOS?  I really feel like I'm swimming upstream all the time with OE
-- things break for me so often that just don't seem to affect anyone
else...))

-Mike


