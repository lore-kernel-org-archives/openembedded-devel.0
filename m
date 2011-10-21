Received: from vms173017pub.verizon.net ([206.46.173.17])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1RHKUE-0005X8-HD
	for openembedded-devel@lists.openembedded.org;
	Fri, 21 Oct 2011 21:10:35 +0200
Received: from gandalf.denix.org ([unknown] [71.191.138.237])
	by vms173017.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LTF00JWOGUZU1RY@vms173017.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Fri,
	21 Oct 2011 13:04:11 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id E6F4414AF5D; Fri,
	21 Oct 2011 14:04:10 -0400 (EDT)
Date: Fri, 21 Oct 2011 14:04:10 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20111021180410.GE9156@denix.org>
References: <ED3E0BCACD909541BA94A34C4A164D4C4013CD9B@post.tritech.se>
	<1319192173.3766.16.camel@mattotaupa> <4EA18A1F.9040409@telia.com>
MIME-version: 1.0
In-reply-to: <4EA18A1F.9040409@telia.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: [PATCH] 2011.03-maintenance: Bad checksums in	binutils-cross-sdk_2.18.bb
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
X-List-Received-Date: Fri, 21 Oct 2011 19:10:35 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Fri, Oct 21, 2011 at 05:05:03PM +0200, Ulf Samuelsson wrote:
> 2011-10-21 12:16, Paul Menzel skrev:
>> Dear Mats,
>>
>>
>> Am Freitag, den 21.10.2011, 06:42 +0000 schrieb Mats K?rrman:
>>
>>> My first patch, please be gentle if i did something wrong ;)
>> our commit policy describes how patches should be formatted [1][2]. Most
>> importantly you forgot your Signed-off-by line.
>>
>>> The following patch is from a local branch tracking
>>> 2011.03-maintenance, should it be done different?
> I did a similar fix for binutils-2.20.1, and that is apparently not the way
> so this was rejected. (See other discussions on binutils this week).

Ulf,

You did not read the issue description carefully. There is a genuine issue 
with "overwriting" checksums incorrectly in binutils-cross-sdk_2.18.bb


> I sent a new version of binutils-2.20.1 patch today,
> which is taken from openembedded-core, and that
> combines the new checksums, with downloading a new tarball.

That is a correct way of solving the changed checksum issue. Thanks for 
submitting your patches.


> If it follows the same scheme, then:
> binutils-2.18.tar.bz2 is only a link to binutils-2.18a.tar.bz2
> Your SRC_URI should be pointing at binutils-${PV}a.tar.bz2

That is a problem for binutils_2.18.bb and he is fixing a slightly different 
problem in binutils-cross-sdk_2.18.bb

-- 
Denys


>> If I read [3] correctly it first has to go into for example the master
>> branch. I pushed a similar hopefully correct change there [4]. Please
>> send a pull request as described in [3] to get that included in
>> 2011.03-maintenance.
>>
>>> The binutils_2.18 tarball from GNU has changed checksums, ref. to 
>>> this<http://git.openembedded.org/openembedded/commit/recipes/binutils/binutils_2.18.bb?h=2011.03-maintenance&id=bc8ddbf7944f82383936d88379619aa46c3954a2>
>>> As binutils-cross-sdk_2.18.bb includes binutils_2.18.bb it does not need 
>>> to specify its own checksums.
>>>
>>> diff --git a/recipes/binutils/binutils-cross-sdk_2.18.bb 
>>> b/recipes/binutils/binutils-cross-sdk_2.18.bb
>>> index 837ebbe..2f13b26 100644
>>> --- a/recipes/binutils/binutils-cross-sdk_2.18.bb
>>> +++ b/recipes/binutils/binutils-cross-sdk_2.18.bb
>>> @@ -1,6 +1,3 @@
>>>   require binutils_${PV}.bb
>>>   require binutils-cross-sdk.inc
>>>   PR = "${INC_PR}.1"
>>> -
>>> -SRC_URI[md5sum] = "9d22ee4dafa3a194457caf4706f9cf01"
>>> -SRC_URI[sha256sum] = 
>>> "487a33a452f0edcf1f8bb8fc23dff5c7a82edec3f3f8b65632b6c945e961ee9b"
>>
>> Thanks and I am looking forward to further contributions,
>>
>> Paul
>>
>>
>> [1] http://www.openembedded.org/wiki/Commit_Policy
>> [2] http://www.openembedded.org/wiki/Category:Policy
>> [3] http://www.openembedded.org/wiki/2011.03-maintenance
>> [4] 
>> http://git.openembedded.org/openembedded/commit/?id=f2d53aa074d76509384e7bb8a9c39e2e27210f4a
>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>
> -- 
> Best Regards
> Ulf Samuelsson
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


