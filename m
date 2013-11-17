Return-Path: <ml@communistcode.co.uk>
Received: from owm.eumx.net (eumx.net [91.82.101.43])
	by mail.openembedded.org (Postfix) with ESMTP id 059696D2F9
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Nov 2013 19:30:42 +0000 (UTC)
Message-ID: <52891962.8030609@communistcode.co.uk>
Date: Sun, 17 Nov 2013 19:30:42 +0000
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <CAOXsvCQhMLr+U=FOmoeSW_yWoMfnMA7VReKKhNuwfDTf1a868Q@mail.gmail.com>	<5285EEE4.4070208@communistcode.co.uk>	<5837624278552957107@unknownmsgid>	<52890BDD.8070709@communistcode.co.uk>
	<CAOXsvCReSJmFAuqTSyqgz2OtXS24xPkQj=6TLi33bO_rQrTa_w@mail.gmail.com>
In-Reply-To: <CAOXsvCReSJmFAuqTSyqgz2OtXS24xPkQj=6TLi33bO_rQrTa_w@mail.gmail.com>
Subject: Re: How to add PHP
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
X-List-Received-Date: Sun, 17 Nov 2013 19:30:42 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I don't know how to fix your problem, but I can tell you that it's not 
PHP that's breaking the build, but mariadb-native. Are you using the 
latest oe-core and meta-oe branches?

On 17/11/13 19:16, Scott Penner wrote:
> Ok, Thanks, makes sense, here is the log file..
>
> and my .bb files for fsl-image-test.
>
> In my bblayers.conf file I have included the webserver directory.
>
>
> Not sure if this is the proper way to add a webserver, any insight is
> appreciated!
>
> Thanks again
>
>
>
> On Sun, Nov 17, 2013 at 11:33 AM, Jack Mitchell <ml@communistcode.co.uk>wrote:
>
>> Hi Scott,
>>
>> Bitbake will point you to the log file in the output (it will be a fairly
>> long filepath). If there isn't a link to a file in the output and the
>> output is short then paste that in an email, or pastebin.
>>
>> If you're still struggling with what to send or where to find it, I would
>> suggest dropping by the IRC channels and someone will be about to help
>> further.
>>
>> Cheers,
>> Jack.
>>
>>
>> On 17/11/13 16:23, Scott Penner wrote:
>>
>>> Hi Jack, thanks for the reply!
>>>    I am looking for modphp, which is in the webserver directory and I
>>> have tried adding that package but the build fails. I've added the
>>> apache webserver with success and took the same approach for adding
>>> modphp. Which log files can I send? My learning is still curving :/
>>>
>>> Thanks,
>>>
>>> Scott Penner
>>>
>>> Goodwell Inc.
>>> c. 4033761977
>>> a. Box 906 Brooks, Ab T1R1B8
>>>
>>>   On Nov 15, 2013, at 2:52 AM, Jack Mitchell <ml@communistcode.co.uk>
>>>> wrote:
>>>>
>>>>   On 15/11/13 05:58, Scott Penner wrote:
>>>>> Hi and thanks for this resource,
>>>>>
>>>>> I am trying to add PHP to my image and cannot!
>>>>> I've tried a few different attempts, sort of documented
>>>>> here<https://community.freescale.com/message/359851#359851>
>>>>> Its for a imx6sabrelite board and I'm trying to modify the
>>>>> fsl-image-test
>>>>> image.
>>>>> I can add the apache server, and it works, but get errors during the
>>>>> bake
>>>>> when adding PHP.
>>>>> Should I be using the PHP packages in the webserver directory or
>>>>> devtools
>>>>> directory?
>>>>> Do you have any working examples of a lamp install or just apache/PHP
>>>>> install procedure?
>>>>>
>>>>> Thanks for any insight,
>>>>>
>>>>> Scott Penner
>>>>>
>>>>
>>>> Hi Scott,
>>>>
>>>> There should only be one location for PHP, or are you getting PHP and
>>>> mod-php mixed up? If so, you should read up on what the differences are
>>>> and decide which one you need.
>>>>
>>>> Secondly, we can't help without error logs :)
>>>>
>>>> Cheers,
>>>>
>>>> --
>>>>    Jack Mitchell (jack@embed.me.uk)
>>>>    Embedded Systems Engineer
>>>>    Cambridgeshire, UK
>>>>    http://www.embed.me.uk
>>>> --
>>>> _______________________________________________
>>>> Openembedded-devel mailing list
>>>> Openembedded-devel@lists.openembedded.org
>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>>>
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>>
>>>
>>
>> --
>>    Jack Mitchell (jack@embed.me.uk)
>>    Embedded Systems Engineer
>>    Cambridgeshire, UK
>>    http://www.embed.me.uk
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
>
>
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>


-- 
   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   Cambridgeshire, UK
   http://www.embed.me.uk
--

