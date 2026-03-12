Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A49E0103E2F7
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 00:19:43 +0000 (UTC)
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10863.1773274774341086331
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Mar 2026 17:19:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jjC66G/T;
 spf=pass (domain: gmail.com, ip: 209.85.167.169, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-4670676ba03so207130b6e.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 11 Mar 2026 17:19:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773274773; cv=none;
        d=google.com; s=arc-20240605;
        b=atw19rqIy89y53wifxYGP7xJYgZlJNY0lmUU4TcbOXZKbAmzHKV3ODAN40Ei6KjwEU
         UbWNM51LSq7J5xycVXOsp1JGotypS7lZ3nLnCV1r/COMMlkpJ1MOMn9dTLNXGxdHauBe
         O4MwlGp+BaX/XqmS8R7aTBqxWWNEymk3z2vic1nbnH6chFwKldIBy4BJhPjTn8E7c8uf
         u7WZtQWm+b5L0pY7mBSymxsgZchqziAxhnR1XWTSz7w0lDSjb3SKqwZzRfBuGRKGbakc
         76YZjgNVSQ+Ro4Tji1QEcintHkecCmnCS+g/q5tkW9dF4hIqjvXgT1cG8SZ9ht/mQ6fj
         h5ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2WbbrP9UKayQKzMCCQlrWbD7lavhLnTvbIIulNvzIGo=;
        fh=LZspYXC3IzyIN8FmVwz229n7pZIWt1HqVNc3WYXGu+o=;
        b=K6/z9KBPb/Hl8XEofnwmKrXbS94pnVPnSY07lDirAcfB64vgrYMXBCJ2dykGfc3Qfh
         +QYLtdEMRhms/UdIIKddF7b/1tULMiJ4FVxlhzXWs0jjgafHa3xc9xSDYeUPgSQ8inH0
         KlPctFMJ9SCkUNQjKm+EbywhD/HUDKvf9tQYJmitdEnwhXcTQ+3Y356+/+8RVuMfGOSw
         EKpM8X2KaCPylpiAwch6D3QotglmyuWQ8vKrErYTpGLabFvBMTvw80EUQZPYIW0VuWEw
         Z79IC8JuMgl53njv9HQrljzD+QxhlMhe6uq7o3XpcHXTCKzLKIzpfw/S5T108wMJHz/c
         zGjQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773274773; x=1773879573; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2WbbrP9UKayQKzMCCQlrWbD7lavhLnTvbIIulNvzIGo=;
        b=jjC66G/T0yVpG1gcvAX7v0hKga4rqlDQRBXLMp4LfMM6k2r0fMPc9XPZH57GXibE6V
         30wAj4h6nRbq//vSQ7EUpIHoZ0KWFpYfaHR8MaUlm6EPuACZ15L3eahL/3DkNP6T84Nd
         Uwt2zVU6UuyJhiJ6+Y28x9iYyHN8FkBelcTl5QKhZXbG3TekOHnWP9SWA8Zjzo9IBFW+
         PhWFz9sIklUPqDOXZ7gyjjZM6ZzPZIfbNk+Bz0DuGCxDwTc1thj+ROFaXq+rSQIKMD2G
         GR3LW8gdXOILsk+KLQbG7Zm0dgPTMRtJ6oTmlEFpBRjOsIzODWJDmE455wH7P2zZzYlq
         np1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773274773; x=1773879573;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2WbbrP9UKayQKzMCCQlrWbD7lavhLnTvbIIulNvzIGo=;
        b=qr9F3hCTuD4uyb8oJ14MoLcvq1sUJ7wpB421mD8zilOfvbXiiC7lGWIrE+Ccc3VkZr
         7f0eKtSgAjk0GFusp5PvnMZsNntnyMqP//ZHQncRracDYGOsZ7sj2M6Sk7q9x09ReSAY
         sMfxyMMonhEc69PBimt9OFDrXRuFW1s4nZC6UW0Pz5REEcRHawk5m8GR+1li88oW4pex
         iknsHM2psBnKFaaJgNtF895F4j+v+LrDXnfvnJ+he8m57czm3Yl/npNjmldkV1hytRLV
         MhnLBMvWAct/zsGVO6dgxbKNiM2HrS4g6QNwQaFp9IuXpPNY9YbgV5F9wGOK9fCHDusD
         NQow==
X-Gm-Message-State: AOJu0Ywt6j0bad7+lZXZLWXMLwq14DCD43sm7Jtvh5c/WJMisxmgZ5rC
	4FpoPXqtnKw7CBCMTs5byN6jNewgUT5HGV3QNw9U/AJtZqnxsBsaEIuj177GHU5+ZR9jl7o/BzV
	1WaFZ/Y+muUuUiJqK69jMgnNVq+HzmQIGb0mD
X-Gm-Gg: ATEYQzzYo5fVnJpZQCdvXUMtH0GDmm3u12HiuOskm1Is16ccvg1CujXzodcfNBfo+rb
	3hW4zSkbLJVdmgOrII+rX6UvJ5Nqjn+l8+REScocPGsU4dRzCywrSIA3i3BqWVjz5rBuDwvZ3zb
	uSNInU+98Pt1UjcuxGPxf5H/Nb/Jh/8qNyiLFIPIwV96xjkjOREbg30aMmo17aiiEw8Gdw+Pyi9
	ZIcpFF2qcDrb5iZEdsiP5C6lzvLfYUvCWpl7b7GW6/wTo7bYgPv4xcGyzhW8MZwG9bF41HTj4f5
	HQCuiaF4R+ev8J/fNbM=
X-Received: by 2002:a05:6808:4fd2:b0:45e:91ea:89fc with SMTP id
 5614622812f47-467333db740mr2478211b6e.2.1773274773374; Wed, 11 Mar 2026
 17:19:33 -0700 (PDT)
MIME-Version: 1.0
References: <20260311082649.97159-1-f_l_k@t-online.de>
In-Reply-To: <20260311082649.97159-1-f_l_k@t-online.de>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Thu, 12 Mar 2026 13:19:22 +1300
X-Gm-Features: AaiRm53qNkPX01-XyFxfliHFrP3koP3Xlq3pOdEzGz3hEmJiwmM0B-B0PDG-JW8
Message-ID: <CADySD0GwwqV7u=Owk3HTuLAGMPU=VrwWAFs0GV9T_nNkWqmq5g@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][PATCH] mypaint-brushes: add recipe for v2
To: f_l_k@t-online.de
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 00:19:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125092

On Wed, Mar 11, 2026 at 9:27=E2=80=AFPM Markus Volk via lists.openembedded.=
org
<f_l_k=3Dt-online.de@lists.openembedded.org> wrote:
>
> This recipe is required to build the upcoming gimp-3.2.0 update
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  .../recipes-gimp/mypaint/mypaint-brushes_2.0.2.bb     | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>  create mode 100644 meta-gnome/recipes-gimp/mypaint/mypaint-brushes_2.0.2=
.bb
>
> diff --git a/meta-gnome/recipes-gimp/mypaint/mypaint-brushes_2.0.2.bb b/m=
eta-gnome/recipes-gimp/mypaint/mypaint-brushes_2.0.2.bb
> new file mode 100644
> index 0000000000..b3ad94b4d7
> --- /dev/null
> +++ b/meta-gnome/recipes-gimp/mypaint/mypaint-brushes_2.0.2.bb
> @@ -0,0 +1,11 @@
> +SUMMARY =3D "MyPaint brushes"
> +LICENSE =3D "CC0-1.0"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D65d3616852dbf7b1a6d4b53b00626=
032"
> +
> +inherit autotools allarch
> +
> +SRC_URI =3D "git://github.com/mypaint/mypaint-brushes.git;protocol=3Dhtt=
ps;branch=3Dmaster"

can please include tag=3Dv${PV} in the SRC_URI as well

> +SRCREV =3D "0df6d130152a94c3bd67709941978074a1303cc5"
> +PV =3D "2.0.2"

setting PV is not needed here

> +
> +FILES:${PN} +=3D "${datadir}/mypaint-data"
> --
> 2.53.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#125068): https://lists.openembedded.org/g/openembedde=
d-devel/message/125068
> Mute This Topic: https://lists.openembedded.org/mt/118256689/3619737
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
nkur.tyagi85@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

