Received: from [68.230.241.39] (helo=fed1rmmtao107.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1LN8aC-0006IT-Nv
	for openembedded-devel@openembedded.org; Wed, 14 Jan 2009 17:27:09 +0100
Received: from fed1rmimpo02.cox.net ([70.169.32.72]) by fed1rmmtao107.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP
	id <20090114162031.NYPI131.fed1rmmtao107.cox.net@fed1rmimpo02.cox.net>
	for <openembedded-devel@openembedded.org>;
	Wed, 14 Jan 2009 11:20:31 -0500
Received: from localhost ([68.230.61.57]) by fed1rmimpo02.cox.net with bizsmtp
	id 3ULW1b00D1E665w04ULWZw; Wed, 14 Jan 2009 11:20:30 -0500
X-Authority-Analysis: v=1.0 c=1 a=KpRSRYWBUXEA:10 a=ohUC8O1cjnQA:10
	a=AaKaiR0PyOW3QHNLP1IA:9 a=iSlUVpfb8TmRO1Im4wAA:7
	a=N2yfW-VexTPlegOVP0vD7UeayW0A:4 a=LY0hPdMaydYA:10
X-CM-Score: 0.00
Date: Wed, 14 Jan 2009 09:21:03 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20090114162102.GA6710@smtp.west.cox.net>
References: <20090113203242.4D378189331@amethyst.openembedded.net>
	<20090114124842.32a3241e@adrastea.totalueberwachung.de>
	<5ED84125-2736-489A-94F0-1E385661D7BA@student.utwente.nl>
	<20090114142431.7db4b26e@adrastea.totalueberwachung.de>
	<gkkq1i$gq5$1@ger.gmane.org>
MIME-Version: 1.0
In-Reply-To: <gkkq1i$gq5$1@ger.gmane.org>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: [oe-commits] Koen Kooi : mtd-utils-native: remove	default-preference from 1.20+git, it shows now errors in my tests
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
X-List-Received-Date: Wed, 14 Jan 2009 16:27:09 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 14, 2009 at 02:41:05PM +0100, Koen Kooi wrote:
> On 14-01-09 14:24, Daniel Willmann wrote:
>> On Wed, 14 Jan 2009 13:08:34 +0100
>> Koen Kooi<k.kooi@student.utwente.nl>  wrote:
>>
>>> Op 14 jan 2009, om 12:48 heeft Daniel Willmann het volgende
>>> geschreven:
>>>
>>>> mtd-utils-native fails here with:
>>>>
>>>> | /home/alphaone/oe-dev/tmp/work/x86_64-linux/mtd-utils-
>>>> native-1.2.0+git-r2/git/
>>>> mkfs.ubifs/mkfs.ubifs.o: In function `write_super':
>>>> | /home/alphaone/oe-dev/tmp/work/x86_64-linux/mtd-utils-
>>>> native-1.2.0+git-r2/git/mkfs.ubifs/mkfs.ubifs.c:1866: undefined
>>>> reference to `uuid_unparse_upper'
>>>> | collect2: ld returned 1 exit status
>>> Which e2fsprogs-libs-native do you have installed? Also, oe-devel is
>>> subscriber only, enough with the CC:!
>>
>> It's building e2fsprogs-libs-native-1.35-r0
>
> That will cause the linking problems, you need the 1.4x one.

That's because in 1.3x (or at least 35 and 38) libuuid is in a different
spot[1]?  Perhaps we should update 1.35 and bump the PR to fix these
problems?

>> Thanks for reverting it in the mean time.
>
> It failed with include problems on another machine, so let's wait till  
> Tom Rini has pushed his fixed version.

I'm poking around now, but I don't see anything obvious.  Thus far just
that e2fsprogs-libs-native should depend on gettext-native.

[1]: My .38 recipe does:
oe_libinstall -a -C lib/uuid libuuid ${STAGING_LIBDIR}/

-- 
Tom Rini


