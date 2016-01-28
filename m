Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-io0-f195.google.com (mail-io0-f195.google.com
	[209.85.223.195])
	by mail.openembedded.org (Postfix) with ESMTP id 132E66012A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Jan 2016 14:01:03 +0000 (UTC)
Received: by mail-io0-f195.google.com with SMTP id k127so3920678iok.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Jan 2016 06:01:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=tK+6iQ3juboK4VrG7tTiEL8zE1Hdepv/ajIQxX12cAI=;
	b=d5/6svgeRDupYGJlOdDHB8AidOq7D5tlPVf0pQrY5BoecZFJpvU99ZcS8r1ZJ0d4/b
	LkAx6F9mX7K1i6zasCctLU7Jc2cnxIJ7zKIZQukk/B+lGSSBVGxqyErzttothbv91nDX
	T5z20zyJX8zSDw1SGRZv3CeJZ0lJIHG6ugV6zOMNlumpg2aSnYOZQxXor0XaxvWuMBui
	0ESwKqN+QtpTcVcD19rWQ9vCHajBniBHG4UyyGf4K3scI9nphy9oPfRRCa/MHqpscZkO
	Qy6KaTw48KUEttqnxE/vS6I/ixaAQCl70VyJyMdYIGOOSBscPXg9/I21gwNvQpndPwZq
	X/Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=tK+6iQ3juboK4VrG7tTiEL8zE1Hdepv/ajIQxX12cAI=;
	b=GWjhRSBqhYyNXZFQU1Ab4abuPIHA07acz627Ei4gvPQptjjfSS8O7FRxfB5te6l4nb
	ueaB7AoOECbaDnHJhg4TxFBLhTieT5BTgOzKgFeOQB7KfIZyVq/puprF8/4gt/aIwiqi
	8FNu71zSHbRGwDKO7uIj++sI6hTPq1FddkxFeUW6OJGFgZjusVnvwumxRr6aLvaYQpub
	WDp5lF7CHZGXmU+Ai14HeWif/c0Rg6k+/hYc2Ygz2QS6p0gHLSkT9SSASXKXBvUXp3Ba
	2L0qhXJ+t6tccG0/yt+c+LyeA/t+O37VXv68xFB3QF6B3v5p9asjOvl8SKd17KbECS4P
	J0oQ==
X-Gm-Message-State: AG10YORuyNE30yWxEoy3a7Dc7KHv0U/1Subj437o/HNkmwo6XMK7We7uv20rVGz8Cu9R/Ak83IBUDaxq1vkgNA==
MIME-Version: 1.0
X-Received: by 10.107.135.104 with SMTP id j101mr4538734iod.133.1453989664573; 
	Thu, 28 Jan 2016 06:01:04 -0800 (PST)
Received: by 10.36.25.81 with HTTP; Thu, 28 Jan 2016 06:01:04 -0800 (PST)
In-Reply-To: <20160128152959.55a9a747@adi-pc-linux.emea.corp.natinst.com>
References: <1453978491-8849-1-git-send-email-adrian.ratiu@ni.com>
	<CALbNGRRTKH2BsXQbB7di3geApmPLz-A_gGaEnGzyLEJzPkX7-Q@mail.gmail.com>
	<20160128152959.55a9a747@adi-pc-linux.emea.corp.natinst.com>
Date: Thu, 28 Jan 2016 15:01:04 +0100
Message-ID: <CALbNGRQroKeu+Sap64Mz3HYJkbchN8GNWvfHeASHRwZ=eA_FdA@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-xfce][PATCH 1/1] xfwm4: add patch to fix touch event handling
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
X-List-Received-Date: Thu, 28 Jan 2016 14:01:04 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jan 28, 2016 at 2:29 PM, Ioan-Adrian Ratiu <adrian.ratiu@ni.com> wrote:
>> I've checked the thread you point to: I am using xfce for touch
>> screens and can resize windows, maximize them, move around and close
>> them all with touch. What kind of error is fixed?
>
> Thank you for challenging this, it helped bring more light on the issue.
> It is a workaround the bug [1] in xserver which was fixed. More details here [2]
> I did not knew this untill I asked on the xfwm bugzilla.
>
> So instead of "fixing" it here, we should try to backport that fix to OE or verify
> if it's not contained in OE's xserver already since it's working for you :)
>
> [1] http://cgit.freedesktop.org/xorg/xserver/commit/?id=24b943132f
This is the correct fix and - I checked in source - is included in
xserver-xorg 1.17.2. That version is shipped with jethro I am working
with currently. Don't know when it came in (for elder oe-core
releases) but master and jethro don't need to fix.

Andreas

