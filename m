Received: from [87.193.137.78] (helo=mail.extern.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@DResearch.DE>) id 1MbVFO-0004E0-4E
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Aug 2009 10:01:19 +0200
Received: from consult.extern.dresearch.de (consult.extern.DResearch.DE
	[87.193.137.68])
	by mail.extern.dresearch.de (Postfix) with ESMTP id 0AA5A16DFA6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Aug 2009 09:49:48 +0200 (CEST)
Received: from hiob.intern.dresearch.de (unknown [87.193.137.50])
	by consult.extern.dresearch.de (Postfix) with ESMTP id 9B0912A424C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Aug 2009 09:44:48 +0200 (CEST)
Received: from [127.0.0.1] ([10.32.10.2]) by hiob.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.3959); Thu, 13 Aug 2009 09:44:16 +0200
Message-ID: <4A83C454.3010001@dresearch.de>
Date: Thu, 13 Aug 2009 09:44:20 +0200
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Thunderbird 2.0.0.22 (Windows/20090605)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <69E6C70090A0A14498CC98FAE5E06B6E3CF94F@hiob.intern.dresearch.de>
	<4A7960FC.6030608@dresearch.de>
In-Reply-To: <4A7960FC.6030608@dresearch.de>
X-OriginalArrivalTime: 13 Aug 2009 07:44:16.0140 (UTC)
	FILETIME=[DBBCE4C0:01CA1BE9]
Subject: Re: confusing qemu-native problem
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
X-List-Received-Date: Thu, 13 Aug 2009 08:01:22 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Steffen Sledz schrieb:
> Sledz, Steffen schrieb:
>> I've seen a very confusing, indetermined behaviour of the qemu-native build in the last time (current dev branch).
>>
>> When calling the following three commands back-to-back the first and the second fail with something like "/bin/sh: .../staging/i686-linux/usr/bin/pod2man: ...bad interpreter: Permission denied" but the third call succeeds (details see below).
>>
>>  bitbake hydraip-hipox-devimage
>>  bitbake qemu-native
>>  bitbake qemu-native
>>
>> In general it looks like the success of the qemu-native is really randomly.
>>
>> Why does the one call of "bitbake qemu-native" fails and the second succeeds?
>> ...
> 
> No more ideas here?
> 
> Such indetermined behaviour is really a horror!

My google searches result in some possible causes for a behaviour like this, but none of them matches my case. :(

1. DOS line endings -> checked: none

2. noexec mount option -> checked: exec

3. acl or user_xattr effects -> checked: not used

Looking into the logs and playing with the devshell i found these interesting points:

> /home/DRESEARCH/production/METABUILD/2009-08-03-15-24-27--hydraip-build--28595/OpenEmbedded/tmp.3/staging/i686-linux/usr/bin/pod2man --help
bash: /home/DRESEARCH/production/METABUILD/2009-08-03-15-24-27--hydraip-build--28595/OpenEmbedded/tmp.3/staging/i686-linux/usr/bin/pod2man: /home/DRESEARCH/production/METABUILD/2009-08-03-15-24-27--hydraip-build--28595: bad interpreter: Permission denied

> head -n1 /home/DRESEARCH/production/METABUILD/2009-08-03-15-24-27--hydraip-build--28595/OpenEmbedded/tmp.3/staging/i686-linux/usr/bin/pod2man
#!/home/DRESEARCH/production/METABUILD/2009-08-03-15-24-27--hydraip-build--28595/OpenEmbedded/tmp.3/staging/i686-linux/usr/bin/perl

> /home/DRESEARCH/production/METABUILD/2009-08-03-15-24-27--hydraip-build--28595/OpenEmbedded/tmp.3/staging/i686-linux/usr/bin/perl --version

This is perl, v5.8.8 built for i686-linux-thread-multi
...

So the perl interpreter seems not to be the problem. Confusing for me is the original error message:

"/home/DRESEARCH/production/METABUILD/2009-08-03-15-24-27--hydraip-build--28595: bad interpreter: Permission denied"

I would expect something like:

"/home/DRESEARCH/production/METABUILD/2009-08-03-15-24-27--hydraip-build--28595/OpenEmbedded/tmp.3/staging/i686-linux/usr/bin/pod2man: bad interpreter: Permission denied"

It looks like someone cut the path to the pod2man script.

I would be really grateful for some help.

Steffen




