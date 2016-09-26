Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f65.google.com (mail-vk0-f65.google.com
	[209.85.213.65])
	by mail.openembedded.org (Postfix) with ESMTP id 52645600BB
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Sep 2016 07:31:58 +0000 (UTC)
Received: by mail-vk0-f65.google.com with SMTP id u196so2021409vkd.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Sep 2016 00:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=7xtYAb+mcSJHM6tKBLanR9ihZKCFnzJUEKX2a7D2B5A=;
	b=bxXdlS+vcx6guuXgB1ZA5NNp1VcTcPwz7k2oWIT+FVvHihC8XlVkwnQ6yqHSMY0yJa
	gKWysuynhU5q6R4wjQIgNE8SqOomLlFY2cFce8/YOl8zCGII3f36nIWbGeXJqt8AOAkI
	Xl5v9mYvhluL8iusqTjzPq8CA8KnXbUvjBu3d3Zz9OQlc0IQoTl5Q6VXGTiuX7Jt80g5
	WvS8aK9cmsD+YXD/8Qpuxqnj19owQtmu1kdQxNiQ63FvLQRbpmyEM1zrhhwzPysf0mEL
	ZIx8gWuWNWnPJnG7Rn7zrwpk9wl+DWQRA/2BsQERS261el2DfiMvQ6f+I5e20JMUip36
	aIAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=7xtYAb+mcSJHM6tKBLanR9ihZKCFnzJUEKX2a7D2B5A=;
	b=RcC9ZXjC6TvZH0MaqJ31kv1x1WCRjzsV8Cs7LsEoDE/JU5KrrNivcPgx0sjIsNfXUw
	C2p5M+5+owbRDs6q77Rkp77hUmSnjsdcr9ne51v8tilSyJympBGJl+MIqoKcL3/un8lK
	LjrDULoWCAJxIUmk0PQ/GdWx9zQG6+6xSC63RZByvA7qvTzUtHeYRGmoXNcOQL+8lBKS
	ZiaLC9vE6lfw+81cyckG2qT/Y1ZjFLeoMB8Zgm1EXHMo1PXKI4qtHuytsDo+OYfVat8I
	HQ4qDpkYPW86yAIUW64YwQxi/LX1Rsr2CmlNF42LO0cOLDg9laH960FRlwZoNPYOiYUN
	VZTg==
X-Gm-Message-State: AA6/9RlFi17sCk7B4Q4I7bOWozKGb8Z5RS7wi9fgcgK/KwcumCLlnDOJIdB2wRRoMeEf4zDpHNqn9YJFSkM1hw==
X-Received: by 10.31.61.213 with SMTP id k204mr7066539vka.173.1474875119804;
	Mon, 26 Sep 2016 00:31:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.80.33 with HTTP; Mon, 26 Sep 2016 00:31:29 -0700 (PDT)
In-Reply-To: <57E69552.9040209@topic.nl>
References: <1474634029-22896-1-git-send-email-mike.looijmans@topic.nl>
	<CAMKF1srhhYfYO69noEU30+66yDX8cLNbEB7tpJhkubKwjPoevw@mail.gmail.com>
	<57E69552.9040209@topic.nl>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 26 Sep 2016 00:31:29 -0700
Message-ID: <CAMKF1so4gZ9zYqS17E-xRq0U-bu27aiv6v_EiR2zc3OqCgDSYg@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] phytool: Add recipe
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
X-List-Received-Date: Mon, 26 Sep 2016 07:32:00 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Sep 24, 2016 at 8:01 AM, Mike Looijmans <mike.looijmans@topic.nl> wrote:
> On 23-09-16 20:33, Khem Raj wrote:
>>
>> On Fri, Sep 23, 2016 at 5:33 AM, Mike Looijmans <mike.looijmans@topic.nl>
>> wrote:
>>>
>>> A nice tool to directly read, write and interpret ethernet PHY data.
>>> Very useful when debugging PHY or MDIO problems, which ethtool does
>>> not do.
>>>
>>> Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
>>> ---
>>>   meta-networking/recipes-support/phytool/phytool.bb | 14 ++++++++++++++
>>>   1 file changed, 14 insertions(+)
>>>   create mode 100644 meta-networking/recipes-support/phytool/phytool.bb
>>>
>>> diff --git a/meta-networking/recipes-support/phytool/phytool.bb
>>> b/meta-networking/recipes-support/phytool/phytool.bb
>>> new file mode 100644
>>> index 0000000..9d541b7
>>> --- /dev/null
>>> +++ b/meta-networking/recipes-support/phytool/phytool.bb
>>> @@ -0,0 +1,14 @@
>>> +SUMMARY = "PHY interface tool for Linux"
>>> +LICENSE = "GPLv2"
>>> +LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
>>> +
>>> +PV = "1.0.1"
>>> +SRCREV = "1a3ea62a218206e9faf3b27fb5d01c85692024c8"
>>> +SRC_URI = "git://github.com/wkz/phytool.git"
>>> +
>>> +S = "${WORKDIR}/git"
>>> +
>>> +do_install() {
>>> +       install -d ${D}${prefix}/bin
>>
>>
>> perhaps use base_bindir here
>
>
> The makefile installs to $PREFIX/bin so I deliberately put the same folder
> in the recipe (the makefile doesn't create the directory). If anyone changes
> $bindir the install will fail.

I see the logic,  if you dont want to use bitbake variables then perhaps its
good to add a comment to explain why it was not done

>
>>
>>> +       oe_runmake 'DESTDIR=${D}' 'PREFIX=${prefix}' install
>>> +}
>>> --
>>> 1.9.1
>>>
>>> --
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>
>
> --
> Mike Looijmans
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

