Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1Pa8r8-0000r5-Se
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Jan 2011 16:31:26 +0100
Received: by wyb40 with SMTP id 40so14780973wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 Jan 2011 07:30:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:cc:content-type;
	bh=HwEBqheh2UyPyeaXC69bXPUD8Qhn3pcm8QJxlpuYQg8=;
	b=tH4UyvVxHUj9HavWILPUOx3nHnQolEoXai7/ZJV5Zp0SHqr8bbOV2e/gl0kPiHYxOl
	FDG60KZvHrKOfr1xzwAYR7/9mYq9hZ9hKoJypNgBRqEemlGumXM7IE01h9HprcDbWTAH
	okxrIZmHXibcjyvSFiWdhFJDfusBN73UulJSk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	b=KsGh9DqVu8rgOHd9jeXVaQ+BIJRppJ9nH+trH9y4I+3OqeR2ffGVLZq/Gn24/EtZo+
	e4jfMYOZlEOThgwnV7HnGIgD9XzoUgJiQpV0V5pDuGyEgTQ8kokAxohbbZ0E864wmqta
	GqNSrmV+reSlXb9xvv4o7lzWY6+2zLnmMFtyg=
Received: by 10.216.220.219 with SMTP id o69mr22510921wep.57.1294155055108;
	Tue, 04 Jan 2011 07:30:55 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.67.67 with HTTP; Tue, 4 Jan 2011 07:30:35 -0800 (PST)
In-Reply-To: <1293905677.17519.16909.camel@rex>
References: <1293905677.17519.16909.camel@rex>
From: Chris Larson <clarson@kergoth.com>
Date: Tue, 4 Jan 2011 08:30:35 -0700
X-Google-Sender-Auth: 1eFyJMeyn1QPCWzqqh10o4PApDw
Message-ID: <AANLkTi=H0T3CxEhNK4vRmoGf5x2irbq8BxV=4pjNMBzV@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: bitbake-dev <bitbake-dev@lists.berlios.de>
Subject: Re: Bitbake task logging
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
X-List-Received-Date: Tue, 04 Jan 2011 15:31:27 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Jan 1, 2011 at 11:14 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> I've been looking at the changes in bitbake master and those in Poky.
> Both are trying to improve the logging situation but I think we need to
> discuss/agree what we're trying to achieve.
>
> I'm trying to think about this from the user point of view. What does a
> user need and expect from bitbake to be as easy to use as possible and
> figure out whats going on. New users often ask "what is it doing? what
> functions does it run?" and its hard to work out for someone new to it.
>
> Some of the list below works today, some is close, some doesn't but I'm
> looking to work out what the experience should be, then we can figure
> out how to get there technically.
>
> The things I think we need are:
>
> a) A logfile per task.

Agreed, and I'm pretty sure I merged this commit from poky already, to
make it task bound rather than function bound.

> b) All output from the task should end up in the logfile, copied or
> otherwise, be it bitbake LogRecords, output to stdout, stderr or
> anything else.

This is reasonable, though it could encourage python code to use
non-bitbake mechanisms like print rather than the correct bitbake APIs
for messaging.  The only piece of this which is not happening today is
stdout/stderr of python functions.  If we do what you describe here,
we can use the file descriptor redirection context manager in
https://github.com/kergoth/bitbake/commit/3acd45c to do it in a clean
way, rather than the old code which was crammed into exec_func.

> c) The logfile should be able to include different output from that
> shown in the UI console. For example, I think "note" output in the
> logfiles might be useful all the time, I'm wondering if it ever is
> useful on the UI console. Turning off "note" for the console but keeping
> it and maybe using it more in tasks could be useful. For example,
> exec_func() could note which functions are being executed and I can
> imagine a user finding that very useful in the log file for debugging
> (which is when a user would look there). Debug output is probably too
> verbose even for the log files in general but I'm open to persuasion one
> way or another on that.

I think this point is up to the UIs.  They have the log records, and
can decide what to do with them.  I'd suggest that we add more context
to the log records (which we really need to do anyway, to ensure that
UIs like goggle can *always* associate messages with a specific task),
and let the UI decide which messages from where to display.  I agree
wholeheartedly on debug output being too verbose.  We need to ensure
that all debug messages are helpful to the user, and developers
helping them -- I suspect that some of the ones we have today are
remnants of us debugging bitbake internal behavior as opposed to that
which is helpful in assisting the user, but that's just a guess.

> d) Handling of the default stdout is a tricky one. I think it makes most
> sense to redirect this to the logfile always, for both python and shell
> tasks. For bitbake itself, nothing in bitbake should be putting output
> there though IMO. This makes sense since we can control stdout from
> within bitbake itself but from within generic tasks we cannot make
> guarantees. Python tasks may make os.system calls, or run binaries and
> it would make sense for stdout to just work for these rather than need
> special handling or wrapper functions especially for log handling (they
> could be a good idea for other reasons).

You've already stated that you want this in b) -- "output to stdout,
stderr or anything else.".  I'm not sure how covering this twice in
the same email helps, other than elaborating the aforementioned point.

Even if we switch back to the file descriptor redirections to send
everything to the log file for all tasks, we still need to do
something to capture what's going to the log file and get it to the UI
for the debug case, and blindly using tee the way it was before is not
the solution, as that was going to the server stdout, not the UI.  If
we do it the way you describe, the same for all tasks, we'd likely
have to spawn off a separate thread or process to read the log file
and send that to the UI.  This is an uglier solution, in my opinion,
and risks more potential performance impact, though should only be
necessary for the debug case, so its arguable.  I'd question whether
this is worthwhile, given the additional ugliness it adds to the code
in multiple ways, simply to support python functions doing something
they shouldn't be doing anyway -- print/os.system.

> e) I'm not 100% on this yet but I'm wondering if we should scrap
> stdout/stderr output to the UI console in debug mode, just make it clear
> where the output went on the console? If you ever have two tasks running
> the output is unreadable anyway.

First, the stdout/stderr output doesn't go to the "UI console",
they're messages sent to the UI, and the UI decides what to do with
it.  The messages aren't unreadable for the goggle UI, only for
knotty.  If you want to silence that for the one UI where it's
confusing, I'd agree with that.  To see what I mean by this, try doing
a build with goggle with current master with -D -- though note that
stdout/stderr output from python tasks is going to the stdout/stderr
of the server currently.  I'd suggest that whether we capture python
task stdout/stderr to the UI or not, we need to silence the
stdout/stderr of the server the way I do in above linked commit on
github, to ensure its not possible to see this sort of problem with
other UIs.  To return to the original point, the output is not
unreadable for all UIs, so I don't see a good argument for removing a
useful feature across the board.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


