Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1OYkoH-0004hc-Lr
	for openembedded-devel@lists.openembedded.org;
	Tue, 13 Jul 2010 21:06:32 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1OYkoD-0006tj-Sd from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 13 Jul 2010 12:06:25 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Tue, 13 Jul 2010 12:06:25 -0700
Received: from [172.30.80.29] ([172.30.80.29]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Tue, 13 Jul 2010 13:06:24 -0600
Message-ID: <4C3CB92A.90102@mentor.com>
Date: Tue, 13 Jul 2010 12:06:18 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <i1chst$tq5$1@dough.gmane.org> <4C39E82E.5000908@mentor.com>
In-Reply-To: <4C39E82E.5000908@mentor.com>
X-OriginalArrivalTime: 13 Jul 2010 19:06:24.0745 (UTC)
	FILETIME=[7D0EE590:01CB22BE]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: 'LIBC' variable clashes with perl variable
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
X-List-Received-Date: Tue, 13 Jul 2010 19:06:32 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Tom Rini wrote:
> Koen Kooi wrote:
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> Hi,
>>
>> Perl (among others) uses the 'LIBC' variable to point its linker to
>> libc.so.6, which fails due to OE redefing LIBC.
>>
>> Any objections to renaming LIBC to TARGET_LIBC in OE?
> 
> Sounds sane to me.

Actually, why don't we just unexport it, like MACHINE / DISTRO / 
TARGET_ARCH, and while we're at it, maybe TMPDIR too (since that's quite 
meaningful outside of OE).

-- 
Tom Rini
Mentor Graphics Corporation


