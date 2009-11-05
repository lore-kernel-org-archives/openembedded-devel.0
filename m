Received: from [150.254.30.30] (helo=libra.cs.put.poznan.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <przemyslaw.wesolek@cs.put.poznan.pl>)
	id 1N64lj-0001VQ-BC for openembedded-devel@lists.openembedded.org;
	Thu, 05 Nov 2009 17:01:06 +0100
Received: from kas30pipe.localhost (unknown [127.0.0.1])
	by libra.cs.put.poznan.pl (Postfix on VMS) with ESMTP id C665584
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Nov 2009 15:59:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at cs.put.poznan.pl
Received: from libra.cs.put.poznan.pl ([127.0.0.1])
	by localhost (libra.cs.put.poznan.pl [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id 2qoVT4nmAmDv
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Nov 2009 16:59:49 +0100 (CET)
Received: from [150.254.31.31] (idss-pw.cs.put.poznan.pl [150.254.31.31])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by libra.cs.put.poznan.pl (Postfix on VMS) with ESMTP id 938E382
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Nov 2009 16:59:49 +0100 (CET)
Message-ID: <4AF2F6F0.9060606@cs.put.poznan.pl>
Date: Thu, 05 Nov 2009 17:01:52 +0100
From: Przemyslaw Wesolek <przemyslaw.wesolek@cs.put.poznan.pl>
Organization: Poznan University of Technology
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1256849813-10538-1-git-send-email-przemyslaw.wesolek@cs.put.poznan.pl>	<1257427111-32537-1-git-send-email-przemyslaw.wesolek@cs.put.poznan.pl>
	<hcur44$elg$2@ger.gmane.org>
In-Reply-To: <hcur44$elg$2@ger.gmane.org>
X-Enigmail-Version: 0.96.0
X-SpamTest-Version: SMTP-Filter Version 3.0.0 [0278], KAS30/Release
X-SpamTest-Info: Not protected
X-SA-Exim-Connect-IP: 150.254.30.30
X-SA-Exim-Mail-From: przemyslaw.wesolek@cs.put.poznan.pl
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] boost: more elaborate and correct usage of GCC atomicity.
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
X-List-Received-Date: Thu, 05 Nov 2009 16:01:06 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Koen Kooi wrote:
> Your patch seems to be based on an old (as in: the day before yesterday)
> snapshot of OE. I added a different set of patches which do almost the
> same, but keep proper atomic ops for armv6 and armv7a, while yours would
> fall back to emulated atomic ops for all arm platforms.

Great. But I see that my change:

>> diff --git a/recipes/boost/files/atomic_count_gcc_atomicity.patch
>> b/recipes/boost/files/atomic_count_gcc_atomicity.patch
>> index 7d08e73..3b09a8a 100644
>> --- a/recipes/boost/files/atomic_count_gcc_atomicity.patch
>> +++ b/recipes/boost/files/atomic_count_gcc_atomicity.patch
>> @@ -2,12 +2,15 @@ Index: boost_1_33_1/boost/detail/atomic_count_gcc.hpp
>>   ===================================================================
>>   --- boost_1_33_1.orig/boost/detail/atomic_count_gcc.hpp   
>> 2008-05-01 20:43:45.000000000 +0200
>>   +++ boost_1_33_1/boost/detail/atomic_count_gcc.hpp    2008-05-01
>> 20:43:55.000000000 +0200
>> -@@ -17,7 +17,7 @@
>> +@@ -17,7 +17,11 @@
>>    //  http://www.boost.org/LICENSE_1_0.txt)
>>    //
>>
>> --#include<bits/atomicity.h>
>> ++#if __GNUC__ * 100 + __GNUC_MINOR__>= 402
>>   +#include<ext/atomicity.h>
>> ++#else
>> + #include<bits/atomicity.h>
>> ++#endif
>>
>>    namespace boost
>>    {

is still applicable. Shell I post a patch for this issue separately?

Przemek



