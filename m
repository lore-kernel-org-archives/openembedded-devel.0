Return-Path: <ross.burton@intel.com>
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
	[209.85.167.196])
	by mail.openembedded.org (Postfix) with ESMTP id B471079AF6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Oct 2018 21:17:21 +0000 (UTC)
Received: by mail-oi1-f196.google.com with SMTP id k19-v6so8481914oic.11
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Oct 2018 14:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ENW+fNWsWTX/t9/P/J+obNXsJjoq991TRHxza9jUTCQ=;
	b=TyOXJVp/QuXfxo7kEmo6UivFBCIOWrbritmFtpEig2NYr4+NQE/rmZVznnU52570JV
	/wr274/ITEkOFxQQqM7t5kgUK7GPtgLInyY1aet9lo2O13Qks1NARWD519vL3s0ez21+
	LJzvcamWV+J8iKRG77QILxUl971RJhoa2thdZPiY9YCPTtyYzL1LVhZkAYdBxYt1kO4S
	27YA4CEtzR3VRSVhZIKKS4I7M+U+QkGre0T+tba4Y5dYRqYluzemUJhmvls7o95ra9Zb
	iVJNkbDu7s1SqJGv6oCog2MczQB6SYexxh/H+sHP4uvinIvJrLjutjlp8cixfLDK8j65
	t4rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ENW+fNWsWTX/t9/P/J+obNXsJjoq991TRHxza9jUTCQ=;
	b=NDZT5RJS5RD9EX+q0erA7NW5dNbsKQYYDFxyvGea9Fl3THPvvvKosa2O0rMhKy9ecg
	pHN3u9/QM0v1JOD+eFOb+htzqCRwsc6LxWHOId3iIF1sz5fjqBSFdmJP7RqscffcEp+q
	lkgH+DN/T02HlTXdca1C75vWpSKUxtuNLm8VmTKmyFPKCom6ZF9+JYjxq4RAhDUItl0B
	/D1miAOTfq7CMFsJIfF58ITYehD4M7J4GjxauxJgcMQLKjjrkwm5HEpUPPquZJ533Oyp
	wgOh+72xqrr+urMjPmm+6uX7exYtPVUWr21SZefDte2aeurtwkGYPtoHtQ7XQjfyFCku
	nf6g==
X-Gm-Message-State: AGRZ1gLvvBralAJ1hp0+wtyzyO31kzGxmh+WpEeBdUP93CjIevQAXRE2
	eTAa0BQS2Vnltjd7nUoMYKGUoltFbf6qoKZtmc7uJg==
X-Google-Smtp-Source: AJdET5eYLkEleixJ9J1Ca2U6Lq2KcNGafOWOJXARPX4yqIPRfIOBmd7C5o57jytRpS31MXTIIUPwFcVcXmCaAp3IskE=
X-Received: by 2002:aca:ed82:: with SMTP id
	l124-v6mr9196974oih.188.1540847842769; 
	Mon, 29 Oct 2018 14:17:22 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1540830650.git.brendank310@gmail.com>
	<4a7b04c4d262dafef02e120102f054f64bb95c69.1540830650.git.brendank310@gmail.com>
	<CAJTo0LaqiCwZXZjKwGfX8qwHLrX20_hOaOzwBs7q5XsO+fj+xA@mail.gmail.com>
	<CAKPa3c0GduyOjSnd1UQMFjNmm6B3VXHB_C-6-BUAhUuNfXG6sA@mail.gmail.com>
	<CAMKF1sqLbXb_w7Cw2Qb2kar-D7t7pV3GLmK+-tbbbN41XQHfKg@mail.gmail.com>
In-Reply-To: <CAMKF1sqLbXb_w7Cw2Qb2kar-D7t7pV3GLmK+-tbbbN41XQHfKg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 29 Oct 2018 21:17:11 +0000
Message-ID: <CAJTo0LZaOFRnfjxoxjqdD2BvXrDZASjeJn7ArRE4DFCqvaK+DA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	=?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Subject: Re: [RFC meta-gnome][PATCH 10/16] dconf-native: add dconf-native recipe
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
X-List-Received-Date: Mon, 29 Oct 2018 21:17:21 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, 29 Oct 2018 at 19:30, Khem Raj <raj.khem@gmail.com> wrote:
>> I had initially tried to get the native recipe integrated into it, by
>> inheriting the native class but was unable to get that to work. Using the
>> above, I get the following:
>>
>> ERROR: Required build target 'gdm' has no buildable providers.
>> Missing or unbuildable dependency chain was: ['gdm', 'dconf-native',
>> 'glib-2.0-utils-native']
>>
>> Any thoughts on how to resolve this? Should I also be providing a
>> glib-2.0-utils-native package?

I'm assuming you meant BBCLASSEXTEND and not an explicit inherit native.

> Just add that dependency to target only recipe via class-target override perhaps

To clarify, the dependency comes from the gsettings.bbclass.  This
dependency should be target-only, so use a class-target override.

Ross

