Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DFB4ECAAA3
	for <webhook@archiver.kernel.org>; Fri, 26 Aug 2022 06:18:54 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com
 [209.85.128.180])
 by mx.groups.io with SMTP id smtpd.web08.34234.1661494724751212543
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Aug 2022 23:18:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kk6OIxfG;
 spf=pass (domain: gmail.com, ip: 209.85.128.180,
 mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f180.google.com with SMTP id
 00721157ae682-31f445bd486so11929287b3.13
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Aug 2022 23:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc;
        bh=CkVAbYHM7Xlnh5YuFVyqm0MIa01RRUEuJvxU7fCC3rE=;
        b=kk6OIxfGCKnZkQb0GGDXEO6aSQT72/nXvDcBzPIs48o6W6N+5wdEVwqJbqiYQeFdNE
         DDY+9U2nhAW+v+4dOnDnAfx+y7UqvxVkHA3OSoiTerpIYdKe7PQsqvmUaCin1fBWWH2m
         YqA5ujNlVEogvafRAoruKEHrs97etKXhxKsdSsM7UM81J+t0Bq4tufm6VBjK4VnDPpRR
         hwQYLECkPMAfRqirY0TFVPAwJYe/qQwISNfL9YUdAHv+Bnn6IimUWP6jMi70lKCapezH
         L31NPzMWa4QETOUeX4Hp3sbxzMc6jlJz+hVQiNMy6dJJCgLwFr7voAPlcWvJHur0Yhnt
         JOxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
        bh=CkVAbYHM7Xlnh5YuFVyqm0MIa01RRUEuJvxU7fCC3rE=;
        b=HqwXX0eWRjGLI6BdG8tCNbgbQBB0L8LvvsmYCPoIc+9isHvo5phUcjQd2bP/yrfZNc
         9dZfwFnmqnf+kOauVUhbPIMmyzMLxq1ciWLNfaxxVBF1IaDh3qBukX7y8Fge2OEjHs4V
         ByTtCubK/KnPjf7maUPWEYGx8OEZL3yhJVg+yADssHtifEOFA/ApQXXKTJoBxlJO0+hH
         QvGMxjkUy0pISs7x3uZJakpWh4yWXn6wW81LhkyWQ48dBsD9lL4NJHhX/8wUM1X9xmPw
         rI5boAk/yDY+ISlspoixiR+DUtDppV2KnKD+1rt+bH13y/N0ThjtbU0hUHtUPVMsmF3i
         U1uA==
X-Gm-Message-State: ACgBeo2v0QA6SdCLKqUevTIDPcLWromqDCAhvS8mQRJfQiIg2MUtNmue
	QrSfD/7yTaCL+O1+wwSXBcnB+hlVYGEdYNzINsd02xqlMHRVsA==
X-Google-Smtp-Source: 
 AA6agR6Z+Fj51hmdNKSZVNDOktvz2ZI5XyL9USGm79/zIWLEGNz2PKmQPl6YxdobL2+ylI1e/tfj0jE6ZuNp6foOhm8=
X-Received: by 2002:a05:6902:192:b0:695:7e89:ed5b with SMTP id
 t18-20020a056902019200b006957e89ed5bmr6096591ybh.226.1661494723855; Thu, 25
 Aug 2022 23:18:43 -0700 (PDT)
MIME-Version: 1.0
References: <1661482288-13218-1-git-send-email-zhengrq.fnst@fujitsu.com>
In-Reply-To: <1661482288-13218-1-git-send-email-zhengrq.fnst@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 25 Aug 2022 23:18:17 -0700
Message-ID: 
 <CAMKF1sotV_t9yN39P0V0-jaBFeJBXH-0P1PRNe-yQrJ5+eDzxg@mail.gmail.com>
Subject: Re: [oe] [meta-python] [PATCH] python3-awesomeversion: Upgrade 22.6.0
 -> 22.8.0
To: zhengruoqin <zhengrq.fnst@fujitsu.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Aug 2022 06:18:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98474

there is an upgrade already send here
https://patchwork.yoctoproject.org/project/oe/patch/20220823110204.2685251-=
1-leon.anavi@konsulko.com/

so I will drop this patch, please see whats in master-next and check
if all is ok.

On Thu, Aug 25, 2022 at 7:51 PM zhengruoqin <zhengrq.fnst@fujitsu.com> wrot=
e:
>
> Changelog:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D
>     =E2=9A=A0=EF=B8=8F Deprecate positional arguments
>     Change devcontainer
>     Do not allow find_first_match without ensure_strategy
>     Warn instead of raise for missing ensure_strategy
>     Correct spelling mistakes
>     Handle KeyError
>     _compare_versions takes AwesomeVersion not str
>
> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
> ---
>  ...wesomeversion_22.6.0.bb =3D> python3-awesomeversion_22.8.0.bb} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-python/recipes-devtools/python/{python3-awesomeversion_22.6.=
0.bb =3D> python3-awesomeversion_22.8.0.bb} (82%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-awesomeversion_2=
2.6.0.bb b/meta-python/recipes-devtools/python/python3-awesomeversion_22.8.=
0.bb
> similarity index 82%
> rename from meta-python/recipes-devtools/python/python3-awesomeversion_22=
.6.0.bb
> rename to meta-python/recipes-devtools/python/python3-awesomeversion_22.8=
.0.bb
> index cadb6f502d..550a8c439b 100644
> --- a/meta-python/recipes-devtools/python/python3-awesomeversion_22.6.0.b=
b
> +++ b/meta-python/recipes-devtools/python/python3-awesomeversion_22.8.0.b=
b
> @@ -4,7 +4,7 @@ SECTION =3D "devel/python"
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://LICENCE.md;md5=3D92622b5a8e216099be741d7832=
8bae5d"
>
> -SRC_URI[sha256sum] =3D "38f580bfacf1c06b674bcd0f68e0c445ebb03fcd3700c6a2=
c588fb9313308e0f"
> +SRC_URI[sha256sum] =3D "0469a801faafb3a7a13c529edc977ea04c3bce825af9ebb6=
02f58012bc487db5"
>
>  RDEPENDS:${PN} +=3D "python3-profile python3-logging"
>
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#98452): https://lists.openembedded.org/g/openembedded=
-devel/message/98452
> Mute This Topic: https://lists.openembedded.org/mt/93262976/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

