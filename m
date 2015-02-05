Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-oi0-f47.google.com (mail-oi0-f47.google.com
	[209.85.218.47])
	by mail.openembedded.org (Postfix) with ESMTP id 65D926AC35
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Feb 2015 13:43:36 +0000 (UTC)
Received: by mail-oi0-f47.google.com with SMTP id a141so6468965oig.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Feb 2015 05:43:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=N2v1e7hyiDO87eE6U6ncm9TlgzpALKHzyDdN2vXlvuQ=;
	b=QZi4IKbzcBx9qoCFJ4bkpbciGYEqr58ECtAxeGCiGe0Z2f/7/KX078oHZxS4UlV9v8
	a5/HKhNAvVhkuwjV4bshlJav19QYNxPuZlK+QQt9P1wsta6jJd6heDfgYyHj/Zz2ifZj
	MJ05CUjma/82Q19shzUXtand6Yfi4KnFF5GNCulxnATrWZJvGk31QnFfwZSwVdux+wHK
	aHPfW3+4rbCDWvpvgGmQjrplq7tEQ6jSbxDomR2NvLzyVFLJ6I/v3aIsfzljzgsEjZPI
	tBmiZ9b/mRwhu3w2OXHIwPMLSGPcQO2uQH1lAkQqHrc+0ei+Dfem/5ESGP0tWuM98JDX
	PJYA==
X-Gm-Message-State: ALoCoQmPOK6lp4pbdZWeTPBAIvTTqMF8SDVqphNisW9h9b1i+p4nk3GNJirhmYl/fsUSEjtK0Ukv
X-Received: by 10.182.58.20 with SMTP id m20mr2438320obq.32.1423143817383;
	Thu, 05 Feb 2015 05:43:37 -0800 (PST)
MIME-Version: 1.0
Received: by 10.76.116.167 with HTTP; Thu, 5 Feb 2015 05:43:17 -0800 (PST)
In-Reply-To: <1423081763-2905-4-git-send-email-danismostlikely@gmail.com>
References: <1423081763-2905-1-git-send-email-danismostlikely@gmail.com>
	<1423081763-2905-4-git-send-email-danismostlikely@gmail.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Thu, 5 Feb 2015 14:43:17 +0100
Message-ID: <CAP71WjxPCVC6BcdmrDUz0HJ36Uw-4P-a4skKEFOZtudE2PWSDg@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 3/5] emacs: Un-blacklist, seems to work fine with new qemu
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
X-List-Received-Date: Thu, 05 Feb 2015 13:43:39 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Feb 4, 2015 at 9:29 PM, Dan McGregor <danismostlikely@gmail.com> wrote:
>
> I've only tested the build with armv7 and x86, but the build
> doesn't segfault anymore. The last time this was tested was
> with qemu 1.5, we're now using 2.1.
>
> While here, don't copy stuff from the sysroot into the qemu tree
> just use the sysroot itself.


I tried this patch, and I was able to build and install emacs package,
on an armv7 board, using master branch as of today. emacs seems to be
working fine under X11 here, however when I run it from a console
without X11 (over ssh, or on the serial console), emacs would start,
but I am not able to use it. keyboard is no working from within the
application. ctrl+z isn't working as well, so I need to manually kill
the process.

i know the emacs build process isn't straightforward, and maybe we aim
to support only emacs + X11 with our recipe.. i am not sure..

have you tried to use emacs without X11?

thanks

