Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f196.google.com (mail-ua0-f196.google.com
	[209.85.217.196])
	by mail.openembedded.org (Postfix) with ESMTP id 1B9FF71E51
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Feb 2017 17:18:16 +0000 (UTC)
Received: by mail-ua0-f196.google.com with SMTP id d5so882376uag.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Feb 2017 09:18:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=Wo8tKQgRx6WMzSTgITFoFGN5cXanPk3zPL6VHtBJlKc=;
	b=L0n2sPnp/cshvHlSVstj/iUu9RvWdzwxkkJP82HYl6dgxcbQosoPKEc5OFePZvTEFe
	CaFjyRDu2y0fC6menRbwwAO+9qGJEHQHqJv6qBBLlaoL/5CANBAsFU6KR4jiWcr+PgUh
	Ux0MjM/B8YpdRoj3/iBbsqxxJBKXWF1g+4p19zLbHvNyjMKBYeKhf24mjGJPB65hgjXS
	C6S/Qm9RPLGi+wae+obtrbn0/YGtZjAQaZa7VKGPfw6nFBYuzedVENdtvY871yF370xk
	mctaFQH0Uz97jmtuMKjNaixc2+Rp3JEah8Vt7lNoWx2TiqWoByl2Und6G3X/tVMA1j1Q
	N/bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=Wo8tKQgRx6WMzSTgITFoFGN5cXanPk3zPL6VHtBJlKc=;
	b=sY+0qMj825BeRrX8rDlRr9Hv2xpY1i7ELX8XdTITGVLflRoSbyYPmzS9cnbZzsXF12
	UhJE9SJoKDSrFZNMJFtZhVb0XgYb7FI/ECxIf0xUb7vDy5EGQPDfstmLtyBBgCe1hmx7
	25/nYiTcp5l1Z/9KJhg5TvDiEQ0RQUAYDP7DCTKRc2Manzfb1YDaQcN1/e68NRuhk2kz
	KnRME+LYUlmymakaQN68eBzw8suPaRZlMClKgAKSATiKYM0R9bDeuA0E7wtP5lDJBdIM
	CHN0vFd0eDA0jn3pBpvp0RXQ1b4LCy+GifJxxGOaOspu9jPx0difA+zqe8dCQTJw8GHa
	0wlw==
X-Gm-Message-State: AMke39kPJpVCHJ0NsGgnSGVp/dxIHk4GxN3SGN7nBEUJoHM6t2jF4NXY8ulYLNdjLAQOHKbuJGfnjvOfeATGPA==
X-Received: by 10.176.90.199 with SMTP id x7mr2116684uae.165.1486660696333;
	Thu, 09 Feb 2017 09:18:16 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.48.222 with HTTP; Thu, 9 Feb 2017 09:17:45 -0800 (PST)
In-Reply-To: <1486660318.13854.105.camel@intel.com>
References: <cover.05852f1b820c067f96dd93729e6fdb949d51579d.1486546542.git-series.patrick.ohly@intel.com>
	<c480e4bea612959118bcdbc09e129084fd1d5866.1486546542.git-series.patrick.ohly@intel.com>
	<CAMKF1spq2eiKHXrz19ZzRWmwzWUKsSSHbunLfqRND98SjkHgVg@mail.gmail.com>
	<1486660318.13854.105.camel@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 9 Feb 2017 09:17:45 -0800
Message-ID: <CAMKF1sqH1XGcG47CGp-CcgE5EYJ2_JE6wBw9V3=XDJ9-=LUHsw@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 1/4] lvm2: remove unbuildable 2.02.138
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
X-List-Received-Date: Thu, 09 Feb 2017 17:18:19 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Feb 9, 2017 at 9:11 AM, Patrick Ohly <patrick.ohly@intel.com> wrote:
> On Wed, 2017-02-08 at 20:21 +0000, Khem Raj wrote:
>> Can you check if this is the last gpl2 version
>
> According to the recipe, both 2.02.138 and 2.02.166 are under LICENSE =
> "GPLv2 & LGPLv2", and that also seems to be what the current code is
> licensed under: https://git.fedorahosted.org/cgit/lvm2.git/tree/
>
> So GPLv2 vs. GPLv3 wasn't the reason for keeping the old version.
>

Thanks for confirming.

> BTW, do all mails from openembedded-devel have Reply-To:
> <openembedded-devel@lists.openembedded.org> set? openembedded-core
> doesn't seem to have that.

yeah I guess reply-all will send to all but I never tried that
>
> I have a mail filter in place which will bring personal replies to my
> attention sooner, but Reply-To to the list defeats that.
>
> --
> Best Regards, Patrick Ohly
>
> The content of this message is my personal opinion only and although
> I am an employee of Intel, the statements I make here in no way
> represent Intel's position on the issue, nor am I authorized to speak
> on behalf of Intel on this matter.
>
>
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

