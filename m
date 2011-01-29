Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1PjCA6-0007qc-6n
	for openembedded-devel@lists.openembedded.org;
	Sat, 29 Jan 2011 15:52:26 +0100
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1PjC9G-0003di-BP from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Sat, 29 Jan 2011 06:51:34 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	svr-orw-fem-01.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Sat, 29 Jan 2011 06:51:34 -0800
Received: from [172.30.80.64] ([172.30.80.64]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Sat, 29 Jan 2011 07:51:33 -0700
Message-ID: <4D44296D.6040209@mentor.com>
Date: Sat, 29 Jan 2011 07:51:25 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1296240753-10120-1-git-send-email-tom_rini@mentor.com>
	<20110129112942.GB3265@jama>
In-Reply-To: <20110129112942.GB3265@jama>
X-OriginalArrivalTime: 29 Jan 2011 14:51:33.0375 (UTC)
	FILETIME=[054F00F0:01CBBFC4]
Subject: Re: [PATCH 0/5] Relocatable perl-native and use it always
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
X-List-Received-Date: Sat, 29 Jan 2011 14:52:26 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/29/2011 04:29 AM, Martin Jansa wrote:
> On Fri, Jan 28, 2011 at 11:52:28AM -0700, Tom Rini wrote:
>> Hey all,
>>
>> As I've talked about before[1] there's build reproducibility issues
>> depending on when perl-native is built.  After talking with Mark Hatle
>> a little bit I started thinking about relocation in perl again and it
>> turns out that starting in 5.10, upstream perl supports relocation.
>>
>> This in turn makes it less painful to make perl-native be what we use
>> when we want perl runtime, nearly everywhere (since you can use pstaging
>> to avoid it the time next time).
>>
>> This patch set drops perl 5.8.8 and bumps all of the perl stuffs PR,
>> switches to relocatable perl-native, and then the big switch to using it
>> early.
>
> Looks good and as we're using 5.10 already then for whole series:
>
> Acked-by: Martin Jansa<Martin.Jansa@gmail.com>

Thanks.

> Can we also get rid of legacy staging from recipes/perl/perl_5.10.1.bb ?

Huh?  I killed legacy staging in both perls a long time ago (and then 
Koen fixed up my thinkos).

-- 
Tom Rini
Mentor Graphics Corporation


