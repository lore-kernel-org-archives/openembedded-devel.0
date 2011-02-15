Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1PpM3P-0006rr-9O
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Feb 2011 15:38:59 +0100
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1PpM2D-0000gR-Hf from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Feb 2011 06:37:45 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Tue, 15 Feb 2011 06:37:44 -0800
Received: from [172.30.80.148] ([172.30.80.148]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Tue, 15 Feb 2011 07:37:44 -0700
Message-ID: <4D5A8FAC.5020001@mentor.com>
Date: Tue, 15 Feb 2011 07:37:32 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4D5A5871.7000005@dresearch.de> <4D5A89CD.803@opendreambox.org>
In-Reply-To: <4D5A89CD.803@opendreambox.org>
X-OriginalArrivalTime: 15 Feb 2011 14:37:44.0367 (UTC)
	FILETIME=[E8342BF0:01CBCD1D]
Subject: Re: linux-libc-headers version (reloaded)
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
X-List-Received-Date: Tue, 15 Feb 2011 14:38:59 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/15/2011 07:12 AM, Andreas Oberritter wrote:
> On 02/15/2011 11:41 AM, Steffen Sledz wrote:
>> "Kernel headers are backwards compatible, but not forwards compatible.  This
>> means that a program built against a C library using older kernel headers
>> should run on a newer kernel (although it may not have access to new
>> features), but a program built against newer kernel headers may not work on an
>> older kernel."[2]
>
> Isn't this what the variable OLDEST_KERNEL is good for, when compiling
> glibc?

Right.  But other things can start to rely on the kernel interfaces 
(where it's allowed to) as well, and often don't do the various hoops to 
be forwards compatible at run time.

-- 
Tom Rini
Mentor Graphics Corporation


