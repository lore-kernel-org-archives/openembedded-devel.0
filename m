Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 643E2C48BC3
	for <webhook@archiver.kernel.org>; Tue, 20 Feb 2024 03:46:21 +0000 (UTC)
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
 by mx.groups.io with SMTP id smtpd.web11.5902.1708400780806181766
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Feb 2024 19:46:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=U8Zp0z0e;
 spf=pass (domain: gmail.com, ip: 209.85.160.52, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-204235d0913so3039429fac.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 19:46:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708400780; x=1709005580; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zD8d65PTFwTEQ5aSzflQnZYN5TnmcnuASaGlj8RC5xw=;
        b=U8Zp0z0eLcbzRszRd9JfmzFLVSRbpd03tbG8c3P+grRw4jLIO521qT4xCuLukM9tzi
         E7sCI5dopmjdt9h8trDaQcZkmOkDggVne1piTBUTIjpugfVM8p7TlD4SefBJJYNGIzFE
         aIYi2JHngM0ZBHSfogDGhRAByNsLBq9bvY6PWcAhvpS0sC5HqttwekfGV+XbHlIhmAGJ
         I8eyfbkPTTM/qBqhNxSUaeTOyf/tyYNyJSBrXxC046YceWe2NFO+3wRmtzFRB6Y4czLo
         yQYUTlZN/IbCanMc/1oj+imnytVLBb6BYgBczxWx8+T5emGftxLNFRTMIrXPWf2cL3C8
         pLpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708400780; x=1709005580;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zD8d65PTFwTEQ5aSzflQnZYN5TnmcnuASaGlj8RC5xw=;
        b=k3B7ka8L3bsVrMfAmBoLysmcFbkUFMZ+T4q0c+Sc6rjd+c8ZvX/AvtECXO+xWE8irG
         L3iI1uQTYDX/rHIE1XPo8QOpIDahekluQiLkHaK2Q7y1fu/VCb3tqYBptrhvpwzUyLAs
         1E5LqMepdSen+vNiCuK3JPERNIPYPuX1SV8EKCNPZtiHaoJVz59JHTWK6psGKBbB2i6x
         jNxmasESnpccW4sZfu5YnrICdjdK5wziBsAxG8OyZNwiTHCZmgp+YOQI+4Wf4du58lzZ
         /qDvgxwXKjHVideYuw4j12G0U6mh4xTB/gD/Yi885EV10OC4aN5fUQOnTnATYyo7gFnG
         UjgA==
X-Gm-Message-State: AOJu0YxtDutIixu1sIjDtK/NR73JAaHp6IOEb2BN0GinskOK2YgnrEDG
	RJr+PLrQ2YlfKRqa/A6DpEO5U26d1Vk2J117a5TQ8mv+wh0K9h4OnPq8+UK4YVSrCfLuvd1SpZI
	stjFRW37KUYBuc/TAVPircw/SOOqCsO+k1ob0FA==
X-Google-Smtp-Source: AGHT+IEOJhWsD2ui4FcXZAhnJpS51cNeFwLf9cQewIv+CFAcNBB17T5bLu+LxjsJfWf10jPnlXAFk44V0m+nb9Q05cE=
X-Received: by 2002:a05:6870:ac0e:b0:21e:6c0d:41cd with SMTP id
 kw14-20020a056870ac0e00b0021e6c0d41cdmr11229218oab.38.1708400779939; Mon, 19
 Feb 2024 19:46:19 -0800 (PST)
MIME-Version: 1.0
References: <cover.1708389659.git.tim.orling@konsulko.com>
In-Reply-To: <cover.1708389659.git.tim.orling@konsulko.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 19 Feb 2024 19:45:54 -0800
Message-ID: <CAMKF1soie5RStLG9j454Bcd1NaCc=chEhnfw_ruXxFmKgU8T5Q@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 0/3] python3-prettytable update; fix ptests
To: Tim Orling <ticotimo@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Feb 2024 03:46:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108899

cool. Please rebase it on top of master-next and re-send.

On Mon, Feb 19, 2024 at 4:47=E2=80=AFPM Tim Orling <ticotimo@gmail.com> wro=
te:
>
> The prior version did not run any ptests, since the test_prettytable.py w=
as
> not discovered by pytest. Also, since python3-pytest upgrade to 8.0.0 the
> python3-pytest-lazy-fixture module was non-functional.
>
> * Add python3-pytest-lazy-fixtures (with the s)
> * Upgrade to the latest python3-prettytable 3.10.0
> * Drop python3-pytest-lazy-fixture (without the s)
>
> All the ptests for meta-python-image-ptest-python3-prettytable pass on qe=
mux86-64:
>
> $ resulttool report build/tmp/log/oeqa/testresults.json
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Test Result Status Summary (Counts/Percentages sorted by testseries, ID)
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> -------------------------------------------------------------------------=
-------------------------------------
> Test Series | ID                                                         =
            | Passed    | Failed | Skipped
> -------------------------------------------------------------------------=
-------------------------------------
> oeqa | runtime_meta-python-image-ptest-python3-prettytable_qemux86-64_202=
40220002104 | 171 (99%) | 0 (0%) | 1 (1%)
> -------------------------------------------------------------------------=
-------------------------------------
> Total | 1                                                                =
            | 171       | 0      | 1
> -------------------------------------------------------------------------=
-------------------------------------
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> qemux86-64 PTest Result Summary
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> -------------------------------------------------------------------------=
-------------------------------------
> Recipe              | Passed    | Failed | Skipped | Time(s)
> -------------------------------------------------------------------------=
-------------------------------------
> python3-prettytable | 166       | 0      | 0      | 0
> -------------------------------------------------------------------------=
-------------------------------------
>
> The following changes since commit ae28f34aab8c7e32e610446fe82868dc020e08=
8a:
>
>   python3-meson-python: move to oe-core (2024-02-19 10:22:55 -0800)
>
> are available in the Git repository at:
>
>   https://git.openembedded.org/meta-openembedded-contrib timo/python3-pre=
ttytable-update
>   https://git.openembedded.org/meta-openembedded-contrib/log/?h=3Dtimo/py=
thon3-prettytable-update
>
> Tim Orling (3):
>   python3-pytest-lazy-fixtures: add 1.0.5
>   python3-prettytable: upgrade 3.9.0 =3D> 3.10.0; fix ptests
>   python3-pytest-lazy-fixture: drop recipe
>
>  .../ptest-packagelists-meta-python.inc        |  1 -
>  .../packagegroups/packagegroup-meta-python.bb |  3 +-
>  ...3.9.0.bb =3D> python3-prettytable_3.10.0.bb} | 33 ++++++++++---------
>  .../python3-pytest-lazy-fixture/run-ptest     |  3 --
>  .../python3-pytest-lazy-fixture_0.6.3.bb      | 26 ---------------
>  .../python3-pytest-lazy-fixtures_1.0.5.bb     | 21 ++++++++++++
>  6 files changed, 39 insertions(+), 48 deletions(-)
>  rename meta-python/recipes-devtools/python/{python3-prettytable_3.9.0.bb=
 =3D> python3-prettytable_3.10.0.bb} (67%)
>  delete mode 100644 meta-python/recipes-devtools/python/python3-pytest-la=
zy-fixture/run-ptest
>  delete mode 100644 meta-python/recipes-devtools/python/python3-pytest-la=
zy-fixture_0.6.3.bb
>  create mode 100644 meta-python/recipes-devtools/python/python3-pytest-la=
zy-fixtures_1.0.5.bb
>
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#108894): https://lists.openembedded.org/g/openembedde=
d-devel/message/108894
> Mute This Topic: https://lists.openembedded.org/mt/104459444/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

