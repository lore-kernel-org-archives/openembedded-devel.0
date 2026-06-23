Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D381CD98F0
	for <webhook@archiver.kernel.org>; Tue, 23 Jun 2026 06:28:28 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15116.1782196107297276221
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Jun 2026 23:28:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=HSFHQYn0;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5ad5e719157so2594439e87.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 22 Jun 2026 23:28:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782196105; cv=none;
        d=google.com; s=arc-20240605;
        b=Oll+9IBJq6rH7FjhHx+4GDuZqdwxEFDxqfAErnGmy48xEmNL4ZE5OYm2RfER+ZZ7Y+
         1YurbzCc7yt7rHH2ZBkAhYmcyoCU3PSCc1lJ8P85ANRIU6Yak5EjH0L1muIJRaRmmqDn
         wiGmkxr4mtHz+MYgZ8kRunEpeQw2g87TaSpkqiH1Elq125SfjoDsi1r+Axr3okouTx5U
         HiGEUhuBXyZChlxBb5SGifRe4NdS2mV7VuVXODAxmGphlUh8wZklysg3tqE//JLSjUlV
         q1Re4rmsSPpxOkI6s0N61XOeUB1K6OgG3ApWkgcCBRXJcpVkBkl7tBRpP7qcqBQNeYdZ
         d9Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+YgyKOzC0AfDZ6nGpcaNctb0ZVgPoffv/YPEWe9NM4M=;
        fh=6hcUKr3duktBY3UgoTWb3oMgRC8h/CdRJUPQi4zxMzQ=;
        b=BGvauB/Hy+WiS08N1RN4NTUXKmG46WCVOqA1J1NN8DJ4p5KlRZsQiYMIn4wWfgbwrs
         x/EMhHRj3oy2lGAmjEjvw1uqPvUDKZ7V2c7FU9fzap94SQKxe2Otr48rc5Kr8tyQjIXq
         zPG0fqRJux86lsV8Nv71AHjcYZkga5Ldc3T+qD7gYFXHiacD9VabFjq1vhwbrbB1Qenh
         Id3ejQaA99BJom71cTP2U4TEWwWVmyVYhd/h8M0QtUrMonUwNGyIbC8ZIWhX6RYlad6r
         n9CV4PdXvrKngNgsPd+fiDkwosoiE5Q3PFOC2hl80Dhmqe3RcqEpXeFzewAAIBG3WzBZ
         pTmQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782196105; x=1782800905; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+YgyKOzC0AfDZ6nGpcaNctb0ZVgPoffv/YPEWe9NM4M=;
        b=HSFHQYn0ZEQMY1oJpfnV0110EGuJUlxRNa5yyWm9IXQA2/zHCqJAgA835dVqgLWl9f
         Ucfvdue30nTFbow5SR/A1KpNmNYCx+bC41rHu+LgI241VRIj4hg6kR0VWseCH/C+37YX
         Zy+8fdiQa6BPVEbdapFO58KlyRv+eEr/aAUjQzb8PSTqW2v0utkB4d1w4H4hrFEmnzZ7
         fweqdXEUvLX0teBqEWSqVH2DKI7IF9Nhjxua1lHzcYoyRFWbw0o5p2jFf2fpbp7mKYnO
         oKUDsMiC5IfRHSpSGyHK039WSvNnH5gGN0YiCKjQuUit19h4EvgbGCoC4VdIDk61jJcU
         nt0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782196105; x=1782800905;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+YgyKOzC0AfDZ6nGpcaNctb0ZVgPoffv/YPEWe9NM4M=;
        b=NgLKmgEgsxqBifF8KRYf8OG7iSvOkbOHCoFFde0FTtmO+Co+Wp7RbdccGxglEVIEXf
         4cmo7j7Ei8a2lSJGPvJlZbaa/i8amyhs75AwgEiR+Mxfxlep7OyP80uQOnn7QWxZPvw1
         jr8TMNq2ZIK0MF0oL2zJOwe5FKkWRWRBEbitIzyxhKxNtJzAED7nf/jSXFmyMPGXiORE
         cfAEpVSvblX1YExHW1E1lPeyLSHCesXfEdcqRvo2d46JhejeVMUieFjH9d6wqUJu1fdy
         RA4Eo2cvzFC7RRIqNzxifX43a3Lr/KB3733opPPkvpM7zm/oKkWs3yb7WQsxsJ1EUwA6
         ENnQ==
X-Gm-Message-State: AOJu0Yx9xGUo7Gij1w0YBkZsR8Lc1hIiqILJ+cju0kf07uDq12RIBxY6
	7C7u5/6ak8n9xLZHGywSRxuNnhi4lIw4TaE64WG1ssQbppR5W4pMSNIIhYw3lO9Z7Cex8xOZRIP
	k0PVSvoGqF3q2x+tHsyMw7RBM5RLspJ0=
X-Gm-Gg: AfdE7cmYnXpoQsAlWbvdRqVXlhcwgZ2jxF1J5L/Lq1Ybv7wyuMOzyJoyVz29KRbk7A4
	QaG2reU1Ca43pTUqa/AlUtYkro329Q9Kx5nSxRvboEO9wTPyRH2EHKDKYUfi1NAty8r3qDgIwkx
	jv/BXMqU+N9PcJ4c4kc0FanC3LOimr/RRzbvbMbGwfHOXRLBvqyxPCxscUDVSlhCbsvvvx/o4Mw
	PD38DrkNBrXRgg+QEYYs5GgC8ObYobpXqLLb1eUZthpaat4VW+FleImmDqCDCSbFzFvroMiknwQ
	vFg80nxapIqy9b/fHTIiHtLoRW8aLO5FHDIclJokTEvhEtXM3y8CHuU=
X-Received: by 2002:a05:6512:250e:b0:5aa:5183:2042 with SMTP id
 2adb3069b0e04-5ad576e938amr5885079e87.19.1782196104514; Mon, 22 Jun 2026
 23:28:24 -0700 (PDT)
MIME-Version: 1.0
References: <20260611124540.1132897-1-f_l_k@t-online.de> <CA+chaQcALoDLpkXf8rhjmD2S=oT7ftCn5ObrxDPd=vs2FWU8YA@mail.gmail.com>
 <KOM2HT.6AX73B5LYJEI@t-online.de>
In-Reply-To: <KOM2HT.6AX73B5LYJEI@t-online.de>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 23 Jun 2026 08:28:05 +0200
X-Gm-Features: AVVi8CdxkqHfvye1Xclr2UD-KYxNr3ZclA3sNwEUTHiMiJjjDVQkDn1BLamAFk4
Message-ID: <CA+chaQdx9wdXd-Cz6FE_cykchxpANJAjpCtj-EFOwVeifQYBpg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] hwlock: update LIC_FILES_CHECKSUM
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Jun 2026 06:28:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127695

Hi,

thanks, there was the upgrade to 2.14.0 from Khem already in
master-next, that's why you've seen the error and sent the
LIC_FILES_CHKSUM fix.

Then your LIC_FILES_CHKSUM change was merged to master without the
upgrade, but Khem pushed the upgrade shortly after in the next batch,
so all is fine now.

https://git.openembedded.org/meta-openembedded/commit/?id=3D69c645570215691=
eae3363265ee1b33e99e53b68

Cheers,

On Tue, Jun 23, 2026 at 8:15=E2=80=AFAM Markus Volk <f_l_k@t-online.de> wro=
te:
>
> On Mon, Jun 22 2026 at 07:23:34 +02:00:00, Martin Jansa <martin.jansa@gma=
il.com> wrote:
>
> Hi, was the LIC_FILES_CHKSUM change intentional? It should be part of the=
 upgrade to 2.14.0, right? But now in master there is the LIC_FILES_CHKSUM =
change but still with 2.12.2 version leading to: ERROR: hwloc-2.12.2-r0 do_=
populate_lic: QA Issue: hwloc: The LIC_FILES_CHKSUM does not match for file=
://COPYING;md5=3D883e49a2e0f7142a345f9b0c01a380e7 hwloc: The new md5 checks=
um is 79179bb373cd55cbd834463a514fb714
>
>
> Hi, I did the LIC_FILES_CHKSUM change, because I had the same error after=
 doing a master-next branch update.
> By that time PV was still 2.12.2 so I can't explain, why it failed in my =
build. Maybe the recipe has been updated
> without changing PV by that time?

