Received: from [216.145.245.199] (helo=mx03.dls.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mwester@dls.net>) id 1KTba4-0004Ru-Ha
	for openembedded-devel@openembedded.org; Thu, 14 Aug 2008 14:05:28 +0200
Received: from [209.242.7.155] (helo=[192.168.1.111])
	by mx03.dls.net with esmtpa (Exim 4.63)
	(envelope-from <mwester@dls.net>) id 1KTbZQ-0008UI-9a
	for openembedded-devel@openembedded.org; Thu, 14 Aug 2008 07:04:48 -0500
Message-ID: <48A41F24.1070507@dls.net>
Date: Thu, 14 Aug 2008 07:03:48 -0500
From: "Mike (mwester)" <mwester@dls.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.8.1.16) Gecko/20080708 Thunderbird/2.0.0.16 Mnenhy/0.7.5.666
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <g7vqvs$3fi$1@ger.gmane.org>	<1218699665.10360.25.camel@lenovo.internal.reciva.com>
	<g815ta$ca0$1@ger.gmane.org>
In-Reply-To: <g815ta$ca0$1@ger.gmane.org>
Subject: Re: git and dir
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
X-List-Received-Date: Thu, 14 Aug 2008 12:05:28 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Rolf Leggewie wrote:
> Phil Blundell wrote:
>> What's the specific corruption that you're worried about?
> 
> Maybe my worries are unfounded and that would be great.  I was thinking
> that building for a certain distribution but changing the checked out
> repo underneath its feet back and forth could eventually result in
> incompatible stuff getting into TMPDIR and particularly staging.  Think
> switching between dev, stable, openmoko and some of its variant and
> building stuff in between.  I don't think it is too far-fetched to worry
> this might lead to some incompatabilities in what is under TMPDIR.

I see both sides of this discussion.  Rolf brings up a very valid point;
a well-intentioned "newbie" may waste a lot of their time -- and the
time of others offering assistance.  On the other hand, I can see many
cases where switching about on minor branches would be useful, and if
one knows what they are doing, it could be a huge timesaver if TMPDIR
could be reused.

So can we consider a middle ground?  A warning message issued if the
current branch doesn't match the one recorded inside TMPDIR?  This could
be ignored by the experts, but it would be something easy to spot in
(for example) a pastebin offered by a struggling "non-expert" user.

Regarding the specific issue -- the openmoko users have already observed
cases where TMPDIR becomes non-useful because they thought they could
switch among branches/repos without penalty, resulting in incorrect
versions in staging, and other build issues.

Regards,
Mike (mwester)


