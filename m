Return-Path: <dimitris@siganos.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1532C54ED0
	for <webhook@archiver.kernel.org>; Fri, 23 May 2025 19:46:33 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.2546.1748029591985194864
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 May 2025 12:46:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siganos-org.20230601.gappssmtp.com header.s=20230601 header.b=tWIxhxkA;
 spf=none, err=permanent DNS error (domain: siganos.org, ip: 209.85.214.182, mailfrom: dimitris@siganos.org)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-23205d55bf4so2259285ad.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 May 2025 12:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=siganos-org.20230601.gappssmtp.com; s=20230601; t=1748029591; x=1748634391; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+iQzFKFm90W39zc0EiccYnZNKT/M/sIbwPSv/6iyF1M=;
        b=tWIxhxkAIZH+fGSsN6e/ZDESbxFAQaCElQeLGRRykBq+2Vbm51Gw+JE5S/gHE9Vlzq
         zoqGsPZoB6PGa5vPT+E6s22QVgF9R1phq5uGlHWsFHyaz/gXOIa9jYojrk0hiF+TYDUj
         AMHPB+DT3EAJIQ2m50KDffaJPobdWZUPPXJMpavJxnlT/aOCekqIW43KETZK8rOfV5AP
         dKeoHqprexPaIawXXU9CCNPJtgW6yWCtptlxoT/wc5nxzY/RTmNuk57n3Zm1YoZVRKb/
         Wx9tTQF/aBq/apDHacqW7/Uk7y4qmdltlhJuonQQcvEsfl6JBNudAxrVp2gNjqDy+5tT
         /GGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748029591; x=1748634391;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+iQzFKFm90W39zc0EiccYnZNKT/M/sIbwPSv/6iyF1M=;
        b=uy6HloMNm4+j3g765HrLvf/xMnlLvZ6KSAat9HZRXrbkzC0SehYoyWBUVHSXvtCoDk
         CnAgZhJeB/Cga9cndAaePw5fwdXOYGfx87AAtsRutwzabaCEeoNpvbXju536ZKgYoRb2
         lN1M1ZJCUB7IldoRNZkqd2jG7vYgDt3gVuXERwSKBGig/iKVJQCJfIIafc0bc4HG4l1r
         hhmNWAW/SetIiYgYt2kMYwwR5stMPK19XzE/acImdiSEReAQB1Kwoncb9teLryz2Gf3C
         0FuxJPPVPYQG3LI5Y4FsvCD77N8QtL2qGhBt+hvH8vXSaFjTRCXXJO/GiRxKQkDdyIzh
         6Kdw==
X-Gm-Message-State: AOJu0Yzx+IwIK1v0/fLQbqkGS+OW1Jqy6n+64J8dGr/ffZTWJxUL2NkO
	BBxdZWY6iY70dv+Km7R/6LqCsBmXWcPhK4Pyi7D49hjUX2HtpgIO+hL2dbNsrzHKV1UxVWFycdN
	0GHrVkxJFj/UEJd+zDNqGDGdaM3LaP5Gq046K+bCPWMwChKjrgoMubqoeUQ==
X-Gm-Gg: ASbGncvO6E+jRehwcD8m3/q91z3JK7gplGRntqLHYrU1uRQldFswPj4qcWxW/i8NfFX
	Qk4+2sfUo7Hk/P/usIcLVZo2HleoimZSnOIGXrFjKgX3095Vw24GeYIXEliiLQcnKP7nrH7b7vR
	KrrWby0jIDIicsxdVtI49ObHzLSyHr91cApT4oIpL9JoIGw90KuYuaj1Hh+Ld+YuZ1VA==
X-Google-Smtp-Source: AGHT+IGy0dEMQjZk8Cb17CONoEOuCcCloD6hIsxcD2GZWbexsbBSNV22hBeCvbF/kGASQUN5WCr4ddAY6u5DoBk5BW4=
X-Received: by 2002:a17:902:cf4c:b0:211:e812:3948 with SMTP id
 d9443c01a7336-23414e9fbdfmr10722475ad.0.1748029591230; Fri, 23 May 2025
 12:46:31 -0700 (PDT)
MIME-Version: 1.0
References: <18423E67C86AEF70.8857@lists.openembedded.org>
In-Reply-To: <18423E67C86AEF70.8857@lists.openembedded.org>
From: Dimitrios Siganos <dimitris@siganos.org>
Date: Fri, 23 May 2025 20:46:20 +0100
X-Gm-Features: AX0GCFvvppVk9VfxSuHWxzP-0xC4TfDRF8aQI8N0b-sPv0W1aoS5krmX5OmRsDY
Message-ID: <CADGVJSL4munjKAe7UETxf7PReoC22PSCw+68CK8JANs=5UFxLw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v3] bvi: add new package
To: openembedded-devel@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>, Khem Raj <raj.khem@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000d7b0a80635d2dafb"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 May 2025 19:46:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117613

--000000000000d7b0a80635d2dafb
Content-Type: text/plain; charset="UTF-8"

Hi Yoann, Raj,

I took your feedback and created a 3rd version of the bvi recipe.
I made the following changes:

1) I fixed the license which is actually GPLv3-or-later and not GPLv3-only
that I had initially set it as.

2) I changed SRC_URI to: ${SOURCEFORGE_MIRROR}/${BPN}/${BP}.src.tar.gz, as
per your suggestion.

3) As per your suggestion, I removed the compiler flag "-std=gnu17" and
replaced it with a patch file that fixes the C23 problem. The patchfile was
actually made available by the debian devs who had the same problem.

Finally, it is true that the project is not very actively maintained but
has been going for almost 30 years and has stood the test of time.
This editor is designed for small footprint and console access and it is an
ideal editor to have in an embedded system and I think it should be part of
yocto.

The bvi editor is included in all the major linux distros, so yocto will
not be alone in maintaining it. In fact, in this case, the debian guys
fixed the C23 problem for us.
See the list of distros that include it here:
https://repology.org/project/bvi/versions

Regards,
Dimitrios Siganos

--000000000000d7b0a80635d2dafb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Hi Yoann, Raj,</div><div><br></div><=
div>I took your feedback and created a 3rd version of the bvi recipe.</div>=
<div>I made the following changes:</div><div><br></div><div>1) I fixed the =
license which is actually GPLv3-or-later and not GPLv3-only that I had init=
ially set it as.</div><div><br></div><div>2) I changed SRC_URI to: ${SOURCE=
FORGE_MIRROR}/${BPN}/${BP}.src.tar.gz, as per your suggestion.</div><div><b=
r></div><div>3)
 As per your suggestion, I removed the compiler flag &quot;-std=3Dgnu17&quo=
t; and=20
replaced it with a patch file that fixes the C23 problem. The patchfile=20
was actually made available by the debian devs who had the same problem.</d=
iv><div><br></div><div>Finally,
 it is true that the project is not very actively maintained but has=20
been going for almost 30 years and has stood the test of time.</div><div>Th=
is
 editor is designed for small footprint and console access and it is an=20
ideal editor to have in an embedded system and I think it should be part
 of yocto.</div><div><br></div><div><div>The bvi editor is included in all =
the major=20
linux distros, so yocto will not be alone in maintaining it. In fact, in=20
this case, the debian guys fixed the C23 problem for us.</div><div>See the =
list of distros that include it here:<br><a href=3D"https://repology.org/pr=
oject/bvi/versions" target=3D"_blank">https://repology.org/project/bvi/vers=
ions</a></div><div><br></div><div>Regards,</div><div>Dimitrios Siganos</div=
></div><br></div></div>

--000000000000d7b0a80635d2dafb--

