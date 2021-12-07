Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 559C4C433F5
	for <webhook@archiver.kernel.org>; Tue,  7 Dec 2021 12:10:10 +0000 (UTC)
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com
 [209.85.221.170])
 by mx.groups.io with SMTP id smtpd.web12.66099.1638879009508426436
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Dec 2021 04:10:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RtsHVFmt;
 spf=pass (domain: gmail.com, ip: 209.85.221.170,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f170.google.com with SMTP id 70so9095159vkx.7
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Dec 2021 04:10:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=x9j8a91NoqVkpI2DXY0lVQpgYuti6lSMypY3sextBsI=;
        b=RtsHVFmtUr/27qmBAdTgASIccxjlxrIiubQxSvZmBibvNBshXDwumCHo7nVpB0cjdB
         4n53IyBshM95g0ojj2ZloYMmbbCjutOQ+eTTNTp2daEqhvS57+xwwYxl2o20yd92udEP
         8wbay9MdjKeQVa1kWZJjH+p2D/Rk3grOuFa0lWYG4Sl+lhnji/JbfW2+4nbDMCFiqt3y
         X2B9yJLxreBU14k6PAZhrO1+CId8z4wH5ePL1sfzU7CBmaRU8T2M8ZpdLSp+HFl0u6uR
         ws2vlPjXFAkP6xuR1ge50kiFD/490OMHMwGwcPiMq3ipjujVcKIBu5/KK+wPDnmEQYxc
         wWeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=x9j8a91NoqVkpI2DXY0lVQpgYuti6lSMypY3sextBsI=;
        b=qYlaRN72ERfCOd+JJHSmtKY57v2Rj0NruyZiwwnYcvd6LzxAex7fzVvb62JQVAhBjt
         osb+7pQbKbNnK2ZIe3m36caTVHPYcpQ6PiCLOc75CYqdDBN8AqrY3YtgZOBU6373Qrhx
         UUZYtYCDopFqk/k9qShPG34wAnmfXBAmiOXZXvby2uy8TNiNnmPEDeMVbxOYeQS32qiH
         oQYnCAUixsuCTwV2kJelwc8KU6wwWKDymql4DnZLgZk3vzere7UtcpMN11QwRBpaRKFc
         kM9QWnr0Pf9/wRb7SyI96yghhn4tKsHKKdPyAIpUcbABzN7n/l+3Pb1sZwyUGZycbjh2
         oxZw==
X-Gm-Message-State: AOAM533G/lkIiDIuy5was5ds0GvPIcQogncCJm/wsFyqBl3HGc7LMyfb
	GIVSou4E69zC38MkHN/6Ujx/r9a0cL9UroPNmjk=
X-Google-Smtp-Source: 
 ABdhPJy9xR9tPLld+X9/znZbd7mJuMfcBoUW7ng9e5jh1suJ86JnWwyTLyyqawXaGUhqAdPelNS8xQdRExIDD+NwtWk=
X-Received: by 2002:a1f:3f4f:: with SMTP id m76mr52496349vka.1.1638879008676;
 Tue, 07 Dec 2021 04:10:08 -0800 (PST)
MIME-Version: 1.0
References: <20211207113954.8959-1-marex@denx.de>
 <968b00aa-5756-dfd0-51ed-72a462de0ff3@gmail.com>
In-Reply-To: <968b00aa-5756-dfd0-51ed-72a462de0ff3@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 7 Dec 2021 13:09:57 +0100
Message-ID: 
 <CANNYZj90rsX4tr5-FVLaa3EgJUE1YczxHoiTjw=ZmEmKn4DCHA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] freerdp: Use DEPENDS:append
To: Jacob Kroon <jacob.kroon@gmail.com>
Cc: Marek Vasut <marex@denx.de>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
 Khem Raj <raj.khem@gmail.com>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: multipart/alternative; boundary="000000000000245d8b05d28d4134"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Dec 2021 12:10:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94229

--000000000000245d8b05d28d4134
Content-Type: text/plain; charset="UTF-8"

I don't think this makes sense either FWIW. The standard practice is that
the recipe sets DEPENDS and then the classes add to it.

Alex

On Tue, 7 Dec 2021 at 13:04, Jacob Kroon <jacob.kroon@gmail.com> wrote:

> On 12/7/21 12:39, Marek Vasut wrote:
> > The build system might have put something into DEPENDS already,
> > adhere to the recommended best practice and use DEPENDS:append
> > to avoid overriding the DEPENDS set by the build system.
> >
>
> Which document states that this is considered best practice ?
>
> Jacob
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#94228):
> https://lists.openembedded.org/g/openembedded-devel/message/94228
> Mute This Topic: https://lists.openembedded.org/mt/87562882/1686489
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000245d8b05d28d4134
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I don&#39;t think this makes sense either FWIW. The s=
tandard practice is that the recipe sets DEPENDS and then the classes add t=
o it.<br></div><div><br></div><div>Alex<br></div></div><br><div class=3D"gm=
ail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, 7 Dec 2021 at 13:0=
4, Jacob Kroon &lt;<a href=3D"mailto:jacob.kroon@gmail.com" target=3D"_blan=
k">jacob.kroon@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">On 12/7/21 12:39, Marek Vasut wrote:<br>
&gt; The build system might have put something into DEPENDS already,<br>
&gt; adhere to the recommended best practice and use DEPENDS:append<br>
&gt; to avoid overriding the DEPENDS set by the build system.<br>
&gt; <br>
<br>
Which document states that this is considered best practice ?<br>
<br>
Jacob<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#94228): <a href=3D"https://lists.openembedded.org/g/ope=
nembedded-devel/message/94228" rel=3D"noreferrer" target=3D"_blank">https:/=
/lists.openembedded.org/g/openembedded-devel/message/94228</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/87562882/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/87562882/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" =
target=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000245d8b05d28d4134--

