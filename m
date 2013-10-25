Return-Path: <cazfi74@gmail.com>
Received: from mail-qe0-f41.google.com (mail-qe0-f41.google.com
	[209.85.128.41])
	by mail.openembedded.org (Postfix) with ESMTP id 81F646D35F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2013 10:06:03 +0000 (UTC)
Received: by mail-qe0-f41.google.com with SMTP id x7so2198518qeu.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2013 03:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=u+PBba05Iwk3DEjd4tErF0/+c3883PcJU5bmGMvjNf0=;
	b=wQdfBlLgoxgCZVs10WhPqHJMA1UhpASUo9gg6snbovSYlLtdqk3Za72nWnpBlCWmFX
	8g+5ejLjrme15nJ83JxwzrjxhqezsbGUOecO/LiBudmjWQr3JIW2ah6cG9uA6Hv25r4Y
	DtuRJE40Be2IRAZ5aWFi10SYGUByHUB3itkKFyjhsb5hizvZrW6shF63tNmdSrm+I7wU
	qdgt66yEHgiO3Ljo8tf+7xMpPQGENub2/PAl9cTm3ZL9zTJsWSf4hWX3248bsTWhtW3P
	+iW2s97cAC23mQRujhrKDbDLZtBnXn2DGMhrSpkdPZFga0dft76pGJErJrlArUHYogxE
	iVMA==
MIME-Version: 1.0
X-Received: by 10.224.138.4 with SMTP id y4mr9953883qat.65.1382695565108; Fri,
	25 Oct 2013 03:06:05 -0700 (PDT)
Received: by 10.224.127.4 with HTTP; Fri, 25 Oct 2013 03:06:04 -0700 (PDT)
In-Reply-To: <CA+chaQdxSVkwbcEttCZo5SA38QS7yVHhwqyXeHp6idxi389SpA@mail.gmail.com>
References: <1382691396-3929-1-git-send-email-cazfi74@gmail.com>
	<CA+chaQfqyNSS+PvjZk8eGKRi69iJJQ8dhxX4=HpNfA6-JpgZAQ@mail.gmail.com>
	<CA+chaQdxSVkwbcEttCZo5SA38QS7yVHhwqyXeHp6idxi389SpA@mail.gmail.com>
Date: Fri, 25 Oct 2013 13:06:04 +0300
Message-ID: <CAF6bG8dJTgWj02PEDzEgTe4ORtUvkrO1v0s5pjnQ0Zcq_ByJ0g@mail.gmail.com>
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] lua5.1: apply lua.org patches for lua-5.1.5
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
X-List-Received-Date: Fri, 25 Oct 2013 10:06:05 -0000
Content-Type: text/plain; charset=UTF-8

On 25 October 2013 12:53, Martin Jansa <martin.jansa@gmail.com> wrote:
> Sorry sent before finish
>
> http://lists.openembedded.org/pipermail/openembedded-core/2013-October/085502.html
>
> can we just upgrade to 5.2.2 in meta-oe instead of patching 5.1.5? Does it
> work for your use-case?

 lua-5.1 and lua-5.2 are somewhat incompatible. For example freeciv <=
2.4 use lua-5.1 and cannot work with lua-5.2, freeciv >= 2.5
(development version) use lua-5.2 and cannot work with lua-5.1. For
some things there simply is no implementation that would work with
both 5.1 and 5.2.
 So I need we need to add lua5.2 at some point, but it cannot replace lua5.1.


 - ML

