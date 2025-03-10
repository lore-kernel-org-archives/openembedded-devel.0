Return-Path: <awais.belal@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09F16C28B2E
	for <webhook@archiver.kernel.org>; Mon, 10 Mar 2025 09:24:36 +0000 (UTC)
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
 by mx.groups.io with SMTP id smtpd.web11.33287.1741598675399530214
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Mar 2025 02:24:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=exGBMij5;
 spf=pass (domain: gmail.com, ip: 209.85.160.48, mailfrom: awais.belal@gmail.com)
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-2bcceee7b41so901442fac.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 10 Mar 2025 02:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741598674; x=1742203474; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=30tLpQNufO6KYlPgPZWy+oOzyZSynPD3ERBFphhqzXI=;
        b=exGBMij5cGeBPJYNggX5XRs6j8yPNIVMDVnvVPxV3RHDq5q76Cc2esVeAPC11c25ke
         vS982u1N/yqPzZYJ29qzuCNQtW9LthA8H1iSYUI+C6sfL0xc4cmuCzI5zYlT14ykvlQK
         wxVFOSbeVIIfyTO1ArQbXDy4fUXx26bMnOvpvX5Mg6lOXCd2cyzHMzNemCPMFFcAKxGT
         EOsZZdzlELxCq6Wgzp6c2awfktNt1YmZAln3KGmRnRjOwr6WOhG32XfcDMwOW09ARxkL
         gi++BqpY5thjXhNZ1Pdl9//5x3phP+DHoptMAW7Kk6A0he+9/WAIhxFFfrKIWuRuLuMv
         FAGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741598674; x=1742203474;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=30tLpQNufO6KYlPgPZWy+oOzyZSynPD3ERBFphhqzXI=;
        b=qqtw5KejOqHvA0uWOjx04od6HE7lhbGwIhHDqhCCbFeTtzBgWxFRffStuEFct5riOG
         tCKz6TVtA09Ffz/wr5x+2EgwvbfK3ea/GO1Y4YLhdg9cAUQMpZ5zVSMKNHub0AgTkfDl
         +fJQjZXKERZ6L2gGRpNUKCJbAFaMNJPjczbwAGWYdhVhnXqjdQof+isC5/2Qw2Y8JfK1
         meuDti6u9JY8KLg0arxz+rBcWwj6xfQR/s40Ef5taO7KH5G5dIlcA7yl8GNiIbd0f6Fe
         NPkNCgbi3leiGgJVdl3a+A238rL59CqkTCcqjTymdUsrVagfGWMnpI9UAUlakO1n7GWD
         miIA==
X-Gm-Message-State: AOJu0YyKDiMzlgF28rFmV0EzYnTXJwpzG0e4TIzm2is7HaB3p+67FbH9
	rof9kNgPRdv/649FnKQJTIH84hFcCmWAUJ+8PD9YSUurnWxwf3qdmU7xKJWtgC0y3rB0l1Gwp6M
	12/g+p4lR0dF430rXcPUzexRckjY=
X-Gm-Gg: ASbGncuXpDmAp4SkldrPtzmvNX9Xq60dglOjgq3dRiAbLcUt0BAc8GY7/EJtIsFXdc3
	IH1kC/5b/VrByDTsEm0VHZodemVavpQiAr6e9MJErBISMDBDIjJDxDGfNtnk2Wd5UULicXpqzJz
	xrCOS+YG0Y+tSbY7eg+N4adxyXlvE=
X-Google-Smtp-Source: AGHT+IFmZdDOvEI3oWPwRUY0EhNRUdbuEGfnHU+0qGoSQsx543zM0JsjcPkGKsNFoH96Vjk/nM03iF4Hmo249VdyDZg=
X-Received: by 2002:a05:6870:8dc4:b0:29f:b09d:d93a with SMTP id
 586e51a60fabf-2c26109a7b7mr6175379fac.16.1741598674422; Mon, 10 Mar 2025
 02:24:34 -0700 (PDT)
MIME-Version: 1.0
References: <20250307093255.1110778-1-awais.belal@gmail.com>
 <20250307093255.1110778-2-awais.belal@gmail.com> <CAMKF1spsyTBdgD_we=X2Q9vpGFhBi-0E59ArdGyKr3KB-8g3Gg@mail.gmail.com>
In-Reply-To: <CAMKF1spsyTBdgD_we=X2Q9vpGFhBi-0E59ArdGyKr3KB-8g3Gg@mail.gmail.com>
From: Awais Belal <awais.belal@gmail.com>
Date: Mon, 10 Mar 2025 14:24:23 +0500
X-Gm-Features: AQ5f1Jp7cE1ms3UKqXZjEKq2BDT9zNgic0aPgzueIvWjQci7CETX0ykOLcUbi5w
Message-ID: <CAM=5Amb6u5-8pmud11do97X4UAwLToizR9SiGjPD=4+Zqet6Rw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][scarthgap][PATCH 2/2] mongodb: update to 4.4.29
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000054965e062ff98aca"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Mar 2025 09:24:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115825

--00000000000054965e062ff98aca
Content-Type: text/plain; charset="UTF-8"

>
>
> I am seeing this  build failure on master
>
> | File
> "/srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/core2-64-poky-linux/mongodb/4.4.29/git/src/mongo/base/generate_error_codes.py",
> line 31, in <module>
> | from Cheetah.Template import Template
> | File
> "/srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/core2-64-poky-linux/mongodb/4.4.29/recipe-sysroot-native/usr/lib/python3.13/site-packages/Cheetah/Template.py",
> line 24, in <module>
> | import cgi # Used by .webInput() if the template is a CGI script.
> | ^^^^^^^^^^
> | ModuleNotFoundError: No module named 'cgi'
> | Generating build/59f4f0dd/mongo/db/repl/repl_settings_gen.cpp
> | scons: *** [build/59f4f0dd/mongo/base/error_codes.h] Error 1
> | scons: building terminated because of errors.
> | build/59f4f0dd/mongo/base/error_codes.h failed: Error 1
>
>
 The changeset was intended for scarthgap and I haven't made sure if master
builds. Is that a requirement? The cgi module was dropped in python 3.13
which is what master is following at this point. I might send a separate
series for master once I move on to that.

--00000000000054965e062ff98aca
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote gmail_quote_container"><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex"><br>I am seeing this=C2=A0 build f=
ailure on master<br>
<br>
| File &quot;/srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/core2=
-64-poky-linux/mongodb/4.4.29/git/src/mongo/base/generate_error_codes.py&qu=
ot;,<br>
line 31, in &lt;module&gt;<br>
| from Cheetah.Template import Template<br>
| File &quot;/srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/core2=
-64-poky-linux/mongodb/4.4.29/recipe-sysroot-native/usr/lib/python3.13/site=
-packages/Cheetah/Template.py&quot;,<br>
line 24, in &lt;module&gt;<br>
| import cgi # Used by .webInput() if the template is a CGI script.<br>
| ^^^^^^^^^^<br>
| ModuleNotFoundError: No module named &#39;cgi&#39;<br>
| Generating build/59f4f0dd/mongo/db/repl/repl_settings_gen.cpp<br>
| scons: *** [build/59f4f0dd/mongo/base/error_codes.h] Error 1<br>
| scons: building terminated because of errors.<br>
| build/59f4f0dd/mongo/base/error_codes.h failed: Error 1<br><br></blockquo=
te><div><br>=C2=A0The changeset was intended for scarthgap and I haven&#39;=
t made sure if master builds. Is that a requirement? The cgi module was dro=
pped in python 3.13 which is what master is following at this point. I migh=
t send a separate series for master once I move on to that.</div></div></di=
v>

--00000000000054965e062ff98aca--

