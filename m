Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1PzWQp-0007LP-Ae
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Mar 2011 16:45:11 +0100
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1PzWPC-0005MI-4S from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Mar 2011 08:43:30 -0700
Received: from SVR-ORW-FEM-05.mgc.mentorg.com ([147.34.97.43]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Tue, 15 Mar 2011 08:43:14 -0700
Received: from [172.30.80.14] (147.34.91.1) by svr-orw-fem-05 (147.34.97.43)
	with Microsoft SMTP Server id 14.1.270.1;
	Tue, 15 Mar 2011 08:43:29 -0700
Message-ID: <4D7F8912.7080608@mentor.com>
Date: Tue, 15 Mar 2011 08:43:14 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.14) Gecko/20110223 Lightning/1.0b2 Thunderbird/3.1.8
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <4D7E3B34.5050100@mentor.com>
	<4D7E953E.2000706@balister.org>	<4D7EA0FD.6090506@mentor.com>
	<4D7F6629.8030107@balister.org>
In-Reply-To: <4D7F6629.8030107@balister.org>
X-OriginalArrivalTime: 15 Mar 2011 15:43:14.0459 (UTC)
	FILETIME=[B2499EB0:01CBE327]
Subject: Re: Discussion: Version retention policy in oe-core
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
X-List-Received-Date: Tue, 15 Mar 2011 15:45:11 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 03/15/2011 06:14 AM, Philip Balister wrote:
> On 03/14/2011 07:13 PM, Tom Rini wrote:
>> On 03/14/2011 03:22 PM, Philip Balister wrote:
>>> On 03/14/2011 11:58 AM, Tom Rini wrote:
>>>> Hi all,
>>>>
>>>> The TSC has discussed this item at the request of the community and has
>>>> come up with the following recommendation which we are looking for
>>>> feedback (positive/negative/neutral) before putting this up on the
>>>> wiki.
>>>
>>> Looks reasonable. One thing I did not see is asking people not to add a
>>> new recipe and delete the old one in separate commits. This makes it
>>> easier to figure out problems when they arise.
>>
>> So, part of what is envisioned here is that for, grabbing a recent
>> example, nodejs 0.4.0 to 0.4.2 we just see a git mv, and that's the
>> normal case for that level of things. But for say 0.4.9 to 0.5.0 (or
>> would it be 0.6.0? I don't track the project, but next stable release
>> that's not in 0.4.x) it would be add 0.5.0 one commit, drop 0.4.9 the
>> next, Does this still fit, given your comment?
>
> The immediate case I am thinking off is the policykit-gnome update.
> (Which I think did the add/delete in the same commit). One of the
> changes was a configure option change that led to build failures on my
> F14 box. I'm not sure how this fits in the scheme you describe since the
> versioning seems to lack a major/minor concept. (Well the minor number
> is large)

So, policykit-gnome was just adding a new stable version (as default). 
The previous one is still there (in part because of pinning of 
dependencies to older versions).

Plugging this example into the workflow:
- policykit/policykit-gnome have newer stable versions released.
- Add new version as default, test[1]
- Keep old versions for now due to some distributions pinning glib-2.0 
to an older version that policykit > 0.98 (or so) need.

And, that brings us to [1].  FC14 seems to show off a class of bugs that 
need squashing.  I'd love it if someone can point me at a VMware 
compatible image (with functional tools) already installed.  That said, 
I think I meant to post to the ML and forgot, or no one saw the 
EXTRA_OECONF bug in the recipe that Koen fixed which I think fixes your 
problem.

> In a perfect world, what you are describing is great, however I'm
> concerned the "special cases" may be an issue.

The special cases being the critical infrastructure?  Or the unclear 
version policy?

-- 
Tom Rini
Mentor Graphics Corporation


