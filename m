Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ua0-f196.google.com (mail-ua0-f196.google.com
	[209.85.217.196])
	by mail.openembedded.org (Postfix) with ESMTP id 5D1C471A31
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Jan 2017 12:35:12 +0000 (UTC)
Received: by mail-ua0-f196.google.com with SMTP id i68so55156481uad.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Jan 2017 04:35:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-transfer-encoding;
	bh=DcTGxw3eTbV8AXY4LLdzQ/QZRJ3sP4lkEQZBWnd3rBI=;
	b=Scs8/R3UqXfN816cVkj/qtawdFl/42drYmvFX4ilFjvScXx8ugREltIWyfmahqOuks
	Q3o3KMtQQRgh9wZmjfa/eqo59LO2aAw6X79yu3/9SjnUWX5cDe3cuDaFsk2yc1sdgpI1
	4Xv25P1Yr9HJ97EdX35iuOc3SdAeLF7HH91ZbtiAyoAG1BvbGCdqi+QbUvkojadzuwBH
	iXE0TFIidhAlCl6Fc2KpF2amaA4zRgUcj7Ll2vLkJMtRjKTXPT/7/Qo9gdkdgA5zxrDa
	26uN10NCwyAiHb9vq6Iq2/5VKZo1gnjLAMc9Wv3H2Ck7SDjW9yhwfbfndlG2lr5jnmYT
	DbZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-transfer-encoding;
	bh=DcTGxw3eTbV8AXY4LLdzQ/QZRJ3sP4lkEQZBWnd3rBI=;
	b=N80UsLRVDiSY4965KtgnawZkR0SsflpLIhK7mPPK+QGbM4YlrVQZWTQxKhAUiI5fUg
	3iv98p8H67Ca684CtQ5ogqj/wSdD1dL5rP2wcnI1rUwMLrcdkfOlxwl3+ePUQBL1JfKa
	XJ79nyNSbGG+XqtzuLnPNnRRKAi4XMRvKq7YG4sQhSRAMFGRllVWKWP7uRMqhXYG6siE
	jeTECUN/gVrVSCN4sivKzhXEl40wuNOsYYGcDtqKwXtPTHY2QM/PfDDQe1NgUfyjxXC3
	X/vaC/0ukcn3JYW07ohoYJiCZE54Yfp1Sed0xcanYrhEltWN2b4OkU2JxOpPvg349CSW
	4NAw==
X-Gm-Message-State: AIkVDXKwfe6Y3Zllq4r+xEI0TNtAEEu7NW48pUfbT92ACPRukS1cg4fgB5oy7mcUxeq9V04xeCQfi5RSgDRyfQ==
X-Received: by 10.159.35.15 with SMTP id 15mr4509740uae.47.1484138112289; Wed,
	11 Jan 2017 04:35:12 -0800 (PST)
MIME-Version: 1.0
Received: by 10.176.69.246 with HTTP; Wed, 11 Jan 2017 04:35:11 -0800 (PST)
In-Reply-To: <949c3c51-85ac-75b8-9a13-61176d7a43c2@linux.intel.com>
References: <1484074127-21458-1-git-send-email-schnitzeltony@googlemail.com>
	<1484074127-21458-2-git-send-email-schnitzeltony@googlemail.com>
	<CAAPZna1k+N+gbqb2n+fOLpmE6=RLasGku9rR7zebHvJRex-Htw@mail.gmail.com>
	<CALbNGRT2CMU03HQzC3-_J7UXR5U_RzkmHNROHyrC3kG2RZxOjw@mail.gmail.com>
	<CAAPZna2vG6pz3_jC=3PSswpBTb4zAaZZRpF9ooKGE-OSioxLEg@mail.gmail.com>
	<CALbNGRQ96mC8=tCLXpauUoDbz9zpD=cvztkaCiezta03V865Sw@mail.gmail.com>
	<949c3c51-85ac-75b8-9a13-61176d7a43c2@linux.intel.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Wed, 11 Jan 2017 13:35:11 +0100
Message-ID: <CALbNGRT-f-yFag_OQhK9Ra_FqEL4PHBGgV7JGtrs5y_REqbETQ@mail.gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-browser][PATCH V2 2/3] firefox: use pkg-config to find nspr
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
X-List-Received-Date: Wed, 11 Jan 2017 12:35:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 11, 2017 at 1:31 PM, Alexander Kanavin
<alexander.kanavin@linux.intel.com> wrote:
> On 01/11/2017 02:22 PM, Andreas M=C3=BCller wrote:
>
>> As far as I can remember there was an announcement by Alexander
>> Kanavin to change patching to more restrictive mode so that the full
>> three lines before/after change must match. Will redo patch creation
>> based on firefox 45.6..
>
>
> This hasn't yet happened. First we need to fix a ton of oe-core recipes, =
and
> we also need to add the capability for automatic patch rebasing to devtoo=
l
> (because this change will break recipes across all layers, and we need to
> make it easy for people to update patches).
>
> Alex
Thanks for this information. Unfortunately this leaves me out of ideas
why the patch does not apply for Fabio...

Andreas

