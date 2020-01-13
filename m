Return-Path: <martin.jansa@gmail.com>
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66])
	by mail.openembedded.org (Postfix) with ESMTP id 21D1D7FC98
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Jan 2020 19:17:55 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id v28so9547030edw.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Jan 2020 11:17:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=2lfyVco2hyY8rBsl/EBkJIvAw9190xEQ1PB78dxHw4w=;
	b=ATnmU4KfcxqsQ1t5BNmaarOqws62bhV2734BvUOBQBVZ40fxP55xJrXkiAgsk8dap2
	DV7KvGxk2tvDv7t8VVIaTr12hiiLdq0p9OLxExWJKCxqN1v3Wij3vV8x2yzHDzN3Rg01
	KP9ufusUVd9ZXW5mPJRU25jczW65/wDyG75q7rhAdLjXVE+5IaB5UEWGBDY3Nyn5Wl4S
	lCxYMhrEWKLHRnc/GVCqu5RAGNb38VX0g3BUu49UBEbVmQfc35MIqSUGDm8JEj7gh9Tq
	qjCl75LjWw25NJq3/aT3Jh8i0YdTz0eAJb9BMF8t7G35T17AoqxdvnbXd7KTCy8KVONP
	FYmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=2lfyVco2hyY8rBsl/EBkJIvAw9190xEQ1PB78dxHw4w=;
	b=B1o0wPh0ltcPx/mbSXourWYjsfrm9HjAfnEpF3t0nlVVDICVjbfHBm+66E4XFYg4vJ
	fpwHekitHBNiL6FOKbrv75ganHCEoXGbUvHu2cu0u6sHPGFZ2IXLNF9323YSc86tw+lH
	yG7yOzIecbbtrH6fPeBKfS8qj0XPo24b1+XfTceDTFb4n/kuv9IxqoQmokzEQNTwDbDy
	38zL72uVpOOCi6eOwAzRYOI0YwtN+M01PFu6poL4lEUnawudKAS9st5x/P7qF2FYkX+y
	HrDQGJZwSbHmUIWGnTAKaB5oyjAcEKLs7STuJNEaL2wjYCw9o+SPSMjIBs22Rw4jeT1g
	bmnA==
X-Gm-Message-State: APjAAAWq88nSTNZRo820aLez68nmctH993FRMMKzQ0d/GBXYuelZTGLN
	XaVJfpYcTaggs8oAzpghhEkeTYuVOxYs7M9SU+Y=
X-Google-Smtp-Source: APXvYqx18ayOnZ+IqsIh+34YsYha2j1EzBUo5VZvQnnNnPzKHW3bocj6xdNFEqRM3+t9hXv0KE7rG9azHNx3FRkZhyE=
X-Received: by 2002:a17:906:e0d7:: with SMTP id
	gl23mr18788412ejb.230.1578943075778; 
	Mon, 13 Jan 2020 11:17:55 -0800 (PST)
MIME-Version: 1.0
References: <20200113170209.95601-1-alex.kanavin@gmail.com>
	<20200113170209.95601-3-alex.kanavin@gmail.com>
	<CA+chaQec=MyVT6a7FkmKPG5izt5UydqhSXqv6-POKh558Y4etA@mail.gmail.com>
	<CANNYZj-j42s83n9RsWoDpKyTpQUhWMGx9=82zVt0Doa=MDFy9g@mail.gmail.com>
	<CA+chaQdXtycq=z3+2i2VK7+7TDQKjU3JCcE4nFxcav37z1cOwQ@mail.gmail.com>
	<CANNYZj_p5cHwcM8BntPOPGC-vSHQRBVpKF5WU8UHssPG=k42jg@mail.gmail.com>
In-Reply-To: <CANNYZj_p5cHwcM8BntPOPGC-vSHQRBVpKF5WU8UHssPG=k42jg@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 13 Jan 2020 20:17:44 +0100
Message-ID: <CA+chaQeRLhqmbWvXh5TPokUumfdtfdERkmcs6X1Rd2+AqMZHTQ@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 3/3] sysprof: move from meta-oe to meta-gnome
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
X-List-Received-Date: Mon, 13 Jan 2020 19:17:55 -0000
Content-Type: text/plain; charset="UTF-8"

Yo're welcome!
Current 2/2 is the same as 3/3 was, I wasn't resolving any conflicts.

On Mon, Jan 13, 2020 at 8:14 PM Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> It does not figure out the 2/3, and still forces a conflict resolution.
> Thanks for doing it (if you correctly resolved the conflicts), but I still
> think it's entirely unnecessary.
>
> Alex
>
> On Mon, 13 Jan 2020 at 19:58, Martin Jansa <martin.jansa@gmail.com> wrote:
>
>> Doing "git mv" in interactive rebase of the first commit should be really
>> easy to do and if git doesn't figure out the 2/3 automatically, than you
>> can still check that the rebased 2/3 looks like the current 3/3 did (and if
>> doesn't then just squash git diff into it), I don't see how this is error
>> prone.
>>
>> On Mon, Jan 13, 2020 at 7:52 PM Alexander Kanavin <alex.kanavin@gmail.com>
>> wrote:
>>
>>> Because I already had the patches ready, and simply added the move
>>> between layers on top of them. Placing it to the right layer requires
>>> either a patchset do-over from scratch, or resolving a merge conflict with
>>> possibility for mistakes.
>>>
>>> Alex
>>>
>>> On Mon, 13 Jan 2020 at 19:15, Martin Jansa <martin.jansa@gmail.com>
>>> wrote:
>>>
>>>> Why don't you add it to the right layer in the 1/3 change?
>>>>
>>>> On Mon, Jan 13, 2020 at 6:03 PM Alexander Kanavin <
>>>> alex.kanavin@gmail.com> wrote:
>>>>
>>>>> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
>>>>> ---
>>>>>  .../files/0001-sysprof-Define-NT_GNU_BUILD_ID-if-undefined.patch  | 0
>>>>>  {meta-oe => meta-gnome}/recipes-kernel/sysprof/sysprof_3.34.1.bb  | 0
>>>>>  2 files changed, 0 insertions(+), 0 deletions(-)
>>>>>  rename {meta-oe =>
>>>>> meta-gnome}/recipes-kernel/sysprof/files/0001-sysprof-Define-NT_GNU_BUILD_ID-if-undefined.patch
>>>>> (100%)
>>>>>  rename {meta-oe => meta-gnome}/recipes-kernel/sysprof/
>>>>> sysprof_3.34.1.bb (100%)
>>>>>
>>>>> diff --git
>>>>> a/meta-oe/recipes-kernel/sysprof/files/0001-sysprof-Define-NT_GNU_BUILD_ID-if-undefined.patch
>>>>> b/meta-gnome/recipes-kernel/sysprof/files/0001-sysprof-Define-NT_GNU_BUILD_ID-if-undefined.patch
>>>>> similarity index 100%
>>>>> rename from
>>>>> meta-oe/recipes-kernel/sysprof/files/0001-sysprof-Define-NT_GNU_BUILD_ID-if-undefined.patch
>>>>> rename to
>>>>> meta-gnome/recipes-kernel/sysprof/files/0001-sysprof-Define-NT_GNU_BUILD_ID-if-undefined.patch
>>>>> diff --git a/meta-oe/recipes-kernel/sysprof/sysprof_3.34.1.bb
>>>>> b/meta-gnome/recipes-kernel/sysprof/sysprof_3.34.1.bb
>>>>> similarity index 100%
>>>>> rename from meta-oe/recipes-kernel/sysprof/sysprof_3.34.1.bb
>>>>> rename to meta-gnome/recipes-kernel/sysprof/sysprof_3.34.1.bb
>>>>> --
>>>>> 2.17.1
>>>>>
>>>>> --
>>>>> _______________________________________________
>>>>> Openembedded-devel mailing list
>>>>> Openembedded-devel@lists.openembedded.org
>>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>>>>
>>>>

