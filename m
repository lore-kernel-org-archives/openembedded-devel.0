Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05908C48BC3
	for <webhook@archiver.kernel.org>; Tue, 20 Feb 2024 05:00:42 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.web10.6789.1708405231671706630
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Feb 2024 21:00:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ERX1D8qk;
 spf=pass (domain: gmail.com, ip: 209.85.128.182, mailfrom: ticotimo@gmail.com)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6082d35b690so17016657b3.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 21:00:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708405231; x=1709010031; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8WQKZStH5JPNEEEHqlBHnGnMff1fPWVdqEYZ3D9Xv8s=;
        b=ERX1D8qkXyIl1O4ssLNnppFxCsh6Wzh2zN6Oim5uI9zgLIiAgP7PMgNOUpEa3/xloG
         1S5LpD9nEzRDIspycKBGkNAYFp2n85vxkXIamcjD4edn6gTxIJo92zXg4Zuy6RvHFjeV
         D5W9Y6gmGpaGJdJ9Na+qWHAcsfYjPGVT5Ak3pchNJLSjerqZTVsgdqirouaAQK4rRTEn
         eenXGD1o81Um7isbFvFzMvjiaFxLC0kPw6T7VMaXVnVSgj5ZPE0lBSK6VuUsCWy1dSG/
         O7vftHXevLLhB9sLrxivgSWx3EiN7pTPXCbyz8wTzPQWzEGQFY0lP9NDCDrmcG3TUbtw
         lkYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708405231; x=1709010031;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8WQKZStH5JPNEEEHqlBHnGnMff1fPWVdqEYZ3D9Xv8s=;
        b=VrrxHJh+PgCYfaBJ07OUU1hHLMwsM0AQc/ukZOGmYZnlZuUnZ/e2sULbW+jHMDQ9Zw
         F690NQCIpvbsa+hjZlRtQXB8Y00bpLGSWW620QM7rV5/Y7q39qQfa5YTXYomRGt9KC8Q
         ILLVk50CRg0oxiyF3A4igjo/5zqO33/qJ+OKLt7ZA5r/1aci4EryL7piPpAKR03KTcEd
         HSb3um/wCAdbdWvjdVVkjd5OXEb2qP2UdHmOyIpcGoSVHKK3kA4VjLJ4pRMcKGiOU8eA
         SNyJs3cw1O8r/nxb9jdYSJxPhAyOxKxZn0aQEcIF2tHIRK9BNXZvys6Omqi+IZLU2Cr7
         nkyQ==
X-Gm-Message-State: AOJu0YxhXbS/eSC4n07TkYP7T6jLSxNZAFyGuLINSMvQWbAJbt35iwwC
	d9Ptq7olnnzXllXlFGz+IV+jf7qbc1SYb6yPQrIzflWIQfxoNKEcvktpYIbRCbS1xy/ZJ0/o2dY
	bys/sc6BzIQRfewy1bH+nZU8JG4Io5IirmCg=
X-Google-Smtp-Source: AGHT+IGk1XXNvV+Kjo2pUws3WIu+LYAWzky5kJkLUcuYY1P7a8buy8NYEf7jeuvSPQR6duUcnVDJJAq6fiHs6ecPt7g=
X-Received: by 2002:a0d:e8c6:0:b0:608:6219:36ae with SMTP id
 r189-20020a0de8c6000000b00608621936aemr895322ywe.39.1708405230580; Mon, 19
 Feb 2024 21:00:30 -0800 (PST)
MIME-Version: 1.0
References: <20240219214801.1514843-1-derek@asterius.io> <20240219214801.1514843-2-derek@asterius.io>
In-Reply-To: <20240219214801.1514843-2-derek@asterius.io>
From: Tim Orling <ticotimo@gmail.com>
Date: Mon, 19 Feb 2024 21:00:19 -0800
Message-ID: <CANx9H-Bcjhc2TeGrpHfAYNePt21hZ2=sL8_CEK_2spLRPwZRfA@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 2/8] python3-msgpack: re-add working ptest
To: Derek Straka <derek@asterius.io>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000e6b69a0611c9165c"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Feb 2024 05:00:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108913

--000000000000e6b69a0611c9165c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

2024-02-19 18:23:55 - INFO     - WARNING:
meta-python-image-ptest-python3-msgpack-1.0-r0 do_testimage: There were
failing ptests.
<snip>
2024-02-19 18:23:55 - INFO     - AssertionError:
2024-02-19 18:23:55 - INFO     - ptests which had no test results:
2024-02-19 18:23:55 - INFO     - ['python3-msgpack']

On Mon, Feb 19, 2024 at 1:48=E2=80=AFPM Derek Straka <derek@asterius.io> wr=
ote:

> Signed-off-by: Derek Straka <derek@asterius.io>
> ---
>  meta-python/conf/include/ptest-packagelists-meta-python.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc
> b/meta-python/conf/include/ptest-packagelists-meta-python.inc
> index 51fcdd2b2..09fd7eb25 100644
> --- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
> +++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
> @@ -23,6 +23,7 @@ PTESTS_FAST_META_PYTHON =3D "\
>      python3-intervals \
>      python3-ipy \
>      python3-iso3166 \
> +    python3-msgpack \
>      python3-multidict \
>      python3-parse-type \
>      python3-platformdirs \
> @@ -75,7 +76,6 @@ PTESTS_PROBLEMS_META_PYTHON =3D"\
>      python3-jdcal \
>      python3-jsmin \
>      python3-license-expression \
> -    python3-msgpack \
>      python3-ordered-set \
>      python3-parse \
>      python3-pillow \
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#108887):
> https://lists.openembedded.org/g/openembedded-devel/message/108887
> Mute This Topic: https://lists.openembedded.org/mt/104456244/924729
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000e6b69a0611c9165c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">2024-02-19 18:23:55 - INFO =C2=A0 =C2=A0 - WARNING: meta-p=
ython-image-ptest-python3-msgpack-1.0-r0 do_testimage: There were failing p=
tests.<br>&lt;snip&gt;<br>2024-02-19 18:23:55 - INFO =C2=A0 =C2=A0 - Assert=
ionError:<br>2024-02-19 18:23:55 - INFO =C2=A0 =C2=A0 - ptests which had no=
 test results:<br>2024-02-19 18:23:55 - INFO =C2=A0 =C2=A0 - [&#39;python3-=
msgpack&#39;]<br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" clas=
s=3D"gmail_attr">On Mon, Feb 19, 2024 at 1:48=E2=80=AFPM Derek Straka &lt;<=
a href=3D"mailto:derek@asterius.io">derek@asterius.io</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">Signed-off-by: Derek S=
traka &lt;<a href=3D"mailto:derek@asterius.io" target=3D"_blank">derek@aste=
rius.io</a>&gt;<br>
---<br>
=C2=A0meta-python/conf/include/ptest-packagelists-meta-python.inc | 2 +-<br=
>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc b/=
meta-python/conf/include/ptest-packagelists-meta-python.inc<br>
index 51fcdd2b2..09fd7eb25 100644<br>
--- a/meta-python/conf/include/ptest-packagelists-meta-python.inc<br>
+++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc<br>
@@ -23,6 +23,7 @@ PTESTS_FAST_META_PYTHON =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0python3-intervals \<br>
=C2=A0 =C2=A0 =C2=A0python3-ipy \<br>
=C2=A0 =C2=A0 =C2=A0python3-iso3166 \<br>
+=C2=A0 =C2=A0 python3-msgpack \<br>
=C2=A0 =C2=A0 =C2=A0python3-multidict \<br>
=C2=A0 =C2=A0 =C2=A0python3-parse-type \<br>
=C2=A0 =C2=A0 =C2=A0python3-platformdirs \<br>
@@ -75,7 +76,6 @@ PTESTS_PROBLEMS_META_PYTHON =3D&quot;\<br>
=C2=A0 =C2=A0 =C2=A0python3-jdcal \<br>
=C2=A0 =C2=A0 =C2=A0python3-jsmin \<br>
=C2=A0 =C2=A0 =C2=A0python3-license-expression \<br>
-=C2=A0 =C2=A0 python3-msgpack \<br>
=C2=A0 =C2=A0 =C2=A0python3-ordered-set \<br>
=C2=A0 =C2=A0 =C2=A0python3-parse \<br>
=C2=A0 =C2=A0 =C2=A0python3-pillow \<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#108887): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/108887" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/108887</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/104456244/924=
729" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/104456244/924729</a><br>
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

--000000000000e6b69a0611c9165c--

