Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1K1GGh-00013S-F6
	for openembedded-devel@openembedded.org; Wed, 28 May 2008 09:40:19 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1K1GDK-0004P4-1E
	for openembedded-devel@openembedded.org; Wed, 28 May 2008 07:36:50 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 28 May 2008 07:36:50 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 28 May 2008 07:36:50 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 28 May 2008 09:36:39 +0200
Message-ID: <g1j228$7m8$1@ger.gmane.org>
References: <70c9a9110805220710x6663f582lc5d6b75744960d08@mail.gmail.com>	<70c9a9110805220711i33fd397k518855a05773edf0@mail.gmail.com>
	<1211958108.27777.15.camel@isis>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Thunderbird 3.0a2pre (Macintosh/2008052003)
In-Reply-To: <1211958108.27777.15.camel@isis>
Sender: news <news@ger.gmane.org>
Subject: Re: GCC 4.3 fails to build glibc(-intermediate)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Wed, 28 May 2008 07:40:19 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Khem Raj wrote:
> On Thu, 2008-05-22 at 16:11 +0200, Enric Balletbò i Serra wrote:
>> Hi,
>>
>> I have the same problem, but at this moment I don't have idea about solution.
>
> I could reproduce this problem as well. I also tried to reduce the
> issue. It is an ICE in GCC and I have made a small testcase which I am
> able to reproduce on gcc-4_3-branch I have reported a gcc bug(PR36350)
> for it  Meanwhile you can remove -frename-registers optimization pass
> and ICE should go away.

And now I know why I wasn't seeing the ICE when using gcc 4.3.0: I 
turned off -frename-registers and -ftree-vectorize for armv7a 
completely, since gcc threw an ICE....

regards,

Koen


>
> Something like this might work around for glibc
>
> Index: libc/iconv/Makefile
> ===================================================================
> --- libc.orig/iconv/Makefile	2008-05-27 23:50:05.000000000 -0700
> +++ libc/iconv/Makefile	2008-05-27 23:54:43.000000000 -0700
> @@ -38,6 +38,8 @@
>   CFLAGS-gconv_simple.c = -DSTATIC_GCONV
>   endif
>
> +CFLAGS-gconv_simple.c += -fno-rename-registers
> +
>   vpath %.c ../locale/programs ../intl
>
>   iconv_prog-modules = iconv_charmap charmap charmap-dir linereader \
>
>
> Thanks
>
> -Khem
>
>> Regards,
>>   Enric Balletbo i Serra
>>
>> On Wed, May 7, 2008 at 7:33 AM, Matthijs van de Water
>> matthijs.van.de.water at gmail.com wrote:
>>
>>> Hi,
>>>
>>> I'm trying to get an ARM EABI build based on gcc 4.3 working. I'm not
>>> having much luck with that so-far.
>>>
>>> The build fails at glibc-internal (tried both 2.6.1 and 2.7) with an
>>> internal compiler error:
>>> ../iconv/skeleton.c: In function '__gconv_transform_ucs4_internal':
>>> ../iconv/skeleton.c:801: internal compiler error: Segmentation fault
>>>
>>> Am I missing something? Any ideas?
>>>
>>> Regards,
>>>
>>> Matthijs van de Water
>>>
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel at lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>>
>>
>>
>>
>> ------------------------------------------------------------------------
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel




