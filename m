Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A947C28B2E
	for <webhook@archiver.kernel.org>; Mon, 10 Mar 2025 12:34:37 +0000 (UTC)
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
 by mx.groups.io with SMTP id smtpd.web10.36423.1741610075370830788
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Mar 2025 05:34:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XfPVOpuB;
 spf=pass (domain: gmail.com, ip: 209.85.167.180, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-3f3d1280f3dso1129822b6e.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 10 Mar 2025 05:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741610074; x=1742214874; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Pc4km4aIVllT4H8iHo4VAXXtH8yzKyOWklwJLs19QXY=;
        b=XfPVOpuB7/JqsFAxxg2HlVOw5DQBXBw+bcdardVik17+TpWvmlylc9Nt+cd++5gpf0
         h3sxgQ/28YUHXW4sCtF0DqunELDX2VOQ0rkrSZm6u+98gzxtard6Jskg3wA++K76ZE2K
         9xDYU5JSQEFxlacN92CZ1QcHu9Ff8hmBmI9QK2Pm2Wkzn025iDWVcTgj/Vm+MrUHqPPv
         RGgy2FGrUZUV0UEyLLLXgEsfn0KQaB2EPo2VHlh252gcncSJJoUWfd8WXWFdWXgP8JQy
         qigsQljw84eqOjeCpttIAcgfQO/oIMU4QIxjkENEuDgn2Y3/3WtvCjIQ995MlroeRQwB
         mMuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741610074; x=1742214874;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pc4km4aIVllT4H8iHo4VAXXtH8yzKyOWklwJLs19QXY=;
        b=oeZTtXmGY6k036K0fng8TKlGZOwaXtsFf0y/GcG2iciJbqtYygJ8VZVGlS2Olyg7J9
         FiMtvFjg/1Mg6IbGpoNi7yA4w+RIChz9NXY+Yd54H01pbNX5QHB6Q9E+A396dvubOssH
         QRrBxs4T91e7YZz/JVfxCp0UAIFW4aUlkhidS0vs40ozS1ru2tw2yfaIPfg3O9kt9Bvi
         +ZtdW9MOCb42VEKfa3koThFt1ETG6aoOciHQMyFjfB7xlvcjB9Kof+JGfw8p9EDkNXao
         ivv+JHvHV7AARznGMFPqaYE2yeF6ZWHR1oZZAUxCZ/miqS9sdupeD7n8ahbr2iADD7DN
         aY0A==
X-Gm-Message-State: AOJu0Yz6RLP4NFfXQlCPLcuj6ACGNWtDblnbF12eujrzhJxSADmFhAvR
	3RtVbMPZG6T6CVdOfQFcYqvimg0rSZSi7/KcBuo5T+3+EdOdLFqkqGwAxkA0SVnOdouH+9pOe/Y
	4VbXhfue8H8ROiW3Yc0shydeKY3A=
X-Gm-Gg: ASbGncundquu6pk1Rk6xfLiYuP/yofwN0hqkwAGWaRQwhcT4tRq8LatTgl0NaiLoESS
	dEjVc0eO1ljl6+95yanCwsc+qo11DePqk1d+xqve6H8EJMoqEgTFJnAdEw3tg9nFz5iOVpEt5wz
	DgxyRbpXAUtniKQcg35wZPHi8F4VmhPaoSf7Qch/bYsKEo4F5sFe/1jNl/zg==
X-Google-Smtp-Source: AGHT+IHd0gYGmjdOReZEXNpRLBnxUjOUCEuHtGHIQ78h/KcQuv7cQj+kxONtGRoPMk4W94lzV48wsEkt+41LWFoTo3s=
X-Received: by 2002:a05:6808:f0a:b0:3f6:7651:d24a with SMTP id
 5614622812f47-3f697b5d606mr6909039b6e.16.1741610074571; Mon, 10 Mar 2025
 05:34:34 -0700 (PDT)
MIME-Version: 1.0
References: <20250307093255.1110778-1-awais.belal@gmail.com>
 <20250307093255.1110778-2-awais.belal@gmail.com> <CAMKF1spsyTBdgD_we=X2Q9vpGFhBi-0E59ArdGyKr3KB-8g3Gg@mail.gmail.com>
 <CAM=5Amb6u5-8pmud11do97X4UAwLToizR9SiGjPD=4+Zqet6Rw@mail.gmail.com>
In-Reply-To: <CAM=5Amb6u5-8pmud11do97X4UAwLToizR9SiGjPD=4+Zqet6Rw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 10 Mar 2025 05:34:23 -0700
X-Gm-Features: AQ5f1JrTvvLg5axY8GODrl-Wjb0dR9m3MDodmmkMagVF4ngKPrOhUYTfchovXKQ
Message-ID: <CAMKF1sroz=jLxp9PfMkZoQwtRjyvDZhK15kGLS32q5vu7dxcHA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][scarthgap][PATCH 2/2] mongodb: update to 4.4.29
To: Awais Belal <awais.belal@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000d5092f062ffc31f2"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Mar 2025 12:34:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115833

--000000000000d5092f062ffc31f2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 10, 2025 at 2:24=E2=80=AFAM Awais Belal <awais.belal@gmail.com>=
 wrote:

>
>> I am seeing this  build failure on master
>>
>> | File
>> "/srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/core2-64-poky-=
linux/mongodb/4.4.29/git/src/mongo/base/generate_error_codes.py",
>> line 31, in <module>
>> | from Cheetah.Template import Template
>> | File
>> "/srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/core2-64-poky-=
linux/mongodb/4.4.29/recipe-sysroot-native/usr/lib/python3.13/site-packages=
/Cheetah/Template.py",
>> line 24, in <module>
>> | import cgi # Used by .webInput() if the template is a CGI script.
>> | ^^^^^^^^^^
>> | ModuleNotFoundError: No module named 'cgi'
>> | Generating build/59f4f0dd/mongo/db/repl/repl_settings_gen.cpp
>> | scons: *** [build/59f4f0dd/mongo/base/error_codes.h] Error 1
>> | scons: building terminated because of errors.
>> | build/59f4f0dd/mongo/base/error_codes.h failed: Error 1
>>
>>
>  The changeset was intended for scarthgap and I haven't made sure if
> master builds. Is that a requirement? The cgi module was dropped in pytho=
n
> 3.13 which is what master is following at this point. I might send a
> separate series for master once I move on to that.
>

Patches are routed by master to release branches if they are needed in
master. They are done for master and then backported

>

--000000000000d5092f062ffc31f2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote gmail_quote_container"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Mon, Mar 10, 2025 at 2:24=E2=80=AFAM=
 Awais Belal &lt;<a href=3D"mailto:awais.belal@gmail.com">awais.belal@gmail=
.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding=
-left:1ex;border-left-color:rgb(204,204,204)"><div dir=3D"ltr"><div class=
=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;bo=
rder-left-color:rgb(204,204,204)"><br>I am seeing this=C2=A0 build failure =
on master<br>
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
v></blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Patches are ro=
uted by master to release branches if they are needed in master. They are d=
one for master and then backported=C2=A0</div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-st=
yle:solid;padding-left:1ex;border-left-color:rgb(204,204,204)"><div dir=3D"=
ltr"><div class=3D"gmail_quote"><div dir=3D"auto"></div></div></div>
</blockquote></div></div>

--000000000000d5092f062ffc31f2--

