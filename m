Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDB90C48BC3
	for <webhook@archiver.kernel.org>; Tue, 20 Feb 2024 05:01:41 +0000 (UTC)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
 by mx.groups.io with SMTP id smtpd.web11.6804.1708405294982336532
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Feb 2024 21:01:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ab6KXJGe;
 spf=pass (domain: gmail.com, ip: 209.85.219.181, mailfrom: ticotimo@gmail.com)
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-dc6d24737d7so4347008276.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 21:01:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708405294; x=1709010094; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZR8NCKlqi323zWMoW2+VFeJnhLBPJ4uWqcIil+KuRoo=;
        b=Ab6KXJGe0K+3wSmyvL+xcVpUI65I91oXpuZ7uRU3L0FNNgOY6xnt7PPmNFQeGEW495
         mSTe3XbKatrQn/fH/d2kY70nlYu+OueUh4lbHtP1LujH7kuJD9nGCRkLF4ia20qx6iPC
         +0jPmhP6p4OvK7xsT4wUPd7rbIK3A0bvkMSb+aDUi3dq7If7L3lpJb7SzqABEbh9VqTM
         ng8HzcxoGHU5FuyVzKt74vBC4o7E4d9zBxbk+2fNBh4mJ6PhzBpop9aMjCoE//95yNz8
         QB4ILQi+Fpo+d4I/L+4G8vtK/9x8nmBaWk1iLciAFgmqwkSROz0JihQ8L3Yut3Tlwe+4
         QUxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708405294; x=1709010094;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZR8NCKlqi323zWMoW2+VFeJnhLBPJ4uWqcIil+KuRoo=;
        b=GcTGsdgEVa/+yhCSxGH+MNm3ofNDSkPIV2cKHegGNEo5sZM2FLz5PkK5KZL9ncadU3
         +nOSfdypY3Z7MD+1Cg10ceAwXzXIUxn+j8XuGFc6K9EodzAUGajCuklROgpc/v1yXLd5
         NkuTz/r7XwmXxFMB5r1tDQLtvxcRSsAkJFGuPC0SN8XXh2qocqDIDWMWrQqhvSJpRXQ7
         bnm9bs90xJMOLwf4H+lJgpvBmebL9ylepd1z1I0tOJw+bKQa3bDDqZsA2lbDzNjS7yTZ
         31G69Zqe8uwzG2RJEklstvgisV+h3VD/R6z/KjJjZD2cv/jUfyN2pwoZQQMB6Z1Q3Im5
         HEcQ==
X-Gm-Message-State: AOJu0Ywt4h0sfOsrF/T6zGx9g5hfWIgRey1GQcbua1u8sfsMFeSx9u4/
	RyjqBeKvo2BeRrcmnuJ2ejRwDcVFHTMTl+VPgr7a0d3O/e72tE6ww18HBM1+y7EOgjATFaaAbkP
	s5Qf+tqD4e8LoFsdjpZD0OWn5nrIlZy/Wyyg=
X-Google-Smtp-Source: AGHT+IFkOEBIgO8ZzxT4NXJGOktzBznhUuJl6JpcvS9kxiXdrs7HWbDNf1aM6gs7j5JHILSbnK6rN1OqOfJxNd3Caiw=
X-Received: by 2002:a25:b392:0:b0:d80:68d1:b826 with SMTP id
 m18-20020a25b392000000b00d8068d1b826mr11517621ybj.6.1708405294184; Mon, 19
 Feb 2024 21:01:34 -0800 (PST)
MIME-Version: 1.0
References: <20240219214801.1514843-1-derek@asterius.io> <20240219214801.1514843-4-derek@asterius.io>
In-Reply-To: <20240219214801.1514843-4-derek@asterius.io>
From: Tim Orling <ticotimo@gmail.com>
Date: Mon, 19 Feb 2024 21:01:23 -0800
Message-ID: <CANx9H-BzcedN7Qcj+LBFZW-kRAWaMk+txNamhCRLQnbcKR5rcQ@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 4/8] python3-parse: add back working ptests
To: Derek Straka <derek@asterius.io>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000b140e90611c91a67"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Feb 2024 05:01:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108914

--000000000000b140e90611c91a67
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

2024-02-19 18:27:51 - INFO     - WARNING:
meta-python-image-ptest-python3-parse-1.0-r0 do_testimage: There were
failing ptests.
<snip>
2024-02-19 18:27:51 - INFO     - AssertionError:
2024-02-19 18:27:51 - INFO     - ptests which had no test results:
2024-02-19 18:27:51 - INFO     - ['python3-parse']

On Mon, Feb 19, 2024 at 1:48=E2=80=AFPM Derek Straka <derek@asterius.io> wr=
ote:

> Signed-off-by: Derek Straka <derek@asterius.io>
> ---
>  meta-python/conf/include/ptest-packagelists-meta-python.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc
> b/meta-python/conf/include/ptest-packagelists-meta-python.inc
> index 98ebdd07a..ea6284264 100644
> --- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
> +++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
> @@ -26,6 +26,7 @@ PTESTS_FAST_META_PYTHON =3D "\
>      python3-jsmin \
>      python3-msgpack \
>      python3-multidict \
> +    python3-parse \
>      python3-parse-type \
>      python3-platformdirs \
>      python3-polyline \
> @@ -77,7 +78,6 @@ PTESTS_PROBLEMS_META_PYTHON =3D"\
>      python3-jdcal \
>      python3-license-expression \
>      python3-ordered-set \
> -    python3-parse \
>      python3-pillow \
>      python3-pint \
>      python3-pytest-lazy-fixture \
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#108889):
> https://lists.openembedded.org/g/openembedded-devel/message/108889
> Mute This Topic: https://lists.openembedded.org/mt/104456246/924729
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000b140e90611c91a67
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">2024-02-19 18:27:51 - INFO =C2=A0 =C2=A0 - WARNING: meta-p=
ython-image-ptest-python3-parse-1.0-r0 do_testimage: There were failing pte=
sts.<br>&lt;snip&gt;<br>2024-02-19 18:27:51 - INFO =C2=A0 =C2=A0 - Assertio=
nError:<br>2024-02-19 18:27:51 - INFO =C2=A0 =C2=A0 - ptests which had no t=
est results:<br>2024-02-19 18:27:51 - INFO =C2=A0 =C2=A0 - [&#39;python3-pa=
rse&#39;]<br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">On Mon, Feb 19, 2024 at 1:48=E2=80=AFPM Derek Straka &lt;<a hr=
ef=3D"mailto:derek@asterius.io">derek@asterius.io</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">Signed-off-by: Derek Strak=
a &lt;<a href=3D"mailto:derek@asterius.io" target=3D"_blank">derek@asterius=
.io</a>&gt;<br>
---<br>
=C2=A0meta-python/conf/include/ptest-packagelists-meta-python.inc | 2 +-<br=
>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc b/=
meta-python/conf/include/ptest-packagelists-meta-python.inc<br>
index 98ebdd07a..ea6284264 100644<br>
--- a/meta-python/conf/include/ptest-packagelists-meta-python.inc<br>
+++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc<br>
@@ -26,6 +26,7 @@ PTESTS_FAST_META_PYTHON =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0python3-jsmin \<br>
=C2=A0 =C2=A0 =C2=A0python3-msgpack \<br>
=C2=A0 =C2=A0 =C2=A0python3-multidict \<br>
+=C2=A0 =C2=A0 python3-parse \<br>
=C2=A0 =C2=A0 =C2=A0python3-parse-type \<br>
=C2=A0 =C2=A0 =C2=A0python3-platformdirs \<br>
=C2=A0 =C2=A0 =C2=A0python3-polyline \<br>
@@ -77,7 +78,6 @@ PTESTS_PROBLEMS_META_PYTHON =3D&quot;\<br>
=C2=A0 =C2=A0 =C2=A0python3-jdcal \<br>
=C2=A0 =C2=A0 =C2=A0python3-license-expression \<br>
=C2=A0 =C2=A0 =C2=A0python3-ordered-set \<br>
-=C2=A0 =C2=A0 python3-parse \<br>
=C2=A0 =C2=A0 =C2=A0python3-pillow \<br>
=C2=A0 =C2=A0 =C2=A0python3-pint \<br>
=C2=A0 =C2=A0 =C2=A0python3-pytest-lazy-fixture \<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#108889): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/108889" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/108889</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/104456246/924=
729" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/104456246/924729</a><br>
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

--000000000000b140e90611c91a67--

