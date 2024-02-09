Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E7C3C4828F
	for <webhook@archiver.kernel.org>; Fri,  9 Feb 2024 15:56:27 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.15267.1707494177563298990
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Feb 2024 07:56:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZKTnN4HP;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-33b0ecb1965so558110f8f.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 09 Feb 2024 07:56:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707494176; x=1708098976; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yJQvab3enuUy57cVfLgUfL22NjuMSHaejdfnt+u59ko=;
        b=ZKTnN4HP6lHcfq7AQIyQ9xEL1OKf4wGUzfPW6lZRevOFbhOSJ4Z7f8cpejbb+PVXSl
         Dx42AdOErfodwhTeW9ISDKvsNNF/dVpCJpWaCZVvX6qjLdEpzIGAi+5J/496JQveuw7z
         cFazwJvacmDYBfnrcVgh9gro7+n0XqYtwUK83TTNiLxKHFSJPKVBfTrQ8XH0HAzRHZ+w
         3zz/fqiF5ceL5+QjCqOQI1LTxnQVHDOxQocb3geIcELX3XPowNoysUIK2yikoyFHISco
         FW/U6xvy3HDuU1IQIDAfL+YSa/QIMMi6aU06eTF9pZArHFU8eeHEm0uYYeD/bKR3Q1LB
         ArFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707494176; x=1708098976;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yJQvab3enuUy57cVfLgUfL22NjuMSHaejdfnt+u59ko=;
        b=g5qmz/tvxxbV1+PGpmQKNu+QISE7viLOLJGYf0euZn5crTD6sy7xakPWSq07ppveU4
         dIIaLgx3uFaJDUjIv0xkKHL4BAyOUoBVb3Eu7XDnr92KfMNSGrmECp63FLxrGSNS/A8W
         oJgRMiSuixsjYEoCaA3PrFObfYhArNCcbXXzfareSHntxmwk7m6pm3tHYeJYZv4ai1nz
         +DsIj8ORgHgP1mJo8+lD8fKRpUnW6x8CXNuVCCGCfycww0CdWH0LIC5/l0qgli/cK+iG
         KvzwDQ2Ko9rjTBhStpFSjuhYtJHkjNlNykBeLd2gqno0251l/JRvwjW+bR/BUQ2MK7oZ
         o7Fw==
X-Gm-Message-State: AOJu0YyEigQ4qqQFGD6akjtaqqMvM/J2RzslMtONT/XjwoJvSGEdE2D/
	1Ke/XSIgOh3MZJqckIAFC5Not1OQfK9Zb1Iw9vBsBL7HRrs8S0OrE+vb2o80N8H570hiJVnAgVq
	8QM2AJU73S2dg8RKkSR9YCfrMQZU=
X-Google-Smtp-Source: AGHT+IEYPmeXp8kr4GlFxlnlv7h0AoLiWNDuwDgoYePnZ0tOc42D704CFWkY7+EmMBcfIBskeWJ791jMt+qXMfk7dLU=
X-Received: by 2002:adf:f30f:0:b0:33b:6942:df07 with SMTP id
 i15-20020adff30f000000b0033b6942df07mr200679wro.21.1707494175802; Fri, 09 Feb
 2024 07:56:15 -0800 (PST)
MIME-Version: 1.0
References: <20240209153623.2759946-1-thomas.perrot@bootlin.com>
In-Reply-To: <20240209153623.2759946-1-thomas.perrot@bootlin.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 9 Feb 2024 16:55:59 +0100
Message-ID: <CA+chaQd7Zzd8jXCopME1-Xq3CCQUTNQU25sb8gkWQNmrnDH+uw@mail.gmail.com>
Subject: Re: [oe][meta-oe][PATCH] kernel-selftest: no longer skip ldflags QA
To: thomas.perrot@bootlin.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000ce08e90610f4f7ac"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Feb 2024 15:56:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108688

--000000000000ce08e90610f4f7ac
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 9, 2024 at 4:36=E2=80=AFPM Thomas Perrot via lists.openembedded=
.org
<thomas.perrot=3Dbootlin.com@lists.openembedded.org> wrote:

> From: Thomas Perrot <thomas.perrot@bootlin.com>
>
> Because there is no longer the error.
>
> Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
> ---
>  meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
> b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
> index 6868f175bcf1..7d21dac7d573 100644
> --- a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
> +++ b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
> @@ -156,7 +156,7 @@ FILES:${PN} +=3D "/usr/kernel-selftest"
>
>  RDEPENDS:${PN} +=3D "python3 perl perl-module-io-handle"
>  # tools/testing/selftests/vm/Makefile doesn't respect LDFLAGS and
> tools/testing/selftests/Makefile explicitly overrides to empty
> -INSANE_SKIP:${PN} +=3D "ldflags libdir"
> +INSANE_SKIP:${PN} +=3D "libdir"


please drop the comment about ldflags as well?

--000000000000ce08e90610f4f7ac
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Fri, Feb 9, 2024 at 4:36=E2=80=AFPM Th=
omas Perrot via <a href=3D"http://lists.openembedded.org">lists.openembedde=
d.org</a> &lt;thomas.perrot=3D<a href=3D"mailto:bootlin.com@lists.openembed=
ded.org">bootlin.com@lists.openembedded.org</a>&gt; wrote:<br></div><div cl=
ass=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From:=
 Thomas Perrot &lt;<a href=3D"mailto:thomas.perrot@bootlin.com" target=3D"_=
blank">thomas.perrot@bootlin.com</a>&gt;<br>
<br>
Because there is no longer the error.<br>
<br>
Signed-off-by: Thomas Perrot &lt;<a href=3D"mailto:thomas.perrot@bootlin.co=
m" target=3D"_blank">thomas.perrot@bootlin.com</a>&gt;<br>
---<br>
=C2=A0meta-oe/recipes-kernel/kernel-selftest/<a href=3D"http://kernel-selft=
est.bb" rel=3D"noreferrer" target=3D"_blank">kernel-selftest.bb</a> | 2 +-<=
br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta-oe/recipes-kernel/kernel-selftest/<a href=3D"http://kerne=
l-selftest.bb" rel=3D"noreferrer" target=3D"_blank">kernel-selftest.bb</a> =
b/meta-oe/recipes-kernel/kernel-selftest/<a href=3D"http://kernel-selftest.=
bb" rel=3D"noreferrer" target=3D"_blank">kernel-selftest.bb</a><br>
index 6868f175bcf1..7d21dac7d573 100644<br>
--- a/meta-oe/recipes-kernel/kernel-selftest/<a href=3D"http://kernel-selft=
est.bb" rel=3D"noreferrer" target=3D"_blank">kernel-selftest.bb</a><br>
+++ b/meta-oe/recipes-kernel/kernel-selftest/<a href=3D"http://kernel-selft=
est.bb" rel=3D"noreferrer" target=3D"_blank">kernel-selftest.bb</a><br>
@@ -156,7 +156,7 @@ FILES:${PN} +=3D &quot;/usr/kernel-selftest&quot;<br>
<br>
=C2=A0RDEPENDS:${PN} +=3D &quot;python3 perl perl-module-io-handle&quot;<br=
>
=C2=A0# tools/testing/selftests/vm/Makefile doesn&#39;t respect LDFLAGS and=
 tools/testing/selftests/Makefile explicitly overrides to empty<br>
-INSANE_SKIP:${PN} +=3D &quot;ldflags libdir&quot;<br>
+INSANE_SKIP:${PN} +=3D &quot;libdir&quot;</blockquote><div><br></div><div>=
please drop the comment about ldflags as well?=C2=A0</div></div></div>

--000000000000ce08e90610f4f7ac--

