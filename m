Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF8C6C36010
	for <webhook@archiver.kernel.org>; Tue,  1 Apr 2025 14:18:27 +0000 (UTC)
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
 by mx.groups.io with SMTP id smtpd.web10.20303.1743517107142991582
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Apr 2025 07:18:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OJOh7+zl;
 spf=pass (domain: gmail.com, ip: 209.85.161.45, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-6028e5a45d7so503641eaf.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 01 Apr 2025 07:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743517106; x=1744121906; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OxCrQ176UxQo5ZsElDswUQUNwYsJyku2A8nmpz39aQQ=;
        b=OJOh7+zl+sVT8VozbWLdgHd1KhmuJMRlg5hAOFYuWJz2EdAehpFIxKcFyeT8bU/z7J
         kinG1hRBujD5GNqKVk2S13VKc9tP9H62R6pQGoHNr/l4LhAzP5yIPWGPahmxDA4y3kcs
         aLSVotCwWJngiAvw7W9m2l+Yk6SSjP6iQNP9IGsltnVp9ZYKqPR52Ct+hFYjSsjVE0iQ
         83EL/wE5MQN1XDeU2ezk9EwrrXf4Bg12xocF9m9wYfr/MTEOoMvw+64PLytgDvnTtpOY
         fKrGiAeAo3JVsj4wtCVB7Cl+K6EDn2tRJj2MCxYGopmolypw5pghfp1dRWPqs845p4U9
         nQXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743517106; x=1744121906;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OxCrQ176UxQo5ZsElDswUQUNwYsJyku2A8nmpz39aQQ=;
        b=MM+2bkf5VpEADXhGrS1bwZffenkpVMcoFMMRMuuVfbNrkyO4u7hUhFBgsfYXyJOGML
         LIZ3SlcjwA7hoOspjSRlJH7AWHJdslo5bB5qUFgzWbUXWiWu7g1qnqy8TzKyCjyKCGOu
         3RHYhTkoPMsUr5ibNV3vlv99HVkER82B+Nd/CvmJ7d1iq6EmMaM/JIAbrwqhd+RCfSGA
         igm58VTp3JGIVqY0Vm2TORZygUke6bvlZL2+YJiiiyRbdmMibvMhAEjYmR0M5RKAG6is
         XzmDbm8nZM4jhQkHTbAn+B6Brz33sGXJ8ya3SutZUJPkNHbpB9Tlz9IOuXHilFwBsMWg
         s28g==
X-Gm-Message-State: AOJu0YyWQst2dVLqIkPZh4RRt8Ez8oUflGK6d93n7co84ip3MSFkbsrx
	YNakdjiSMmM1X/1iWjyaO6u2WjYveossSu1lyQn+DJ9cQg0jll0BDzAuvGG94wliea6zme38SMv
	8cV/9X0tMxdACodfvl8LIidaJSQs=
X-Gm-Gg: ASbGncvUp8rdNFdhmNymAQCJoiabLb2qe3fmCsX7HHPkCKJuXcG8hOGBnMaIwf6EhQG
	3YbWP6f75uCu7KT3AKJFWKy+BXgoBAigX8fwj2lTN37CFaftn0qF2f+dahnch8Wi+OGUpcL4+fn
	9f/YoUYyU6w0Kf+7tJNvUxlLNjoMcOKIhkj2zUncP1
X-Google-Smtp-Source: AGHT+IGkKAI3LVJHi41oMpDaxmzvKVibdPJiEOdfHWoCEp6gYu79TsM/eSTrsPqcmrRiTUlgXqy3/jo42pFVED5h1WE=
X-Received: by 2002:a05:6820:1c8c:b0:602:8233:4c93 with SMTP id
 006d021491bc7-60290f41d03mr5848816eaf.4.1743517106280; Tue, 01 Apr 2025
 07:18:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250331062237.8115-1-f_l_k@t-online.de> <20250331062237.8115-2-f_l_k@t-online.de>
 <CAMKF1srs8KfdY+9tZn33x00bUKSRvbA=YNBMPqBHEskiBV3Qqw@mail.gmail.com> <S301US.K6JXZLZA1JX12@t-online.de>
In-Reply-To: <S301US.K6JXZLZA1JX12@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 1 Apr 2025 07:17:58 -0700
X-Gm-Features: AQ5f1JpqqNOMl-Xx3gUTp9cxyy8MyKe7IhGLUX2GDAQ631Lfbh23vt_xOCt9cpk
Message-ID: <CAMKF1spzWZ6G8QqUQWz30p1X6XKp8hkBYLRBSqjpptq4=84ubA@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][PATCH 2/2] celluloid: add recipe
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Apr 2025 14:18:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116476

On Mon, Mar 31, 2025 at 11:15=E2=80=AFPM Markus Volk <f_l_k@t-online.de> wr=
ote:
>
> On Mon, Mar 31 2025 at 14:39:53 -07:00:00, Khem Raj <raj.khem@gmail.com> =
wrote:
>
> I think due to mpv dependency here amd mpv needing ffmpeg this needs some=
thing like below EXCLUDE_FROM_WORLD =3D "${@bb.utils.contains("LICENSE_FLAG=
S_ACCEPTED", "commercial", "0", "1", d)}"
>
>
> Did you add celluloid to packagegroup-gnome-apps.bb to include it to worl=
d build?
>
> If so, it might eventually help to add it as follows:
> RDEPENDS:${PN} =3D " \
>     ${@bb.utils.contains("LICENSE_FLAGS_ACCEPTED", "commercial", "cellulo=
id", "", d)} \
>

This will not work with bitbake world

> instead of using EXCLUDE_FROM_WORLD within the celluloid recipe

