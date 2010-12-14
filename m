Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1PSYC5-0005qH-18
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 Dec 2010 17:57:41 +0100
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1PSYAV-0002Fa-AK from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 Dec 2010 08:56:03 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Tue, 14 Dec 2010 08:56:07 -0800
Received: from [172.30.80.111] ([172.30.80.111]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Tue, 14 Dec 2010 09:56:02 -0700
Message-ID: <4D07A19D.8090602@mentor.com>
Date: Tue, 14 Dec 2010 09:55:57 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4D065431.6080304@dell.com>	<AANLkTin2DnrgjhA4Qt63+pyfhPP=rLcs94CL_gbOeBGC@mail.gmail.com>
	<4D079B88.9010503@dell.com>
In-Reply-To: <4D079B88.9010503@dell.com>
X-OriginalArrivalTime: 14 Dec 2010 16:56:02.0324 (UTC)
	FILETIME=[CA25AD40:01CB9BAF]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] eglibc: use HTTP for svn checkout
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
X-List-Received-Date: Tue, 14 Dec 2010 16:57:41 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/14/2010 09:30 AM, Ryan D Phillips wrote:
> On 12/13/2010 2:00 PM, Khem Raj wrote:
>> On Mon, Dec 13, 2010 at 9:13 AM, Ryan D Phillips
>> <ryan_d_phillips@dell.com> wrote:
>>> SVN over HTTP is a more reliable transport for developers behind
>>> restrictive
>>> proxies.
>>>
>>
>> and how much slower/faster is it when compared to svn protocol ?
>>
>
> The speed depends on which subversion client backend someone is using.
> HTTP will be slower than using the svn native protocol, but the serf
> subversion backend will perform parallel fetches.
>
> I would like to see this patch get into the OE tree to make the tree
> more robust to proxies. Currently, this is the only customization I need
> for the projects I work on.

Note that if you use a mirror site with the SVN checkout archive in it, 
you won't try and do the fetch at all.  This may or may not be 
applicable to your case.  For your case I think what we really want is a 
way to globally toggle the svn protocol argument.

-- 
Tom Rini
Mentor Graphics Corporation


