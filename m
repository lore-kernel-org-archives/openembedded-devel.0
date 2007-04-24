Received: from [80.122.23.18] (helo=admproxy.stiftadmont.local)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <patrick.steiner@a1.net>) id 1HgHQz-0004RU-8H
	for openembedded-devel@lists.openembedded.org;
	Tue, 24 Apr 2007 11:35:41 +0200
Received: from admproxy.stiftadmont.local (localhost [127.0.0.1])
	by postfix.imss70 (Postfix) with ESMTP id 3B30E1DC20D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Apr 2007 11:07:16 +0200 (CEST)
Received: from admex.ora.local (admex [10.2.0.60])
	by admproxy.stiftadmont.local (Postfix) with ESMTP id 2D0511DC209
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Apr 2007 11:07:16 +0200 (CEST)
Received: from [10.2.1.9] ([10.2.1.9]) by admex.ora.local with Microsoft
	SMTPSVC(6.0.3790.1830); Tue, 24 Apr 2007 11:09:12 +0200
Message-ID: <462DC919.4050300@a1.net>
Date: Tue, 24 Apr 2007 11:08:41 +0200
From: Patrick Steiner <patrick.steiner@a1.net>
User-Agent: Thunderbird 1.5.0.10 (X11/20070302)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@lists.openembedded.org>
References: <200704192334.00169.patrick.steiner@a1.net>
	<432beae0704191642m79afc9aaia85466716ee744af@mail.gmail.com>
	<462853A9.6020309@a1.net>
	<1177061454.5842.7.camel@localhost.localdomain>
In-Reply-To: <1177061454.5842.7.camel@localhost.localdomain>
X-OriginalArrivalTime: 24 Apr 2007 09:09:12.0642 (UTC)
	FILETIME=[39ABE220:01C78650]
X-TM-AS-Product-Ver: IMSS-7.0.0.1640-3.8.0.1026-15134.002
X-TM-AS-Result: No--7.232-5.0-31-1
X-imss-scan-details: No--7.232-5.0-31-1;No--7.232-5.0-31-1
Subject: Re: strange build errors after (Checking Package:...)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 24 Apr 2007 09:35:41 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Richard Purdie wrote:
> On Fri, 2007-04-20 at 07:46 +0200, Patrick Steiner wrote:
>> Justin Patrin wrote:
>>> On 4/19/07, Patrick Steiner <patrick.steiner@a1.net> wrote:
>>> Sounds to me like a missing native dep on whatever package scanelf comes from
>> hi i think this was the problem i did bitbake pax-utils-native now it works
>>
>> i think this should be added as default dependency, also the sha256sum 
>> stuff...
>
> It should be a dependency by default. Was this with bitbake 1.8.0? Does
> 1.8.1 from svn work any better? 
>
> To check, look at the task-depends.dot file saved by "bitbake something
> -g" and see if pax-utils-native is mentioned as a dependency for
> do_package tasks...
>
> I just checked here and it seems to be working for me with 1.8.1.
>
> Cheers,
>
> Richard
i have tested it now with the bitbake svn version (1.8.0 branch) now it 
also works.

so this could be an bug in 1.8.0 stable...

regards,
 patrick


