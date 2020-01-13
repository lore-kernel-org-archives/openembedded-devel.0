Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ua1-f67.google.com (mail-ua1-f67.google.com
	[209.85.222.67])
	by mail.openembedded.org (Postfix) with ESMTP id 931CC7FC98
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Jan 2020 19:14:10 +0000 (UTC)
Received: by mail-ua1-f67.google.com with SMTP id c14so3781154uaq.11
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Jan 2020 11:14:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=nfgc6iWEFCuBsOjr9ovJUxT8Wmu5gSYuNoc8AqjIOaM=;
	b=C6mJuVE/CnuVYim42vKhADG7ueR39VSzTWnjw5U3um0s6cbfYNYCz1qHdA+lrM62Rc
	iSkQKpGqZ5oJIkhTDfSuEDYCjrZWtq6kXusnk4oDz9iWrM8jKB7u2i0yWtdOuQSxsPa6
	v7RnYXColR9hcyJKOgtkAscLP9a+nLsGR8B1FoHALysysel3rh2Xbg3K4HHa70f32d/v
	vZWuAI3LkmzhohXe50ffJhFjzMVOfJ2n53X2jfOUsI8/NECyvCyOWWEUeOZouezOvxL3
	oui92F4L8HpIh2SKiMP3fXMJy1o9qPUqWg1UNJtBv8K7sL3v7UOFoYuyGpJeuReV7o+3
	QVWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=nfgc6iWEFCuBsOjr9ovJUxT8Wmu5gSYuNoc8AqjIOaM=;
	b=a0SsSBfKTBn7zLJBzFQGwSB/QhU5u5Ojg9y/Cy25zjMng7469rgTBEICLBJBxLIYSL
	veXc0b7Fv+ep1uacYWxCen1onyzrgSGYygEBoSYy2jpCTSolQ2J1rfnzWeraex7R0L2J
	/Rux+T0Z06TcDXK43mw9062um5baPB/Wkfz/ineK4zEKOvk93JcXD5jfm4HZzFFr4cfn
	McivYFrzq/yCKOJoUsbOMVQ3C2WLauxlCuOl/rAwUrA2hTaTida2eEL6RJ4SV/Cyv3SP
	Nl7RjYbOQjWf5EZD61sswqAKgo4mAZq3PG9zBRNy/lNLB/gwRsmrlItnWkW5BcOXJLhP
	4WXQ==
X-Gm-Message-State: APjAAAVq9G5nwI9CrG5AIw7ss0KhqtdPN04Dv44SMt4l55vmhMKwVVOy
	p+ViSL97hYH2fYFrGZ38LFzZkl0BMayxT5Au4ZE=
X-Google-Smtp-Source: APXvYqyHRA+ELE13K/x5TCsUZqMPAFWPRurOu9iq/a2ASkV5oeIV35qVZBtwBUlhnh+OjJmjHEnMv+GFWeBwUeVQ6ZM=
X-Received: by 2002:ab0:6894:: with SMTP id t20mr8493268uar.100.1578942851379; 
	Mon, 13 Jan 2020 11:14:11 -0800 (PST)
MIME-Version: 1.0
References: <20200113170209.95601-1-alex.kanavin@gmail.com>
	<20200113170209.95601-3-alex.kanavin@gmail.com>
	<CA+chaQec=MyVT6a7FkmKPG5izt5UydqhSXqv6-POKh558Y4etA@mail.gmail.com>
	<CANNYZj-j42s83n9RsWoDpKyTpQUhWMGx9=82zVt0Doa=MDFy9g@mail.gmail.com>
	<CA+chaQdXtycq=z3+2i2VK7+7TDQKjU3JCcE4nFxcav37z1cOwQ@mail.gmail.com>
In-Reply-To: <CA+chaQdXtycq=z3+2i2VK7+7TDQKjU3JCcE4nFxcav37z1cOwQ@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 13 Jan 2020 20:14:00 +0100
Message-ID: <CANNYZj_p5cHwcM8BntPOPGC-vSHQRBVpKF5WU8UHssPG=k42jg@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
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
X-List-Received-Date: Mon, 13 Jan 2020 19:14:11 -0000
Content-Type: text/plain; charset="UTF-8"

It does not figure out the 2/3, and still forces a conflict resolution.
Thanks for doing it (if you correctly resolved the conflicts), but I still
think it's entirely unnecessary.

Alex

On Mon, 13 Jan 2020 at 19:58, Martin Jansa <martin.jansa@gmail.com> wrote:

> Doing "git mv" in interactive rebase of the first commit should be really
> easy to do and if git doesn't figure out the 2/3 automatically, than you
> can still check that the rebased 2/3 looks like the current 3/3 did (and if
> doesn't then just squash git diff into it), I don't see how this is error
> prone.
>
> On Mon, Jan 13, 2020 at 7:52 PM Alexander Kanavin <alex.kanavin@gmail.com>
> wrote:
>
>> Because I already had the patches ready, and simply added the move
>> between layers on top of them. Placing it to the right layer requires
>> either a patchset do-over from scratch, or resolving a merge conflict with
>> possibility for mistakes.
>>
>> Alex
>>
>> On Mon, 13 Jan 2020 at 19:15, Martin Jansa <martin.jansa@gmail.com>
>> wrote:
>>
>>> Why don't you add it to the right layer in the 1/3 change?
>>>
>>> On Mon, Jan 13, 2020 at 6:03 PM Alexander Kanavin <
>>> alex.kanavin@gmail.com> wrote:
>>>
>>>> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
>>>> ---
>>>>  .../files/0001-sysprof-Define-NT_GNU_BUILD_ID-if-undefined.patch  | 0
>>>>  {meta-oe => meta-gnome}/recipes-kernel/sysprof/sysprof_3.34.1.bb  | 0
>>>>  2 files changed, 0 insertions(+), 0 deletions(-)
>>>>  rename {meta-oe =>
>>>> meta-gnome}/recipes-kernel/sysprof/files/0001-sysprof-Define-NT_GNU_BUILD_ID-if-undefined.patch
>>>> (100%)
>>>>  rename {meta-oe => meta-gnome}/recipes-kernel/sysprof/
>>>> sysprof_3.34.1.bb (100%)
>>>>
>>>> diff --git
>>>> a/meta-oe/recipes-kernel/sysprof/files/0001-sysprof-Define-NT_GNU_BUILD_ID-if-undefined.patch
>>>> b/meta-gnome/recipes-kernel/sysprof/files/0001-sysprof-Define-NT_GNU_BUILD_ID-if-undefined.patch
>>>> similarity index 100%
>>>> rename from
>>>> meta-oe/recipes-kernel/sysprof/files/0001-sysprof-Define-NT_GNU_BUILD_ID-if-undefined.patch
>>>> rename to
>>>> meta-gnome/recipes-kernel/sysprof/files/0001-sysprof-Define-NT_GNU_BUILD_ID-if-undefined.patch
>>>> diff --git a/meta-oe/recipes-kernel/sysprof/sysprof_3.34.1.bb
>>>> b/meta-gnome/recipes-kernel/sysprof/sysprof_3.34.1.bb
>>>> similarity index 100%
>>>> rename from meta-oe/recipes-kernel/sysprof/sysprof_3.34.1.bb
>>>> rename to meta-gnome/recipes-kernel/sysprof/sysprof_3.34.1.bb
>>>> --
>>>> 2.17.1
>>>>
>>>> --
>>>> _______________________________________________
>>>> Openembedded-devel mailing list
>>>> Openembedded-devel@lists.openembedded.org
>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>>>
>>>

