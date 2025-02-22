Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A25EC021B2
	for <webhook@archiver.kernel.org>; Sat, 22 Feb 2025 12:58:33 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
 by mx.groups.io with SMTP id smtpd.web10.45497.1740229105278128373
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 22 Feb 2025 04:58:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XVNDx9H1;
 spf=pass (domain: gmail.com, ip: 209.85.128.180, mailfrom: jan.vermaete@gmail.com)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6f8c58229f1so26149267b3.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 22 Feb 2025 04:58:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740229104; x=1740833904; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=28Xx4j4dHW+M9gG9VCMSfVH2FCGTYLlVB/nfpCM+SUs=;
        b=XVNDx9H164LueeEvmVCfgy7JqHW8u4kbnhOtBEzhmWXPSWkio+sqK96TLS2bktAiUq
         fSXzh+QZ8wS045XNRpwev+JMmrwQNuUBDqwYryffTcaTnLXWKTMR/d45ZThOAhMa89uU
         EFfZceoM3jAJnkT85Rd4iETU7lmsiT64iAl9XdPfnwm6GVUAyJ9D8FoyPIDMBsBHiNab
         HL/jT7gWZRGeNnF7weDgM2oT6jlKfFI+AhlGlFMLb+KmKtvMIU4Prfsh/NnPoCiaHWOF
         4Lc7g3mn2GvidvHZJLYXPfwN/9bpaU7Ur/PsnWo77XnalQwopjUgNT9apyd0YJ+yQ0EZ
         6amA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740229104; x=1740833904;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=28Xx4j4dHW+M9gG9VCMSfVH2FCGTYLlVB/nfpCM+SUs=;
        b=bOAqd7CQZExTTfO6vjr+tuda3vRW3XauiwgvchgNDljRIY75udLJ258OPMJeCqt430
         RvLMy2GfB3BCBTXTz8pIYzLz35nq6Z+5bVLK5QwJa+njLoi4/woZzZjImZwhMjKM3ok6
         HwSFVsHj/E/L7JugOCt17ffKLu/mBvz+aiyzQ3ytY5cQNL8VbkoFxeOW+CAJIcgEbf/w
         ritZMJCJ9pWO60XXm8k5iSE9ZglZfGgMpvfUO9J6ulMLJgLQ+/xrsknpU5txRujz4G0q
         c9amPu1unq/tU70YheN8z+GG8UiAdrWJapBnzH0RWso+w5AnGve8urBpvqec5SNuMOYz
         4/HQ==
X-Gm-Message-State: AOJu0YzN+v+R0TBX44J7skKaS/5nJ2SwNCDlxYxo/fUODB1bIxTVO6y8
	kPWyN/0y3JUXK3Nrr2fm9JwrpxXsovCRFXZy+RluHZxcojalk2Sjid2KadbJXPSQ0HMvxqSx7uu
	rYTVgoZaZ2kkS73QRyUZ2IPQjeNQ=
X-Gm-Gg: ASbGnctMi2TVIHPVI9wKip+dZH5JflS55Hu4+KzzwD5Ui8NHbDjtJQUc42126o2yyj9
	+x1djQSp2tj0R2gDWKRb6F1iKuxXm68XBLLpKVcPh/C4rVsWVLqSfTuuXufWk9dZrGahFrN7Jr6
	CkqHvMvA==
X-Google-Smtp-Source: AGHT+IGGMBkn6EZ8TdOc7ihmLQlTc9J6a6oMV78oHfKjZYxYbT7iGWjqDr4Z+u+ptKjEwMUgTH19Xg2s20RfTbucr/I=
X-Received: by 2002:a05:690c:a98:b0:6fa:fd85:a2b6 with SMTP id
 00721157ae682-6fbcbe0cc2cmr55150177b3.13.1740229104419; Sat, 22 Feb 2025
 04:58:24 -0800 (PST)
MIME-Version: 1.0
References: <20250222121505.291425-1-jan.vermaete@gmail.com> <15179d61-7acf-40cc-ad25-4d33ace18897@gmail.com>
In-Reply-To: <15179d61-7acf-40cc-ad25-4d33ace18897@gmail.com>
From: jan vermaete <jan.vermaete@gmail.com>
Date: Sat, 22 Feb 2025 13:58:13 +0100
X-Gm-Features: AWEUYZmai-6IKWNaQ5pCWBsffrp9FyYP-h4PZZnBgq3-It6tha31MlDuuNxBqL0
Message-ID: <CABF_=ygDJtKQxpayR7ShDU8EHvaHe9xcC2hNMmADs5+ex3ga8A@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH 1/1] wireshark: version bump 4.2.10
 -> 4.2.11
To: Gyorgy Sarvari <skandigraun@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 22 Feb 2025 12:58:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115540

True, I have made a v2 patch with your comments.  Thanks

On Sat, Feb 22, 2025 at 1:24=E2=80=AFPM Gyorgy Sarvari <skandigraun@gmail.c=
om> wrote:
>
> On 22.02.25 13:15, Jan Vermaete via lists.openembedded.org wrote:
> > @@ -17,7 +17,7 @@ SRC_URI =3D "https://1.eu.dl.wireshark.org/src/wiresh=
ark-${PV}.tar.xz \
> While you are at it, do you think the SRC_URI could be also changed to
> https://1.eu.dl.wireshark.org/src/all-versions/wireshark-${PV}.tar.xz?
> These URLs seem to be more stable, it looks like they are not deleted
> like the not "all-versions" ones.



--=20
Jan Vermaete
=E2=80=9CSuccess is a self-correcting phenomenom.=E2=80=9D -- Gary Hamel

