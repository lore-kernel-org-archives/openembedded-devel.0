Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D990CD6E45
	for <webhook@archiver.kernel.org>; Fri, 29 May 2026 08:52:02 +0000 (UTC)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6250.1780044719546378591
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 May 2026 01:51:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=mwtbbifH;
 spf=pass (domain: gmail.com, ip: 209.85.128.172, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-7dc73a56b5aso13678037b3.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 29 May 2026 01:51:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780044718; cv=none;
        d=google.com; s=arc-20240605;
        b=Y9S7xIQY6y9VqPr5rTMIxwFwhzND+dIUUjjjAsNryytnBEZvLT/ItYm4yus+ww2CQk
         eYHcxBeZwtf/NDG3D3290EZRVsQi5YOzzuxyw2z3Fs8fZ6JNy/w8tkljapLQEllxP0hL
         JbpY9Y9AX/6FqXESLHdTiYnw0YcLSIYtEW820n/qKk+1Z7r6kZgVXrZXCI19zmUjZl3i
         AS5qteOnXjSaVMfs9DXZmuGVMP1DbXsqpkUmvPr5zpAbmrbgpn9bzakkmG2CR95gTtau
         JcNK87hDqLGBKktp17WQCWBsJ8+nGHPdnvgCyDljtooGUy7aMyNvZYv7OvXImtcOEoHf
         P38A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=QyI8fErsydaXO2ecTGMGUMy8nA32rVt22A06Dv02Bd4=;
        fh=H0WPD9t+arvweePxRadW7pCJJzTVivudu2OcYPkVQXM=;
        b=juDdNIS38dUdLhQQjkqemqbDYsS6znOX3esgNrjXcnvbwC4wVGX/uiOLjjL8wpcRmT
         VetBKfh4F4Ml15ehF6dJ3APM8pfe7CMbTexHEiJAN7O7v9/afLdtWSeBLKFo5rH8jOxk
         OhgrLD8LXBsaDa6tuT6tvT0spPO6RQFu3XtJTOpfXFF5UVSolNQiLGZ6ewIDnnUAcUVz
         xUcURLOebH3RFJ8AGGXoMKmHqCL9WjUjnV5wNUSLw/ovbOWZblbfyeymuZiQYKqXjWgW
         YDrzs26xwcjYwv9Un7ctCsKimV5c4En0MhBEl37Ov52uiCKaumUh0fIkDtCzEaKLfsmp
         iFPA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780044718; x=1780649518; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QyI8fErsydaXO2ecTGMGUMy8nA32rVt22A06Dv02Bd4=;
        b=mwtbbifHIHGvw82k3w//kvp+yonxWVgV8vJN3A4js93LlXdayRf8i0QUr2HHfwk8Vz
         eNcBE/eLqcZf6SB4eLOVfw93c0I6T/3rs7PadRcvF0HM17UR4SG/Bn8HNx5KyzmWk6of
         3QbS41SnfRK29KZIKdyZs41uN7QpSsPJhp8cb9cr6cOeZnXH12cAlWufBQIJEZw3fbnl
         pYcKRPUJOOXe9cQrFw4aAwzCgpBTfGyJzgNhz73KGDBNF2IYd+XyOrCzQfcHsgHNqZB2
         b3aa/MYPP8kb5FQQ8jyTVjudEPPf9b9UUE5E9AQSfSDOmHUYbqk6zqBo7/iLv/lA0U+h
         pVBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780044718; x=1780649518;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QyI8fErsydaXO2ecTGMGUMy8nA32rVt22A06Dv02Bd4=;
        b=nclvuGAmhCnpnHl1Qy+C/28RiNWDM+xjZGMNIRkFKlYQohCWT18V9ArqvGoRYvT3ck
         nkQ/RKo3LV7t6RbpYcI/IFkGcYxXmWM0jWmMP2hoXfmIGlXuA8qWHiWRQBxeNaf6u83m
         l0WZVIgU4kC3nzk5CakT/68RPmfZkkNFQm5weUQ0Bl/WXCBUGKWRgIrVtXMS61YXSojm
         hAi2tujvwXzbFJuNxdM5MvDtprHYDrgTaL4MII5tz04wPJUaJhbpUM9aGA7zn0Tpkbh8
         ivh+hUZqMdEtXIHaHqb9+EHRj3arAPtzNE0JCmCBMTWAyTLIGTwU3Kdm50GoA6H3Mynl
         lwqw==
X-Gm-Message-State: AOJu0YyRuQMuwvuINqAP9X6nJ4OFEhBkwLXHxZ8nAswa0vaNhNx2299K
	keJ2t4F2c1SzANkfqCptTt+N7LYRbMcEdCeed4b5Y+PPhrAlcUF+FDwmmqMBiqKVb5OVi5q7WbF
	fjqLwGYvaQvkvCu5OOnQJaIglR3OJ/FA=
X-Gm-Gg: Acq92OHDc+65EiwcXwoo8b9NTkVpzL+DeBhQ3bIMHUZXb8HD87r7DIGb+zyQLjmJQ7I
	ny/bvH21t0ymnrAFfXISGCbOWpC87w6drcz6nAtoBuLx6239twXIQ5phyTiGDPFr2p6STNWPk0g
	LqSxDOqwWZ4VmEEKe0qSIhWkLJ/+q+mYoi6KAq0//gpwphIpnTP3ROaaQJ4m5JpEeL42lxak7hd
	e2ZIJ7ZvjZfIV0UWM3I048iwu8O84M/tKWKXyH3iOIfYLpBYd8vPXJFwpwqw3lFV0Eej8tCbsII
	SvF7EZKx9+JZF8ekT7kbOAyNkhF9FnzADqxA+xJIRPMYxoDqzC1YHQFA6SpBZSWFtVUFxrsOIl5
	vvIQUViPY9yjzpy/BqrscVRJ/j8/U4LMwbr22sA3mHP716FaiLWkrPbeA7yfFNz44JhtX3r5Kei
	y4KVeTMtp5L9z4quTd0sBi01E9VEk=
X-Received: by 2002:a05:690c:6a11:b0:799:198d:8c5a with SMTP id
 00721157ae682-7de489c8ee4mr15248167b3.34.1780044718515; Fri, 29 May 2026
 01:51:58 -0700 (PDT)
MIME-Version: 1.0
References: <20260524065341.82660-1-emailaddress.ashish@gmail.com> <1873030.1779965250546887877@lists.openembedded.org>
In-Reply-To: <1873030.1779965250546887877@lists.openembedded.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 29 May 2026 10:51:47 +0200
X-Gm-Features: AVHnY4IIIhJ4dANaGUF_TTasz-0GFRlr00tZNOXavwM7o0F7ZPr9Q175d0V8XNQ
Message-ID: <CAMKF1soum1vO6ekJcEa6jY5G+cOM0jWLyA47yAbG3yrdU+Bh5g@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v4 0/4] android-tools: migration and cleanup
To: Ashish Kumar Mishra <ashishkumar.mishra@bmwtechworks.in>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000021abc50652f0f55e"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 29 May 2026 08:52:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127283

--00000000000021abc50652f0f55e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I am traveling so merging is a bit slow . Hopefully this will have no
issues and will be in master soon. Thanks for contributing to make meta-oe
better

On Thu, May 28, 2026, 12:47=E2=80=AFPM AshishKumar Mishra via lists.openemb=
edded.org
<ashishkumar.mishra=3Dbmwtechworks.in@lists.openembedded.org> wrote:

> Hi Khem / Gyorgy / Team ,
>
> Good Evening
>
> Just a follow up if team can merge this patch , i see it in master-next
> branch for 3-4 days now
> Do we follow any specific wait days after which the master-next moves to
> master
> Trying to understand the process better
>
> Thanks ,
> Ashish
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#127274):
> https://lists.openembedded.org/g/openembedded-devel/message/127274
> Mute This Topic: https://lists.openembedded.org/mt/119463944/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000021abc50652f0f55e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">I am traveling so merging is a bit slow . Hopefully this =
will have no issues and will be in master soon. Thanks for contributing to =
make meta-oe better=C2=A0</div><br><div class=3D"gmail_quote gmail_quote_co=
ntainer"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, May 28, 2026, 12:47=
=E2=80=AFPM AshishKumar Mishra via <a href=3D"http://lists.openembedded.org=
">lists.openembedded.org</a> &lt;ashishkumar.mishra=3D<a href=3D"mailto:bmw=
techworks.in@lists.openembedded.org">bmwtechworks.in@lists.openembedded.org=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
<div><span style=3D"color:rgb(51,51,51);font-family:system-ui,&quot;Segoe U=
I&quot;,Roboto,&quot;Helvetica Neue&quot;,&quot;Noto Sans&quot;,&quot;Liber=
ation Sans&quot;,Arial,sans-serif,&quot;Apple Color Emoji&quot;,&quot;Segoe=
 UI Emoji&quot;,&quot;Segoe UI Symbol&quot;,&quot;Noto Color Emoji&quot;;fo=
nt-size:16px;font-style:normal;font-variant-ligatures:normal;font-variant-c=
aps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-inde=
nt:0px;text-transform:none;word-spacing:0px;white-space:normal;background-c=
olor:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:i=
nitial;float:none;display:inline">Hi Khem / Gyorgy / Team ,=C2=A0<br><br></=
span>Good Evening=C2=A0<br><br>Just a follow up if team can merge this patc=
h , i see it in master-next branch for 3-4 days now=C2=A0<br>Do we follow a=
ny specific wait days after which the master-next moves to master=C2=A0<br>=
Trying to understand the process better=C2=A0<br><br>Thanks ,<br>Ashish=C2=
=A0</div>
<div>=C2=A0</div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#127274): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/127274" rel=3D"noreferrer noreferrer" target=3D"_b=
lank">https://lists.openembedded.org/g/openembedded-devel/message/127274</a=
><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/119463944/199=
7914" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openemb=
edded.org/mt/119463944/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank" rel=3D"noreferrer">openembedded-devel+owner@lists.=
openembedded.org</a><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.opene=
mbedded.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmai=
l.com" target=3D"_blank" rel=3D"noreferrer">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--00000000000021abc50652f0f55e--

