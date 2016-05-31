Return-Path: <kergoth@gmail.com>
Received: from mail-it0-f65.google.com (mail-it0-f65.google.com
	[209.85.214.65])
	by mail.openembedded.org (Postfix) with ESMTP id 4414E77229
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 May 2016 19:21:43 +0000 (UTC)
Received: by mail-it0-f65.google.com with SMTP id k76so96035ita.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 May 2016 12:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=5v3kZMWqbAgX5Atr1AKFdmWLqVSTxL9PfSXQCqgx+Po=;
	b=Yn8Zgnf0ZjETf1sWl6kcihMDwyf0ctVgf7nnU/BWhZdaXhUkv5UU4iRkt8FnaoV9tg
	vA4/qqYUajUjIkBqwRcLbJ8y8S1Al7QMh5RjZ8lnxut9fwUmfFG2s10YaM8N6/7Fa/PL
	6NtSmy5wMzwaGQlTnXq1hDZ+hxyj1usWe3gaPK6qhod1ybtxhgFi/zgUq2vVk8qWQDvW
	fv6heuNh/jItWxFYWbbWdaAMbcXXwo39SU/gxMFGe9ODiiSdZJM2fJ0YgI7CstJWnc2U
	U8yEy8DsAC+1V3RiORiuWIFVSBXRpyypnnpYvharAbrlQTdS7SOtJJP8Ui/sZWrAYXFE
	1MrA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mentor-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=5v3kZMWqbAgX5Atr1AKFdmWLqVSTxL9PfSXQCqgx+Po=;
	b=M0uZYG6Oio+Wci2PKkIg/Oad834MEdwYzAOdayoHRNddbEWlRthdGhNCY24sFmtwIT
	J68zC8RSrNbdB9KtYEzVivfrUW6JbYuxydC/lCkyvu611rgNX0ANs+SEHvWZ+1YyGoLW
	VAiE+wduC4yoTvxaU6e3NqJ8mrPZjXz6chgnqXyhA9mlb8iS3BMvjGUwtxW8byG/H8I2
	SURKA4bT7o55TwtauDiSJQw45aTgbo4fXP0D3XID51ZAfTDKQg0wFot8SmXJ8T561P6Q
	F7t74eyvxaZGjnBD/mQUIbRknq0V2e/0BwkBUYq8X1zD0roNCtqkrGbhZCT9jO1I7J8R
	F0FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=5v3kZMWqbAgX5Atr1AKFdmWLqVSTxL9PfSXQCqgx+Po=;
	b=AVYukxFIekqzskKyJxnJ1ZGIwo2XyJl41nsCfN2hxQmhkDyAlpBTIULIL6AROdYXQh
	kn45H5yHVcPDQeeqr0QnET/EodRFOwCxQniiyZWhGhkrW37hJYNGZHLRZQtGtEPio8UV
	l1MvTwHxw4uuh5oXxXFyUnRlC6XVntFVz25vU+jZcEgD3kRZcDTIDa3Zfb4MUiiL4aFy
	jJgrqpFNIOKjentVcFRNsx1E5TWIw/+xSbN5+Pv1VOVYP2oazum+FBbxcyMZ58W4xqqS
	Q1pF0bpQ++h1KZDjWCGz3mjCn/uPdjRoS6C4yR4wVDKu/TosvmGLdPmDaV4mMH0WcRzi
	L/vg==
X-Gm-Message-State: ALyK8tLuobOg1HUvZ2dTA5XMBOjalBG27h9tiRQBQ0vddcq1MvSRkCdfY7DVoX0wolRFgO3/JarYNXzEz1teyQ==
X-Received: by 10.36.53.134 with SMTP id k128mr16040099ita.66.1464722504505;
	Tue, 31 May 2016 12:21:44 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.100.5 with HTTP; Tue, 31 May 2016 12:21:24 -0700 (PDT)
In-Reply-To: <1464722120-6702-1-git-send-email-kergoth@gmail.com>
References: <1464722120-6702-1-git-send-email-kergoth@gmail.com>
From: Christopher Larson <chris_larson@mentor.com>
Date: Tue, 31 May 2016 12:21:24 -0700
X-Google-Sender-Auth: DW2LqA_048Rfh1KRNkvb063UsqU
Message-ID: <CABcZANncZO9cmxRKP=_5dx6TMMNtRtgf7LuGa+xK-++cdkBjuw@mail.gmail.com>
To: Openembedded Discussion <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: Re: [meta-oe][PATCH] plymouth: allow disabling the dracut dep
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
X-List-Received-Date: Tue, 31 May 2016 19:21:44 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, May 31, 2016 at 12:15 PM, Christopher Larson <kergoth@gmail.com>
wrote:

> From: Christopher Larson <chris_larson@mentor.com>
>
> Add a 'initrd' PACKAGECONFIG to disable emission of the plymouth-initrd
> package which includes initramfs files for use by dracut. Disabling this
> will
> avoid the runtime dependency on dracut, which is useful if one doesn't
> need or
> want dracut and doesn't want to pull in meta-initramfs.
>
> Signed-off-by: Christopher Larson <chris_larson@mentor.com>
>

Ignore this, needs a rebase. v2 forthcoming.
-- 
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

