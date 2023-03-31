Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40256C76196
	for <webhook@archiver.kernel.org>; Fri, 31 Mar 2023 14:10:49 +0000 (UTC)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
 by mx.groups.io with SMTP id smtpd.web11.55724.1680271845695390703
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 31 Mar 2023 07:10:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20210112.gappssmtp.com header.s=20210112 header.b=VRUuqqPp;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.217.44, mailfrom: brgl@bgdev.pl)
Received: by mail-vs1-f44.google.com with SMTP id g17so19210581vst.10
        for <openembedded-devel@lists.openembedded.org>; Fri, 31 Mar 2023 07:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112; t=1680271844;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TV8jeMHVmpNZ4fvsd7g+aKGgXw6sJwu3oZcK1Czx6dQ=;
        b=VRUuqqPpVcOwOSDGL0+beJaFFDZUF3GLDRbZI3cqucGgLMyQqg17HyS3bTPZKcL71E
         1vzVYySuI0ZBdVIr7RSNQ7tIv1P00vNt3Aw1Jy1EwOBzkRlF85pw19hcr4n5GEH22uoN
         6JsToUv/BTy4IflglpcMr/Uo1UtFkIY75tKfAPG0UbsTkNIy2QX14dATmiMV8hiNtmxX
         AUGJpZpkI3MR8/eXLZDmhkgSkYraEz+WdwQI5c2H8sj9xqGqwlO6dhZlvOo9RDEVMxVd
         U7cUciKoimhrhX0IAGf8z5nWM8yRMWEDUlELgeIGdC8YJWc7Etkr8YHHHp+gl+IZShDv
         Niuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680271844;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TV8jeMHVmpNZ4fvsd7g+aKGgXw6sJwu3oZcK1Czx6dQ=;
        b=PKz4umKsSTqHIu1rHnbzlAcmpAnvATTwA+9G+cMQQ9QHmMnm8ev/ZqwpjxTyFmWQqt
         DicnucQ2sa/J6Hjg5li5cQOZPHB8N5GSHv67JHePmsDuOOObe9+NWbhfIW1AVmokqrCi
         lmmZTa6opL9P6oeLZdXErLEIWxZccqnStHNF0I0FyvOa6XWJEsRsjISrpWT7xkZPW2zP
         bLEu03Oj1NYVBF27DUaCGnaO8BYELEdnzC3GYIAyt6g5QAnsPkzZuMpK5Lc9N7USsOEj
         3R0Cs/RC/8kNe58VKLiiy+gF+4xLV97zv0jDbEhyDR5PpQt+xh0UhSewbDQ9P9R+xsBZ
         /U9A==
X-Gm-Message-State: AAQBX9d9D4xDPz8eVoVtweyB+uswc5siJbSfRFYl8T17A7gNAzRtRaX+
	pNey/9CeT2ibxdDiDAms9yw+hsuoaq2+5GsLXFsEzw==
X-Google-Smtp-Source: AKy350YyogSwvtrhNB96iWZFuwFmDEtuYxvvMxlOpxiKWmYWYfbk4FtXuVzKA8mPnaqe7Oe8628De9wctTVcp0ftcM0=
X-Received: by 2002:a67:e095:0:b0:426:b051:1c4 with SMTP id
 f21-20020a67e095000000b00426b05101c4mr9139682vsl.0.1680271844706; Fri, 31 Mar
 2023 07:10:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230331123153.292738-1-brgl@bgdev.pl> <4E0B1FB2-9294-4E87-B055-A048B8A8151A@arm.com>
In-Reply-To: <4E0B1FB2-9294-4E87-B055-A048B8A8151A@arm.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 31 Mar 2023 16:10:33 +0200
Message-ID: <CAMRc=Mfmqp2o8j4dKdZWnQRKaTVjrdGfp9KX6M0w+yNfTH82JQ@mail.gmail.com>
Subject: Re: [oe] [PATCH] reboot-mode: put the build artifacts in ${B}
To: Ross Burton <Ross.Burton@arm.com>
Cc: Khem Raj <raj.khem@gmail.com>, 
	openembeded-devel <openembedded-devel@lists.openembedded.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 31 Mar 2023 14:10:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101856

On Fri, Mar 31, 2023 at 3:11=E2=80=AFPM Ross Burton <Ross.Burton@arm.com> w=
rote:
>
> On 31 Mar 2023, at 13:31, Bartosz Golaszewski via lists.openembedded.org =
<brgl=3Dbgdev.pl@lists.openembedded.org> wrote:
> >
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > We should output the compiled executables into ${B} and install them
> > from it as well. Currently we put the build objects in the source
> > directory. While at it: don't assume we're already in the source
> > directory and instead prepend the source file with ${S}.
>
> By default B=3D${S}, so this hasn=E2=80=99t changed anything.
>
> Ross

I'd say it's still more semantically correct, no?

Bart

