Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1PslVk-0003CN-48
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Feb 2011 01:26:20 +0100
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1PslUQ-0005zd-BF from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Feb 2011 16:24:58 -0800
Received: from SVR-ORW-FEM-05.mgc.mentorg.com ([147.34.97.43]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Thu, 24 Feb 2011 16:24:57 -0800
Received: from [172.30.80.151] (147.34.91.1) by svr-orw-fem-05 (147.34.97.43)
	with Microsoft SMTP Server id 14.1.270.1;
	Thu, 24 Feb 2011 16:24:57 -0800
Message-ID: <4D66F6CC.5050904@mentor.com>
Date: Thu, 24 Feb 2011 17:24:44 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1298490534.26736.52.camel@rex>	<AANLkTim-WprzRfvaYnFMjoR4=19hj96qp3NioMjY0Axi@mail.gmail.com>	<4D668554.4050307@mentor.com>
	<1298588138.26090.38.camel@mattotaupa>
	<AANLkTin=8b8KSQF7fPN7R3ahatwU8+SnwSmSSegRy4H5@mail.gmail.com>
In-Reply-To: <AANLkTin=8b8KSQF7fPN7R3ahatwU8+SnwSmSSegRy4H5@mail.gmail.com>
X-OriginalArrivalTime: 25 Feb 2011 00:24:57.0329 (UTC)
	FILETIME=[6E674610:01CBD482]
Subject: Re: OT: pull requests, merges and bisection
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
X-List-Received-Date: Fri, 25 Feb 2011 00:26:20 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 02/24/2011 04:33 PM, Chris Larson wrote:
> On Thu, Feb 24, 2011 at 3:55 PM, Paul Menzel
> <paulepanter@users.sourceforge.net>  wrote:
>> it is great that the minutes of the meetings get published. Thank you.
>>
>>
>> Am Donnerstag, den 24.02.2011, 09:20 -0700 schrieb Tom Rini:
>>
>> […]
>>
>>> Not clear in the summary but from the logs is that we want to, as part
>>> of making this be transparent, publish guidelines for how this will
>>> work, based on what poky is doing now.  The high level plan is to follow
>>> the contrib tree model that poky has which means sending pull requests
>>> (which in turn also post the patches to the ML for review).
>>>
>>> For changes that don't have a tree to pull from, someone with write
>>> access would need to pick them up.
>>
>> XBMC is using also an approach with pull requests. The Linux kernel is
>> doing that also. Is there documentation on how pull requests, merges and
>> bisecting works together?
>>
>> My problem is that pull requests are based on a certain commit in
>> origin/master. After the request is sent most of the time several
>> commits are pushed to origin/master in the mean time, so a merge is
>> necessary “polluting” the commit history.
>
> I don't really see a problem with it, personally.  It's not pollution
> if it's useful information, and recording the point where the branch
> was brought it can indeed be useful information.
>
>> With my current knowledge I find it very difficult to track down bad
>> commits especially if commits break the builds in between. Does `git
>> bisect` take care of that itself? How do the Linux developers deal with
>> that problem, especially merge conflicts?
>
> Well, you can mark commits that are broken for unrelated reasons with
> bisect, but ideally people would use something like git test-sequence
> combined with rebase to ensure that there are no points in their
> commits which will break bisect, and *that* gets merged to master.  I
> think it's pretty important to retain bisectability (not a word, I
> know :) on our branches.

... and this is where policies and guidelines help the situation.  poky 
currently looks to be doing a rebase after each, which could be fine so 
long as test-sequence (and a useful set of targets being built in there) 
are used.

-- 
Tom Rini
Mentor Graphics Corporation


