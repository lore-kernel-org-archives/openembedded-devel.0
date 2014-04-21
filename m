Return-Path: <kergoth@gmail.com>
Received: from mail-la0-f49.google.com (mail-la0-f49.google.com
	[209.85.215.49])
	by mail.openembedded.org (Postfix) with ESMTP id 0182265D07
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Apr 2014 14:36:00 +0000 (UTC)
Received: by mail-la0-f49.google.com with SMTP id mc6so3207978lab.22
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Apr 2014 07:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:content-type;
	bh=G6kxTMeamUCNiPz3p7NMMqhh/YeI6zo0UVT8Z9xHcn8=;
	b=BXHMNwPvoKGD9rezgizByA/J30r1wFimfWRE4iOjB/SVh+mCC/CCtvUHeVU0mpoZ0f
	TksAViEGHuDLlKaiGaxOUnYq+duznPqIWAxjdzyo4Suub5Yy9ZIVfvthfMGZVAH3uFor
	KyQKnJJvGBB18l6jQPaB9g9om8Bqy8sxsSZFbSbyxBEFd+KxFTwmktVY/Y6ozVz0ubK3
	JfHbdcRY5DZ1ph9pj0sMUdWNwpE5x5ALm13/7XU0jC/p2Zcshb/XkPSHuyycw+A1F33q
	aJZKR9Kvq7ceQ7C4lDHRE0muR4UCqwApqCCSAZERn83+5IR9d84hOYrH7H0SekrhBqMO
	n5oA==
X-Received: by 10.112.147.36 with SMTP id th4mr2834387lbb.32.1398090960603;
	Mon, 21 Apr 2014 07:36:00 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.35.194 with HTTP; Mon, 21 Apr 2014 07:35:40 -0700 (PDT)
In-Reply-To: <CALYKT1jF=ZHeU=cYgA55O5_SjJeCVLWMdR=Gwr9B0U_UVjYuZQ@mail.gmail.com>
References: <CALYKT1jF=ZHeU=cYgA55O5_SjJeCVLWMdR=Gwr9B0U_UVjYuZQ@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Mon, 21 Apr 2014 07:35:40 -0700
X-Google-Sender-Auth: Bz5Eu2SZODu9Iwbj2VXZfj4nrbE
Message-ID: <CABcZANk8XttZ3JBSoE9XDfmc0FWCW9K-5SRT080RHRuoFXc5dw@mail.gmail.com>
To: Openembedded Discussion <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: How can I use / enable strace of the image of oe-core?
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
X-List-Received-Date: Mon, 21 Apr 2014 14:36:02 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Apr 21, 2014 at 4:56 AM, Journeyer J. Joh
<oosaprogrammer@gmail.com>wrote:

> oe-core for MSM is just a clone of oe-core.
> And mine is open via codeaurora :
>     git://codeaurora.org/quic/le/openembedded/openembedded-core
>     https://www.codeaurora.org/xwiki/bin/QLBEP/WebHome
>
>
> I want to use strace to debug my application on the image of oe-core (for
> MSM).
> I mean I want to use it on target embedded system.
>
> And I found strace from my oe-core source tree:
>     oe-core/meta/recipes-devtools/strace
>
> And there are:
>     strace-4.6/  strace_4.6.bb
>
> This gives me impression that I can use strace from my target system.
> But there is no source code for strace... in it!
>

There's almost never source for anything in oe-core, ever. Sources are
downloaded from upstream locations on the internet, patched if appropriate,
and built by bitbake.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

