Received: from [131.111.8.135] (helo=ppsw-5.csi.cam.ac.uk)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jic23@cam.ac.uk>) id 1Md0q7-0000Df-KD
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 Aug 2009 13:57:28 +0200
X-Cam-AntiVirus: no malware found
X-Cam-SpamDetails: not scanned
X-Cam-ScannerInfo: http://www.cam.ac.uk/cs/email/scanner/
Received: from arcturus.eng.cam.ac.uk ([129.169.154.73]:59982)
	by ppsw-5.csi.cam.ac.uk (smtp.hermes.cam.ac.uk [131.111.8.155]:25)
	with esmtpsa (PLAIN:jic23) (TLSv1:DHE-RSA-AES256-SHA:256)
	id 1Md0Zi-0008Ur-JB (Exim 4.70) for
	openembedded-devel@lists.openembedded.org
	(return-path <jic23@cam.ac.uk>); Mon, 17 Aug 2009 12:40:30 +0100
Message-ID: <4A8941B7.1020508@cam.ac.uk>
Date: Mon, 17 Aug 2009 12:40:39 +0100
From: Jonathan Cameron <jic23@cam.ac.uk>
User-Agent: Thunderbird 2.0.0.22 (X11/20090803)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4A892A41.6070702@cam.ac.uk>
	<200908171219.14115.holger+oe@freyther.de>
In-Reply-To: <200908171219.14115.holger+oe@freyther.de>
X-Enigmail-Version: 0.95.7
Subject: Re: [PATCH] glibc 2.9: Remove unnecessary asm/page.h include, not present in recent headers
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
X-List-Received-Date: Mon, 17 Aug 2009 11:57:29 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Holger Hans Peter Freyther wrote:
> On Monday 17 August 2009 12:00:33 Jonathan Cameron wrote:
>> Only applies to arm.  The bug may also exist for alpha.
>> The include doesn't appear to be necessary anyway.
>>
>> Signed-off-by: Jonathan Cameron <jic23@cam.ac.uk>
>> ---
>> First oe patch. Please tell me if I got any of the patch formatting
>> wrong etc. Lots more to follow ;)
> 
> 
> In the future we will ask us why is this patch necessary. 
I'll put more detail in future.

In this particular case though, the patch title gives you most info.
The header doesn't exist so the error message is the somewhat obvious:
../ports/sysdeps/unix/sysv/linux/arm/ioperm.c:48:22: error: asm/page.h: No such file or directory 

So to ease answering 
> the question the patch itself should include the build error you are seeing, a 
> post to a mailinglist or even better a ticket in the glibc bugzilla.

There are reports of related issues with older glibc (2.7)
http://www.mail-archive.com/debian-glibc@lists.debian.org/msg38393.html
http://sourceware.org/ml/crossgcc/2008-05/msg00014.html

Not sure which version this one refers to.
http://sourceware.org/ml/libc-ports/2008-04/msg00005.html
For some reason the problem is still there despite (I think) the last one claiming
a check in to the glibc ports tree well before the 2.9 release.
(not sure if it was a branch or the mainline tree though).

Sorry for the lack of original info, the bug fix seemed so trivial I didn't bother
chasing down other references to it.

Anyhow, just after I sent this out, khem told me (on irc)
that the patch was already there for 2.4.
 
Alternate patch to follow shortly, please ignore original one.

Also the bug no longer exists at the head of the glibc tree.

Thanks,

Jonathan


