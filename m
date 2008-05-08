Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Ju16E-0004js-GD
	for openembedded-devel@openembedded.org; Thu, 08 May 2008 10:03:34 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1Ju15X-0003X4-6d
	for openembedded-devel@openembedded.org; Thu, 08 May 2008 08:02:51 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 08 May 2008 08:02:51 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Thu, 08 May 2008 08:02:51 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 08 May 2008 10:02:41 +0200
Message-ID: <fvuc31$vci$1@ger.gmane.org>
References: <c384c5ea0805071507u747f820fga7e797c26243a367@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Thunderbird 3.0a1pre (Macintosh/2008042803)
In-Reply-To: <c384c5ea0805071507u747f820fga7e797c26243a367@mail.gmail.com>
Sender: news <news@ger.gmane.org>
Subject: Re: [RFC] Auto bi-sect build server idea
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10b4
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
X-List-Received-Date: Thu, 08 May 2008 08:03:36 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Leon Woestenberg wrote:
> Hello all,
>
>
> I typically run a from scratch build once a day, typically a
> combination of {uc,eg,g}libc and targets {ixp4xx, powerpc, avr32}.
>
> Today my avr32/uclibc build stopped with bug #1380 which has been
> reported 2 months ago but never occurred to me.
>
> When I fixed that, I then ran into bug #4065 which has been
> opened/fixed/closed and reopened.
>
> So, I think we have a regression at hand (which might be already fixed
> when I send this email, but that's not the point).
>
> Then I thought about the idea of having a build server automatically
> doing an automatic bi-sect towards the commit that breaks things.
>
> Define a few local.conf's that are known-good.
> Build each of them,

What is different between those confs? I haven't edited my local.conf in 
months and still build different configurations every day.

> if the build completes, tag the revision as "last known good".
> if the build fails, tag the revision as "latest known bad", and

Tags would be a bad idea, we can use certs with monotone, which allow a 
free-from key:value structure, so you can do

mtn cert 8759384591ada9304319403 bug4530 bad
mtn cert 3123424905903affeaf0232 bug4530 good

This way you can do multiple bisects in parallel, and you don't clutter 
the tags list (which is db global and permanent).

> bi-sect, selecting a "candidate" and iterate to the breaking commit.
>
> I'm mainly interested in a helloworld-image, I'm not much interested
> in package recipes, but mostly in the toolchain/libc
> stuff/rootfs/image stuff, for now.
>
> Has this been done earlier? Ideas?

It would be easy to extend seppuku.bbclass to add a 'bug#:bad' cert each 
time it falls over. That would catch buildproblems. For bisecting we 
would probably need a small wrapper script.

Any volunteers for extending seppuku.bbclass and/or writing such a 
wrapper script?

regards,

Koen




