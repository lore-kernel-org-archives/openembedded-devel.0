Return-Path: <samuli.piippo@gmail.com>
Received: from mail-io0-f196.google.com (mail-io0-f196.google.com
	[209.85.223.196])
	by mail.openembedded.org (Postfix) with ESMTP id AA31576050
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Jun 2018 05:44:00 +0000 (UTC)
Received: by mail-io0-f196.google.com with SMTP id d22-v6so9628107iof.13
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Jun 2018 22:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=oZMlYWr9QUOu/R2bI1UtoQMIYpwVX4CUFDmMDDpe6bo=;
	b=JN1sCrwQUQeBLqeayS/wWXw3j7oAGl4Tg/kjjUchLquH3PclOdCOpdAemX3vyqiV7J
	8XiU6olefrTcuOivoO+dRiGULWG9evpDvTD4T47dNrGLoKczHhEKrWMkw0UDynblI9SW
	FzmDbPlOvCWstf9rgoIHNHE6U7vXoc1OinOECfT0LXONsiA/uXzJsYqaZ7d9zwVormHM
	2z/8Tj3JFLo1P1CVigK7gD64ZwiEusGe8ab5m1FPvC3wc4S9Ful9NTfR1NKPyA4swr/H
	zg5lMA55wfPAYfDbODM5lfqObvFBZA6/Fbi8JqAs9TpBJL7+G+pFwG7I87HCRAXH6MXq
	vlFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=oZMlYWr9QUOu/R2bI1UtoQMIYpwVX4CUFDmMDDpe6bo=;
	b=o4NvCX730Ei3H22RnaLPs7AO952v5C37+28Q3kaXez9gAq9DHv7X3gsp48rDLuqfpp
	f6vrYlg7LpXa81r4RKt7tkG652Fghn1qkUIy/pnaexPKqw8Qk5y15xVHZoXDPjJlvHMf
	oI/oIRQYJK22dvJnwxjShjRb/EPb9z9MvjaqszOhj5bjDOomzjNOtQYlpazcr5clpJ0+
	Fi66a5EZ5qidUUl3WWAJJUnXiJKVr8/doYv8LAVAt6P7QrQlh6A83i0ulNL7KwspYCdG
	5Fvz62f5mSzTAEsuAgp9y+tf82jj6WG01C/ygatFWklfmINu+o/ccxaUlAX2vOP/BIC1
	bwHQ==
X-Gm-Message-State: APt69E09GBZEyZFlXr/hVoq04JIKllQlsc9dlFBF0NpwLbLIbapMMwqF
	94nneVCqJrEjXOHwomsKy1HWc2XAglGjVvNkr4k=
X-Google-Smtp-Source: ADUXVKLAxw5eljsqcK92N6eqBx+i6GN0w/xI/zQAL/NQVGPWTvewEZk24pd96yBBnI3X/gzA0yF4yhEDn6DmK0bbbxI=
X-Received: by 2002:a6b:2401:: with SMTP id k1-v6mr240973iok.270.1529041441424;
	Thu, 14 Jun 2018 22:44:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a6b:8855:0:0:0:0:0 with HTTP; Thu, 14 Jun 2018 22:44:00
	-0700 (PDT)
In-Reply-To: <CABXoSoUparq518CmSYB-8g6nemqE46pyU5CBwQHWT6B+QdXNJQ@mail.gmail.com>
References: <20180529092556.25053-1-samuli.piippo@qt.io>
	<20180606200506.GA1353@jama>
	<CABXoSoUparq518CmSYB-8g6nemqE46pyU5CBwQHWT6B+QdXNJQ@mail.gmail.com>
From: Samuli Piippo <samuli.piippo@gmail.com>
Date: Fri, 15 Jun 2018 08:44:00 +0300
Message-ID: <CABXoSoUh3HDg4-WB8JYJyn1b8u1nW4vuQeUdzWNe9jowmk-gmw@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH] qt5: Update to Qt 5.11.0
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
X-List-Received-Date: Fri, 15 Jun 2018 05:44:00 -0000
Content-Type: text/plain; charset="UTF-8"

There's existing bug report for GCC that matches this problem:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=82882
It's been fixed for one case, but not for all.

On 8 June 2018 at 07:21, Samuli Piippo <samuli.piippo@gmail.com> wrote:
> On 6 June 2018 at 23:05, Martin Jansa <martin.jansa@gmail.com> wrote:
>> On Tue, May 29, 2018 at 12:25:56PM +0300, Samuli Piippo wrote:
>>> Add recipes for Qt OPC UA and Qt WebGL platform plugin.
>>
>> Unfortunately qtremoteobjects is causing gcc 8.1 to segfault
>> during the build:
>> http://errors.yoctoproject.org/Errors/Build/60747/
>> the same with slightly older SRCREV currently in meta-qt5/master:
>> http://errors.yoctoproject.org/Errors/Build/60753/
>>
>> Can you check what in qtremoteobjects is triggering that and report the
>> issue to gcc?
>
> We'll look into this.

