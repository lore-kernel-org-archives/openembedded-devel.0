Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1PzsYo-0008Pi-05
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Mar 2011 16:22:54 +0100
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1PzsX9-0004Yh-82 from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Mar 2011 08:21:11 -0700
Received: from SVR-ORW-FEM-05.mgc.mentorg.com ([147.34.97.43]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Wed, 16 Mar 2011 08:20:50 -0700
Received: from [172.30.80.14] (147.34.91.1) by svr-orw-fem-05 (147.34.97.43)
	with Microsoft SMTP Server id 14.1.270.1;
	Wed, 16 Mar 2011 08:21:10 -0700
Message-ID: <4D80D556.8020508@mentor.com>
Date: Wed, 16 Mar 2011 08:20:54 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.14) Gecko/20110223 Lightning/1.0b2 Thunderbird/3.1.8
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <4D80C3A7.9030704@beam.ltd.uk>
In-Reply-To: <4D80C3A7.9030704@beam.ltd.uk>
X-OriginalArrivalTime: 16 Mar 2011 15:20:50.0505 (UTC)
	FILETIME=[BBA44390:01CBE3ED]
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
X-List-Received-Date: Wed, 16 Mar 2011 15:22:54 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 03/16/2011 07:05 AM, Terry Barnaby wrote:
> -------- Original Message --------
> Subject: Re: [Openembedded-users] Problem with building angstrom-2008.1 for
> at91sam9m10g45ek
> Date: Wed, 16 Mar 2011 00:45:30 -0700
> From: Khem Raj<raj.khem@gmail.com>
> To: openembedded-users@linuxtogo.org
>
> On 3/16/2011 12:18 AM, Terry Barnaby wrote:
>> On 03/15/2011 02:23 PM, Terry Barnaby wrote:
>>> On 03/15/2011 01:03 PM, Ludovic Desroches wrote:
>>>> Hello,
>>>>
>>>> On 3/15/2011 1:36 PM, Terry Barnaby wrote:
>>>>> Hi,
>>>>>
>>>>> I am trying to build angstrom-2008.1 for a at91sam9m10g45ek but am
>>>>> having
>>>>> an error.
>>>>>
>>>>> NOTE: Applying patch 'tclprivate.diff'
>>>>> (openembedded/recipes/tcltk/tcl-8.5.8/tclprivate.diff)
>>>>> NOTE: Applying patch 'mips-tclstrtod.patch'
>>>>> (openembedded/recipes/tcltk/tcl-8.5.8/mips-tclstrtod.patch)
>>>>> ERROR: Task 693
>>>>> (virtual:native:/scratch/OpenEmbedded/openembedded/recipes/tcltk/tcl_8.5.8.bb,
>>>>>
>>>>> do_patch) failed with exit code 1
>>>>> FATAL: Execution of 'quilt
>>>>> --quiltrc=/scratch/OpenEmbedded/tmp/sysroots/i686-linux/usr/bin/quiltrc
>>>>> push'
>>>>> failed with exit code 1:
>>>>> Applying patch mips-tclstrtod.patch
>>>>> patch: **** rejecting target file name with ".." component:
>>>>> ../generic/tclStrToD.c
>>>>> Patch mips-tclstrtod.patch does not apply (enforce with -f)
>>>>
>>>> The problem seems to be only with the last patch applied onto tcl
>>>> sources. Since
>>>> it concerns only MIPS architecture, you can skip it for your ARM chip by
>>>> removing into tcl_8.5.8.bb the line
>>>> file://mips-tclstrtod.patch;striplevel=0 \
>>>>
>>>> It doesn't solve the problem but then you could continue. You have a
>>>> look on the
>>>> sources to see if the patches can be applied, maybe the problem is
>>>> the patch level.
>>>>
>>>>
>>>> Regards
>>>>
>>>> Ludovic Desroches
>>>>
>>>>
>>>> _______________________________________________
>>>> Openembedded-users mailing list
>>>> Openembedded-users@linuxtogo.org
>>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-users
>>> Hi Ludovic,
>>>
>>> Thanks, that has allowed the build to continue, I will see what happens.
>>>
>>> Cheers
>>>
>>>
>>> Terry
>>>
>>> _______________________________________________
>>> Openembedded-users mailing list
>>> Openembedded-users@linuxtogo.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-users
>>
>> Should I report this as an OpenEmbedded bug somewhere ?
>
> please forward this to openembedded-devel@lists.openembedded.org
>

Thanks for the report, I'll take care of this.

-- 
Tom Rini
Mentor Graphics Corporation


