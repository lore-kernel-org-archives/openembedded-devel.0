Return-Path: <otavio.salvador@gmail.com>
Received: from mail-pa0-f50.google.com (mail-pa0-f50.google.com
	[209.85.220.50])
	by mail.openembedded.org (Postfix) with ESMTP id 6CB737595E
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Jun 2015 11:31:49 +0000 (UTC)
Received: by pacyx8 with SMTP id yx8so21624821pac.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Jun 2015 04:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=+oCv1hlVcbUmcVg6Cv3kCIypLv0wX+sO3x1VYG0XU+s=;
	b=LmY/5biyUu0+fCMOUen2KS8vQDCkjNurL4exlEpFfnbNbwCJAyjEYUafJUKj38Z0q3
	thsdeApk9VdO5cYbFp7lqgK8lAHEYx/5INAF7L0hyyI/Roqc0z9f5eKcmHNZa9NbH+B2
	CdFoS8v4YtmfOcuJp4HY7sBDKd8/yPDOEzlXQvh0SPcbk5V7vCXNeI/VBLxDpRH6Dlmx
	luaniNBdrDeUSZl97zt6lNgwK+W5VZ706ozEe/23McZdLkBlUcBHfJfjvE82MEu3DmLo
	GT04NpRBJG4eJZ+ZjR+8abPzxvMGQ048QPoTE0/ZCENlJFNVfgJeP2mYcIYcgLQQJbkg
	zVMg==
MIME-Version: 1.0
X-Received: by 10.68.108.65 with SMTP id hi1mr22324714pbb.129.1434108709363;
	Fri, 12 Jun 2015 04:31:49 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.70.34.109 with HTTP; Fri, 12 Jun 2015 04:31:49 -0700 (PDT)
In-Reply-To: <557AB88E.8020300@mail.bg>
References: <5579F20D.5040900@mail.bg> <557A817E.7070709@mail.bg>
	<557AB88E.8020300@mail.bg>
Date: Fri, 12 Jun 2015 08:31:49 -0300
X-Google-Sender-Auth: NncrsgMAAay5iUvnimBAvs_1aqU
Message-ID: <CAP9ODKruFjbNjXnQXzEgZLM+YW2NHnM+7CKd4f352iWLftD5+A@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Cc: "meta-freescale@yoctoproject.org" <meta-freescale@yoctoproject.org>
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
X-List-Received-Date: Fri, 12 Jun 2015 11:31:54 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jun 12, 2015 at 7:46 AM, Nikolay Dimitrov <picmaster@mail.bg> wrote:
> On 06/12/2015 09:51 AM, Nikolay Dimitrov wrote:
>>
>> Adding openembedded guys in the loop.
>>
>>
>> On 06/11/2015 11:39 PM, Nikolay Dimitrov wrote:
>>>
>>> Hi gang,
>>>
>>> Chromium tabs are crashing when they see an HTML5 <video> tag, like
>>> this one:
>>>
>>> <video width="320" height="240" controls>
>>>    <source src="movie.mp4" type="video/mp4">
>>> </video>
>>>
>>> (Code is from http://www.w3schools.com/html/html5_video.asp)
>>>
>>> I'm pretty sure that this worked fine some weeks ago, so it's a recent
>>> regression on Fido, 100% reproducible on imx6q sabresd. At this moment
>>> I still can't point to a specific commit in meta-fsl-arm or
>>> meta-browser.
>
>
> Commit 30b8d6b3d0d6501c56ef6967a2fa73a3d4bf5fe9 is the last known good
> commit. After it the component either doesn't compile, libs are missing
> or video tag isn't working.
>
> Looks like it's a "revert time" for the customer builds...

Might be packaging splitting which can have changes. One way to easily
track this is using buildhistory and compare both packaged outputs.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

