Return-Path: <schnitzeltony@gmail.com>
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
	[209.85.166.68])
	by mail.openembedded.org (Postfix) with ESMTP id C16E67FBF9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Jan 2020 01:04:23 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id n11so31886517iom.9
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Jan 2020 17:04:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Zrp8joBVcgEA+iLYRcUi14oDzBkY0OiI7kj588YSRA0=;
	b=OVWbRgyJgrsAIGYKRAliD5gVL522/7bqmSugPqzbsgcMfIDV6zLLmUxAacBdUQKNez
	vKDZrGAHN2yrNL9O1mwuvjj4jVcU8Zh+wHWfKpe/1lIfjoedPw+2sngaCeZbX0Sci8Fd
	JrdsClFUyNpncY9eSy832qtqlp6M5PmB1RRx42cwZXPPCRLOMnOeDoPTKIUiywTnkL/G
	HqqxsGK1SsCERQkKlcVq0vvE4pCs/6rGGrDhaJxw6RwLppXUYdhP4jdJ7G9os03j2/Nx
	usrqgIeMRGyOKAzIKdWdemOCpAOJft2P1dQxsC/dj7j8pUfZi97V1XtCT5YXNZvbHoXY
	Wkag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Zrp8joBVcgEA+iLYRcUi14oDzBkY0OiI7kj588YSRA0=;
	b=QF1PzYsaSqyU5cP31LLc9XVlcelMwmQRj2bqXc+M4XDvhJKDdeAWOOGxSC6ZsxWhNG
	6kYtHIEMrr0cLelg/5EG1nhXSe8rbacHxxcg2enUsenQkLToN29QzTpyM5BPCpu4v2F0
	PZOOyRoL3HQIQtax3C8x7CVQIxMxVhQXbpdF12bX2nofb6OpHMGfE2afzT5s4a40uhqv
	8Ir0DvePe4zbZ/zTC9UfFkd0OMbTjNPBUtRAXiwhsO8noKCsynJAsqLD5PRSkwHVzM4Q
	OnKkUCkPK4DEaMeOgRDHzYn+5+/J26mgp7rwTDCOqmk02/CGn9jdfxBTslCkLMIVZwbD
	s5Nw==
X-Gm-Message-State: APjAAAUTn2KLT9YGhZMeI2uf834L6/0qWTCgWxE6DpldWOepvVFet+e8
	57jIBJ/TmoxDZIWNOHZjWN5ZCAPtDTDm8sK+XFJQMunu
X-Google-Smtp-Source: APXvYqwfxKn/6QpUbWsnpxVLHIlwNPtBaXEQ9l/PJMouw+7IBEx3jHO8+zftzlrQFQEYF469hkGG+MWu4zuhk6eZ/kM=
X-Received: by 2002:a6b:b9c6:: with SMTP id
	j189mr38143765iof.147.1579482264577; 
	Sun, 19 Jan 2020 17:04:24 -0800 (PST)
MIME-Version: 1.0
References: <20200120003527.1518697-1-raj.khem@gmail.com>
In-Reply-To: <20200120003527.1518697-1-raj.khem@gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Mon, 20 Jan 2020 02:04:12 +0100
Message-ID: <CALbNGRTc_pyQHKveimQX7y2jhzXSb+8N=VoOByWrz=XVWCa2Og@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 1/5] python3-pytoml,python3-jsmin: Add recipes
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
X-List-Received-Date: Mon, 20 Jan 2020 01:04:24 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Jan 20, 2020 at 1:35 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../recipes-devtools/python/python3-pytoml_0.1.21.bb  |  2 ++
>  .../recipes-devtools/python/python3-jsmin_2.2.2.bb    | 11 +++++++++++
>  2 files changed, 13 insertions(+)
>  create mode 100644 meta-oe/recipes-devtools/python/python3-pytoml_0.1.21.bb
>  create mode 100644 meta-python/recipes-devtools/python/python3-jsmin_2.2.2.bb
>
mozjs says thanks :)

Andreas

