Return-Path: <max.oss.09@gmail.com>
Received: from mail-ob0-f178.google.com (mail-ob0-f178.google.com
	[209.85.214.178])
	by mail.openembedded.org (Postfix) with ESMTP id 13F7575EE7
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Nov 2015 11:55:46 +0000 (UTC)
Received: by obbza9 with SMTP id za9so138291705obb.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Nov 2015 03:55:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=xUPQtSxFz6Y+dEO3kUFZwhjZTeLLYM30ko6bXjVdkO8=;
	b=Mm6eWPukJ8LAMCWJrWnYA78/1n4vas3XRzAoLunYEyfsPwMyXNdcYRv6bqfuHQjI5J
	Za8v7XenNF3xD31IhruPP7pcGxh14AIlgjdLRg6b2G2jaQB2e9WOIgQ9buwow5fozVpN
	Xh7YfZsZsaRCwPn5NlSd17gnrvWHSomq3lpquAULbo+uHzyBsOp1nF4Eshf+lNJ56bsU
	Z8A/Lk4rmWPhgIg/7EUjttrcJ/T3jQNvgzV1Mn81Rv55G3M0isimx27PwQVdboXcVx0+
	06rM/oI3uPiPWBN2zWRZkgEvjJYGlnpjFYXjrcRq/3L2Vnc6L2oFUPn5khr64eks0eEv
	8egg==
MIME-Version: 1.0
X-Received: by 10.182.210.234 with SMTP id mx10mr15899251obc.47.1447070146350; 
	Mon, 09 Nov 2015 03:55:46 -0800 (PST)
Received: by 10.202.177.86 with HTTP; Mon, 9 Nov 2015 03:55:46 -0800 (PST)
In-Reply-To: <CAP9ODKrMMxvOY02BGF__TToUMiUGdveB5FqSWn+-yEkiLVZCFA@mail.gmail.com>
References: <1446898829-21243-1-git-send-email-max.oss.09@gmail.com>
	<1446898829-21243-6-git-send-email-max.oss.09@gmail.com>
	<05423CF5-47B2-439F-A64C-F89B5F9BEFD8@gmail.com>
	<CAP9ODKrMMxvOY02BGF__TToUMiUGdveB5FqSWn+-yEkiLVZCFA@mail.gmail.com>
Date: Mon, 9 Nov 2015 12:55:46 +0100
Message-ID: <CAEHkU3VsXAsWLcWYTK=gA7V=Xc53pPnX7=y=pT6-6y1peyfMZg@mail.gmail.com>
From: Max Krummenacher <max.oss.09@gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-browser][PATCH v2 5/5] cef3: fix build with gcc 4.9.4
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
X-List-Received-Date: Mon, 09 Nov 2015 11:55:47 -0000
Content-Type: text/plain; charset=UTF-8

Hi Otavio,


2015-11-09 11:51 GMT+01:00 Otavio Salvador <otavio.salvador@ossystems.com.br>:
> Max,
>
> On Sat, Nov 7, 2015 at 5:52 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>> On Nov 7, 2015, at 4:20 AM, Max Krummenacher <max.oss.09@gmail.com> wrote:
>>>
>>> During the final link we get errors like this:
>>> .../4.9.4/ld: warning: hidden symbol 'sqlite3_temp_directory' in obj/.../sqlite.sqlite3.o) is referenced by DSO .../usr/lib/libsoftokn3.so
>>> .../4.9.4/ld: error: treating warnings as errors
>>> collect2: error: ld returned 1 exit status
>>
>> This is gold linker specific so you should disable these warning when ld-is-gold is in DISTRO_FEATURES. Its a big broad brush so lets
>> try to make it small as we can.
>
> I ended applying it before seeing Khem's comment; can you make the
> change as he proposes and send a new patch?

sure, I will put up a patch tonight and send a new patch just for that issue.

Max

