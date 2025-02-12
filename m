Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A1BAC02198
	for <webhook@archiver.kernel.org>; Wed, 12 Feb 2025 16:39:58 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web11.20660.1739378396914900916
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Feb 2025 08:39:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Kf0ZaZ8b;
 spf=pass (domain: gmail.com, ip: 209.85.222.174, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7c0155af484so915445885a.0;
        Wed, 12 Feb 2025 08:39:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739378396; x=1739983196; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KmGI4pTOsbhyhuhie2SkAlmgR0jv4ple6nbu1Ci9tqc=;
        b=Kf0ZaZ8b+PLQzgNjnr6VQ/+PJsSo3qeFZNMEKalc18Q6/81oMNubEHtxs0NgOkM+nW
         C5EnOIxuEcX8GRQiqg4OpEHazN8yWS5pytihr2f+QlTSvmBk5xgTri9ilgq343OHRW0A
         3Ej5NvIdH3A0+z0A6eRLQgS4Tfx1QD50MOo0ioAeEUfJsTmrZKmMlAzjtmJ/SOyBiCxv
         hD5gKMRGxZ00Rt1C7f0tehApGa6whV27gEiVDBqUc4luB8tFn1ClKZIv6tlucnucIfjo
         j/xPgyZYpaSQfo3hc/AkHv8kKKMJSQZ48MAXPROjcCZRd9vHx/eE0Z+IXU5Uwzi05HP9
         Va9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739378396; x=1739983196;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KmGI4pTOsbhyhuhie2SkAlmgR0jv4ple6nbu1Ci9tqc=;
        b=NxRvOmNDQQnMdtKz6fDQlBBEQ+lx7PFij+IUYdbvwFs47WfNJLXejp0y5ZzenYmyUD
         NRrA6o9hXg1NlSmb+P5T3xtbvPYOFfARLSE0dWOx/vy5/Aomzk+EV+UEu1O3EkKVLgA/
         f/M6UJETFpkh19CW5N2oTxbKjZYV1Doi1AlsvFMmRRXvkU4NN3okyiXDK7uEDA3F+dTV
         zP3+L9/Sa74+kitEfWDd1pkOArtWAa2lScPGbLEfdsXVNYoZE7PcsHv9jdinpJOFnGmR
         vu9sou6VcMUhHl4f0qUbFW6ot5TOal7IOp4hIFF+m0NIzDwd0QdGDxElCvRynSMpC9D6
         ujgA==
X-Forwarded-Encrypted: i=1; AJvYcCU3QfdUK3HJSkHexAyTYb4fPq08YNP6vkt2V8RbidHaD+e0wnUNRwoDoU3UCd+UqIfY5BciYRGLd19r9lTkds2aMx2l@lists.openembedded.org, AJvYcCXjOKM/YBvTo+0AA19NcaAD8vz7JKK/hMzwlQDeER/5nr7o+bBDqVoQsKsjy9h+J3/ngNR9bu1XMNRgZfbIW3mXs4c=@lists.openembedded.org
X-Gm-Message-State: AOJu0YwYy3icgZwGa276kr4ABHEaQKwaUD214jBzGMLlD2+JG4SzbKwP
	R0RzNeiqNyEr1z4pnU8xUPliXljkXKOmFOFaPowCxwYIu/64MQ2a3HUzgvK8GxcjLU0slmvdHJG
	7dgc9mQOEK+8o/aHenn4mLOoyLcU=
X-Gm-Gg: ASbGncsdH409fuowfaAWyhPUHiqHCDR6aFbO0lXrvJNr8HrQfHgWRhaLxNPCiu+IDsP
	+W8M1RIFpT99dM+KjrFwGNWbnc32EDGeWgqvOAdJRwYt1Nr661JdwPLNHj3bpCNPPLIVcalc/sU
	YR4THG6Izgmm097rVbCaxpFQWQMGI=
X-Google-Smtp-Source: AGHT+IFwMek08Qd1ER791UiIGQszAkq1vJqs2Q4HgEhyy9F67Y297HKsdgjAAuUoEOroscRNhwSI09RRHjN/CwfOFlA=
X-Received: by 2002:a05:6214:2261:b0:6d4:238e:35b0 with SMTP id
 6a1803df08f44-6e65bf57a33mr2325406d6.17.1739378395802; Wed, 12 Feb 2025
 08:39:55 -0800 (PST)
MIME-Version: 1.0
References: <1739178095-26432-1-git-send-email-wangmy@fujitsu.com>
 <1739178095-26432-17-git-send-email-wangmy@fujitsu.com> <H0WKRS.6N3N2FQDS83Z@t-online.de>
In-Reply-To: <H0WKRS.6N3N2FQDS83Z@t-online.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 12 Feb 2025 17:39:44 +0100
X-Gm-Features: AWEUYZmeixcBUg2f67ajpCbfH1tiDdy3RBWLIq4gABuaMfIgglkTOmhkzJuZvkM
Message-ID: <CANNYZj_DmLxMc9rKYk0wop-Q_PWhKp1AuSYE7Z_5A8iR=gKfdg@mail.gmail.com>
Subject: Re: [oe] [meta-gnome] [PATCH 17/66] msgraph: upgrade 0.2.3 -> 0.3.3
To: f_l_k@t-online.de
Cc: wangmy@fujitsu.com, Khem Raj <raj.khem@gmail.com>, 
	openembedded-devel@lists.openembedded.org, 
	"wangmy via lists.openembedded.org" <wangmy=fujitsu.com@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000697310062df49768"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Feb 2025 16:39:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115450

--000000000000697310062df49768
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

New gnome releases usually clash with yocto feature freeze. There=E2=80=99s=
 enough
to deal with already so they=E2=80=99re deferred to after that.


Alex

On Wed 12. Feb 2025 at 17.25, Markus Volk via lists.openembedded.org <f_l_k=
=3D
t-online.de@lists.openembedded.org> wrote:

> On Mo, Feb 10 2025 at 17:00:46 +08:00:00, wangmy via
> lists.openembedded.org <wangmy=3Dfujitsu.com@lists.openembedded.org> wrot=
e:
>
> msgraph
>
>
> The msgraph update breaks gvfs:
> | Run-time dependency msgraph-0.1 found: NO (tried pkgconfig)
> |
> | ../gvfs-1.56.1/meson.build:434:16: ERROR: Dependency "msgraph-0.1" not
> found, tried pkgconfig
>
> gvfs 1.57 will be a requirement to be able to use msgraph-0.2 and the
> update is problematic because it requires glib-2.0 update in oe-core
>
> I dont know if there is interest in getting the gnome 48 updates into
> oe-core before feature freeze, but if not, this update should be delayed
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#115448):
> https://lists.openembedded.org/g/openembedded-devel/message/115448
> Mute This Topic: https://lists.openembedded.org/mt/111099072/1686489
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> alex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000697310062df49768
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">New gnome releases usually clash with yocto feature freez=
e. There=E2=80=99s enough to deal with already so they=E2=80=99re deferred =
to after that.</div><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div=
><div dir=3D"auto">Alex</div><div dir=3D"auto"><br><div class=3D"gmail_quot=
e gmail_quote_container" dir=3D"auto"><div dir=3D"ltr" class=3D"gmail_attr"=
>On Wed 12. Feb 2025 at 17.25, Markus Volk via <a href=3D"http://lists.open=
embedded.org">lists.openembedded.org</a> &lt;f_l_k=3D<a href=3D"mailto:t-on=
line.de@lists.openembedded.org">t-online.de@lists.openembedded.org</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;bor=
der-left-color:rgb(204,204,204)"><div id=3D"m_2542804981793604725geary-body=
" dir=3D"auto">On Mo, Feb 10 2025 at 17:00:46 +08:00:00, wangmy via <a href=
=3D"http://lists.openembedded.org" target=3D"_blank">lists.openembedded.org=
</a> &lt;wangmy=3D<a href=3D"mailto:fujitsu.com@lists.openembedded.org" tar=
get=3D"_blank">fujitsu.com@lists.openembedded.org</a>&gt; wrote:<br><blockq=
uote type=3D"cite"><div style=3D"white-space:break-spaces">msgraph</div></b=
lockquote><div><br></div><div>The msgraph update breaks gvfs:</div><div><di=
v>| Run-time dependency msgraph-0.1 found: NO (tried pkgconfig)</div><div>|=
=C2=A0</div><div>| ../gvfs-1.56.1/meson.build:434:16: ERROR: Dependency &qu=
ot;msgraph-0.1&quot; not found, tried pkgconfig</div></div><div><br></div><=
div>gvfs 1.57 will be a requirement to be able to use msgraph-0.2 and the u=
pdate is problematic because it requires glib-2.0 update in oe-core</div><d=
iv><br></div><div>I dont know if there is interest in getting the gnome 48 =
updates into oe-core before feature freeze, but if not, this update should =
be delayed</div></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#115448): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/115448" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/115448</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/111099072/168=
6489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/111099072/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" =
target=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000697310062df49768--

