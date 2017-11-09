Return-Path: <akuster808@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 90ECC60290;
	Thu,  9 Nov 2017 19:43:32 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id v137so9202214qkb.1;
	Thu, 09 Nov 2017 11:43:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language;
	bh=YbImLVS4nGebx8Au0rHEy27BmytjLPaTRLuHDZ40/yY=;
	b=DuRTQBgB4ocrVEBGgJlFjnvh8fB6p9ClszhoC/JsyIZ9pXeIiu4SPmHzCdwxsDWl85
	XSRKrtMw1jwh1X3aSE0FaN4JnxCPh7OkqKWCkhunEE6MjlS5fsyFc2+TIra9r6YmAseF
	nKCvoF14XnS2QMxVc+Jrfx6FsflvOsP6pw/NRze9UUBi3KjiThWMPm9AUhBBGegVowOJ
	lnh6XgNyEcDii0crkR4LuwFJKTGHV/P1i9Z2zXS/d5liolxPhW3o12gfRqGDapUJN1iC
	6fFFXcO6h40ETO8rbIz2T+vefkCjWmvzcyZ+UNJCYN3QLSCV5+k7RLhzYrYmH/fGxiWt
	Ttfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language;
	bh=YbImLVS4nGebx8Au0rHEy27BmytjLPaTRLuHDZ40/yY=;
	b=uAgxe3PpmFfHfK6zyZ7ArxfCIt7hXKR/cvBpOQ7Ui9vR84JyN7bTDvoTgxZzmysicT
	nQlWc9kp75AV9lXpXk7EUc8AM8LSdgIiv3eY1Fq7jms8ItMfXZSj+Ci5BwbsGCzOOmj6
	JqpWnOZIvO+pvIIhiQr+S/23vJlc6d7ywP/w0q8zR6jk4Q98id1/x3appkLhanLtIwPC
	BlFjt0xzSJW+xYPf+H2mzlzOOjCDtOdvjcV58S8zS8AxLYPoKHoHNIaHPblWWF8QtcTI
	WIQhB6bkvTOLFeJ/cUgk5JYGExXZmOf1RBb59El4I8w6hZCcqRRN+ffT5SJu8tw17FGi
	G3Ug==
X-Gm-Message-State: AJaThX5uVqZSZG4ZQ1B1TUU3bVVEHpeX6gseZhXPK5NGODWgRvR95IZU
	zxBnAKi8c3vSxUCFuSVane+cOg==
X-Google-Smtp-Source: AGs4zMbiwT6KkHPsmQ0OXV7YauIW3p2JGa7eCSiitMAf5EY6Wtad1ZdWt1w/5aB19ebR/XR2qXFs/Q==
X-Received: by 10.55.151.4 with SMTP id z4mr2740342qkd.173.1510256613342;
	Thu, 09 Nov 2017 11:43:33 -0800 (PST)
Received: from [10.43.100.234] (50-233-148-156-static.hfc.comcastbusiness.net.
	[50.233.148.156]) by smtp.gmail.com with ESMTPSA id
	g47sm5161373qtk.37.2017.11.09.11.43.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 09 Nov 2017 11:43:32 -0800 (PST)
To: Denys Dmytriyenko <denis@denix.org>
References: <8075716d-066a-ec38-3787-fd64bb9c61d5@gmail.com>
	<20171106164345.GQ9221@denix.org>
	<18f73e9e-6c8f-2c36-f9fc-6d6e53ef179d@gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <808d5b44-4ecb-2da6-0dc3-0600afb2a759@gmail.com>
Date: Thu, 9 Nov 2017 11:43:31 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <18f73e9e-6c8f-2c36-f9fc-6d6e53ef179d@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [yocto] [Openembedded-architecture] [RFC] stable branch naming scheme
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 09 Nov 2017 19:43:32 -0000
Content-Language: en-US
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Any more comments?


I started to use stable/{branch}-next in all the contrib repos. Poky
will be constructed from oe-contrib repos.


thanks for all the feedback.

regards,

Armin


On 11/06/2017 10:14 AM, akuster808 wrote:
>
>
>
> On 11/06/2017 08:43 AM, Denys Dmytriyenko wrote:
>> On Fri, Nov 03, 2017 at 09:20:43AM -0700, akuster808 wrote:
>>> Hello,
>>>
>>> The problem I hope to solve is that a Maintainer can stage changes in=

>>> any branch in the contrib repos making it difficult for folks to trac=
k
>>> their back port requests. The also makes it harder to automate any ki=
nd
>>> of build automation.
>>>
>>> I would like to propose a contrib naming scheme for the stable releas=
e
>>> branches. I am thinking of the following:
>>>
>>> stable/{version}-next or {special char}_stable/{version}-next.
>>>
>>> =C2=A0=C2=A0 "version" is either the code name or numeric like in bit=
bake.
>>>
>>> =C2=A0=C2=A0 "special char" would be used to have these branches at t=
he top of th
>>> list, if we wont that.
>> I like this branch unification!
>>
>> I know we discussed this at OEDEM and there was some convenience reaso=
n given,=20
>> but can we also standardize on the tree? I.e. openembedded-core-contri=
b vs.=20
>> poky-contrib?
>
> The current Poky maintenance process talks about deconstructing
> "stable-next":
> https://wiki.yoctoproject.org/wiki/Stable_branch_maintenance#Stable_bra=
nch_maintainers
> =C2=A0
> # Split out any bitbake changes and send them to the bitbake-devel
> mailing list (marking them with the appropriate stable version in the
> subject line e.g. [1.20])
> # Split out OE-Core changes and create an openembedded-core-contrib
> branch containing them; send the cover letter only (marking it as such
> in the subject) to the openembedded-core mailing list.
> The above has been happening via=C2=A0 a script Richard runs.=C2=A0 I p=
ersonally
> think it the workflow should be for OE -> Yocto. This does add more
> work for the maintainer but is cleaner.=C2=A0 I did ask Richard to crea=
te
> bitbake-contrib for this purpose but am lazy as he uses his script ; )
>
> The reason I choose "stable/" branching is that the "-next" branches
> are out of sync and not being used correctly or not defined on their
> purpose. another subject for another time.
>
> - armin
>
>>> We can apply this to all OE / Yocto repos that have stable branch
>>> maintenance process.
>>>
>>> If we standardize on a naming scheme, We can then document this so
>>> contributers can monitor their requests more easily. The community ca=
n
>>> see what changes are being backport.=C2=A0 This will enable the possi=
bility
>>> to automate builds, etc.=C2=A0
>>>
>>> let me know what you think.
>>>
>>> Kind regards,
>>>
>>> Armin
>>>
>>>
>>>
>>> _______________________________________________
>>> Openembedded-architecture mailing list
>>> Openembedded-architecture@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-architect=
ure
>


