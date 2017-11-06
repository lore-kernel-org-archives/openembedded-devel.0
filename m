Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-yw0-f169.google.com (mail-yw0-f169.google.com
	[209.85.161.169])
	by mail.openembedded.org (Postfix) with ESMTP id 810C778453
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Nov 2017 11:50:57 +0000 (UTC)
Received: by mail-yw0-f169.google.com with SMTP id z195so7539506ywz.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Nov 2017 03:50:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=WcZGBvTc9poi/zSzY7vbZcLMyWPNNmd909NbY98OZtk=;
	b=uzGx54lAyBE3CpmxqW880eirxXHX8vICVCjxiZ7ESMa+4yuFwuYE2/1t3aUCcqs6CC
	i0yQiidacQF6vSMtJk+zW/v3Ge/1543CvttKluHu2kbLage57Tm/enrig6f4tUfuBtnk
	YQVc7MkQWR0ZH1p5z7W7a9VPFrkZSnBDikhI9AzYFknqcMwS5VKk1bJoXPBJpyYdgqhL
	eFewjD+2KjOjTzWXRqymeUaspxCVRVcqZVSwrKtuVCpIJW72+gpkFphai3zmhaONjZNy
	GMAWHJ+QL7yMkB43rI2QzpuoTr+gMBnnuVgVgsXs8hCX4dIfnB667TPTbULUmWVAXr4J
	jFMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=WcZGBvTc9poi/zSzY7vbZcLMyWPNNmd909NbY98OZtk=;
	b=Lz8HnmIP7QRt6QLfZhxltI/cBfrQ+D+N+LUHes51fG/M7ujk0PTXjbjE4/IB9HxISq
	51u9HM8dZSCHsDA9Ucr5ujcxFKIFOtCc6KRWHW0fkmOtB5qkQPKA6Zlb8cnqJ6EN+gvQ
	wLlq8qA+UgyTPjYNusZuZapLgYnmmLSNBULBPXWmLqCcx7WMYBoJiXMv99SWIvQYdHxb
	Hu9J0ryZVq8hekuME4x5EzBWAzEiaxAxiqfEcxIfTH4OhqtjAalW2RL7XI/hYsAyrJ61
	Vo7ydT7rriq+Jv2KHqkdlmJPOblxlV9A76eKzmoevwcH6YcXj3TYn5sGXmeVbJ3zadjL
	aaug==
X-Gm-Message-State: AMCzsaWuEw5D7ij2XOPEcDaeTYRnkh7IjOqHCqEOHBpfIf0v4SyHk26c
	1ByRG5cv1isx1bS/CJhroY8dNeWIFHHzNxcy54k=
X-Google-Smtp-Source: ABhQp+RfPsC0GIjgBKkbX+GVkEyl+3SIqaXRuAD+Wr1LcJ2Tu0a64BZ3f9cUoIBlbkUCLJCC4tEbAftpNlqb2AuGVZU=
X-Received: by 10.37.188.197 with SMTP id l5mr9583357ybm.365.1509969059341;
	Mon, 06 Nov 2017 03:50:59 -0800 (PST)
MIME-Version: 1.0
Received: by 10.37.162.136 with HTTP; Mon, 6 Nov 2017 03:50:58 -0800 (PST)
In-Reply-To: <CALbNGRSy0-Y=oLGbR+ON0jSitnEzkyMJevYtMhf--1+i-p7JhA@mail.gmail.com>
References: <20171102103129.3703-1-schnitzeltony@googlemail.com>
	<20171102103129.3703-2-schnitzeltony@googlemail.com>
	<CAMKF1spbF2bJDQK_htfwpEKRgh1MzZEpkxpyde1x1dfoaqNYhw@mail.gmail.com>
	<CALbNGRRrpSkAy8vkVQ33P-ONLdWqXnT_Oa1tViORfBx2R_Wjbw@mail.gmail.com>
	<CALbNGRSy0-Y=oLGbR+ON0jSitnEzkyMJevYtMhf--1+i-p7JhA@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Mon, 6 Nov 2017 12:50:58 +0100
Message-ID: <CALbNGRTFUBUKNtZueSi_cDWOMiqMPxf482NR3kjyvduTA33oMg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 01/10] tumbler: make thumbnails work again
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
X-List-Received-Date: Mon, 06 Nov 2017 11:50:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 2, 2017 at 6:07 PM, Andreas M=C3=BCller <schnitzeltony@googlema=
il.com
> wrote:

> >  PACKAGECONFIG[gstreamer-thumbnailer] =3D "--enable-gstreamer-thumbnail=
e
> r,--disable-gstreamer-thumbnailer,gstreamer1.0 gstreamer1.0-plugins-base"
>
>> >
>>> > +do_install_appen() {
>>>
>>> typo
>>>
>>> Thanks and LOL: In this way this patch does simply nothing and I could
>> swear having tested it. @Martin: Can you please ignore this one until I
>> checked and come back with V2 (if really necessary).
>>
>> I checked: This patch (created on April 4th) was a leftover and does not
> make sense: Link is created properly / thumbs work fine.
>
> Thanks Khem for eagle eye :)
>
> FWIW: I removed the patch from git repo mentioned in pull request.

Andreas

