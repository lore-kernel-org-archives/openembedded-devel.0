Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 070FCCA9EBE
	for <webhook@archiver.kernel.org>; Fri,  9 Oct 2026 17:28:39 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1207.1791566910411380548
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Oct 2026 10:28:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=qovE/LPa;
 spf=pass (domain: gmail.com, ip: 209.85.128.182, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-8b05bf699easo36697627b3.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 09 Oct 2026 10:28:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791566909; cv=none;
        d=google.com; s=arc-20260327;
        b=CzFu7EufJJ43IlTE/fZKuayFr1lEti4JnZ15kpYtdggrbhkDef3PjYqR9xzGtr1p37
         Tfyp2S0uIWdNksEp+k6PEzDianiToFtwcV73+ajSB6+1TwXxAaktIxYgRvZdQ7dkKa60
         /sa+HqDklG7O7LpWURcvvQrn+fw5ftM7nUEretaIVjd8U+oBQPO3iLmrQ7+wEJMxS+EG
         cV6b209xwGU7DOvAOF1FtnDs1rNASQ5HQ+SeASOMOAyphEVa6aC3HDKuDHGkz2cdJevV
         Bhaht5YOnW/xZeOILKIZFh344Lrz/oxYSAXuWV2oc+oT7J2BTiv4JYSvfAiW/WUcAF0q
         QeOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Xe8jRkfpNz/P/ZqnPnKbX5+wRiqHAAj72WBD7udoZa0=;
        fh=CRRqV+fq3acp1YcHy1+JNxybe1rFY9IAgBIn7foH7Zw=;
        b=Q6PKCN8k5rPbw6fhpetMDhoie5hIGnQ7oZoRukdRtcGT22Q5Zj/8lHqzEoJEgfS8r1
         Q8nyiOJYiPmWGDs2p9P/hwmVIR0zeIDbgMFk5zlNl9JryI2qDpbKupcR0YmBglu5vov5
         /ir7SpVHITC6UAGPtnMAuiI8FaYNw+O4/V3NiD3xjbLs2Nq8iLJYJgZkXL/1fuE453TQ
         LOO1cV/lU6wDmKgPzLatnu8DlH+jJ8RsS83+XoBpCYDMWoWmSrKuyCK8JgGDS7xHF9vQ
         RY8lsdemd/vT2kO/bAacaUD4VoaTbzWBz/MSZWqiumOV9zk2tC/EvPYQKrAHQ833uxbY
         OHMw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791566909; x=1792171709; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xe8jRkfpNz/P/ZqnPnKbX5+wRiqHAAj72WBD7udoZa0=;
        b=qovE/LPacxJhBK+foz3B9YJyLqXEDq/zxQIiHDRy3cmfJoiqPTBCAVMFzskHN9g1Z9
         r61fRrq6doQ3km0oHS1XqZl+ulyzkhz89k1j+F9xAi6JyzUPut6SU4NUygHJItE0SNsU
         AmTNF+w4VMrX7iYR/7NrYlII/2rb2EJO0tzX0p2gm+xMYPP1OO+Zom/RIyceOWQbGl4d
         Kd/KhRYpGLPcV8Y+pL/QZZxP6AXXyc7RvshqtU07ygE7urDEKTnZ5H/b2o3hecUMfzy6
         SdEz3xsuVwzjY+V3yi0NERoTkZ0MZQ/igg+HfM+U/h9FAVxXY4XbiusC0Gshh7AAQIrd
         uAAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791566909; x=1792171709;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Xe8jRkfpNz/P/ZqnPnKbX5+wRiqHAAj72WBD7udoZa0=;
        b=jVSD0dl5XitYryHqLzaZG3hpimeGYhV486cfuKXX7GYAnV1Od3rA7IMxCP/xW3hNS/
         2Yzzsf0R4C/na3JmRkyQBlI5u2OS+81xyeslvxuMgdbanTBY1StbR+lx7uxFTjdMnueG
         /xWwnB1EiFH9XKji9u+SewX3GotHse0kJin6wnzk+86eQYluHFvPc8F2foHdiJdWuJb8
         z9waeo8NcIypJFyYlUD/F0OsQvUaSOvpcRCBbjI2shkSZq8T+Mnj1svtnPoWaoYCNyoc
         3/2+/iN1AzaenCRjscQ0jf0W1qM+zNAwFkXXleFtx6wx/gqenHzIXuB1Posn72XDLsUA
         EPeg==
X-Gm-Message-State: AFq9FYK81HMZ76p/PLj9sUWd2R4zo2tMauJQ3CRnDpkC7KfYWDLKsdkr
	TeDYwWP9nczonLhc1H1Nw0skoBH/Z5PLzA++qsCHjHWVC5obzZ3zMam7hFoEGqv5vwasve9ni+H
	QQSpHCQYH7IwyCfpOJecV/4LlVMLO92A=
X-Gm-Gg: AYBFou3CtA+Ph7i1SLGoD9RdvjOz5l2P8kgLOQyD4a11AtRKS59UCzYNF2gYgKmKtVo
	smlfEkiW2zmN71fREPby3fIodTq8otHtFqYsrds30SoT352OS+7Zo8M2I+dYHP7qTSQuXrDfVmo
	mdAcjrUVH5VnP8vLy+xJ2deneKRhNFPoz1vJJ6O3Ans/28J0mHUOm5C6FM+2ufQcFIIz+ZGhKu5
	1hN3U4VlUZEFKRrk2s2YD95uqUI8xRxsN+CqBWUe8BByDcvvqFobA+pTOB+3gCI0FPczOugXcnW
	Qt6+xPIkWM7sKq+YT5sjX+v8PhDnAB8f9tmItCNIEbavsnDBXx+EPVPzgEVPN/qSo6/lWY+QALg
	Qg4LTSHJyTJoajIJff3NgBbNXcRX7D1rBW2+8Kf/yAsLtKJxY9y2HhcyKvUWkJAU/U4p128o4Xv
	UYkYs9oa0XSH7TSk196wD7JuP+5KIP9jmgTUWwhmW8+EC/8cLPI0MTf0TOhjKrqvC2RJSR6Tohl
	uEEX8HoRdCzIgSIakK69jf63lMPucw68XOZVftLj5VbRShMxsEygm++ZclUTKtAskPFpCWjYVLQ
	7Z8Roxo6Zw==
X-Received: by 2002:a05:690c:309:b0:8ac:cdfe:cde with SMTP id
 00721157ae682-8b07ea8cf79mr10014177b3.0.1791566909367; Fri, 09 Oct 2026
 10:28:29 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1791537542.git.scott.murray@konsulko.com>
In-Reply-To: <cover.1791537542.git.scott.murray@konsulko.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 9 Oct 2026 10:28:02 -0700
X-Gm-Features: AclHuK_2qDUGxRl98ECoJErVE4BrNURF-v9GazU4R5S-ctaxg2HVRFtMi6tqrAo
Message-ID: <CAMKF1so+TJ4W=8MpY9m9QXWHo1kqwHAABAx71d=P0dS2DBGZaQ@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 0/2] Some updates for pypi.bbclass changes
To: scott.murray@konsulko.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000396b55065d6badba"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Oct 2026 17:28:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130704

--000000000000396b55065d6badba
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ross has sent a comprehensive patch which I could not test and apply due to
travel, its now in master, can you revalidate your usecase and see if these
fixes are still needed ?

On Fri, Oct 9, 2026 at 3:05=E2=80=AFAM Scott Murray via lists.openembedded.=
org
<scott.murray=3Dkonsulko.com@lists.openembedded.org> wrote:

> Here are a couple of PYPI_PACKAGE_SDIST additions to work with
> the updated pypi.bbclass, they fix failures I was seeing with
> meta-security CI.
>
> Changes:
>
> Scott Murray (2):
>   python3-systemd: Add PYPI_PACKAGE_SDIST
>   python3-dateutil: Add PYPI_PACKAGE_SDIST
>
>  meta-python/recipes-devtools/python/python3-dateutil_2.9.0.bb | 1 +
>  meta-python/recipes-devtools/python/python3-systemd_235.bb    | 1 +
>  2 files changed, 2 insertions(+)
>
> --
> 2.47.3
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#130682):
> https://lists.openembedded.org/g/openembedded-devel/message/130682
> Mute This Topic: https://lists.openembedded.org/mt/121669340/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000396b55065d6badba
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Ross has sent a comprehensive patch which I could not test=
 and apply due to travel, its now in master, can you revalidate your usecas=
e and see if these fixes are still needed ?</div><br><div class=3D"gmail_qu=
ote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Oc=
t 9, 2026 at 3:05=E2=80=AFAM Scott Murray via <a href=3D"http://lists.opene=
mbedded.org">lists.openembedded.org</a> &lt;scott.murray=3D<a href=3D"mailt=
o:konsulko.com@lists.openembedded.org">konsulko.com@lists.openembedded.org<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">H=
ere are a couple of PYPI_PACKAGE_SDIST additions to work with<br>
the updated pypi.bbclass, they fix failures I was seeing with<br>
meta-security CI.<br>
<br>
Changes:<br>
<br>
Scott Murray (2):<br>
=C2=A0 python3-systemd: Add PYPI_PACKAGE_SDIST<br>
=C2=A0 python3-dateutil: Add PYPI_PACKAGE_SDIST<br>
<br>
=C2=A0meta-python/recipes-devtools/python/<a href=3D"http://python3-dateuti=
l_2.9.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-dateutil_2.9.0.bb<=
/a> | 1 +<br>
=C2=A0meta-python/recipes-devtools/python/<a href=3D"http://python3-systemd=
_235.bb" rel=3D"noreferrer" target=3D"_blank">python3-systemd_235.bb</a>=C2=
=A0 =C2=A0 | 1 +<br>
=C2=A02 files changed, 2 insertions(+)<br>
<br>
-- <br>
2.47.3<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#130682): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/130682" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/130682</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/121669340/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/121669340/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000396b55065d6badba--

