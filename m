Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1NUL7V-0005Fg-59
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Jan 2010 15:19:52 +0100
Received: (qmail 30499 invoked by uid 1003); 11 Jan 2010 14:17:39 -0000
Received: from localhost (HELO ?192.168.1.167?) (philip@opensdr.com@127.0.0.1)
	by mail.geekisp.com with SMTP; 11 Jan 2010 14:17:38 -0000
Message-ID: <4B4B3301.2090808@balister.org>
Date: Mon, 11 Jan 2010 09:17:37 -0500
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.5) Gecko/20091209 Fedora/3.0-3.fc11 Thunderbird/3.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <alpine.LFD.2.00.1001110722550.22930@localhost>	<4B4B2B0E.8030501@balister.org>
	<alpine.LFD.2.00.1001110856460.28813@localhost>
In-Reply-To: <alpine.LFD.2.00.1001110856460.28813@localhost>
X-SA-Exim-Connect-IP: 216.168.135.169
X-SA-Exim-Mail-From: philip@balister.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: bitbake and e2fsprogs-1.41.9?
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
X-List-Received-Date: Mon, 11 Jan 2010 14:19:52 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/11/2010 09:05 AM, Robert P. J. Day wrote:
> On Mon, 11 Jan 2010, Philip Balister wrote:
>
>> On 01/11/2010 07:27 AM, Robert P. J. Day wrote:
>>>
>>>     apologies as i accidentally deleted the emails i was going to
>>> respond to, the thread is here:
>>>
>>> http://lists.linuxtogo.org/pipermail/openembedded-devel/2010-January/016074.html
>>>
>>>     and here:
>>>
>>> http://lists.linuxtogo.org/pipermail/openembedded-devel/2010-January/016097.html
>>>
>>> graham gower suggests that an upgrade to e2fsprogs might be the
>>> solution.  i might have time later this week to try that upgrade
>>> unless someone else gets to it first and checks it in to the dev
>>> branch.
>>>
>>>     what would be useful, though, is to get some confirmation that there
>>> really *was* a build error in the current version.  otherwise, i'll be
>>> back where i started.
>>
>> It builds on my F11 machine.
>
>    which version of e2fsprogs are you referring to?  the current 1.41.5
> version, or the newer one?  i know i'm sounding tedious, but it's been
> literally *weeks* since i've been able to build e2fsprogs on my F12
> system from the OE dev checkout, and it's the exact same error every
> single time and i am fresh out of ideas.

The current 1.41.5.

Philip

>
> ERROR: function do_compile failed
> ERROR: see log in
> /home/rpjday/oe/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/e2fsprogs-1.41.5-r1/temp/log.do_compile.3121
> NOTE: Task failed:
> /home/rpjday/oe/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/e2fsprogs-1.41.5-r1/temp/log.do_compile.3121
> ERROR: TaskFailed event exception, aborting
> ERROR: Build of
> /home/rpjday/oe/openembedded/recipes/e2fsprogs/e2fsprogs_1.41.5.bb
> do_compile failed
> ERROR: Task 8
> (/home/rpjday/oe/openembedded/recipes/e2fsprogs/e2fsprogs_1.41.5.bb,
> do_compile) failed
> ...
> make[2]: Entering directory
> `/home/rpjday/oe/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/e2fsprogs-1.41.5-r1/e2fsprogs-1.41.5/e2fsck'
>          COMPILE_ET prof_err.et
>          CC gen_crc32table
>          GEN32TABLE crc32table.h
>          CC crc32.c
>          CC dict.c
>          CC unix.c
>          CC e2fsck.c
>          CC super.c
>          CC pass1.c
>          CC pass1b.c
>          CC pass2.c
>          CC pass3.c
>          CC pass4.c
>          CC pass5.c
>          CC journal.c
>          CC badblocks.c
>          CC util.c
>          CC dirinfo.c
>          CC dx_dirinfo.c
>          CC ehandler.c
>          CC problem.c
>          CC message.c
>          CC recovery.c
>          CC region.c
>          CC revoke.c
>          CC ea_refcount.c
>          CC rehash.c
>          CC profile.c
>          CC prof_err.c
> make[2]: *** No rule to make target `-lpthread', needed by `e2fsck'.
> Stop.
>
>    is this the error that upgrading to 1.41.9 is supposed to fix?
> clearly, this is some sort of build error where a build *flag* is
> being misinterpreted as a make *target*.
>
> rday
> --
>
>
> ========================================================================
> Robert P. J. Day                               Waterloo, Ontario, CANADA
>
>              Linux Consulting, Training and Kernel Pedantry.
>
> Web page:                                          http://crashcourse.ca
> Twitter:                                       http://twitter.com/rpjday
> ========================================================================
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


