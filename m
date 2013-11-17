Return-Path: <gwt.scott@gmail.com>
Received: from mail-ob0-f170.google.com (mail-ob0-f170.google.com
	[209.85.214.170])
	by mail.openembedded.org (Postfix) with ESMTP id EB2886D2F9
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Nov 2013 19:39:04 +0000 (UTC)
Received: by mail-ob0-f170.google.com with SMTP id wp18so1389835obc.29
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Nov 2013 11:39:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=references:from:in-reply-to:mime-version:date:message-id:subject:to
	:content-type; bh=sekrNg8aFsxKvafz/CLqEZDH5nF3SEDTliDB1aZh4cU=;
	b=GQiAak3HjKo/m3xCpBUVyS0D2XHoS3CRavh2Y4xlriShkDyuf7SEBUxOuejBl2bAgq
	aqXDCc3xzkXhSP8kM13K4FyZe9DSMtzOyK7emmhV69H/oyBAcqyAKsbSK/NHTYeWGnpv
	78Zt09bXD/zIvruX0pEr3HS1fgWphElAYlrWt06D4OTPo7N7mr+7dYZgVqIED6KgjQci
	pxNmC06epuuw2NHVjPr10m9PqUOSgE/yaLLzFS/MRko9dvoBFEqAMcc1rqgQoOGO6gIB
	qwIrUQ8enc/7RxLjvXT5W9Yofi7+hWXI0IpVMVB8MTZvmGx+9Fl+e2fcmGCbWxEqTk0f
	UWMw==
X-Received: by 10.60.47.228 with SMTP id g4mr16464561oen.10.1384717146255;
	Sun, 17 Nov 2013 11:39:06 -0800 (PST)
References: <CAOXsvCQhMLr+U=FOmoeSW_yWoMfnMA7VReKKhNuwfDTf1a868Q@mail.gmail.com>
	<5285EEE4.4070208@communistcode.co.uk>
	<5837624278552957107@unknownmsgid>
	<52890BDD.8070709@communistcode.co.uk>
	<CAOXsvCReSJmFAuqTSyqgz2OtXS24xPkQj=6TLi33bO_rQrTa_w@mail.gmail.com>
	<52891962.8030609@communistcode.co.uk>
From: Scott Penner <gwt.scott@gmail.com>
In-Reply-To: <52891962.8030609@communistcode.co.uk>
Mime-Version: 1.0 (1.0)
Date: Sun, 17 Nov 2013 12:39:03 -0700
Message-ID: <-905742598699052867@unknownmsgid>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Sun, 17 Nov 2013 19:39:05 -0000
Content-Type: text/plain; charset=ISO-8859-1

I probably downloaded it 2~3 weeks ago.
If I remove the code for the php in the .bb files, everything builds
fine and the image works. Wasn't sure if modphp was dependant on other
software before it would build.

Thanks,

Scott Penner

Goodwell Inc.
c. 4033761977
a. Box 906 Brooks, Ab T1R1B8

> On Nov 17, 2013, at 12:30 PM, Jack Mitchell <ml@communistcode.co.uk> wrote:
>
> I don't know how to fix your problem, but I can tell you that it's not PHP that's breaking the build, but mariadb-native. Are you using the latest oe-core and meta-oe branches?
>
>> On 17/11/13 19:16, Scott Penner wrote:
>> Ok, Thanks, makes sense, here is the log file..
>>
>> and my .bb files for fsl-image-test.
>>
>> In my bblayers.conf file I have included the webserver directory.
>>
>>
>> Not sure if this is the proper way to add a webserver, any insight is
>> appreciated!
>>
>> Thanks again
>>
>>
>>
>> On Sun, Nov 17, 2013 at 11:33 AM, Jack Mitchell <ml@communistcode.co.uk>wrote:
>>
>>> Hi Scott,
>>>
>>> Bitbake will point you to the log file in the output (it will be a fairly
>>> long filepath). If there isn't a link to a file in the output and the
>>> output is short then paste that in an email, or pastebin.
>>>
>>> If you're still struggling with what to send or where to find it, I would
>>> suggest dropping by the IRC channels and someone will be about to help
>>> further.
>>>
>>> Cheers,
>>> Jack.
>>>
>>>
>>>> On 17/11/13 16:23, Scott Penner wrote:
>>>>
>>>> Hi Jack, thanks for the reply!
>>>>   I am looking for modphp, which is in the webserver directory and I
>>>> have tried adding that package but the build fails. I've added the
>>>> apache webserver with success and took the same approach for adding
>>>> modphp. Which log files can I send? My learning is still curving :/
>>>>
>>>> Thanks,
>>>>
>>>> Scott Penner
>>>>
>>>> Goodwell Inc.
>>>> c. 4033761977
>>>> a. Box 906 Brooks, Ab T1R1B8
>>>>
>>>>  On Nov 15, 2013, at 2:52 AM, Jack Mitchell <ml@communistcode.co.uk>
>>>>> wrote:
>>>>>
>>>>>>  On 15/11/13 05:58, Scott Penner wrote:
>>>>>> Hi and thanks for this resource,
>>>>>>
>>>>>> I am trying to add PHP to my image and cannot!
>>>>>> I've tried a few different attempts, sort of documented
>>>>>> here<https://community.freescale.com/message/359851#359851>
>>>>>> Its for a imx6sabrelite board and I'm trying to modify the
>>>>>> fsl-image-test
>>>>>> image.
>>>>>> I can add the apache server, and it works, but get errors during the
>>>>>> bake
>>>>>> when adding PHP.
>>>>>> Should I be using the PHP packages in the webserver directory or
>>>>>> devtools
>>>>>> directory?
>>>>>> Do you have any working examples of a lamp install or just apache/PHP
>>>>>> install procedure?
>>>>>>
>>>>>> Thanks for any insight,
>>>>>>
>>>>>> Scott Penner
>>>>>
>>>>> Hi Scott,
>>>>>
>>>>> There should only be one location for PHP, or are you getting PHP and
>>>>> mod-php mixed up? If so, you should read up on what the differences are
>>>>> and decide which one you need.
>>>>>
>>>>> Secondly, we can't help without error logs :)
>>>>>
>>>>> Cheers,
>>>>>
>>>>> --
>>>>>   Jack Mitchell (jack@embed.me.uk)
>>>>>   Embedded Systems Engineer
>>>>>   Cambridgeshire, UK
>>>>>   http://www.embed.me.uk
>>>>> --
>>>>> _______________________________________________
>>>>> Openembedded-devel mailing list
>>>>> Openembedded-devel@lists.openembedded.org
>>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>>> _______________________________________________
>>>> Openembedded-devel mailing list
>>>> Openembedded-devel@lists.openembedded.org
>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>>
>>> --
>>>   Jack Mitchell (jack@embed.me.uk)
>>>   Embedded Systems Engineer
>>>   Cambridgeshire, UK
>>>   http://www.embed.me.uk
>>> --
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
>>
>>
>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>
> --
>  Jack Mitchell (jack@embed.me.uk)
>  Embedded Systems Engineer
>  Cambridgeshire, UK
>  http://www.embed.me.uk
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

