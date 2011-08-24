Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <a.sappia@biotechware.com>) id 1QwKfk-000412-2u
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Aug 2011 23:07:40 +0200
X-Originating-IP: 217.70.178.137
Received: from mfilter8-d.gandi.net (mfilter8-d.gandi.net [217.70.178.137])
	by relay4-d.mail.gandi.net (Postfix) with ESMTP id 669CD17208B;
	Wed, 24 Aug 2011 23:02:55 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mfilter8-d.gandi.net
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by mfilter8-d.gandi.net (mfilter8-d.gandi.net [10.0.15.180])
	(amavisd-new, port 10024)
	with ESMTP id HHgqGj5Kplnu; Wed, 24 Aug 2011 23:02:54 +0200 (CEST)
X-Originating-IP: 82.58.178.196
Received: from [127.0.0.1] (host196-178-dynamic.58-82-r.retail.telecomitalia.it
	[82.58.178.196]) (Authenticated sender: a.sappia@biotechware.com)
	by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 29FE2172076;
	Wed, 24 Aug 2011 23:02:50 +0200 (CEST)
Message-ID: <4E5566F8.6080306@biotechware.com>
Date: Wed, 24 Aug 2011 23:02:48 +0200
From: Alessandro Sappia <a.sappia@biotechware.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; rv:6.0) Gecko/20110812 Thunderbird/6.0
MIME-Version: 1.0
To: Jan Kobler <eng1@koblersystems.de>
References: <1309803629.20865.8.camel@BTW1>	<CA+2YH7uyJUNWuvcNEC5jnsqkZs9Hnri7sxq0aZXWf1r88tU_qw@mail.gmail.com>	<1309850758.24550.19.camel@BTW1>	<CAG4_upTf2tNbusXcBs91dwf9TE+C9yxSmDM-nXc7wHsSHYDhyQ@mail.gmail.com>
	<1309860631.20533.4.camel@BTW1> <4E555468.6070201@koblersystems.de>
In-Reply-To: <4E555468.6070201@koblersystems.de>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Cannot compile helloworld-image
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
X-List-Received-Date: Wed, 24 Aug 2011 21:07:40 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 24/08/2011 21:43, Jan Kobler wrote:
> Hi,
>
> I have encountered the problem with the missing gl_GLIBC21 too.
>
> This is what solved the problem for me:
>
> bitbake -c clean gettext-native
> bitbake gettext-native
>
> Afterwards the string "GLIBC21" appears in
> sysroots/x86_64-linux/usr/share/aclocal/glibc21.m4 and
> sysroots/x86_64-linux/usr/share/aclocal/intl.m4

The problem is something in master branch of bitbake. using .12 let a 
fresh enviroment
build everything.

> Best regards,
>
> Jan
>
>
> on 05.07.2011 12:10 Alessandro Sappia said the following:
>> but compilation fails on bison-native.
>>
>> Seem solved by using the host bison ASSUME_PROVIDED += "bison-native"
>> instead of let bitbake compile
>> (bison from recipes complains about a "perhaps missing m4 macro
>> gl_GLIBC21").
>>



