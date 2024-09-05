Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34045CD5BAA
	for <webhook@archiver.kernel.org>; Thu,  5 Sep 2024 11:46:17 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.7313.1725536769503916437
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Sep 2024 04:46:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=wB6rZg22;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-42bbffe38e6so5121385e9.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 05 Sep 2024 04:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1725536768; x=1726141568; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=32fUY69BYC8buB8NSNFBqqqlo61idxnmFcbMy6XnBAA=;
        b=wB6rZg22SCkwpEzgcYvsKKTKoMJnm6jGbkQ1rznh3nnIOsa3DbB3aDLo4UPxmHq2pe
         5Dtagua3NCCiwG1AFDQApJPbnc9DmjknnJAY7HVB5fBuPlkyQ+TZqctY9v+EnhqvtTqJ
         1ksRAJNjeV3dMwsb7LC8iI4ieEYHAp5J3lWP8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725536768; x=1726141568;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=32fUY69BYC8buB8NSNFBqqqlo61idxnmFcbMy6XnBAA=;
        b=oTezhENVyb9lHu3tQRhZZO0chDOP8DCh24WI7Mw3SnoCGBe4lCOTpXvmW35tgElCe7
         pEm9gSUUX3DRzSW94SIGHA27uLC1Op44Ey37SFumg5g4srfSvvXDbIsVQlGCavJNBajM
         Tmnjha6yfBWAGN+DW9HGYdqX5aBioA6zzfF2y5QC7hu4Ry08/GWUIRoHo0clfpbF/4PG
         lgqJWaxioHfl0P20KdfSEQaLOtHncmqWLDOJevaiWL9WHe/co2973oTtNRKzL3xe3Sgh
         lXZoX3xp1H0/L3T29ZM8RL5SLODlshxpdfXpYRa0Dj05+yGE+8r0YfdYC50e5d7FvOn6
         4s6Q==
X-Gm-Message-State: AOJu0YyYl3pSZvR4NQAuBd/nOWZWErZuCY1twwxIavNrvR79a2oYR0xX
	WWcdBpJeyoRD59Mz0tZP32qMWETIRLzdHP0iyzesVZ1YDHNdteRDrhJHKs423UhkOldHXTGDyPK
	HUhDyqEpTTukERbEidlQqcCVSRs7OCnu+8nd1TQ==
X-Google-Smtp-Source: AGHT+IElZdXIWEUz56cBZGFR9DRaYqrwiYZ3ZnCt3Ni/GPuoYzrDVxHHa2249FPJPJq/0yp05gUxQbytyEbJFRVY2uY=
X-Received: by 2002:a05:6000:223:b0:374:d1dd:1cc1 with SMTP id
 ffacd0b85a97d-374d1dd1e44mr6438573f8f.2.1725536767135; Thu, 05 Sep 2024
 04:46:07 -0700 (PDT)
MIME-Version: 1.0
References: <20240905093005.2731956-1-yoann.congal@smile.fr>
 <CANNYZj8WR11Cm+Chio-FeS-tpS3Ydi=MTM1ivVTuNXZ6eXktLw@mail.gmail.com>
 <CAMSfU+6NAhDtNwYgGXibbR7u1cVTE7snm3+2yAunmHYUxAEAtA@mail.gmail.com> <CANNYZj9M-foBdCVoJ3hpUiNEbA2aD_Pa20Hb--ALMJAOqf=vhg@mail.gmail.com>
In-Reply-To: <CANNYZj9M-foBdCVoJ3hpUiNEbA2aD_Pa20Hb--ALMJAOqf=vhg@mail.gmail.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Thu, 5 Sep 2024 13:45:41 +0200
Message-ID: <CAMSfU+473OC5H5SehEtwBTRLzvAo7nJPDGgUAF0swER_wV8uBQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v2 1/2] polkit: Switch PAM files to common-*
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000000d6d9d06215dd63e"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Sep 2024 11:46:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112104

--0000000000000d6d9d06215dd63e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeu. 5 sept. 2024 =C3=A0 13:36, Alexander Kanavin <alex.kanavin@gmail.co=
m> a
=C3=A9crit :

> On Thu, 5 Sept 2024 at 13:07, Yoann Congal <yoann.congal@smile.fr> wrote:
> > You mean submit the patch in v1 upstream?
> > https://lists.openembedded.org/g/openembedded-devel/message/112093
> >
> > Why not! I'll do it, let's see what upstream says.
>
> Yes - another possibility is to convince them to define an option
> named 'generic', so we don't run the risk of future suse-specific
> changes getting in the way and causing regressions.
>
> I definitely prefer v1 patch, if it's sent usptream.
>

Submitted here: https://github.com/polkit-org/polkit/pull/497 :)

I'll send a v3 with the Upstream-Status: Submitted
--=20
Yoann Congal
Smile ECS - Tech expert

--0000000000000d6d9d06215dd63e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Le=C2=A0jeu. 5 sept. 2024 =C3=A0=C2=A013:=
36, Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex.ka=
navin@gmail.com</a>&gt; a =C3=A9crit=C2=A0:</div><div class=3D"gmail_quote"=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">On Thu, 5 Sept 2024 at 1=
3:07, Yoann Congal &lt;<a href=3D"mailto:yoann.congal@smile.fr" target=3D"_=
blank">yoann.congal@smile.fr</a>&gt; wrote:<br>
&gt; You mean submit the patch in v1 upstream?<br>
&gt; <a href=3D"https://lists.openembedded.org/g/openembedded-devel/message=
/112093" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.or=
g/g/openembedded-devel/message/112093</a><br>
&gt;<br>
&gt; Why not! I&#39;ll do it, let&#39;s see what upstream says.<br>
<br>
Yes - another possibility is to convince them to define an option<br>
named &#39;generic&#39;, so we don&#39;t run the risk of future suse-specif=
ic<br>
changes getting in the way and causing regressions.<br>
<br>
I definitely prefer v1 patch, if it&#39;s sent usptream.<br></blockquote><d=
iv><br></div><div>Submitted here: <a href=3D"https://github.com/polkit-org/=
polkit/pull/497">https://github.com/polkit-org/polkit/pull/497</a> :)</div>=
<div><br></div><div>I&#39;ll send a v3 with the Upstream-Status: Submitted<=
br></div></div><span class=3D"gmail_signature_prefix">-- </span><br><div di=
r=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><font face=3D"Raleway,=
 regular">Yoann Congal</font><div><font face=3D"Raleway, regular">Smile ECS=
 - Tech expert<br></font></div></div></div></div>

--0000000000000d6d9d06215dd63e--

