Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CF00E77183
	for <webhook@archiver.kernel.org>; Mon, 16 Dec 2024 21:05:12 +0000 (UTC)
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
 by mx.groups.io with SMTP id smtpd.web10.67271.1734383109728609776
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Dec 2024 13:05:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JqKUirIo;
 spf=pass (domain: gmail.com, ip: 209.85.160.42, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-29fbba47ca4so1889778fac.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Dec 2024 13:05:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734383109; x=1734987909; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4IR6kK3EeB8xXPmgxwWTqQi0idFqJ1buQoRqLX5jozE=;
        b=JqKUirIouM8PzGWl/sSPKDUMRV8Jlw2A0qjfoNe8y8TPH6WVUOvPrOPc/9il9PtI5T
         GOkSKBubIwvUurkXwVgnEa1SMPhEIitKSCd1NRHLtut/wQU5Tn6CtvJ4JGRKa/jerPOJ
         DTkLYf3/qEzkZgIa/6n83DzSRtCUE/fSr9OCwdXeYvsMLza+PVZgiUtfYxNOHgj5OT1N
         9rR3CNekrQwu1LMOgmfUE35Kco4yOFHBotJCT9d4PRAAuKwuWC45f2uz66uGaI9tlGo9
         QFVDufRl6Lbovz9hbw2MHOw73fQuiHyLljBK5SHM02fPcBmC7IHN2x0D6kPf/Ftwfp6C
         Ix4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734383109; x=1734987909;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4IR6kK3EeB8xXPmgxwWTqQi0idFqJ1buQoRqLX5jozE=;
        b=N0bmbiSPmYa1YsvzMH4WMAdObhPmfwBXBdQXDEhwA91AM/1FQDN+2b3YAReMMs/fFK
         5YJNfJj92quX+SD39lI5hAnn4f0r0NWapnLFEvFbj1I+Kgki3BD1WfWJDdVJ2MUUgSUS
         BKKjThfOIu9D1nSDQAt7+6QC4y4W6sFmMMGQfIiIqKq7oIkm2kglAzcPV0wN3fT/bqvZ
         HtXMSsPcXR10HWi9uY//ShCTTKSR4RwmGhbrzeuMjWXA5HKVewZvlNg4XhvNTxNH+/BX
         ygfeCQAC/P+9MCrOJGTndX5XyWho9MuZiRq3mwn3lConFUXNOhPedUE2aaslVQBtDot2
         tvmw==
X-Gm-Message-State: AOJu0Ywav6ve/zaWis/W0wgWmarlzEGFY1Q7CSzf8du6Jo+PiEPpWhU0
	JsZHMOuUXk5G0gd54BzUI9TK69Kudtf3oyVaY2xChVB9Ti6XNV6xBa4QDMkpnZy9V7XAsjyOvl1
	z5snVryoqzE3hv0prPBpLXPYBAWc=
X-Gm-Gg: ASbGnctHkN9BBBEhEG3mPp3HlY42lKqQmTs4TFqYzn9vYFjjQqZMm/rHm4XLKUuhV3R
	Xt/57dsjfg8Qa/s/e85S4IDml0xpDlEeG/Ylk8sHQDF3kL4Mgx/kHk81R+o77m+l3mLR0lw99
X-Google-Smtp-Source: AGHT+IGtKDeHyd8tO+UISoNTL9mzm+t7LJsjn6aHfMZNKWcychrjJjxeE3dlgGjO5VogBkGLjBNTpdjWlEnZevTZJkI=
X-Received: by 2002:a05:6870:9d94:b0:297:285e:f824 with SMTP id
 586e51a60fabf-2a3ac5a41b9mr7298668fac.10.1734383109018; Mon, 16 Dec 2024
 13:05:09 -0800 (PST)
MIME-Version: 1.0
References: <1811A85A00D6A22F.23577@lists.openembedded.org>
 <VX6LOS.3HWFQSO1SJD41@t-online.de> <CAMKF1srFAYctP2qWSh0SRTFHgjyHbECD_G2AvrGWqd3tyq3-Kg@mail.gmail.com>
 <Y7SLOS.86J6WO9IZ2GB2@t-online.de>
In-Reply-To: <Y7SLOS.86J6WO9IZ2GB2@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 16 Dec 2024 13:04:56 -0800
Message-ID: <CAMKF1sr-a7XZyTDfhZdkVxo1ZhLFxLYSm0f28jv65M+0CGsBcw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCHv2] libpeas: update 1.36.0 -> 2.0.5
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000001e1b940629698993"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 16 Dec 2024 21:05:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114340

--0000000000001e1b940629698993
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 16, 2024 at 12:14=E2=80=AFPM Markus Volk <f_l_k@t-online.de> wr=
ote:

> On Mon, Dec 16 2024 at 09:47:39 AM -08:00:00, Khem Raj <raj.khem@gmail.co=
m>
> wrote:
>
> libpeas seems to be needed by meta-gnome only, so perhaps move this recip=
e
> to meta-gnome is the right thing to do.
>
>
> We could also move gjs to meta-oe because it only pulls in mozjs-128 and
> cairo. Both are also in meta-oe.
>

Yeah that works too if there are more
Users of gjs beyond meta-gnome

>

--0000000000001e1b940629698993
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote gmail_quote_container"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Mon, Dec 16, 2024 at 12:14=E2=80=AFP=
M Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de">f_l_k@t-online.de</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D"m_915839457=
2807842853geary-body" dir=3D"auto">On Mon, Dec 16 2024 at 09:47:39 AM -08:0=
0:00, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">=
raj.khem@gmail.com</a>&gt; wrote:<br><blockquote type=3D"cite"><div style=
=3D"white-space:break-spaces">libpeas seems to be needed by meta-gnome only=
, so perhaps move this
recipe to meta-gnome is the right thing to do.
</div></blockquote><div><br></div><div>We could also move gjs to meta-oe be=
cause it only pulls in mozjs-128 and cairo. Both are also in meta-oe.</div>=
</div></blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Yeah that =
works too if there are more</div><div dir=3D"auto">Users of gjs beyond meta=
-gnome=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D"m_9158394572807=
842853geary-body" dir=3D"auto"><div dir=3D"auto"></div></div></blockquote><=
/div></div>

--0000000000001e1b940629698993--

