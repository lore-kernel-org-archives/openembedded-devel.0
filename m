Return-Path: <schnitzeltony@gmail.com>
Received: from mail-yw1-f68.google.com (mail-yw1-f68.google.com
	[209.85.161.68])
	by mail.openembedded.org (Postfix) with ESMTP id A34796C4BD
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Nov 2018 18:22:57 +0000 (UTC)
Received: by mail-yw1-f68.google.com with SMTP id f65so1151240ywc.8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Nov 2018 10:22:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=g73vCvXu4vc1d/Qa+NAOKqifKBGxpT8tzb1aKSrD2eU=;
	b=nKiYP4KbHgPnY7Reu1tzGYAhyFK+bW0DmBI+YPiuZDZOT2N+rT7cy8IpTVHjdM5gk4
	2Qp8FCO2sM3iGjZ9QAa502yZO2WTXlSzJTgtj9Bsj/Dw4YQfghYpcr0mdfudh3aOPs/n
	x+8U4zoiFGgmudyhFYhCmRhMwF730YjAsDf8TBH1JPXIIMLN4wsldkFCP5XHu0XmOR8a
	avsIq35qysxm7NhNgoP5z0mamRzVopPQmptB71TquZPzhj/HV2sM8VoUX2R9RTrOHIdi
	+mBLfYYdmeLuJVEigzfOGOFyNC0n2RxwE6pLWBRXU+zABKRzKVUlX3FtiT83cntZYvpk
	+h5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=g73vCvXu4vc1d/Qa+NAOKqifKBGxpT8tzb1aKSrD2eU=;
	b=mmMTbwQxNj6yccZnO7paXyGHHy7EDJ4itIabr6XPZdumISWxVcOYGoFw36uo7LHiV4
	WgLDoAuMqipTLiTTc/ciM36t9MNOlw2Xa8mhGNmlOXUVnEpmvvpxXpUKA5Pqd7exJGZG
	2h6v57/btgg4tXGUyEkef+Q6LTKCv9kqqtWbNIpMqVlzOFH0F76rI/WUCUqG2A08bKog
	TfTF5hj577aGyiZVIgsNIjSnJyq7cCpU8sviVWrgp8iXrvy7zAA7Qdd41EsYVhuS38Qt
	ryIOHrysI4QxTm4D/Y7wCQh7It5Z9lUFC4FYdOrgRxB8CxWDVzlU4Z9VRVxQEM80U6EO
	BERg==
X-Gm-Message-State: AGRZ1gLIWQacPuAYuTDyT4Zq5UTBudBEIabH9h6xVr+4TpuLrs48cvVm
	SXt7HNJ1meZlgzc0lH8yfNP2MLTCLGbnwR5T1UE=
X-Google-Smtp-Source: AJdET5dAiLFAzOqvngj/E/vJb5g3uvnkDU2ElUmk5mRMhvxeM0Yz+HQopG1iTUDfi1/hXF8HBRNDfyD0RIRgISJ/VmQ=
X-Received: by 2002:a81:294f:: with SMTP id p76mr3064640ywp.401.1542738178656; 
	Tue, 20 Nov 2018 10:22:58 -0800 (PST)
MIME-Version: 1.0
References: <1542730446-30253-1-git-send-email-fabien.lahoudere@collabora.com>
	<CA+chaQfN9Y+0TwfdcUc0mCzibX-U94SS9gR4NKGvF-FpCR5ekg@mail.gmail.com>
In-Reply-To: <CA+chaQfN9Y+0TwfdcUc0mCzibX-U94SS9gR4NKGvF-FpCR5ekg@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Tue, 20 Nov 2018 19:22:45 +0100
Message-ID: <CALbNGRQ_q=+GYLc5x8Fh3=wnTTnTPci+zbJOgvYApEJSQQMTpA@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] evince: Drop x11 requirement
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
X-List-Received-Date: Tue, 20 Nov 2018 18:22:57 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 20, 2018 at 5:36 PM Martin Jansa <martin.jansa@gmail.com> wrote:
>
> This was already removed once in:
>
> commit 33c822a7c11df08f35dda18a44aae730f93c6130
> Author: Fabien Lahoudere <fabien.lahoudere@collabora.co.uk>
> Date:   Wed Sep 6 18:53:07 2017 +0200
>
>     evince: Remove X dependency
>
>     gnome-desktop is the only X dependency for evince.
>     In order to build evince for Wayland based system without X support,
>     gnome-desktop is added to DEPENDS only if x11 exists in DISTRO_FEATURES.
>     So x11 is dropped from REQUIRED_DISTRO_FEATURES.
>
>     Signed-off-by: Fabien Lahoudere <fabien.lahoudere@collabora.co.uk>
>     Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>
> and then returned here:
> commit 62376d673aa86b5f8ffb26c8a74046ee87ef4f66
> Author: Armin Kuster <akuster808@gmail.com>
> Date:   Wed Mar 7 08:08:57 2018 -0800
>
>     evince: only include when x11 in DISTRO_FEATURES
>
>     Signed-off-by: Armin Kuster <akuster808@gmail.com>
>
> What's going on?
The magic yocto-layer-script is going on :)
> But if everybody agrees on removing it, then you should
> remove the distro_features_check inherit as well.

Andreas

