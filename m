Received: from ch1ehsobe004.messaging.microsoft.com ([216.32.181.184]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B40290@freescale.com>) id 1TahSr-0006IS-NN
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Nov 2012 07:37:50 +0100
Received: from mail185-ch1-R.bigfish.com (10.43.68.229) by
	CH1EHSOBE017.bigfish.com (10.43.70.67) with Microsoft SMTP Server id
	14.1.225.23; Tue, 20 Nov 2012 05:53:28 +0000
Received: from mail185-ch1 (localhost [127.0.0.1])	by
	mail185-ch1-R.bigfish.com (Postfix) with ESMTP id 992BE240070;
	Tue, 20 Nov 2012 05:53:28 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 1
X-BigFish: VS1(zz98dI9371Ic89bhc85dh1432I1447Izz1de0h1202h1d1ah1d2ah10d2mzz17326ah8275bh8275dhz2dh2a8h668h839hd25he5bhf0ah1288h12a5h12bdh137ah1441h1504h1537h153bh162dh1631h1155h)
Received: from mail185-ch1 (localhost.localdomain [127.0.0.1]) by mail185-ch1
	(MessageSwitch) id 1353390807235359_21592;
	Tue, 20 Nov 2012 05:53:27 +0000 (UTC)
Received: from CH1EHSMHS035.bigfish.com (snatpool1.int.messaging.microsoft.com
	[10.43.68.247])	by mail185-ch1.bigfish.com (Postfix) with ESMTP id
	2DD41220220;	Tue, 20 Nov 2012 05:53:27 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS035.bigfish.com
	(10.43.70.35) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Tue, 20 Nov 2012 05:53:26 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-004.039d.mgd.msft.net (10.84.1.14) with Microsoft SMTP
	Server (TLS) id 14.2.318.3; Tue, 20 Nov 2012 05:53:26 +0000
Received: from [10.192.208.249] (guo-desktop.ap.freescale.net
	[10.192.208.249])	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with
	ESMTP id qAK5rLIK022502;	Mon, 19 Nov 2012 22:53:23 -0700
Message-ID: <50AB1AE1.80803@freescale.com>
Date: Tue, 20 Nov 2012 13:53:37 +0800
From: chunrongguo <b40290@freescale.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1353031219-16200-1-git-send-email-b40290@freescale.com>
	<CAP9ODKpfdpS3ULMNPig7d-n+2y5tvvvKmHi+1fP8UP+E=dqtDA@mail.gmail.com>
	<20121119133040.GB5534@windriver.com>
In-Reply-To: <20121119133040.GB5534@windriver.com>
X-OriginatorOrg: freescale.com
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: B29882@freescale.com, B19537@freescale.com,
	Joe MacDonald <Joe.MacDonald@windriver.com>
Subject: Re: [meta-networking v5 ] inetutils : Update to 1.9.1
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
X-List-Received-Date: Tue, 20 Nov 2012 06:37:50 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

  1. the following patches were accepted by inetutils 1.9.1 upstream
inetutils-1.8-0002-argp-fix-program_invocation_name-detection.patch
inetutils-1.8-1001-ftp-rename-ruserpass-to-avoid-C-library-collision.patch
inetutils-1.8-1002-rshd-detect-__rcmd_errstr-support-in-the-C-lib.patch
inetutils-1.8-1003-use-daemon-from-the-C-library-when-possible.patch
     inetutils-1.8-1004-detect-fork-support.patch
     inetutils-1.8-1005-ftpd-add-daemon-D-nommu-support.patch
2. the following patches were pending
inetutils-1.8-0001-printf-parse-pull-in-features.h-for-__GLIBC__.patch
     inetutils-1.8-0003-wchar.patch
     fix-disable-ipv6.patch

I will submit new patch for inetutils 1.9.1

thank you
chunrong


On 2012?11?19? 21:30, Joe MacDonald wrote:
> [Re: [oe] [meta-networking v5 ] inetutils : Update to 1.9.1] On 12.11.19 (Mon 08:34) Otavio Salvador wrote:
>
>> On Fri, Nov 16, 2012 at 12:00 AM, Chunrong Guo <b40290@freescale.com> wrote:
>>
>>>    * There are difference spaces between  inetutils-1.8/COPYING
>>>      and inetutils-1.9.1/COPYING,so md5sum is changed.
>>>
>>> Signed-off-by: Chunrong Guo <b40290@freescale.com>
>>>
>> I did not built or tested it but the commit log might be improved to
>> express what happened to the patches you removed. I assume they were fixed
>> upstream but it is not clear looking at the changes or commit log.
>>
>> Please make it explicit.
> I agree.  I only got do to a proper build test yesterday, and all seemed
> well, but I'd like to see the log expanded a bit as well.
>
> Almost there!  And thanks for the update to the new version, that's
> something I'd been thinking I was going to need to get to soon, so it's
> saving me some time.
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


