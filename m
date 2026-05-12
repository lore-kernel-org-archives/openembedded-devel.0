Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFA7FCD4F39
	for <webhook@archiver.kernel.org>; Tue, 12 May 2026 21:42:50 +0000 (UTC)
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.437.1778622169957810690
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 May 2026 14:42:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=QIldp7aZ;
 spf=pass (domain: gmail.com, ip: 209.85.210.45, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-7dbe07d3ec3so3197162a34.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 12 May 2026 14:42:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778622169; cv=none;
        d=google.com; s=arc-20240605;
        b=H2jhLAUI3w70CwhUVrGiKpBF9MdVdh9C8v2s9vCQVKnYnWuWGZx+G5wP8CTYOS+t/L
         1u2VsFMqpfIJSsT24YgUNaiuffVI0jodk9QtXdl1PCdmzAdrPuHA2B/7PK1g+yK0VJtE
         QCcyxQeI1VO5vHpj6G9duWMLTVHpsVhmKegnj2Y6qg8rA2k7JfSNRrrj8C6lFwMQGdc2
         lf+LMqR6ugV6JTQ7ZSb7j5EkMM6jw+xBBb7/pDgr9g1z5YtoNUIrc72Ev9s6UKeuGzNU
         DQNVB1FfibwqvlXyPyZo5RBZlXxlCSdHwTWn2NIRbD8rrtcWpi9OO0DghAW9ZalQpdhs
         DXsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HZBTM8+POocGGsNMhTX/G6ztjo97essQwrtNHa4/o8c=;
        fh=W8gol2YzCxET1LVyvGyuiPOs1EC53CxfVVzDdnABwrc=;
        b=YDJK+fY3xp9f4S9sf979zy6a+ybgO8oKar3gdrz8hmGduAuVsX03RFpi2H5y95NHwr
         0K+CjwBIlmxahO4poN5zv1CDfaIfDqWb/aOmQMhU0STiZjzeOSSNGuo7U1p/GIRmtxRr
         I6VxFy4g1qYFBYnbaX0nKWkE4ZaRVSPCOO/LrPoZQfIKvXth8Ym2RO3LakeW+CbxwdKx
         pkZ59vlOUz+tzsdAPeNPpC6quscYNGwGC13z/jTLwPcEiwl+HjKma8KWKuRjSDNxGDu1
         2iAJjMVryduXwNANqLKTs0LwjwQ77oJ0PwCvS49w+HsgSv7/+IJIBawmMnZWV+eNIuw+
         k6Ig==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778622169; x=1779226969; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HZBTM8+POocGGsNMhTX/G6ztjo97essQwrtNHa4/o8c=;
        b=QIldp7aZw0jTDIMLIztFX0ZuDJTA2EqqWJ/LwALgbaEcl733P/aEkfAnVSmW/VAdA+
         Jway0JYLAzBAAYXNdApYyx1ldYeEkb5gTrkU3hAH8Wm/44XvdXqtY10QRNeqCpFztsLk
         U/viLK65r6BH7HHHhorCnXKYNHG6MMiE/1E/rzxYn69LgB9+XAqVRvRY0hgdEffp30yr
         To/fN6vcHYSa+bLe7oj47K2XmKCJYaxagXjT80A23sgIX9uNpA1Pc0lpmeOKJXx/Nlj4
         y/wckTsc0aUYgQ3izyrmI/HDaUNTZI7CEhl4s3qdwbDzybvnDbUUsdxGVOOmxXysE7tO
         WG1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778622169; x=1779226969;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HZBTM8+POocGGsNMhTX/G6ztjo97essQwrtNHa4/o8c=;
        b=giwXWfTXseS99jvpx/8fFZf0TE5tiqAGGra0gPaMBp2pRLE9z6ct4s1LCJZNyyOm5z
         saJ3r5w3zCatZ9yVUhHi0SkUU07Tfcp63aP+wjx2MI/8WzwKSu3ejHvsqxIHCNzUfNST
         +pi/QyT3ejAXriMroubUJTX+RvsCR7w+TvesCPEf5JFwRjNEs/vP2yK3n0XzH2RPepE1
         QjIajBVz0knrSN7PSyKJQd6z9L+E4GKn9TUfffqmHkgoBAGF6sOlyrIrUJBEHen/B+KX
         PivOz0bnwuF+hX8dBeVmyd3+QKKN6l2eo8l2fUMITB8IMq4GSNSDOs/NJ2Q0C+PzhHf0
         DxaA==
X-Gm-Message-State: AOJu0YyCuuVCtIeEVuwliDQ0HwubuDkkYbsGqyiVVocw76leH3Ch6wNV
	h7m9oeNgr8Nye+WFAEtD2qgyone9U6YPdYB1+TeiTzUc92rxa3QRo9Rsn4+mZp2/cnO3lxIRrbW
	AZxJprnboFgAuz4/PwmdcvztMsjVFf/k=
X-Gm-Gg: Acq92OHWS8pKZnbXOD6dMV/QWPGfnEUO/PWTAn6XClCJ/rYHksR0ebAt1LWYnrojQnX
	yapbGT7/h70OdRjqC+swa4CyNcsXjAXKvNRMtq7nimB3F9x0Yc8Y4DpaW0yuH28KLxmj/grwC7z
	9CyFXDdxuDPL+ddZRpf6TRReiD6B8uTp0t3gq6hfipgNcyZhDRULcNikughdqbQQy//atqqx37O
	oEBOEShU/9NBsvakyKMRejU9Ajfb0EiKuFTPcTjTqRGuifV4QVvw1zen0lEQOk78xYkxioKZhIv
	GALv9BmUluvJ1DiMo4NC
X-Received: by 2002:a05:6830:6612:b0:7de:5133:90df with SMTP id
 46e09a7af769-7e3da47a1c6mr331338a34.14.1778622169065; Tue, 12 May 2026
 14:42:49 -0700 (PDT)
MIME-Version: 1.0
References: <20260512070527.127409-1-li.zhou@windriver.com>
In-Reply-To: <20260512070527.127409-1-li.zhou@windriver.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Wed, 13 May 2026 09:42:37 +1200
X-Gm-Features: AVHnY4JF_UQoMYE3Px-I4sFnrZ1a1qpS0fEcHHAF90sAb_ftS17u--hZYjIlWfc
Message-ID: <CADySD0Hj3H83KTLxu520dzkEkTAUohhzu5Dy1K91DnjmMkco2w@mail.gmail.com>
Subject: Re: [oe][meta-oe][PATCH] haveged: upgrade 1.9.19 -> 1.9.20
To: li.zhou@windriver.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 12 May 2026 21:42:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126875

On Tue, May 12, 2026 at 7:05=E2=80=AFPM Li Zhou via lists.openembedded.org
<li.zhou=3Dwindriver.com@lists.openembedded.org> wrote:
>
> ChangeLog:
> https://github.com/jirka-h/haveged/releases/tag/v1.9.20
>
> Signed-off-by: Li Zhou <li.zhou@windriver.com>
> ---
>  .../haveged/{haveged_1.9.19.bb =3D> haveged_1.9.20.bb}            | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-oe/recipes-extended/haveged/{haveged_1.9.19.bb =3D> haveged_=
1.9.20.bb} (94%)
>
> diff --git a/meta-oe/recipes-extended/haveged/haveged_1.9.19.bb b/meta-oe=
/recipes-extended/haveged/haveged_1.9.20.bb
> similarity index 94%
> rename from meta-oe/recipes-extended/haveged/haveged_1.9.19.bb
> rename to meta-oe/recipes-extended/haveged/haveged_1.9.20.bb
> index 69de5628c4..2ea12b3977 100644
> --- a/meta-oe/recipes-extended/haveged/haveged_1.9.19.bb
> +++ b/meta-oe/recipes-extended/haveged/haveged_1.9.20.bb
> @@ -6,7 +6,7 @@ HOMEPAGE =3D "https://www.issihosts.com/haveged/index.htm=
l"
>  LICENSE =3D "GPL-3.0-only"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb673463ab874e80d47fae=
504"
>
> -SRCREV =3D "0ef7dd915ee8be4ca2bb10b5cc2bee92b8ede61d"
> +SRCREV =3D "e2d96806273caa9ce7457e2f8669a3c40517ca27"
>  SRC_URI =3D "git://github.com/jirka-h/haveged.git;branch=3Dmaster;protoc=
ol=3Dhttps \

Can please include tag=3Dv${PV} in the SRC_URI

>  "
>
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#126859): https://lists.openembedded.org/g/openembedde=
d-devel/message/126859
> Mute This Topic: https://lists.openembedded.org/mt/119270981/3619737
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
nkur.tyagi85@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

