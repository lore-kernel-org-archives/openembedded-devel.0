Received: from [72.14.220.152] (helo=fg-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <pmiscml@gmail.com>) id 1J4RX6-0001Am-0l
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Dec 2007 02:46:08 +0100
Received: by fg-out-1718.google.com with SMTP id 22so301732fge.20
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Dec 2007 17:41:16 -0800 (PST)
Received: by 10.86.99.9 with SMTP id w9mr7071337fgb.44.1197942076444;
	Mon, 17 Dec 2007 17:41:16 -0800 (PST)
Received: from ?192.168.20.166? ( [194.79.8.34])
	by mx.google.com with ESMTPS id a37sm18465029fkc.2007.12.17.17.41.15
	(version=SSLv3 cipher=OTHER); Mon, 17 Dec 2007 17:41:15 -0800 (PST)
Date: Tue, 18 Dec 2007 03:46:37 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Mailer: The Bat! (v3.64.01 Christmas Edition) Professional
X-Priority: 3 (Normal)
Message-ID: <959759661.20071218034637@gmail.com>
To: Rod Whitby <rod@whitby.id.au>
In-Reply-To: <47671D87.8090709@whitby.id.au>
References: <47671326.3090300@whitby.id.au>
	<1672988162.20071218025052@gmail.com>
	<47671D87.8090709@whitby.id.au>
MIME-Version: 1.0
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
X-List-Received-Date: Tue, 18 Dec 2007 01:46:08 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Rod,

Tuesday, December 18, 2007, 3:08:23 AM, you wrote:

> Paul Sokolovsky wrote:
>> Tuesday, December 18, 2007, 2:24:06 AM, you wrote:
>>> kernel26 is not a kitchen sink where you can just add vfat-related nls
>>> modules that are not strictly required for booting a 2.6 kernel.
>> 
>>   As you perfectly know, defining what is strictly required is yet
>> long task to do for OE and specific machine in it. Whereas Angstrom
>> RCs are something to do right now.

> Are you seriously putting forward the position that vfat nls modules
> should be part of the basic kernel26 task, even when you yourself put a
> comment in the file saying that it should be in a separate feature?

  No, I'm hinting that release management is a subtle task, requiring
compromises and serialization.

> Angstrom RCs are not a license to violate basic task separation principles.

>>> Your addition has just *bloated* the rootfs for *every* 2.6 machine,
>> 
>>   No, it did not. It just added 10k of uncompressed modules.

> 10k that is not required, and is forcibly imposed, is a bloat.
> task-base has a fine granularity for a reason (in fact, that is the very
> reason it was created).  You are violating that fine granularity, and
> imposing your choice on others without allowing them to 'opt-in' via a
> feature.

  Nonsense. The change I made has nothing to do with forcing or
disallowing. It is a quick fix, similar to other fixes applied to
task-base/its overall state, to fix current issue at hand, and yet
be a small incremental step in the right direction (moving
machine-independent modules out of machine configs into task-base).
And it was done is such a way to not cause any noticeable regressions.
For example, there's no size-optimized image which stopped fitting
into size constraint set for it.

[]

> The length of your todo list is immaterial to committing correct changes
> to task-base.

  Just face it - my change was on par with current state of task-base.

[]

>> I'd be glad to just do another quick fix now as you request and
>> offload tasks 1-3 above to you. How that sounds?

> Well, I've already sent you an example patch (it's not correct, nor
> complete, so don't commit it as-is).  For #1 and #3 it's up to each
> distro or machine maintainer to make the conscious choice to enable this
> new feature.  For #2, that's something that is done incrementally by
> each person who requires another package to be added to task-base-vfat.
>  If these things are done properly, then tasks can be done incrementally
> without impacting other distros and machines.

> If you instead want to put in a quick fix for a particular machine or
> distro, then use a machine and distro override.  Do *not* pollute all
> machines or distros that use task-base by violating the basic principles
> of the task-base package.

  Oh, so you caught me on one supposedly questionable change, and I
point out numerous other highly related issues of the same nature, and
invite you address them as we already started on that. Instead, you
tell that you don't care and think it's normal if some machines will
lose the feature they must have. That doesn't sound too productive.

  I'm trying to do my share of release management here, and thus care
about all machines, and facing a dilemma of need to fix dozen machine
quickly while risking to nudge few a tiny bit sideways, I select to do
that, in grounded manner. So, I'd like to ask you to be patient with
such changes, until the real fix is introduced, if it happens that you
cannot be helpful with that (== the real fix, not some small untested
patch).

> -- Rod


-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



