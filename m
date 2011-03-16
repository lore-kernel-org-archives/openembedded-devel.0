Received: from hermes.mlbassoc.com ([64.234.241.98] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1Pzset-0000WL-HY
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Mar 2011 16:29:24 +0100
Received: by mail.chez-thomas.org (Postfix, from userid 999)
	id BB78F166021E; Wed, 16 Mar 2011 09:27:28 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2-r929478 (2010-03-31) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2-r929478
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by mail.chez-thomas.org (Postfix) with ESMTP id 0645C166021D;
	Wed, 16 Mar 2011 09:27:27 -0600 (MDT)
Message-ID: <4D80D6DE.3040406@mlbassoc.com>
Date: Wed, 16 Mar 2011 09:27:26 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101209 Fedora/3.1.7-0.35.b3pre.fc13
	Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4D80C3A7.9030704@beam.ltd.uk> <4D80D556.8020508@mentor.com>
In-Reply-To: <4D80D556.8020508@mentor.com>
Subject: Re: [Openembedded-users] Problem with building angstrom-2008.1 for at91sam9m10g45ek
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
X-List-Received-Date: Wed, 16 Mar 2011 15:29:25 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/16/2011 09:20 AM, Tom Rini wrote:
> On 03/16/2011 07:05 AM, Terry Barnaby wrote:
>> -------- Original Message --------
>> Subject: Re: [Openembedded-users] Problem with building angstrom-2008.1 for
>> at91sam9m10g45ek
>> Date: Wed, 16 Mar 2011 00:45:30 -0700
>> From: Khem Raj<raj.khem@gmail.com>
>> To: openembedded-users@linuxtogo.org
>>
>> On 3/16/2011 12:18 AM, Terry Barnaby wrote:
>>> On 03/15/2011 02:23 PM, Terry Barnaby wrote:
>>>> On 03/15/2011 01:03 PM, Ludovic Desroches wrote:
>>>>> Hello,
>>>>>
>>>>> On 3/15/2011 1:36 PM, Terry Barnaby wrote:
>>>>>> Hi,
>>>>>>
>>>>>> I am trying to build angstrom-2008.1 for a at91sam9m10g45ek but am
>>>>>> having
>>>>>> an error.
>>>>>>
>>>>>> NOTE: Applying patch 'tclprivate.diff'
>>>>>> (openembedded/recipes/tcltk/tcl-8.5.8/tclprivate.diff)
>>>>>> NOTE: Applying patch 'mips-tclstrtod.patch'
>>>>>> (openembedded/recipes/tcltk/tcl-8.5.8/mips-tclstrtod.patch)
>>>>>> ERROR: Task 693
>>>>>> (virtual:native:/scratch/OpenEmbedded/openembedded/recipes/tcltk/tcl_8.5.8.bb,
>>>>>>
>>>>>> do_patch) failed with exit code 1
>>>>>> FATAL: Execution of 'quilt
>>>>>> --quiltrc=/scratch/OpenEmbedded/tmp/sysroots/i686-linux/usr/bin/quiltrc
>>>>>> push'
>>>>>> failed with exit code 1:
>>>>>> Applying patch mips-tclstrtod.patch
>>>>>> patch: **** rejecting target file name with ".." component:
>>>>>> ../generic/tclStrToD.c
>>>>>> Patch mips-tclstrtod.patch does not apply (enforce with -f)
>>>>>
>>>>> The problem seems to be only with the last patch applied onto tcl
>>>>> sources. Since
>>>>> it concerns only MIPS architecture, you can skip it for your ARM chip by
>>>>> removing into tcl_8.5.8.bb the line
>>>>> file://mips-tclstrtod.patch;striplevel=0 \
>>>>>
>>>>> It doesn't solve the problem but then you could continue. You have a
>>>>> look on the
>>>>> sources to see if the patches can be applied, maybe the problem is
>>>>> the patch level.
>>>>>
>>>>>
>>>>> Regards
>>>>>
>>>>> Ludovic Desroches
>>>>>
>>>>>
>>>>> _______________________________________________
>>>>> Openembedded-users mailing list
>>>>> Openembedded-users@linuxtogo.org
>>>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-users
>>>> Hi Ludovic,
>>>>
>>>> Thanks, that has allowed the build to continue, I will see what happens.
>>>>
>>>> Cheers
>>>>
>>>>
>>>> Terry
>>>>
>>>> _______________________________________________
>>>> Openembedded-users mailing list
>>>> Openembedded-users@linuxtogo.org
>>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-users
>>>
>>> Should I report this as an OpenEmbedded bug somewhere ?
>>
>> please forward this to openembedded-devel@lists.openembedded.org
>>
>
> Thanks for the report, I'll take care of this.
>

Note: I ran across the same thing building Poky on Fedora 14.  It didn't
break my build and & forgot to do anything about it.

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


