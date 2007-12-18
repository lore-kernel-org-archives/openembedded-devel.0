Received: from [66.111.4.28] (helo=out4.smtp.messagingengine.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <rod@whitby.id.au>) id 1J4Ryp-0001gh-1Z
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Dec 2007 03:14:47 +0100
Received: from compute1.internal (compute1.internal [10.202.2.41])
	by out1.messagingengine.com (Postfix) with ESMTP id 285977EFAE;
	Mon, 17 Dec 2007 21:09:55 -0500 (EST)
Received: from heartbeat1.messagingengine.com ([10.202.2.160])
	by compute1.internal (MEProxy); Mon, 17 Dec 2007 21:09:55 -0500
X-Sasl-enc: Lv6lpobxRBfI7AcZxL2M7RJkICPN4ei0LZbnzlJX9h6a 1197943794
Received: from [192.168.76.11] (secure.astc-design.com [203.122.250.137])
	by mail.messagingengine.com (Postfix) with ESMTP id BA25458B8;
	Mon, 17 Dec 2007 21:09:53 -0500 (EST)
Message-ID: <47672BB3.3000100@whitby.id.au>
Date: Tue, 18 Dec 2007 12:38:51 +1030
From: Rod Whitby <rod@whitby.id.au>
User-Agent: Thunderbird 2.0.0.9 (Windows/20071031)
MIME-Version: 1.0
To: Paul Sokolovsky <pmiscml@gmail.com>
References: <47671326.3090300@whitby.id.au>
	<1672988162.20071218025052@gmail.com>
	<47671D87.8090709@whitby.id.au>
	<959759661.20071218034637@gmail.com>
In-Reply-To: <959759661.20071218034637@gmail.com>
X-Enigmail-Version: 0.95.5
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: pfalcon: revert r5dc6982e... vfat nls modules are not for task-base-kernel26
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 18 Dec 2007 02:14:47 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Paul Sokolovsky wrote:
> Tuesday, December 18, 2007, 3:08:23 AM, you wrote:
>> 10k that is not required, and is forcibly imposed, is a bloat.
>> task-base has a fine granularity for a reason (in fact, that is the very
>> reason it was created).  You are violating that fine granularity, and
>> imposing your choice on others without allowing them to 'opt-in' via a
>> feature.
> 
>   Nonsense. The change I made has nothing to do with forcing or
> disallowing. It is a quick fix, similar to other fixes applied to
> task-base/its overall state, to fix current issue at hand, and yet
> be a small incremental step in the right direction (moving
> machine-independent modules out of machine configs into task-base).
> And it was done is such a way to not cause any noticeable regressions.
> For example, there's no size-optimized image which stopped fitting
> into size constraint set for it.

This is a discussion about the principles of task-base, not about a
quick fix.  If your position is indeed that this is a quick fix, and
that you intend to move it into a task-base-vfat at your (or someone
else's) earliest convenience, then I have no problem with that.  It
seemed, however, that you have been strongly arguing about the
principles of task-base, and that is the point to which I take issue.
If you had said "mea culpa, I agree with the principle, I'll fix it next
week", then we could have avoided this exchange completely.

>   Just face it - my change was on par with current state of task-base.

I don't agree with that.  I observe that task-base has been carefully
crafted, and I believe the OE developers have been vigilent in making
sure that the basic tasks (like task-boot and task-base-kernel26) are
not bloated.

>   Oh, so you caught me on one supposedly questionable change, and I
> point out numerous other highly related issues of the same nature, and
> invite you address them as we already started on that. Instead, you
> tell that you don't care and think it's normal if some machines will
> lose the feature they must have. That doesn't sound too productive.

Actually, I do care very much.  I care that those things are done in the
proper manner.  The machines didn't have the feature by omission.  You
added it in the wrong place.  Correcting that by adding it in the right
place will enable those machines to retain that feature, not loose it.
Getting it in the right place is more important than a day's delay on an
Angstrom RC release.

>   I'm trying to do my share of release management here, and thus care
> about all machines, and facing a dilemma of need to fix dozen machine
> quickly while risking to nudge few a tiny bit sideways, I select to do
> that, in grounded manner. So, I'd like to ask you to be patient with
> such changes, until the real fix is introduced, if it happens that you
> cannot be helpful with that (== the real fix, not some small untested
> patch).

If you agree that those nls modules should not be added to
task-base-kernel26, since that violates the principle of fine
granularity of task-base, and that they will be moved to a feature at
someone's (perhaps your's, perhaps mine, perhaps hrw's) earliest
convenience, then we have no quarrel.  I have no issue if the earliest
convenience takes weeks - it's the principle of how task-base evolves in
the future which is my primary concern here.

-- Rod


