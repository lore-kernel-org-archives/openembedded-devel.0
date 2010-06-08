Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1OLzzU-00007m-2S
	for openembedded-devel@lists.openembedded.org;
	Tue, 08 Jun 2010 16:41:21 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1OLzvF-0001pc-6A from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 08 Jun 2010 07:36:57 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Tue, 8 Jun 2010 07:36:56 -0700
Received: from [172.30.80.221] ([172.30.80.221]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Tue, 8 Jun 2010 08:36:55 -0600
Message-ID: <4C0E5585.8010907@mentor.com>
Date: Tue, 08 Jun 2010 07:36:53 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4C0D498A.4030709@mentor.com>
	<AANLkTilJrzCr73GBdsGFgxQl4Gn7FAGj3Aytx1IrzYpS@mail.gmail.com>
In-Reply-To: <AANLkTilJrzCr73GBdsGFgxQl4Gn7FAGj3Aytx1IrzYpS@mail.gmail.com>
X-OriginalArrivalTime: 08 Jun 2010 14:36:56.0135 (UTC)
	FILETIME=[0B5B8D70:01CB0718]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH, RFC] Add linux-libc-headers-native, make it default 	dep for native
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
X-List-Received-Date: Tue, 08 Jun 2010 14:41:21 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Frans Meulenbroeks wrote:
> 2010/6/7 Tom Rini <tom_rini@mentor.com>:
>> On some host distributions the provided linux kernel headers are too old
>> to compile utilities we need[1].  Given that we need these utilities to
>> run things on the target the best solution is to provide
>> linux-libc-headers-native.  Rather than get things into an inconsistent
>> state, we make linux-libc-headers-native be a default dependency.
>>
>> [1]: A prime example of this would be mtd-utils-native and UBI
> 
> I'd say this is heading in the totally wrong direction.
> 
> Target code should not depend on host headers.
> And if you need the target headers, you should depend on and use
> linux-libc-headers.
> 
> I guess mtd-utils-native is used to make an mtd image for the target
> and as such I would expect it to use the target headers.
> 
> What would be the difference between linux-libc-headers and
> linux-libc-headers-native in the first place?
> (and if there is a difference, I think a better package name would be
> linux-libc-headers-cross).

As Khem said, you're thinking in the wrong direction here.  Target stuff 
which needs the headers get the headers via linux-libc-headers.  The 
problem is runs on the host tools that generate things for the target.

> Btw if say mtd-utils-native needs kernel headers to access host
> functionality using headers for a different kernel version seems to be
> a no-no either.

mtd-utils is depending on OK to be exported by the kernel information to 
know how to make a UBI image.  And again, for the target this just works.

> PS: which distributions/distribution versions/kernel versions do have
> this problem?
> Ubuntu 8.04 (which has a 2.6.24 kernel) does not seem to exhibit this problem).

RHEL4.

-- 
Tom Rini
Mentor Graphics Corporation


