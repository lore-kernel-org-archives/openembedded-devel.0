Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-yw1-f42.google.com (mail-yw1-f42.google.com
	[209.85.161.42])
	by mail.openembedded.org (Postfix) with ESMTP id 744556069A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Mar 2020 13:28:21 +0000 (UTC)
Received: by mail-yw1-f42.google.com with SMTP id v138so1935799ywa.9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Mar 2020 06:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Y2sihzjefJ+eA/dskUa68RWTmp4BVrC876pst1VzPc4=;
	b=iTpYaMxDerGxOiZSh73rOMvVxV49aRe1C49Ir9Dnoamt2Yi527m0bYIlOkckFk/Dlz
	XOHD/t5NbkOPziM5WodrFcjzfRpoFumuzsBi29l4mDdPnmZPCDD1Xjd9BZFtLVjOeaaD
	T6KSblAUFNeA+6uEuyxBBiAdpbaEO2zib56GAyV3jXz62l5Hawu9YAZiq3/sd+SjVmio
	usucC4/L3KmjEALL6IKJ9E4Zq5ntyLfaLYVZcBviv6ogKuYLA3ZmPqxY5oBCDEwglwCs
	EKidcQizDW5ck94bZXVjwcUktEJ+bSnHzZ1iDR5UWcfXUff5+Wp0Vbyr37Wsl5XBbL/K
	+OuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Y2sihzjefJ+eA/dskUa68RWTmp4BVrC876pst1VzPc4=;
	b=XZ8hPwdlf8cMVisq3xGYqS6VuehNN6AYWadVsa+dWAgHyiV4/+ZL8KrsL9lVOrjDaY
	bWGsCtybQhjHPtYnZ/ftwvZ9L6gv5q7ObcQd96szEttSLIY2uKew9xuuxffUN1QcRJMF
	bl9pCIVdEERPr/bg5HfUORXRxWVIAcouQTYZShbKSgwmLRlSFSY/2DG7P7kGYui4ziBE
	Y8TazOLqisIqXlvjq/kdQaxmSjDe+qK8y5rVqVkcEyJFA++ofFmBWg71kcdoV/6hFzrs
	gfCpYrDfmsWKYp9a3fysr7A0CTHJZLPLEnKToNPmaE/Gva7xZh6Ys7hsQYD0dCeP5PP3
	B9kw==
X-Gm-Message-State: ANhLgQ0U1oXCOztTceeBsSv8Q0z7gvykkY+jgSwrmQaXVnwfU0GvfwkF
	qrpkhLgdF1u2H7DGUjKUL40Rje1vz674VHXZeIWjtA==
X-Google-Smtp-Source: ADFU+vvGvjL9s3EC4PuB4sWyHP7D1PqFlEqmv+AdSfSQwVh40JFQhBUt7pziL2Wx3L1Me6uQnc9+Ye/zGYBIU4Oe/II=
X-Received: by 2002:a0d:ee04:: with SMTP id x4mr3266299ywe.189.1583933300914; 
	Wed, 11 Mar 2020 06:28:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200228150345.11829-1-brgl@bgdev.pl>
	<CAP9ODKqbfrnLUBzE+WkGceSo+qBimGPUFUcgRuZmS3vwJZqpwA@mail.gmail.com>
	<CAMRc=MftVskWMFZQhbFKZLwNAR9a1+4zbayWTbXFuSJgG-ZgbA@mail.gmail.com>
	<CAP9ODKpVW6qxw7+5oA7auBMW1ApLdqjicZf8Ahe3RhYG8QjmgQ@mail.gmail.com>
	<CAMRc=MeJ0R81s-ui7J78pe89JE6c-_wx3RGUZx-tzMLc3pzthQ@mail.gmail.com>
	<dd3d6ea7-2bac-6a06-823d-fd070f547784@gmail.com>
	<CAMRc=MevN3tAfBkLZuOiW0BVbOWkq_T_HiD6XTMwh5d32xrGeQ@mail.gmail.com>
	<CAMRc=MehBSu1RpPkzP=xiFqt3wpJrf4FhV889jcPxUHPnf0GLg@mail.gmail.com>
In-Reply-To: <CAMRc=MehBSu1RpPkzP=xiFqt3wpJrf4FhV889jcPxUHPnf0GLg@mail.gmail.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Wed, 11 Mar 2020 14:28:09 +0100
Message-ID: <CAP71Wjz1n_Csm762xbsxUK-3i3OYm-rfh=9Ccf28USLgJjRiFQ@mail.gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	Otavio Salvador <otavio.salvador@ossystems.com.br>
Subject: Re: [meta-ota][PATCH] meta-ota: add support for binary-delta images in a new layer
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
X-List-Received-Date: Wed, 11 Mar 2020 13:28:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

hi Bartosz,

On Wed, Mar 11, 2020 at 9:04 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> wt., 3 mar 2020 o 14:56 Bartosz Golaszewski <brgl@bgdev.pl> napisa=C5=82(=
a):
> >
> > If this is not something that should be part of meta-openembedded - is
> > there any way to have it hosted at https://git.yoctoproject.org/cgit/
> > as an official yocto layer? I'm sorry if this is a dumb question, I
> > don't know exactly what the policy is for that.
> >
>
> Hi Khem,
>
> gentle ping on this. What is the procedure of hosting a layer at OE?
>

it depends what you mean here.

1. Hosting on git.yoctoproject.org is mostly for layers supported by YP
membership, these layers are under the responsibility of the YP TSC [1]
2. Hosting on git.openembedded.org is under the responsibility of the OE
TSC [2]

We recently started an initiative using gitlab, to host layers:
https://gitlab.com/openembedded/community, though it's not picking up much
for now. But that would be another option, Paul B. or myself could give you
access

You might want to host the layer on your own (github, gitlab or anywhere
else). I understand why you think that hosting on yoctoproject.org would
make it 'more' official, however hundreds of layers are 'self hosted' and
it's usually not a big concern.

In any case you should register your layer in the OE layer index.


[1] https://wiki.yoctoproject.org/wiki/TSC
[2] https://www.openembedded.org/wiki/TSC



> Bartosz
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

