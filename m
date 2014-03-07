Return-Path: <ajlennon@dynamicdevices.co.uk>
Received: from www.dynamicdevices.co.uk (www.dynamicdevices.co.uk
	[89.200.136.37])
	by mail.openembedded.org (Postfix) with ESMTP id 1D0496F572
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Mar 2014 10:08:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by www.dynamicdevices.co.uk (Postfix) with ESMTP id 816AC862DB;
	Fri,  7 Mar 2014 10:08:32 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at lennoab2.miniserver.com
Received: from www.dynamicdevices.co.uk ([127.0.0.1])
	by localhost (www.dynamicdevices.co.uk [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id Tjy1a6xNvPGs; Fri,  7 Mar 2014 10:08:29 +0000 (UTC)
Received: from [127.0.0.1] (cpc32-live22-2-0-cust59.17-2.cable.virginm.net
	[82.36.253.60])
	(using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by www.dynamicdevices.co.uk (Postfix) with ESMTPSA id ACC4C8610D;
	Fri,  7 Mar 2014 10:08:29 +0000 (UTC)
Message-ID: <53199A96.80901@dynamicdevices.co.uk>
Date: Fri, 07 Mar 2014 10:08:22 +0000
From: Alex J Lennon <ajlennon@dynamicdevices.co.uk>
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <cover.1394010806.git.ajlennon@dynamicdevices.co.uk>
	<ce88733ef0143e96e323aff0ac34909d43eda4bf.1394010806.git.ajlennon@dynamicdevices.co.uk>
	<20140305172026.GX26981@jama>
	<53176169.9060501@dynamicdevices.co.uk>
	<20140305193027.GD26981@jama> <20140306183804.GI26981@jama>
In-Reply-To: <20140306183804.GI26981@jama>
X-Enigmail-Version: 1.6
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe] [PATCH 1/1] daq: Update from 2.0.1 to 2.0.2
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 07 Mar 2014 10:08:35 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit


On 06/03/2014 18:38, Martin Jansa wrote:
> On Wed, Mar 05, 2014 at 08:30:27PM +0100, Martin Jansa wrote:
>> On Wed, Mar 05, 2014 at 05:39:53PM +0000, Alex J Lennon wrote:
>>> On 05/03/2014 17:20, Martin Jansa wrote:
>>>> On Wed, Mar 05, 2014 at 03:49:13PM +0000, Alex J Lennon wrote:
>>>>> daq-2.0.1.tar.gz is missing from SRC_URI location. Presumably replaced with 2.02.
>>>> Sorry I haven't noticed it when replying on oe-core version, but can you
>>>> please remove 2.0.1 version in the same patch and sent with -M?
>>>>
>>>> Do you know if it fixes do_install issue when building on host with
>>>> dash? It's reported regularly in:
>>>> http://www.openembedded.org/wiki/Bitbake_World_Status
>>>>
>>>> Thanks!
>>> Apologies. I thought I had the removal of 2.0.1 in there. Clearly I
>>> shouldn't be doing this
>>> type of thing before the first coffee of the day!
>> :)
>>
>> I've added 2.0.1 removal when cherry-picking this to master-next.
>>
>>> I'll take a look at the issue you mention before I resubmit
>> Thanks, I've started new world build, please watch status e-mails to see
>> if it happens there as well again, it's possible that dash isn't the
>> (only) reason for the failure..
> Yes, it does fail with 2.0.2, you can see whole log here:
> http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.20140306_000713.log/bitbake.log

I wonder why it fails on your build system and not for me. The only
difference that jumps out at me is that you are running an x64 host

I don't suppose you fancy sending over an archive of your complete
daq/2.0.2-r0/* build folder including the temp dir, and I'll try to do
some comparisons here with mine.

Cheers, Alex

>>> Cheers, Alex
>>>
>>>>> Signed-off-by: Alex J Lennon <ajlennon@dynamicdevices.co.uk>
>>>>> ---
>>>>>  meta-oe/recipes-connectivity/daq/daq_2.0.2.bb |   16 ++++++++++++++++
>>>>>  1 file changed, 16 insertions(+)
>>>>>  create mode 100644 meta-oe/recipes-connectivity/daq/daq_2.0.2.bb
>>>>>
>>>>> diff --git a/meta-oe/recipes-connectivity/daq/daq_2.0.2.bb b/meta-oe/recipes-connectivity/daq/daq_2.0.2.bb
>>>>> new file mode 100644
>>>>> index 0000000..2675e2a
>>>>> --- /dev/null
>>>>> +++ b/meta-oe/recipes-connectivity/daq/daq_2.0.2.bb
>>>>> @@ -0,0 +1,16 @@
>>>>> +SUMMARY = "The dump DAQ test the various inline mode features "
>>>>> +HOMEPAGE = "http://www.snort.org"
>>>>> +LICENSE = "GPLv2"
>>>>> +LIC_FILES_CHKSUM = "file://COPYING;md5=f9ce51a65dd738dc1ae631d8b21c40e0"
>>>>> +
>>>>> +PARALLEL_MAKE = ""
>>>>> +
>>>>> +DEPENDS = "libpcap libpcre "
>>>>> +
>>>>> +SRC_URI = "http://fossies.org/linux/misc/daq-${PV}.tar.gz \
>>>>> +            file://disable-run-test-program-while-cross-compiling.patch "
>>>>> +
>>>>> +SRC_URI[md5sum] = "865bf9b750a2a2ca632591a3c70b0ea0"
>>>>> +SRC_URI[sha256sum] = "d65d1e67c4994e02c3142c49a648642e780b7e3d942b4a51f605309beac269a8"
>>>>> +
>>>>> +inherit autotools
>>>>> -- 
>>>>> 1.7.9.5
>>>>>
>>>>> _______________________________________________
>>>>> Openembedded-devel mailing list
>>>>> Openembedded-devel@lists.openembedded.org
>>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>>>
>>>> _______________________________________________
>>>> Openembedded-devel mailing list
>>>> Openembedded-devel@lists.openembedded.org
>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>>    
>> -- 
>> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
>

-- 

Dynamic Devices Ltd <http://www.dynamicdevices.co.uk/>

Alex J Lennon / Director
1 Queensway, Liverpool L22 4RA

mobile: +44 (0)7956 668178

Linkedin <http://www.linkedin.com/in/alexjlennon> Skype
<skype:alexjlennon?add>

This e-mail message may contain confidential or legally privileged
information and is intended only for the use of the intended
recipient(s). Any unauthorized disclosure, dissemination, distribution,
copying or the taking of any action in reliance on the information
herein is prohibited. E-mails are not secure and cannot be guaranteed to
be error free as they can be intercepted, amended, or contain viruses.
Anyone who communicates with us by e-mail is deemed to have accepted
these risks. Company Name is not responsible for errors or omissions in
this message and denies any responsibility for any damage arising from
the use of e-mail. Any opinion and other statement contained in this
message and any attachment are solely those of the author and do not
necessarily represent those of the company.


