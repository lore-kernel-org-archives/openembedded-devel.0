Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02B05C48BC4
	for <webhook@archiver.kernel.org>; Tue, 20 Feb 2024 04:59:32 +0000 (UTC)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
 by mx.groups.io with SMTP id smtpd.web10.6760.1708405171212035736
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Feb 2024 20:59:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZJdBzfxG;
 spf=pass (domain: gmail.com, ip: 209.85.219.173, mailfrom: ticotimo@gmail.com)
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-dcc73148611so5824219276.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 20:59:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708405170; x=1709009970; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DGRrbrgH77GEHkl2dODS0YHSvxmE0v5CB96KTEfFQR4=;
        b=ZJdBzfxG1Mm92fQgicgxyX5+Z47Ef7pEAaQaUfr9NquivNnwbm0BLvGnda2OUZmZ/2
         WjhAjywgfF88+sHwPlz5bct4uiTmeRZoQP79oKuQZV6PzZ4HWVfiECw9NZvzYr/q5HjO
         taZZu8djQE5evYIjKxDvDGJvspXN6hDz7ascIkfWZ1hkudnpOhI4/i7CNJ42hNCexA9X
         jw0O9MXnDjb/MgoZCC3lKMQ50g1EPp6MezsV5U3a4IbDhyS/3eoyHb1qlaKs/lNXxUM4
         K2mHmNiZje4uny6cmQOY9DTGm7xcDvpQzh61OXDBp76m7rvnE2Nwr40ph664nZCRo6KI
         iYBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708405170; x=1709009970;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DGRrbrgH77GEHkl2dODS0YHSvxmE0v5CB96KTEfFQR4=;
        b=HejgY5qI1TgMj0QxGr5rzoMEfOCfLm+wwJ/ZqniqqGSrPahrL6gy+FDzuu6B18awCj
         iyV/bo91TzxvMztgrytRL1hw7POqiHC9Otm4MSDwE/n+yOoP73SPqqrA9ePw1UQQTQaN
         YgDplnbkLfmiqR6s5iYa8DVJJHuQO8urRGtNEX/p3JxKQ6eZrDvm2iv9CxxLRIpJE/+j
         odmG7jyt5gJIbE79U+77UVKE7/dkPWY8BDOr6d9FyZFNdt7W/YLLO9NeSoiV4YGwrezh
         pbVq8drobO6celo9t26SwpnnM+L9mR5oFdSrSfEkoqdLUj6g55uLnKVhlcwxqjUabLxE
         XTxw==
X-Gm-Message-State: AOJu0Yx6I1KbPcJXi8UyExz7Cf1tH48NpLHD5T3x+8OEn9HqSgHoOpDS
	FtUELr+EwUkb6Lf3VPN2NzJ60LhXruEx0GEujl5lt5s/4EzeIqFxpKxd0Nsp+yD6O/E1ALoX238
	qD1k+a3OPEW5C5W+xxoFJDQaQGGavvNkpllk=
X-Google-Smtp-Source: AGHT+IE0mKoGeZpBwdjz3QmashpUuYUGUaIp8fc8oNb2wEMpEDKqBw7urGt2TikMuY0f9rH4XdvzSwDOV8CrxGj0VRg=
X-Received: by 2002:a25:fc09:0:b0:dce:182e:bf64 with SMTP id
 v9-20020a25fc09000000b00dce182ebf64mr10274586ybd.49.1708405170183; Mon, 19
 Feb 2024 20:59:30 -0800 (PST)
MIME-Version: 1.0
References: <20240219214801.1514843-1-derek@asterius.io> <20240219214801.1514843-3-derek@asterius.io>
In-Reply-To: <20240219214801.1514843-3-derek@asterius.io>
From: Tim Orling <ticotimo@gmail.com>
Date: Mon, 19 Feb 2024 20:59:19 -0800
Message-ID: <CANx9H-BrMN8p_3ZH4c3C4bb+XMO4gfMGQonirgGXmcJatUm+7Q@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 3/8] python3-jsmin: re-add functional ptests
To: Derek Straka <derek@asterius.io>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000004d23b10611c913cb"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Feb 2024 04:59:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108912

--0000000000004d23b10611c913cb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

2024-02-19 18:19:43 - INFO     - WARNING:
meta-python-image-ptest-python3-jsmin-1.0-r0 do_testimage: There were
failing ptests.
<snip>
2024-02-19 18:19:43 - INFO     - self.fail(failmsg)
2024-02-19 18:19:43 - INFO     - AssertionError:
2024-02-19 18:19:43 - INFO     - ptests which had no test results:
2024-02-19 18:19:43 - INFO     - ['python3-jsmin']

On Mon, Feb 19, 2024 at 1:48=E2=80=AFPM Derek Straka <derek@asterius.io> wr=
ote:

> Supress warnings about syntax for the tests
>
> Signed-off-by: Derek Straka <derek@asterius.io>
> ---
>  meta-python/conf/include/ptest-packagelists-meta-python.inc | 2 +-
>  meta-python/recipes-devtools/python/python3-jsmin/run-ptest | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc
> b/meta-python/conf/include/ptest-packagelists-meta-python.inc
> index 09fd7eb25..98ebdd07a 100644
> --- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
> +++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
> @@ -23,6 +23,7 @@ PTESTS_FAST_META_PYTHON =3D "\
>      python3-intervals \
>      python3-ipy \
>      python3-iso3166 \
> +    python3-jsmin \
>      python3-msgpack \
>      python3-multidict \
>      python3-parse-type \
> @@ -74,7 +75,6 @@ PTESTS_PROBLEMS_META_PYTHON =3D"\
>      python3-gunicorn \
>      python3-inotify \
>      python3-jdcal \
> -    python3-jsmin \
>      python3-license-expression \
>      python3-ordered-set \
>      python3-parse \
> diff --git a/meta-python/recipes-devtools/python/python3-jsmin/run-ptest
> b/meta-python/recipes-devtools/python/python3-jsmin/run-ptest
> index cbcfffda5..2f04130b9 100644
> --- a/meta-python/recipes-devtools/python/python3-jsmin/run-ptest
> +++ b/meta-python/recipes-devtools/python/python3-jsmin/run-ptest
> @@ -1,3 +1,3 @@
>  #!/bin/sh
>
> -python3 test.py
> +python3 -W ignore test.py
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#108888):
> https://lists.openembedded.org/g/openembedded-devel/message/108888
> Mute This Topic: https://lists.openembedded.org/mt/104456245/924729
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000004d23b10611c913cb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">2024-02-19 18:19:43 - INFO =C2=A0 =C2=A0 - WARNING: meta-p=
ython-image-ptest-python3-jsmin-1.0-r0 do_testimage: There were failing pte=
sts.<br>&lt;snip&gt;<br>2024-02-19 18:19:43 - INFO =C2=A0 =C2=A0 - self.fai=
l(failmsg)<br>2024-02-19 18:19:43 - INFO =C2=A0 =C2=A0 - AssertionError:<br=
>2024-02-19 18:19:43 - INFO =C2=A0 =C2=A0 - ptests which had no test result=
s:<br>2024-02-19 18:19:43 - INFO =C2=A0 =C2=A0 - [&#39;python3-jsmin&#39;]<=
br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_att=
r">On Mon, Feb 19, 2024 at 1:48=E2=80=AFPM Derek Straka &lt;<a href=3D"mail=
to:derek@asterius.io">derek@asterius.io</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">Supress warnings about syntax for th=
e tests<br>
<br>
Signed-off-by: Derek Straka &lt;<a href=3D"mailto:derek@asterius.io" target=
=3D"_blank">derek@asterius.io</a>&gt;<br>
---<br>
=C2=A0meta-python/conf/include/ptest-packagelists-meta-python.inc | 2 +-<br=
>
=C2=A0meta-python/recipes-devtools/python/python3-jsmin/run-ptest | 2 +-<br=
>
=C2=A02 files changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc b/=
meta-python/conf/include/ptest-packagelists-meta-python.inc<br>
index 09fd7eb25..98ebdd07a 100644<br>
--- a/meta-python/conf/include/ptest-packagelists-meta-python.inc<br>
+++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc<br>
@@ -23,6 +23,7 @@ PTESTS_FAST_META_PYTHON =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0python3-intervals \<br>
=C2=A0 =C2=A0 =C2=A0python3-ipy \<br>
=C2=A0 =C2=A0 =C2=A0python3-iso3166 \<br>
+=C2=A0 =C2=A0 python3-jsmin \<br>
=C2=A0 =C2=A0 =C2=A0python3-msgpack \<br>
=C2=A0 =C2=A0 =C2=A0python3-multidict \<br>
=C2=A0 =C2=A0 =C2=A0python3-parse-type \<br>
@@ -74,7 +75,6 @@ PTESTS_PROBLEMS_META_PYTHON =3D&quot;\<br>
=C2=A0 =C2=A0 =C2=A0python3-gunicorn \<br>
=C2=A0 =C2=A0 =C2=A0python3-inotify \<br>
=C2=A0 =C2=A0 =C2=A0python3-jdcal \<br>
-=C2=A0 =C2=A0 python3-jsmin \<br>
=C2=A0 =C2=A0 =C2=A0python3-license-expression \<br>
=C2=A0 =C2=A0 =C2=A0python3-ordered-set \<br>
=C2=A0 =C2=A0 =C2=A0python3-parse \<br>
diff --git a/meta-python/recipes-devtools/python/python3-jsmin/run-ptest b/=
meta-python/recipes-devtools/python/python3-jsmin/run-ptest<br>
index cbcfffda5..2f04130b9 100644<br>
--- a/meta-python/recipes-devtools/python/python3-jsmin/run-ptest<br>
+++ b/meta-python/recipes-devtools/python/python3-jsmin/run-ptest<br>
@@ -1,3 +1,3 @@<br>
=C2=A0#!/bin/sh<br>
<br>
-python3 test.py<br>
+python3 -W ignore test.py<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#108888): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/108888" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/108888</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/104456245/924=
729" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/104456245/924729</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:ticotimo@gmail.com" targ=
et=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000004d23b10611c913cb--

