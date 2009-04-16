Received: from [206.46.173.5] (helo=vms173005pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dhuggins@cs.cmu.edu>) id 1LuV2C-0005k6-HB
	for openembedded-devel@openembedded.org; Thu, 16 Apr 2009 19:06:00 +0200
Received: from [128.237.251.210] by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KI7008N6DYT6I8J@vms173005.mailsrvcs.net> for
	openembedded-devel@openembedded.org;
	Thu, 16 Apr 2009 12:01:42 -0500 (CDT)
Message-id: <49E76412.50807@cs.cmu.edu>
Date: Thu, 16 Apr 2009 13:00:02 -0400
From: David Huggins-Daines <dhuggins@cs.cmu.edu>
User-Agent: Thunderbird 2.0.0.21 (X11/20090318)
MIME-version: 1.0
To: Tom Rini <trini@kernel.crashing.org>
References: <1239739518-1325-1-git-send-email-dhuggins@cs.cmu.edu>
	<20090416162942.GF17629@smtp.west.cox.net>
In-reply-to: <20090416162942.GF17629@smtp.west.cox.net>
X-SA-Exim-Connect-IP: 206.46.173.5
X-SA-Exim-Mail-From: dhuggins@cs.cmu.edu
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: **
X-Spam-Status: No, score=2.2 required=5.0 tests=BAYES_50, FM_FAKE_HELO_VERIZON,
	RDNS_NONE autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@openembedded.org
Subject: Re: [PATCH] Supply uclibc-thread-db package expected by	task-sdk-base
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
X-List-Received-Date: Thu, 16 Apr 2009 17:06:01 -0000
Content-type: text/plain; charset=ISO-8859-1
Content-transfer-encoding: 7bit

Tom Rini wrote:
> On Tue, Apr 14, 2009 at 04:05:18PM -0400, David Huggins-Daines wrote:
>
>   
>> Currently, building task-sdk-base (and by extension meta-toolchain) fails
>> for uclibc targets.  This is because task-sdk-base depends on the thread
>> debugging library uclibc-thread-db, but this is not built by the uclibc
>> recipe unless PTHREADS_DEBUG_SUPPORT is enabled.  In addition, once it is
>> built, if you are using Debian version numbers, it will be helpfully
>> renamed to "libthread-db1" and the build will still fail.
>>
>>     
As pointed out earlier on this thread (and verified - there was some
confusion on my part since I didn't fully clean before rebuilding), the
library renaming itself doesn't cause any problems.  The only actual
problem is the lack of PTHREADS_DEBUG_SUPPORT.
> That's interesting as when I pushed these changes I did test with a
> uclibc target too.  What DISTRO/MACHINE are you using?
>   
I have a custom distro and machine, but broadly speaking it is
minimal-uclibc and ep93xx...


