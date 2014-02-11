Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f176.google.com (mail-ie0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id 1772F6EE49
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Feb 2014 15:09:12 +0000 (UTC)
Received: by mail-ie0-f176.google.com with SMTP id tp5so4580538ieb.35
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Feb 2014 07:09:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=OVE50YuGu9GaA6gh/aAKGvICWM+qQBHgXg8cnesmxSI=;
	b=W3thHs84ylmjRtpZHvllz5LgVnLVI2Xvg4Ted0tmf1xmjhiAFgrrmxVlGcC2SIebZF
	TGR0ZIzJ0bW92e/RYfShaMFzMzTyfsz7Dm8QilZBpaPuIPWJsUxJgoD3Qz+i4y1TwdMt
	dh8isuxw4WAykBACLRKEIc2Mj6/c0TfFGRc8dLqtIbzNACIchPqx0nmp/IBXNTIeHj4K
	+YgJ9ZLU1eeDCskDn3ZmWkaoXcr/Y+Ymarz8L8ZFCtaY/MZo8rmMYrbMrnL4iJcuQMsH
	chSExZOMyMzrz5NpX+9UzbKkDVZAfvWpo3K2x8BTGAtVWa4fnHYCpFkXPuVa/MbBi5Fy
	7qug==
X-Received: by 10.42.85.140 with SMTP id q12mr1865230icl.51.1392131353296;
	Tue, 11 Feb 2014 07:09:13 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.8.137 with HTTP; Tue, 11 Feb 2014 07:08:42 -0800 (PST)
In-Reply-To: <CAMCfZKH74FMry8-LvajWMEMbx0fEF2OzmZV+iDCkZ6djUCXsrA@mail.gmail.com>
References: <CANx9H-DMjo0JaHyGqgxh31wX77Z_OmpjF=cgAayLKyYcKLenxw@mail.gmail.com>
	<FC0A8257-46FF-46AD-8061-AD3396E8B243@gmail.com>
	<CAMCfZKH74FMry8-LvajWMEMbx0fEF2OzmZV+iDCkZ6djUCXsrA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 11 Feb 2014 07:08:42 -0800
Message-ID: <CAMKF1sq=9ycj9XRr9PrMopyy9qpHg_cyxy_6fH++Nq6MqsGU8g@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: xbmc build failing
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
X-List-Received-Date: Tue, 11 Feb 2014 15:09:12 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Feb 11, 2014 at 2:15 AM, Diego Sueiro <diego.sueiro@gmail.com> wrote:
> On Tue, Feb 11, 2014 at 2:10 AM, Khem Raj <raj.khem@gmail.com> wrote:
>
>> seems like its not including proper headers may be you need to include
>> unistd.h
>>
>
> Not sure about this. The strange thing is: When using poky as DISTRO this
> error is raised, but when using Angstrom instead, the error isn't raised.
> Could it be related to eglibc version? How can I check which version is
> used on both distress?

also check version of gcc in meta-angstrom search for ANGSTROM_GCC e.g.

