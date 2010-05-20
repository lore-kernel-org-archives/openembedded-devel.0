Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1OEuYQ-0004jf-L3
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 May 2010 03:28:07 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1OEuUV-0001So-Fd from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Wed, 19 May 2010 18:24:03 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Wed, 19 May 2010 18:24:03 -0700
Received: from [172.30.80.86] ([172.30.80.86]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Wed, 19 May 2010 19:24:02 -0600
Message-ID: <4BF48F2C.8010908@mentor.com>
Date: Wed, 19 May 2010 18:23:56 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4BF45542.2000406@freyther.de> <20100520003151.GA26630@gmail.com>
In-Reply-To: <20100520003151.GA26630@gmail.com>
X-OriginalArrivalTime: 20 May 2010 01:24:02.0351 (UTC)
	FILETIME=[2152F3F0:01CAF7BB]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: TSC Meetings for the meeting of may
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
X-List-Received-Date: Thu, 20 May 2010 01:28:08 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Khem Raj wrote:
> On (20/05/10 05:16), Holger Freyther wrote:
[snip]
>> Removing old versions
>> =====================
>> The TSC looked into the topic of when to remove versions.
>>
>>
>> The TSC thinks there can not be a general rule of when to delete
>> a package. The TSC believes that in some cases a package should
>> never be deleted, e.g. with GCC/GLIBC to target a specific device
>> or distribution. For a series of major releases it seems plausible
>> to only keep the latest minor release of each release series around
>> given that the quality should increase with each minor release but
>> a removal of a minor release should not be done if there is a
>> PREFERRED_VERSION set. The TSC believes that 24 months can be a good
>> time to remove old major releases but it is certainly not the only
>> criteria for a removal.
> 
> gcc makes minor releases and in general they are bug fix only releases.
> like kernel.
> 
> I would propose that OE count such packages with major release only.
> e.g. gcc 4.4 (indicated 4.4.x) 4.5 and so on. This will simplify the
> maintenance and reduce duplication, with one downside that if some DISTRO does not need a 
> bug fix that was say done in 4.4.4 and is currently using 4.4.3 as
> preferred cross compiler. Although chances of such cases will be low.

In general, I think this will be OK.  But the compat with __ external 
distro cases (both say old compat things or as just an example, Android 
1.x uses gcc 4.2.1 iirc as the libgcc exception was still WIP for GPLv3) 
are the exception.

-- 
Tom Rini
Mentor Graphics Corporation


