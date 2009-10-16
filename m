Received: from [87.193.137.78] (helo=mail.extern.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@DResearch.DE>) id 1MygLQ-0000pX-9x
	for openembedded-devel@lists.openembedded.org;
	Fri, 16 Oct 2009 08:31:23 +0200
Received: from consult.extern.dresearch.de (consult.extern.DResearch.DE
	[87.193.137.68])
	by mail.extern.dresearch.de (Postfix) with ESMTP id A405016DFDC
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Oct 2009 08:30:25 +0200 (CEST)
Received: from hiob.intern.dresearch.de (unknown [87.193.137.50])
	by consult.extern.dresearch.de (Postfix) with ESMTP id 63B1D2A4284
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Oct 2009 08:30:25 +0200 (CEST)
Received: from [127.0.0.1] ([10.32.10.2]) by hiob.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.3959); Fri, 16 Oct 2009 08:32:09 +0200
Message-ID: <4AD812E4.6030304@dresearch.de>
Date: Fri, 16 Oct 2009 08:29:56 +0200
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Thunderbird 2.0.0.23 (Windows/20090812)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4AD59AF2.50003@dresearch.de>	<1255516331.9214.327.camel@lenovo.internal.reciva.com>	<4AD5C4B3.1050505@dresearch.de>
	<19c1b8a90910140958v561e4d04pd48cf3260145b916@mail.gmail.com>
In-Reply-To: <19c1b8a90910140958v561e4d04pd48cf3260145b916@mail.gmail.com>
X-OriginalArrivalTime: 16 Oct 2009 06:32:09.0546 (UTC)
	FILETIME=[63530AA0:01CA4E2A]
X-SA-Exim-Connect-IP: 87.193.137.78
X-SA-Exim-Mail-From: sledz@DResearch.DE
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: glibc_2.9 compile failed for armv5te
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
X-List-Received-Date: Fri, 16 Oct 2009 06:31:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Khem Raj wrote:
> On Wed, Oct 14, 2009 at 5:31 AM, Steffen Sledz <sledz@dresearch.de> wrote:
>> Phil Blundell schrieb:
>>> On Wed, 2009-10-14 at 11:33 +0200, Steffen Sledz wrote:
>>>> Since a few days a clean build of glibc_2.9 failed for hipox machine
>>>> (armv5te) with this error (details see attached logfile):
>>>>
>>>> | ../ports/sysdeps/arm/eabi/setjmp.S: Assembler messages:
>>>> | ../ports/sysdeps/arm/eabi/setjmp.S:45: Error: internal_relocation
>>>> (type: OFFSET_IMM) not fixed up
> 
> usually such error means that a undefined define is being used in assembly
> like in this case LDR a3, [a3, #RTLD_GLOBAL_RO_DL_HWCAP_OFFSET]
> 
> you should trace why RTLD_GLOBAL_RO_DL_HWCAP_OFFSET is not being defined
> correctly

Sorry, but i'm not really able to trace this. My knowledge in
assembler and tricky glibc build tooling (and the time i'm able to
invest) is limited.

The mentioned symbol seems to be defined in a file named
rtld-global-offsets.sym. It contains these lines:

 #define SHARED 1

 #include <ldsodefs.h>

 #define rtld_global_ro_offsetof(mem) offsetof (struct rtld_global_ro,
mem)

 RTLD_GLOBAL_RO_DL_HWCAP_OFFSET  rtld_global_ro_offsetof (_dl_hwcap)

But it's not clear to me, how this is involved in the build process. :(

Steffen




