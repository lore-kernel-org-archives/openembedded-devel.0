Received: from portal.beam.ltd.uk ([62.49.82.227] helo=mailgate.beam.ltd.uk)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <terry@beam.ltd.uk>) id 1PzrNW-0001gZ-O4
	for openembedded-devel@linuxtogo.org; Wed, 16 Mar 2011 15:07:10 +0100
Received: from beam.beamnet (beam.beamnet [127.0.0.1])
	by mailgate.beam.ltd.uk (8.14.4/8.14.4) with ESMTP id p2GE5RTh003677
	for <openembedded-devel@linuxtogo.org>; Wed, 16 Mar 2011 14:05:27 GMT
Message-ID: <4D80C3A7.9030704@beam.ltd.uk>
Date: Wed, 16 Mar 2011 14:05:27 +0000
From: Terry Barnaby <terry@beam.ltd.uk>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101209 Fedora/3.1.7-0.35.b3pre.fc14
	Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@linuxtogo.org
X-Enigmail-Version: 1.1.1
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
X-List-Received-Date: Wed, 16 Mar 2011 14:07:11 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

-------- Original Message --------
Subject: Re: [Openembedded-users] Problem with building angstrom-2008.1 for
at91sam9m10g45ek
Date: Wed, 16 Mar 2011 00:45:30 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-users@linuxtogo.org

On 3/16/2011 12:18 AM, Terry Barnaby wrote:
> On 03/15/2011 02:23 PM, Terry Barnaby wrote:
>> On 03/15/2011 01:03 PM, Ludovic Desroches wrote:
>>> Hello,
>>>
>>> On 3/15/2011 1:36 PM, Terry Barnaby wrote:
>>>> Hi,
>>>>
>>>> I am trying to build angstrom-2008.1 for a at91sam9m10g45ek but am
>>>> having
>>>> an error.
>>>>
>>>> NOTE: Applying patch 'tclprivate.diff'
>>>> (openembedded/recipes/tcltk/tcl-8.5.8/tclprivate.diff)
>>>> NOTE: Applying patch 'mips-tclstrtod.patch'
>>>> (openembedded/recipes/tcltk/tcl-8.5.8/mips-tclstrtod.patch)
>>>> ERROR: Task 693
>>>> (virtual:native:/scratch/OpenEmbedded/openembedded/recipes/tcltk/tcl_8.5.8.bb,
>>>>
>>>> do_patch) failed with exit code 1
>>>> FATAL: Execution of 'quilt
>>>> --quiltrc=/scratch/OpenEmbedded/tmp/sysroots/i686-linux/usr/bin/quiltrc
>>>> push'
>>>> failed with exit code 1:
>>>> Applying patch mips-tclstrtod.patch
>>>> patch: **** rejecting target file name with ".." component:
>>>> ../generic/tclStrToD.c
>>>> Patch mips-tclstrtod.patch does not apply (enforce with -f)
>>>
>>> The problem seems to be only with the last patch applied onto tcl
>>> sources. Since
>>> it concerns only MIPS architecture, you can skip it for your ARM chip by
>>> removing into tcl_8.5.8.bb the line
>>> file://mips-tclstrtod.patch;striplevel=0 \
>>>
>>> It doesn't solve the problem but then you could continue. You have a
>>> look on the
>>> sources to see if the patches can be applied, maybe the problem is
>>> the patch level.
>>>
>>>
>>> Regards
>>>
>>> Ludovic Desroches
>>>
>>>
>>> _______________________________________________
>>> Openembedded-users mailing list
>>> Openembedded-users@linuxtogo.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-users
>> Hi Ludovic,
>>
>> Thanks, that has allowed the build to continue, I will see what happens.
>>
>> Cheers
>>
>>
>> Terry
>>
>> _______________________________________________
>> Openembedded-users mailing list
>> Openembedded-users@linuxtogo.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-users
>
> Should I report this as an OpenEmbedded bug somewhere ?

please forward this to openembedded-devel@lists.openembedded.org

_______________________________________________
Openembedded-users mailing list
Openembedded-users@linuxtogo.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-users


