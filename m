Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1QEScl-0006UK-IA
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Apr 2011 22:43:15 +0200
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1QESaN-0000t7-Ov from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Apr 2011 13:40:47 -0700
Received: from SVR-ORW-FEM-04.mgc.mentorg.com ([147.34.97.41]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Mon, 25 Apr 2011 13:40:47 -0700
Received: from [172.30.80.238] (147.34.91.1) by svr-orw-fem-04.mgc.mentorg.com
	(147.34.97.41) with Microsoft SMTP Server id 14.1.270.1;
	Mon, 25 Apr 2011 13:40:47 -0700
Message-ID: <4DB5DC4D.9080202@mentor.com>
Date: Mon, 25 Apr 2011 13:40:45 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.14) Gecko/20110223 Lightning/1.0b2 Thunderbird/3.1.8
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1303756273-22385-1-git-send-email-tom_rini@mentor.com>
	<BANLkTikm-JOf-Y2E=gz8xhrbzst2SOMLOw@mail.gmail.com>
In-Reply-To: <BANLkTikm-JOf-Y2E=gz8xhrbzst2SOMLOw@mail.gmail.com>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 25 Apr 2011 20:40:47.0588 (UTC)
	FILETIME=[0E84AA40:01CC0389]
Subject: Re: [RFC, PATCH] Add minver/maxver to patch.bbclass, update bluez
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
X-List-Received-Date: Mon, 25 Apr 2011 20:43:15 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 04/25/2011 01:14 PM, Frans Meulenbroeks wrote:
> 2011/4/25 Tom Rini <tom_rini@mentor.com>
> 
>> Hey all,
>>
>> In digging at some other bluez problems, I found that at least
>> 4.91 no longer needs the sbc-thumb patch.  But without moving it to the
>> N versions of bluez4 we have or starting a new inc file for later bluez4
>> versions, there wasn't a clean way to exclude the patch.  Until now.
>> Borrowing the minrev/maxrev logic I added minver/maxver patch params
>> and tested them lightly (the patch is applied on 4.89 and not on
>> 4.91).  I'm cc'ing Koen here because patch #3 adds 4.91 and make it
>> default for Angstrom, but all I've done myself is build testing.
>> It should be safe, based on upstream changelog tho.
>>
>> First question should probably be: do we need 9 versions of bluez4? This is
> not too much in line with the version policy the TSC once stipulated and
> seems also different from the road oe-core and meta-oe are taking.

For bluez4 we could probably drop out 4.31, 4.41 (4.43 seems to
introduce some startup changes that might require folks to opt-in) and
then all of the post ones until 4.91, since shr and angstrom would both
depend on that.  I'd be happy to do that as a follow-up.

> Also personally I'm not too keen on minrev/maxrev. It only makes things
> again a little bit more complicated.
> My preference would be to remove the patch from the .inc file and move to
> the individual bb files

Well, maybe the better answer is a re-worked series to drop out a number
of older versions, and then it won't be bad to have the patch in a the
bb files..  Need to think about this.

> My 2 cents.
> 
> Frans
> 
> PS: two more cents: it seems somewhat odd that some distro's have a DP = 1
> for more than one version of a recipe. While technically not wrong this
> looks a little bit odd.
> Also we seem to have two mechanisms to select a version for a distro. One is
> the DP_distro mechanism the other one is the PREFERRED_VERSION_recipe in the
> conf file
> It seems to me one should be sufficient

Well, this is in part something the oe-core/meta-oe/etc policy will help
with since it does have a planned phasing out / removal of the old
version, so we would have less in the way of "add the latest .z release
and .z-1 through .z-5 just stick around).

-- 
Tom Rini
Mentor Graphics Corporation


