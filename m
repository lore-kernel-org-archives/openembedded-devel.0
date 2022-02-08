Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62173C433F5
	for <webhook@archiver.kernel.org>; Tue,  8 Feb 2022 15:50:27 +0000 (UTC)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com
 [209.85.217.41])
 by mx.groups.io with SMTP id smtpd.web08.12889.1644335426301224994
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Feb 2022 07:50:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MXREI8i/;
 spf=pass (domain: gmail.com, ip: 209.85.217.41,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-vs1-f41.google.com with SMTP id b2so3853974vso.9
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Feb 2022 07:50:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nWhytmzkZsRLLinlTa+sl82KrE+cwof+UL/IftJ4C/A=;
        b=MXREI8i/OqGV0x1G+/tGABb/aLa/P2v7uQsD71m3NhIohb3//KdtShLIUyQvTTTRXp
         yaHwmNswlzziB20Ue+LoJG1msbqmmcsvVkdf3hPcBlHQveh2RMYuKDxAwfuTNflra5OP
         /BUianSqI2gmN/DvXgl4PmDnocK7gJ2TNQL9qNittdp0DGPD8dLFJ7FUWU5niNHBuL79
         NuS2S3h2JmeCvww+rNpI9mp+Erk3XDZBvdWiutgJPdsatBRwsjsMgskqQEeg5xK/syML
         J9a7QEzLQzeUhDXQav1Ome9xe3bbfUu0MEgu9B9PX6A8W1jynz3BiodqL5Gj2mnk58oe
         /XvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nWhytmzkZsRLLinlTa+sl82KrE+cwof+UL/IftJ4C/A=;
        b=WPT2adXFgiB2BoWjR51OrL8VxHl8ZijAGU9XVC9YPPYkRfcjvt9k84r7r0FZ+WY4ZX
         /caRz/YTZ7q2gZV3hW4dse76Lkrb0eIWa3oP2Spdx7sG97w8vMNaVWGzvy/AkzcveXb4
         SOkYn3w89yg421mUogu92E/dJ85VDiKE9nOa5W+v0aTl9eRW/Xl3o6tU8RXdrVBtaMCL
         QEa4csTJEqcNVGdb2eXqTtw9/1XOnik2KhELUmwrvb+VGeiZSlk+QkmUhPN9N8jbrP8J
         Rn0am16s96QYgpO1/I/wy8B48XkP9RM5GRFIbRx9J8SdcGWQh2FlsHn04HGEPnL80kgp
         kjvw==
X-Gm-Message-State: AOAM530RFGF+5aCXvyEFkVjhIUm6U7sTrxtgtiB9LtMnRWaGyDWOvlmX
	Ifr4d+kDLAaPRj0wT0KaDWsuzyNb0B3pANBe+yc=
X-Google-Smtp-Source: 
 ABdhPJwpgtcuXssrsS1SnbwDsFg7OO+soTnfH5LhxzBxupXuD2PPUXZdYbItLAX2X+8nuHmnNYAqBx8zs4LK8qzZ4h4=
X-Received: by 2002:a67:ea4e:: with SMTP id r14mr1254889vso.51.1644335425405;
 Tue, 08 Feb 2022 07:50:25 -0800 (PST)
MIME-Version: 1.0
References: <20220208154731.10107-1-pkj@axis.com>
In-Reply-To: <20220208154731.10107-1-pkj@axis.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 8 Feb 2022 16:50:11 +0100
Message-ID: 
 <CA+chaQdodr+hu7Eh8ndGgpZSNPqfx5BO2ZHLMrEFuaQQ47speg@mail.gmail.com>
Subject: Re: [oe] [honister][PATCH] insane.bbclass: Correct
 package_qa_check_empty_dirs()
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000ec467f05d783ac21"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Feb 2022 15:50:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95265

--000000000000ec467f05d783ac21
Content-Type: text/plain; charset="UTF-8"

This should be sent to oe-core ML.

On Tue, Feb 8, 2022 at 4:47 PM Peter Kjellerstedt <
peter.kjellerstedt@axis.com> wrote:

> The oe.qa.add_message() method is not available in Honister, use
> package_qa_add_message() instead.
>
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
>  meta/classes/insane.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
> index bfaf2577d0..2c8f5338e5 100644
> --- a/meta/classes/insane.bbclass
> +++ b/meta/classes/insane.bbclass
> @@ -945,7 +945,7 @@ def package_qa_check_empty_dirs(pkg, d, messages):
>              recommendation = (d.getVar('QA_EMPTY_DIRS_RECOMMENDATION:' +
> dir) or
>                                "but it is expected to be empty")
>              msg = "%s installs files in %s, %s" % (pkg, dir,
> recommendation)
> -            oe.qa.add_message(messages, "empty-dirs", msg)
> +            package_qa_add_message(messages, "empty-dirs", msg)
>
>  def package_qa_check_encoding(keys, encode, d):
>      def check_encoding(key, enc):
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#95264):
> https://lists.openembedded.org/g/openembedded-devel/message/95264
> Mute This Topic: https://lists.openembedded.org/mt/88999081/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> Martin.Jansa@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000ec467f05d783ac21
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This should be sent to oe-core ML.</div><br><div class=3D"=
gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Feb 8, 2022 at 4=
:47 PM Peter Kjellerstedt &lt;<a href=3D"mailto:peter.kjellerstedt@axis.com=
">peter.kjellerstedt@axis.com</a>&gt; wrote:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">The oe.qa.add_message() method is not availabl=
e in Honister, use<br>
package_qa_add_message() instead.<br>
<br>
Signed-off-by: Peter Kjellerstedt &lt;<a href=3D"mailto:peter.kjellerstedt@=
axis.com" target=3D"_blank">peter.kjellerstedt@axis.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/insane.bbclass | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass<br>
index bfaf2577d0..2c8f5338e5 100644<br>
--- a/meta/classes/insane.bbclass<br>
+++ b/meta/classes/insane.bbclass<br>
@@ -945,7 +945,7 @@ def package_qa_check_empty_dirs(pkg, d, messages):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0recommendation =3D (d.getVa=
r(&#39;QA_EMPTY_DIRS_RECOMMENDATION:&#39; + dir) or<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;but it is expected to be empty&=
quot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0msg =3D &quot;%s installs f=
iles in %s, %s&quot; % (pkg, dir, recommendation)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 oe.qa.add_message(messages, &quo=
t;empty-dirs&quot;, msg)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 package_qa_add_message(messages,=
 &quot;empty-dirs&quot;, msg)<br>
<br>
=C2=A0def package_qa_check_encoding(keys, encode, d):<br>
=C2=A0 =C2=A0 =C2=A0def check_encoding(key, enc):<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#95264): <a href=3D"https://lists.openembedded.org/g/ope=
nembedded-devel/message/95264" rel=3D"noreferrer" target=3D"_blank">https:/=
/lists.openembedded.org/g/openembedded-devel/message/95264</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/88999081/3617=
156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/88999081/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:Martin.Jansa@gmail.com" =
target=3D"_blank">Martin.Jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000ec467f05d783ac21--

