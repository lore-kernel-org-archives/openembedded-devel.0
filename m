Received: from eumx.net ([91.82.101.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1U5wXJ-0002HO-Uf
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 Feb 2013 11:59:32 +0100
Message-ID: <511CBFCE.2000300@communistcode.co.uk>
Date: Thu, 14 Feb 2013 10:43:26 +0000
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130109 Thunderbird/17.0.2
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <CAKSKmM3AKfssEKaJ6ndb5v9On73Yi6WW9b99h6biHtD=8xS6Aw@mail.gmail.com>
	<511CAFF3.3090004@communistcode.co.uk>
	<CAKSKmM3vHzj_-Jh1MP1SZxxsCYe212NdnWApHvmn6CVJPXOMsA@mail.gmail.com>
	<511CB7DD.4080407@communistcode.co.uk>
	<CAKSKmM3keR3GKfvT5_VFvL101RBjbwfS4=ugV=yodWfBRfzs4w@mail.gmail.com>
In-Reply-To: <CAKSKmM3keR3GKfvT5_VFvL101RBjbwfS4=ugV=yodWfBRfzs4w@mail.gmail.com>
Subject: Re: gtk errors in openembedded classis build
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
X-List-Received-Date: Thu, 14 Feb 2013 10:59:33 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 14/02/13 10:32, Sankar H Malarmani wrote:
> I dont want to use that classic thing and get extinct..
>
> I'll go with openembedded-core as you say..
>
> I followed the steps for oe-core given in this link
> http://developer.toradex.com/software-resources/arm-family/linux/source-code/linux-%28colibri-t20%29-openembedded
>
> And I'm getting the following errors
>
> ERROR: There is a confusing multiline, partially commented expression on
> line 45 of file /home/hc/oe-core/build/../stuff/meta-toradex/recipes/images/
> angstrom-lxde-image.bb ().
> Please clarify whether this is all a comment or should be parsed.
> ERROR: Unable to parse
> /home/hc/oe-core/build/../stuff/meta-toradex/recipes/images/
> angstrom-lxde-image.bb: Exited with "1"
> ERROR: Command execution failed: Exited with 1
>
> Bare with me please.. I'm blind here..

Did you use the correct revisions of each git repository as stated on 
the wiki page? I believe the error you are seeing is an issue with the 
meta-toradex layer, bitbake has become more picky recently with proper 
commenting.

The problem is that the version of bitbake being used when meta-toradex 
was created was older than the one you are using, and as such not as strict.

>
> On Thu, Feb 14, 2013 at 3:39 PM, Jack Mitchell <ml@communistcode.co.uk>wrote:
>
>> On 14/02/13 10:01, Sankar H Malarmani wrote:
>>
>>> Hi Jack Mitchell,
>>>
>>> Thanks for your reply..
>>>
>>> openembedded-core is what you are referring as new openembedded. right?
>>>
>> Correct.
>>
>>
>>
>>> I'm trying to build a linux image version which could be done only using
>>> openembedded-classic..
>>>
>> What processor support do you need?
>>
>>
>>   And these errors i'm stuck on with are dealing with
>>> gtk+ installation and versions.. I could figure out what I'm doing wrong..
>>> Can I get your help here please ???
>>>
>> Unfortunately(?...) I have not bee here long enough to have ever used
>> oe-classic.
>>
>>
>>
>>> And please refer me how to get started with new oipenembedded.. I'll have
>>> a
>>> go at it..
>>>
>> There are a plethora of docs available here: https://www.yoctoproject.org/
>>
>>
>>>
>>> On Thu, Feb 14, 2013 at 3:05 PM, Jack Mitchell <ml@communistcode.co.uk
>>>> wrote:
>>>   On 14/02/13 05:08, Sankar H Malarmani wrote:
>>>>   Hi All,
>>>>> I'm tryin to build a linux image by using openembedded classic. On
>>>>> giving
>>>>> the bitbake command I'm getting the following errors.
>>>>>
>>>>> failed to load "./apple-red.png": Couldn't recognize the image file
>>>>> format
>>>>> for file './apple-red.png'
>>>>>
>>>>> ERROR: Function 'do_compile' failed (see
>>>>> /home/hc/oe/output/work/i686-****linux/gtk+-native-2.24.8-r1/****
>>>>> temp/log.do_compile.11738
>>>>> for further information)
>>>>> ERROR: Task 6157 (virtual:native:/home/hc/oe/**
>>>>>
>>>>> stuff/trdx/recipes/gtk+/gtk+_
>>>>> 2.24.8.bb, do_compile) failed with exit code '1'
>>>>> ERROR: '/home/hc/oe/stuff/****openembedded/recipes/eglibc/**eg**
>>>>> libc_2.12.bb<http://**eglibc_2.12.bb <http://eglibc_2.12.bb>>'
>>>>> failed
>>>>> ERROR:
>>>>> 'virtual:native:/home/hc/oe/****stuff/openembedded/recipes/**
>>>>> gobject-introspection/
>>>>> gobject-introspection_1.29.17.****bb<http://gobject-**
>>>>> introspection_1.29.17.bb <http://gobject-introspection_1.29.17.bb>>'
>>>>> failed
>>>>> ERROR: 'virtual:native:/home/hc/oe/****stuff/trdx/recipes/gtk+/gtk+_**
>>>>> 2**
>>>>> .24.8.bb <http://2.24.8.bb>'
>>>>>
>>>>> failed
>>>>>
>>>>> I'm a newbie to this openembedded stuffs..
>>>>> Please guide me to solve this issue.
>>>>>
>>>>>
>>>>>   Is there a reason you are using OE Classic? If not, then transfer to
>>>> the
>>>> new OpenEmbedded, OE Classic has been EOL for a long time now.
>>>>
>>>> Regards,
>>>>
>>>> --
>>>>
>>>>     Jack Mitchell (jack@embed.me.uk)
>>>>     Embedded Systems Engineer
>>>>     http://www.embed.me.uk
>>>>
>>>> --
>>>>
>>>>
>>>> ______________________________****_________________
>>>> Openembedded-devel mailing list
>>>> Openembedded-devel@lists.**ope**nembedded.org <http://openembedded.org><
>>>> Openembedded-**devel@lists.openembedded.org<Openembedded-devel@lists.openembedded.org>
>>>> http://lists.linuxtogo.org/****cgi-bin/mailman/listinfo/****
>>>> openembedded-devel<http://lists.linuxtogo.org/**cgi-bin/mailman/listinfo/**openembedded-devel>
>>>> <http://**lists.linuxtogo.org/cgi-bin/**mailman/listinfo/openembedded-**
>>>> devel<http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>
>>>>
>>>
>> --
>>
>>    Jack Mitchell (jack@embed.me.uk)
>>    Embedded Systems Engineer
>>    http://www.embed.me.uk
>>
>> --
>>
>>
>> ______________________________**_________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.**openembedded.org<Openembedded-devel@lists.openembedded.org>
>> http://lists.linuxtogo.org/**cgi-bin/mailman/listinfo/**openembedded-devel<http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>
>>
>
>


-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--



