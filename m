Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Pna07-00012L-AV
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Feb 2011 18:08:15 +0100
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1PnZz4-0002DH-5H from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Feb 2011 09:07:10 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	svr-orw-fem-01.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Thu, 10 Feb 2011 09:07:09 -0800
Received: from [172.30.80.144] ([172.30.80.144]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 10 Feb 2011 10:07:09 -0700
Message-ID: <4D541B37.6050404@mentor.com>
Date: Thu, 10 Feb 2011 10:07:03 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4D540F81.3030205@mentor.com> <ij14m0$o7u$1@dough.gmane.org>
In-Reply-To: <ij14m0$o7u$1@dough.gmane.org>
X-OriginalArrivalTime: 10 Feb 2011 17:07:09.0158 (UTC)
	FILETIME=[F391F860:01CBC944]
Subject: Re: [RFC] postgresql updates
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
X-List-Received-Date: Thu, 10 Feb 2011 17:08:15 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/10/2011 09:44 AM, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 10-02-11 17:17, Tom Rini wrote:
>> Hey all,
>>
>> I'll post patches later but I'd like to do some upgrading / fixing to
>> postgresql.
>>
>> First, from
>> http://wiki.postgresql.org/wiki/PostgreSQL_Release_Support_Policy
>> postgresql 8.1.x (our default) is EOL.  8.2.x will EOL this year and
>> 8.4.x has some good life left to it.
>>
>> Second, after reading the various release notes (starting on
>> http://www.postgresql.org/docs/8.2/static/release-8-2-20.html), I would
>> like to:
>>
>> - Drop 8.1.x
>> - Drop 8.2.x (since it's D_P = -1 and unpinned)
>> - Make 8.4.7 the default which means
>>    - Un-pin SHR (8.4.4 to 8.4.7 is a safe and no changes needed upgrade,
>> see http://www.postgresql.org/docs/8.4/static/release-8-4-7.html)
>
> Sounds good to me!
>
>> What got me going here is that 8.1.x and 8.2.x both use ld directly for
>> linking rather than CCLD which causes problems on mips64 which means
>> qt4*demo-image was failing (well, outside of SHR ;)).
>>
>> But the question is, do we want to in any way try and prompt the user to
>> get them to upgrade their 8.1.x DB?  Or just assume anyone using
>> postgresql will be smart enough to figure out they need to dump and
>> restore (if I read things right).
>
> We could at least dump something to stdout in the postinst like mysql does.

I see where mysql will attempt to setup the db.  Maybe mysql_install_db 
(a command from mysql) does that?

-- 
Tom Rini
Mentor Graphics Corporation


