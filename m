Received: from [87.193.137.78] (helo=mail.extern.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@DResearch.DE>) id 1MykcZ-0003Be-Bz
	for openembedded-devel@lists.openembedded.org;
	Fri, 16 Oct 2009 13:05:22 +0200
Received: from consult.extern.dresearch.de (consult.extern.DResearch.DE
	[87.193.137.68])
	by mail.extern.dresearch.de (Postfix) with ESMTP id 86F5F16DFDC
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Oct 2009 13:04:24 +0200 (CEST)
Received: from hiob.intern.dresearch.de (unknown [87.193.137.50])
	by consult.extern.dresearch.de (Postfix) with ESMTP id 44C6F2A4285
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Oct 2009 13:04:24 +0200 (CEST)
Received: from [127.0.0.1] ([10.32.10.2]) by hiob.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.3959); Fri, 16 Oct 2009 13:06:08 +0200
Message-ID: <4AD8531B.6070208@dresearch.de>
Date: Fri, 16 Oct 2009 13:03:55 +0200
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Thunderbird 2.0.0.23 (Windows/20090812)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4AD59AF2.50003@dresearch.de>
In-Reply-To: <4AD59AF2.50003@dresearch.de>
X-OriginalArrivalTime: 16 Oct 2009 11:06:08.0828 (UTC)
	FILETIME=[A9E667C0:01CA4E50]
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
X-List-Received-Date: Fri, 16 Oct 2009 11:05:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Steffen Sledz wrote:
> Since a few days a clean build of glibc_2.9 failed for hipox machine
> (armv5te) with this error (details see attached logfile):
> 
> | ../ports/sysdeps/arm/eabi/setjmp.S: Assembler messages:
> | ../ports/sysdeps/arm/eabi/setjmp.S:45: Error: internal_relocation
> (type: OFFSET_IMM) not fixed up
> 
> Sorry, but i've no idea what the problem is and which commit is
> responsible for it. Any ideas?

My tries to identifiy the commit responsible to this problem drive me
crazy. Everytime i thought i'de catched the causer a recheck brought a
different result. :(

So i updated to the HEAD (commit
9a6a9e12a1ef50296621c2eea9fe385464b64f02) and tried again. And really
it seems that the behaviour is not deterministic:

-----------------------------------------------------------
# rm -rf tmp.3
# bitbake glibc

--> everything worked well :)

-----------------------------------------------------------
# rm -rf tmp.3
# bitbake glibc

--> failed with something like "sed: can't read
/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-angstrom-linux-gnueabi/glibc-2.9-r35.2/build-arm-angstrom-linux-gnueabi/tcb-offsets.h.dT:
No such file or directory" :(

# bitbake glibc

--> succeeded ???

-----------------------------------------------------------
# rm -rf tmp.3
# bitbake glibc

--> failed with something like "sed: can't read
/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-angstrom-linux-gnueabi/glibc-2.9-r35.2/build-arm-angstrom-linux-gnueabi/tcb-offsets.hT3:
No such file or directory" :(

# bitbake glibc

--> succeeded ???

-----------------------------------------------------------

Any ideas? Can somebody reproduce this behaviour? A bitbake problem?

Steffen









