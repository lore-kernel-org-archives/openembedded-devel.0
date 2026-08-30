Return-Path: <rob.woolleywr@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D85DC61DD9
	for <webhook@archiver.kernel.org>; Sun, 30 Aug 2026 09:39:48 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6016.1788082786438165789
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Aug 2026 02:39:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=OS78/XYf;
 spf=pass (domain: gmail.com, ip: 209.85.128.177, mailfrom: rob.woolleywr@gmail.com)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-861feb6d61bso5094267b3.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 30 Aug 2026 02:39:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788082785; cv=none;
        d=google.com; s=arc-20260327;
        b=S4y0ung4dUBV8m2tsetjWd1jAdBPy0bv5MH59yxCK5OH8/wtCrR/P61yDVlQpfKT8c
         JRgJ51Sj9RTuYitO3xPpYlUTh44FLQq+Y0HjW94fepulP0693ye/EL2gY4ijpd5a79SG
         afKgAZ4bwGgSoTP53H7LkpBPMP9TsgVAMO46zsZ51n0DsrXdsNMXCU4yqQhXVAyYnCXs
         bj0+ER1wARFwCfo2sF97f5LtgXaKsZGJPddHsoAvRzubbWLN5YSqK55RegJVrZc984C1
         35PxjFg8sQB10VdvG7MzwsjyrjBdODqPKn2EZw2vli60z06HvDLNPHk/DpruefVQQIOx
         wS8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=bBE3WMB75uDwO8yBkMPvmjX78XdXYMw16jpDndCW3VQ=;
        fh=xcS4RZANSVRjGVd48CS40Xdh8DYR9xQ2gUwMOj5xU+I=;
        b=AXPaUJCFmOLSYAfkhfXwG6SheKJiwgRFEb5ATcTbJta0oj56aO+Ob/jaGUgHT9Odv3
         /qz0McsG81Z1/fHYDS26tZ4Y8DEd+Kq8qPy+LsysHvCCysGOuxDcjeWYPzcaMPkUmdAO
         t/grNZ9zYubJebTyto76ipXUYknyMBRTTBjFiZr7eKlxYK5Vqoql7MYPe72RaRkUYnme
         TP7JHP+8L3mjfqh+6v+XVqst/5uMxfT95B3qy+stCrIsrQ0ShwMVHvgtEypRFZI364jq
         0BSEsGbdbAg4L8XBni3RJiCCplCu9ljESyo3essACZIdc1tomZWrwBhcTgBWZd3rbDwt
         z/zQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788082785; x=1788687585; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bBE3WMB75uDwO8yBkMPvmjX78XdXYMw16jpDndCW3VQ=;
        b=OS78/XYfVWGWhp+YTe/XMzSvZRUULqIdaJwkfhlXaYMOxU9srDlQrhb3yEf5yGnSz/
         NieBuQX8a9IQp+tLf0b59CouG1yLyZazeQPxzwg9FiTj8DmeETvhbIMLvs0fuAlt21fo
         vql7nu6WKkxNDzOTqhESeAG3iY1x/ikqUn+djGSttE0Knd0oUcw0yrRn7+CF9Fw/fVQp
         A1P3qOXC4gWubNjI20VSt5vNLEneCLGCHVPk2216IwDUpOwNNtROxYQrQi3mr/a+ZBUf
         qUq/2Fgj6J6fHda1mDeWZouobz8v++ER5mBlAMTHgZ2pApbh1qv7yXB98/sDrRDFBVBT
         CSYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788082785; x=1788687585;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bBE3WMB75uDwO8yBkMPvmjX78XdXYMw16jpDndCW3VQ=;
        b=HMS54T1XXBZmXQMn2550ObxDbCBoEA9VmvKtWahEIDkD5Ggktz/YeagEjO+P5zgu++
         LgT7Q2IeKXZVIBrE5hXFHfoH0O2lkn7V9L78QzDHNNYVhRbd9RYwt7Y7GTwRQPfPbjJ+
         jjVi+hSkYRJsIHLLbT0BFsSdenb4tanxuodk0ZqQDcbhUfBwcyPMQU0Z1ZtLIfIQv29W
         VhXAd5Nan+9XSubGMu/isEqQwZfVtHBFz28TA6j2aYJ/WcbieojZNGZVzsgk3ynwjOvO
         K8pQ9OQLgIV9BOpQg8VrrRlHOMD0vZ52Gxy2bErHgzLnL6b8GwF32N2hFwCPswTcxuqc
         mylQ==
X-Gm-Message-State: AFuF++nCNMimg9w82EHWPFP5zpjrZrFY+mjFSNUnKlOTkRqeMcm1nBHB
	cZeDsxgL9pCUl2n7ebbZJp3A5W84bTvg9gHxpSnjJQ8N7Z/jZAG7HhpxWUDmjamC7kBGAgjJZMV
	hdwSHlNaDdTTfx0d6PXgTB7caxgUq7/U=
X-Gm-Gg: AYBFou0E+fSKSOonQXxlx+4ywZBIcVbKrqA+N1khU2Ys5CoLxSQ6r+djszyDf79PDAN
	t4BqAfGqM9Ws/Ja+AX4bTS1cKuqXgvLHr1flKtjZVGvWZrlMjZVZ9LVVtz8cbaRsToxazF0GCgj
	E4m8qABecfRGMJ0S2qfocHYBeWZ18e6g+ThkTPV+YS5Ob6p7e85RxdRXOF7ntMo6Quf6eKRhrZu
	jq+Kh1RTQQQhW4LXsv/q+EnWgD/AYvWx5N+kgdZiP7Rrh9xaF66jTgCRyop7wCzYa2CFpSJazAe
	Ydx4MW4/pRmfBWc60RpYncYaMT8RxyU4egS1KpIw/VO9i7u9SzDsPV+99VB121upHvnWBsmHpjn
	H0mn7Hbwi9fXw
X-Received: by 2002:a05:690c:6603:b0:81e:eb11:6e5f with SMTP id
 00721157ae682-85d6faae854mr61927607b3.34.1788082785372; Sun, 30 Aug 2026
 02:39:45 -0700 (PDT)
MIME-Version: 1.0
References: <20260827122023.76593-1-jaipaul.cheernam@est.tech>
 <CAGAhMBwE0G_1v=v50bCvtUPc_9NVzCs_o1wxOKD9f2zNK1FaJw@mail.gmail.com> <2925873.1788073672353896461@lists.openembedded.org>
In-Reply-To: <2925873.1788073672353896461@lists.openembedded.org>
From: Rob Woolley <rob.woolleywr@gmail.com>
Date: Sun, 30 Aug 2026 05:39:34 -0400
X-Gm-Features: AcwNN1Xv6FHyy9bJ7m02IGEg2WsJ16pLv1QGLh_b1pLspNQUQDzcrsn1gejw2yY
Message-ID: <CAGAhMBw=XgtZ5cQ0wpWj7ySiEZEtLhAVrbUYjGOx=ALPcJyAtQ@mail.gmail.com>
Subject: Re: [oe] [PATCH] doxygen: upgrade 1.17.0 -> 1.18.0
To: jaipaul.cheernam@est.tech
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000404e17065a4077ff"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 30 Aug 2026 09:39:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129594

--000000000000404e17065a4077ff
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jaipaul,

Thanks for the quick reply.  As far as I can see the configgen.py gets run
on every run:
https://github.com/doxygen/doxygen/blob/master/src/CMakeLists.txt#L47

The buildpath error gets introduced by this commit in the 1.18.0 release:
https://github.com/doxygen/doxygen/commit/6985a2ef063773c1f3ccd3755fdf6b7f8=
1f44f4c

Out of curiosity, what do you see in the files generated on your system?

Regards,
Rob

On Sun, Aug 30, 2026 at 3:07=E2=80=AFAM Jaipaul Cheernam via lists.openembe=
dded.org
<jaipaul.cheernam=3Dest.tech@lists.openembedded.org> wrote:

> Hi Robb,
>
> No I didn't get this QA build path failure and may I know is there any
> prerequisite that trigger this ?
>
> I built on Ubuntu 24.
>
> Regrads,
> Jaipaul
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#129593):
> https://lists.openembedded.org/g/openembedded-devel/message/129593
> Mute This Topic: https://lists.openembedded.org/mt/120954979/556952
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> rob.woolleywr@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000404e17065a4077ff
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Jaipaul,<br><br>Thanks for the quick reply.=C2=A0 As fa=
r as I can see the configgen.py gets run on every run:=C2=A0<a href=3D"http=
s://github.com/doxygen/doxygen/blob/master/src/CMakeLists.txt#L47">https://=
github.com/doxygen/doxygen/blob/master/src/CMakeLists.txt#L47</a><br><br>Th=
e buildpath error gets introduced by this commit in the 1.18.0 release: <a =
href=3D"https://github.com/doxygen/doxygen/commit/6985a2ef063773c1f3ccd3755=
fdf6b7f81f44f4c">https://github.com/doxygen/doxygen/commit/6985a2ef063773c1=
f3ccd3755fdf6b7f81f44f4c</a><br><br>Out of curiosity, what do you see in th=
e files generated on your system?<br><br>Regards,<br>Rob</div><br><div clas=
s=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_att=
r">On Sun, Aug 30, 2026 at 3:07=E2=80=AFAM Jaipaul Cheernam via <a href=3D"=
http://lists.openembedded.org">lists.openembedded.org</a> &lt;jaipaul.cheer=
nam=3D<a href=3D"mailto:est.tech@lists.openembedded.org">est.tech@lists.ope=
nembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex"><div>Hi Robb,<br><br>No I didn&#39;t get this QA build path fa=
ilure and may I know is there any prerequisite that trigger this ?=C2=A0<br=
><br>I built on Ubuntu 24.=C2=A0</div>
<div>=C2=A0</div>
<div>Regrads,</div>
<div>Jaipaul</div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#129593): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/129593" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/129593</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/120954979/556=
952" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/120954979/556952</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:rob.woolleywr@gmail.com"=
 target=3D"_blank">rob.woolleywr@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000404e17065a4077ff--

