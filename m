Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id ECE4F758F2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Jun 2015 11:42:02 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 26FACF811F9; Fri, 12 Jun 2015 05:42:03 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=10.0 tests=ALL_TRUSTED,BAYES_00,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 7C638F811F8;
	Fri, 12 Jun 2015 05:42:02 -0600 (MDT)
Message-ID: <557AC595.7070402@mlbassoc.com>
Date: Fri, 12 Jun 2015 05:42:13 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <5579F20D.5040900@mail.bg>
	<557A817E.7070709@mail.bg>	<557AB88E.8020300@mail.bg>
	<CAP9ODKruFjbNjXnQXzEgZLM+YW2NHnM+7CKd4f352iWLftD5+A@mail.gmail.com>
In-Reply-To: <CAP9ODKruFjbNjXnQXzEgZLM+YW2NHnM+7CKd4f352iWLftD5+A@mail.gmail.com>
Subject: Re: [meta-freescale] Chromium crashes on HTML5 video tag
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
X-List-Received-Date: Fri, 12 Jun 2015 11:42:03 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 2015-06-12 05:31, Otavio Salvador wrote:
> On Fri, Jun 12, 2015 at 7:46 AM, Nikolay Dimitrov <picmaster@mail.bg> wrote:
>> On 06/12/2015 09:51 AM, Nikolay Dimitrov wrote:
>>>
>>> Adding openembedded guys in the loop.
>>>
>>>
>>> On 06/11/2015 11:39 PM, Nikolay Dimitrov wrote:
>>>>
>>>> Hi gang,
>>>>
>>>> Chromium tabs are crashing when they see an HTML5 <video> tag, like
>>>> this one:
>>>>
>>>> <video width="320" height="240" controls>
>>>>     <source src="movie.mp4" type="video/mp4">
>>>> </video>
>>>>
>>>> (Code is from http://www.w3schools.com/html/html5_video.asp)
>>>>
>>>> I'm pretty sure that this worked fine some weeks ago, so it's a recent
>>>> regression on Fido, 100% reproducible on imx6q sabresd. At this moment
>>>> I still can't point to a specific commit in meta-fsl-arm or
>>>> meta-browser.
>>
>>
>> Commit 30b8d6b3d0d6501c56ef6967a2fa73a3d4bf5fe9 is the last known good
>> commit. After it the component either doesn't compile, libs are missing
>> or video tag isn't working.
>>
>> Looks like it's a "revert time" for the customer builds...
>
> Might be packaging splitting which can have changes. One way to easily
> track this is using buildhistory and compare both packaged outputs.
>

It looks to me like that revision updated by 2 major versions of
Chrome - more likely there are goblins in there than just a packaging
issue.

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

