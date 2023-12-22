Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 282AFC41535
	for <webhook@archiver.kernel.org>; Fri, 22 Dec 2023 16:20:57 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web11.26540.1703262052076090468
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Dec 2023 08:20:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fEDXZ1Uz;
 spf=pass (domain: gmail.com, ip: 209.85.167.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-50e3295978aso2579603e87.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 22 Dec 2023 08:20:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703262050; x=1703866850; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=d0Oi+P626QtaAqw354FJEBqJx0fuhI7T3OyMHrHqKCg=;
        b=fEDXZ1UzN/XpIPReLAf7pZ21hGQJlQVojwCDIa6LIRoADv1/H39b+cfXGuX9n0gvNa
         j8N24iOhW58pPQ69VOpsE81UlH8lnYTPD/mQ1J8CLqFVIMGoH/8pUuxPujX+guBHRZn9
         w0NLvByA4iskvg72GjF0N9awowgfoV8t2BVAC3bSmp0D/wSIP1gfyMd748ycCUapWYVP
         2Tl2FUmicUbWPmElJjdTgch2eB/YTdRrMb/yibHrfdk6eOpg6z1bZSeIV2sPSLAES4KC
         GGNXDvF++1uhFvKUqYCTUS27pa7ZNxypn+Zll2XUaFdW71NcumFl85vQlRcRERstPDoE
         6eBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703262050; x=1703866850;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d0Oi+P626QtaAqw354FJEBqJx0fuhI7T3OyMHrHqKCg=;
        b=e70GWzV9E0HxZLIJ7k3UKmRFnZi0OORxwuZ+jKFHKs5g1APd0uRe73dib+rXzWmZVg
         TbkO11wdZOuzdkEHijw9A//gSc7n3aB244gonhLzn+VH/FMI7Urol+ANsFiHew9w9omB
         NrZjY5QSC0Ci1G2X5td3IP0WA3qkw3t8Dv6tB7mMzjcEawslrjWb3Bn5YVb5b2XoMV8b
         nnY+6zJv+r/oz6LXEkxi1SAhseNJYLrNJSBc5GxdkZJBuH6GfzE156m6cMg3IGee5XBK
         AwMaiWtqjDpLdb4ObrT0rL5GOD0TwjKg53EKafhh4EEqv7o40j9P4M9xdDgxNraeInXb
         wfTg==
X-Gm-Message-State: AOJu0YzQ4igEYjiOhdHLtPedkS/lQ0sSrK6Wj7wdqf8k3SUsv1Jnt86A
	Xvt/hQ1ykTGkcJR+3T/Qj6vdgfI/f8BQPh3kKBg=
X-Google-Smtp-Source: AGHT+IH+FLM/1RUGyv58xma3tBINDlrPUxUBagjN2tCjlHKAfQ2okObSs+fiAoW7IdguXvhKavC5cAnJ7bE9+neNI1g=
X-Received: by 2002:a05:6512:15a4:b0:50e:6943:acfc with SMTP id
 bp36-20020a05651215a400b0050e6943acfcmr1060925lfb.18.1703262049995; Fri, 22
 Dec 2023 08:20:49 -0800 (PST)
MIME-Version: 1.0
References: <20231222151108.645675-1-alex@linutronix.de> <20231222151108.645675-8-alex@linutronix.de>
 <C1S26S.CLJ4310DALJ63@t-online.de>
In-Reply-To: <C1S26S.CLJ4310DALJ63@t-online.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 22 Dec 2023 17:20:33 +0100
Message-ID: <CANNYZj-LjuV2uX2N-_DuyoUT56EEXVb2tEw+WTdL8_VcSW+5fA@mail.gmail.com>
Subject: Re: [oe] [PATCH 8/9] flatpak: do not rely on executables from the host
To: f_l_k@t-online.de
Cc: Alexander Kanavin <alex@linutronix.de>, openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000007311d8060d1b99da"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Dec 2023 16:20:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107767

--0000000000007311d8060d1b99da
Content-Type: text/plain; charset="UTF-8"

On Fri 22. Dec 2023 at 17.50, <f_l_k@t-online.de> wrote:

>
> -EXTRA_OEMESON += "-Dsystem_dbus_proxy=${bindir}/xdg-dbus-proxy
> -Dsystem_bubblewrap=${bindir}/bwrap"
>
> My understanding was that these were runtime dependencies and setting the
> paths would ensure that target flatpak can find them
>

No, it actually tries to find these at build time on the host, and run
them, checking if the versions are correct. Which is of course a bogus
check, because they would be provided by the host distro, and not match
what is going to be in the target image:
https://github.com/flatpak/flatpak/blob/main/meson.build#L254

If they're unset, then flatpak instead falls back to internal helper
binaries that it installs into libexec:
https://github.com/flatpak/flatpak/blob/main/meson.build#L351

Alex

--0000000000007311d8060d1b99da
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Fri 22. Dec 2023 at 17.50, &lt;<a href=
=3D"mailto:f_l_k@t-online.de" target=3D"_blank">f_l_k@t-online.de</a>&gt; w=
rote:<div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex"><div id=3D"m_-8805272561304818759m_-68575834768063=
09584geary-body" dir=3D"auto"><br><div style=3D"white-space:break-spaces">-=
EXTRA_OEMESON +=3D &quot;-Dsystem_dbus_proxy=3D${bindir}/xdg-dbus-proxy -Ds=
ystem_bubblewrap=3D${bindir}/bwrap&quot;</div><div><br></div><div><span sty=
le=3D"background-color:rgb(255,255,255)">My understanding was that these we=
re runtime dependencies and setting the paths would ensure that target flat=
pak can find them</span></div></div></blockquote><div><br></div><div>No, it=
 actually tries to find these at build time on the host, and run them, chec=
king if the versions are correct. Which is of course a bogus check, because=
 they would be provided by the host distro, and not match what is going to =
be in the target image: <br></div><div><a href=3D"https://github.com/flatpa=
k/flatpak/blob/main/meson.build#L254">https://github.com/flatpak/flatpak/bl=
ob/main/meson.build#L254</a></div><div><br></div><div>If they&#39;re unset,=
 then flatpak instead falls back to internal helper binaries that it instal=
ls into libexec:</div><div><a href=3D"https://github.com/flatpak/flatpak/bl=
ob/main/meson.build#L351">https://github.com/flatpak/flatpak/blob/main/meso=
n.build#L351</a></div><div><br></div><div>Alex<br></div></div></div></div>
</div>

--0000000000007311d8060d1b99da--

