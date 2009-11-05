Received: from [80.91.229.12] (helo=lo.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1N65QE-0003Ot-Bi for openembedded-devel@lists.openembedded.org;
	Thu, 05 Nov 2009 17:42:57 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1N65Oy-0001xE-BB
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 Nov 2009 17:41:36 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Nov 2009 17:41:36 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Nov 2009 17:41:36 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 05 Nov 2009 17:41:11 +0100
Message-ID: <hcuv77$uhe$1@ger.gmane.org>
References: <1256849813-10538-1-git-send-email-przemyslaw.wesolek@cs.put.poznan.pl>	<1257427111-32537-1-git-send-email-przemyslaw.wesolek@cs.put.poznan.pl>	<hcur44$elg$2@ger.gmane.org>
	<4AF2F6F0.9060606@cs.put.poznan.pl>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.3pre) Gecko/20090811 Shredder/3.0b4pre
In-Reply-To: <4AF2F6F0.9060606@cs.put.poznan.pl>
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
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
X-List-Received-Date: Thu, 05 Nov 2009 16:42:57 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05-11-09 17:01, Przemyslaw Wesolek wrote:
> Koen Kooi wrote:
>> Your patch seems to be based on an old (as in: the day before yesterday)
>> snapshot of OE. I added a different set of patches which do almost the
>> same, but keep proper atomic ops for armv6 and armv7a, while yours would
>> fall back to emulated atomic ops for all arm platforms.
>
> Great. But I see that my change:
>
>>> diff --git a/recipes/boost/files/atomic_count_gcc_atomicity.patch
>>> b/recipes/boost/files/atomic_count_gcc_atomicity.patch
>>> index 7d08e73..3b09a8a 100644
>>> --- a/recipes/boost/files/atomic_count_gcc_atomicity.patch
>>> +++ b/recipes/boost/files/atomic_count_gcc_atomicity.patch
>>> @@ -2,12 +2,15 @@ Index: boost_1_33_1/boost/detail/atomic_count_gcc.hpp
>>>    ===================================================================
>>>    --- boost_1_33_1.orig/boost/detail/atomic_count_gcc.hpp
>>> 2008-05-01 20:43:45.000000000 +0200
>>>    +++ boost_1_33_1/boost/detail/atomic_count_gcc.hpp    2008-05-01
>>> 20:43:55.000000000 +0200
>>> -@@ -17,7 +17,7 @@
>>> +@@ -17,7 +17,11 @@
>>>     //  http://www.boost.org/LICENSE_1_0.txt)
>>>     //
>>>
>>> --#include<bits/atomicity.h>
>>> ++#if __GNUC__ * 100 + __GNUC_MINOR__>= 402
>>>    +#include<ext/atomicity.h>
>>> ++#else
>>> + #include<bits/atomicity.h>
>>> ++#endif
>>>
>>>     namespace boost
>>>     {
>
> is still applicable. Shell I post a patch for this issue separately?

Yes please :)



