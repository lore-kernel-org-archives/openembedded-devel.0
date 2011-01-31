Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1PjunQ-0006R9-2K
	for openembedded-devel@lists.openembedded.org;
	Mon, 31 Jan 2011 15:32:00 +0100
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1PjumW-0004oA-W3 from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Mon, 31 Jan 2011 06:31:05 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Mon, 31 Jan 2011 06:31:04 -0800
Received: from [172.30.80.99] ([172.30.80.99]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 31 Jan 2011 07:31:03 -0700
Message-ID: <4D46C79D.7040501@mentor.com>
Date: Mon, 31 Jan 2011 07:30:53 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1296240753-10120-1-git-send-email-tom_rini@mentor.com>	<1296240753-10120-3-git-send-email-tom_rini@mentor.com>
	<lyy661s67b.fsf@ensc-virt.intern.sigma-chemnitz.de>
In-Reply-To: <lyy661s67b.fsf@ensc-virt.intern.sigma-chemnitz.de>
X-OriginalArrivalTime: 31 Jan 2011 14:31:03.0870 (UTC)
	FILETIME=[7D4AEDE0:01CBC153]
Subject: Re: [PATCH 2/5] perl-native: Switch to userelocatableinc and not shared libperl
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
X-List-Received-Date: Mon, 31 Jan 2011 14:32:00 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/31/2011 03:44 AM, Enrico Scholz wrote:
> Tom Rini<tom_rini@mentor.com>  writes:
>
>> -	for PERLSCRIPT in `grep -rIl ${bindir}/perl ${D}${bindir}`; do
>> -		sed -i -e 's|^#!${bindir}/perl|#!/usr/bin/env perl|' $PERLSCRIPT
>> +	for PERLSCRIPT in `grep -rIEl '#!.*/perl' ${D}${bindir}`; do
>> +		sed -i -e '1s|^#!.*|#!/usr/bin/env perl|' $PERLSCRIPT
>
> This will break shebang lines with interpreter options (e.g.
> '#! /usr/bin/perl -T'):
>
> | $ echo '#! /usr/bin/env perl -T'>  /tmp/x.pl
> | $ chmod +x /tmp/x.pl
> | $ /tmp/x.pl
> | /usr/bin/env: perl -T: No such file or directory

Which is why we change it to just /usr/bin/env perl.  Given how we use 
these programs, it's not a problem to drop -w/W/t/T IMHO.

-- 
Tom Rini
Mentor Graphics Corporation


