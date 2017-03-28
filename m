Return-Path: <twoerner@gmail.com>
Received: from mail-vk0-f44.google.com (mail-vk0-f44.google.com
	[209.85.213.44])
	by mail.openembedded.org (Postfix) with ESMTP id 0CE7077A87
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Mar 2017 18:10:51 +0000 (UTC)
Received: by mail-vk0-f44.google.com with SMTP id z204so98286977vkd.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Mar 2017 11:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=zvVkXGcgrJ+Q9CPuEMvo1U8vWK5L8ITVxhoZnoD3+C0=;
	b=AuxAmEW4Io4XAXEI6M2EpiojvcedLMY+d8jL2ol0iGY61STM0aihqf8a04hMP9XVX9
	vv/e0U99q4ZUCQp5OMPjG7PkBs/isj607lnHdE4AoRIfRVMghTUljtgBlrqEXLNBgiBp
	zhumbUG0UEsiG6kBplBpGn5fdkf+7TmQl4xMVgBTdd7IArkwkQVAmOFQ/POezdPmkeCB
	IwhnykRB5uX7iJ1e5x7FT/6AR+Qm6to4qANto0B0X+KQ3Dcn3MzQBxHbjJn6/sw6GcPr
	7SlwOPZdHiBPTwvxxpZ3wZy6z42TPYa0L2HjKKO50d+2x7aQj0OGARk5JV6aFHOTfnWH
	qcOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=zvVkXGcgrJ+Q9CPuEMvo1U8vWK5L8ITVxhoZnoD3+C0=;
	b=mBXbOZDqH7sDlHHyHIkYlE0I6Sx2hiBqz27CuvB2ojw4AaPfbRe8cTtrZAqG667Lx/
	WIzVTR2u3u382aJUNiPQGuSjpBWCumg3qNWg7GBpUvdrP8FtNrSslC5g+2pAtV2B3Fcx
	zpySb7jw3ByHk4ertOwG6bpBoj90uGkKQB3Fmhg7feTlByUJHPSAvqICMSH70xNZnY8P
	aewzxWPL2a+s6VT8O/zjSoRPa8J4kH4dhV/XLAhOyTEGvr6EC6uLmfMV6vqNhnkLARcg
	gVsWmEmTFsteRTWzQsiKuLBuxhu2SYJlmmYYRxgf0m2z68dmpLRleC9EvYQDJAVOLHu+
	Yx/w==
X-Gm-Message-State: AFeK/H2pn3QbDrobARucw/AJEEQ87VBrVcaDunBA5bJShV/PGU1GXvOCxvKJG4rGJpPf60rVZE0ZllloC5HfCg==
X-Received: by 10.176.82.238 with SMTP id w43mr5654675uaw.171.1490724651624;
	Tue, 28 Mar 2017 11:10:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.43.65 with HTTP; Tue, 28 Mar 2017 11:10:51 -0700 (PDT)
In-Reply-To: <CAJTo0LYsTtk9eFD=kdhdrtFUCPr-eOn5dnPxDR+hM9LRbL40ug@mail.gmail.com>
References: <CAJTo0LYsTtk9eFD=kdhdrtFUCPr-eOn5dnPxDR+hM9LRbL40ug@mail.gmail.com>
From: Trevor Woerner <twoerner@gmail.com>
Date: Tue, 28 Mar 2017 14:10:51 -0400
Message-ID: <CAHUNapRmymF0Z2s1aGhxNAusk35cj6Wg2uqYWDrZTNTMXYkYTQ@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: Meson build system
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
X-List-Received-Date: Tue, 28 Mar 2017 18:10:57 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Jul 26, 2016 at 9:31 AM, Burton, Ross <ross.burton@intel.com> wrote:
> FWIW I started looking at packaging and writing a class for the Meson build
> system (mesonbuild.com) last night.  It's not finished and needs quite a
> lot of work, but if anyone has a need for Meson or just fancies finishing
> it off as a project then I can share the recipes and braindump what's left
> to do.


With the X system converting to meson, it looks like this is going to
become rather important to have.

