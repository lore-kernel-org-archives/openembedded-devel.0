Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A08CC433F5
	for <webhook@archiver.kernel.org>; Fri, 11 Mar 2022 05:27:04 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web12.2614.1646976423106278733
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Mar 2022 21:27:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mimz7W3f;
 spf=pass (domain: gmail.com, ip: 209.85.167.47,
 mailfrom: rybczynska@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id bu29so13291369lfb.0
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Mar 2022 21:27:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MVWW0ju5GqA3XTRTn2ktACVi5ifGcYs6ZHcBSLG/1eU=;
        b=mimz7W3fwb+7w1uyKmDEPrkZqsUwVXjbkBCwIGfCPAjfCePcdhV7lpV8HLVScgG3Xn
         Lz/+mA2fu6JQ3HyUvIkCvEND57ZtBpC3HgiRYlRfwZMyM58fNb90Xi+IArrLA8aJJmvv
         759AkEyJ2OXr8W2HZMb/hf09JsvgiDfX495NXJkMB1h++R+yd+wAXTeVR1JZ+FP+Vygh
         YNfqPNLLd6hYMFKhLQ3/hKt5FadfapMplJ4+xlW+pY4szL/S+vLb/MwyJzHb+HHjkT5W
         GmdXpr1sFsJAuKMruaP4OOAOdYTrApejwN9DM2aKpm10iVo+Legi67GmfxvvLdYSRQhk
         2tjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MVWW0ju5GqA3XTRTn2ktACVi5ifGcYs6ZHcBSLG/1eU=;
        b=K/UFlGUw9DdyO1SiGUmvNa7MCK9ldrrhWWTKzQWtkiefVNJ8YGoarxMo0GnrIXt8hD
         aXDMQ7fwVKw/8Y70GnjfBy2lc/tHFIxpqLd1s20JXL+tDHg7O+1Kmv72VfmHrPzxilr3
         sMtJ/wY6w39Hra71ljf5BV7GQgffLvmSDtafqNoWNiXvJ8njAl6U7WKXhBtsfZ/jnZqZ
         8XcNFFrh3fqPcRSYX3mhX8AgiTxJrkhCNpa1sxQvjykOMur5NJRUfSdfLSbY47FErsIx
         jbY54Smjj8HqHdGI2orZEKtRK7ZqKA5HzxdEztslWYq3CS/eYhHZLeVxkGeD8Hc4soAl
         IQgg==
X-Gm-Message-State: AOAM532R0dwrK/HWXVy0IFycXCAqSOFe10gxhIp5LhS80oPaoq1KNTwQ
	1ZAEl+If4GZZZpZZrXadPmrHcmi6Km/ruvbkqbU=
X-Google-Smtp-Source: 
 ABdhPJxsyCdb6zfaLlaPdmGOlHhaHWT4kVUonYW3O+BVAdt5K9OztyqWvwdaxdyCcOhlyKbIDZpsgE8I8sd5I9MYJdg=
X-Received: by 2002:a05:6512:2305:b0:448:614a:b597 with SMTP id
 o5-20020a056512230500b00448614ab597mr4127118lfu.277.1646976420931; Thu, 10
 Mar 2022 21:27:00 -0800 (PST)
MIME-Version: 1.0
References: <20220311041033.1684086-1-shin.matsunaga@fujitsu.com>
In-Reply-To: <20220311041033.1684086-1-shin.matsunaga@fujitsu.com>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Fri, 11 Mar 2022 06:26:48 +0100
Message-ID: 
 <CAApg2=RCBt272k4-b0x+ymoToqbHam7ZVJRFt=f4kw7zLQXJ8w@mail.gmail.com>
Subject: Re: [oe] [PATCH] ecryptfs-utils: add CVE-2016-1572 to allowlist
To: Matsunaga-Shinji <shin.matsunaga@fujitsu.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000085eefe05d9ea947d"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 11 Mar 2022 05:27:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95947

--00000000000085eefe05d9ea947d
Content-Type: text/plain; charset="UTF-8"

On Fri, Mar 11, 2022, 05:14 Matsunaga-Shinji <shin.matsunaga@fujitsu.com>
wrote:

> Patch for CVE-2016-1572 is applied in version 109.
>
> Signed-off-by: matsunaga-shinji <shin.matsunaga@fujitsu.com>
> ---
>  recipes-security/ecryptfs-utils/ecryptfs-utils_111.bb | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/recipes-security/ecryptfs-utils/ecryptfs-utils_111.bb
> b/recipes-security/ecryptfs-utils/ecryptfs-utils_111.bb
> index 9aefc32..d98724c 100644
> --- a/recipes-security/ecryptfs-utils/ecryptfs-utils_111.bb
> +++ b/recipes-security/ecryptfs-utils/ecryptfs-utils_111.bb
> @@ -68,3 +68,6 @@ FILES:${PN} += "${base_libdir}/security/*
> ${base_libdir}/ecryptfs/*"
>
>  RDEPENDS:${PN} += "cryptsetup"
>  RRECOMMENDS:${PN} = "gettext-runtime"
> +
> +# Patch for CVE-2016-1572 is applied in version 109.
> +CVE_CHECK_IGNORE += "CVE-2016-1572"
>

Wouldn't it be better to report this to the NVD and do the fix in the
database instead?

Regards
Marta

>

--00000000000085eefe05d9ea947d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Fri, Mar 11, 2022, 05:14 Matsunaga-Shinji &lt;<a hr=
ef=3D"mailto:shin.matsunaga@fujitsu.com">shin.matsunaga@fujitsu.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex">Patch for CVE-2016-1572 is =
applied in version 109.<br>
<br>
Signed-off-by: matsunaga-shinji &lt;<a href=3D"mailto:shin.matsunaga@fujits=
u.com" target=3D"_blank" rel=3D"noreferrer">shin.matsunaga@fujitsu.com</a>&=
gt;<br>
---<br>
=C2=A0recipes-security/ecryptfs-utils/<a href=3D"http://ecryptfs-utils_111.=
bb" rel=3D"noreferrer noreferrer" target=3D"_blank">ecryptfs-utils_111.bb</=
a> | 3 +++<br>
=C2=A01 file changed, 3 insertions(+)<br>
<br>
diff --git a/recipes-security/ecryptfs-utils/<a href=3D"http://ecryptfs-uti=
ls_111.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">ecryptfs-utils_1=
11.bb</a> b/recipes-security/ecryptfs-utils/<a href=3D"http://ecryptfs-util=
s_111.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">ecryptfs-utils_11=
1.bb</a><br>
index 9aefc32..d98724c 100644<br>
--- a/recipes-security/ecryptfs-utils/<a href=3D"http://ecryptfs-utils_111.=
bb" rel=3D"noreferrer noreferrer" target=3D"_blank">ecryptfs-utils_111.bb</=
a><br>
+++ b/recipes-security/ecryptfs-utils/<a href=3D"http://ecryptfs-utils_111.=
bb" rel=3D"noreferrer noreferrer" target=3D"_blank">ecryptfs-utils_111.bb</=
a><br>
@@ -68,3 +68,6 @@ FILES:${PN} +=3D &quot;${base_libdir}/security/* ${base_l=
ibdir}/ecryptfs/*&quot;<br>
<br>
=C2=A0RDEPENDS:${PN} +=3D &quot;cryptsetup&quot;<br>
=C2=A0RRECOMMENDS:${PN} =3D &quot;gettext-runtime&quot;<br>
+<br>
+# Patch for CVE-2016-1572 is applied in version 109.<br>
+CVE_CHECK_IGNORE +=3D &quot;CVE-2016-1572&quot;<br></blockquote></div></di=
v><div dir=3D"auto"><br></div><div dir=3D"auto">Wouldn&#39;t it be better t=
o report this to the NVD and do the fix in the database instead?</div><div =
dir=3D"auto"><br></div><div dir=3D"auto">Regards</div><div dir=3D"auto">Mar=
ta</div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"g=
mail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-l=
eft:1ex">
</blockquote></div></div></div>

--00000000000085eefe05d9ea947d--

