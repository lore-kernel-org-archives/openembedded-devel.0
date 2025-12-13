Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BDC9D5B15D
	for <webhook@archiver.kernel.org>; Sat, 13 Dec 2025 19:58:52 +0000 (UTC)
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12399.1765655924867980092
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 13 Dec 2025 11:58:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NsU2oHB8;
 spf=pass (domain: gmail.com, ip: 209.85.160.53, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-3e80c483a13so1660378fac.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 13 Dec 2025 11:58:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765655924; x=1766260724; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P3kwQ9biEaBACXIp3oZ2Yn0De5dcbkOiSVitcTJs1iA=;
        b=NsU2oHB88aDRhC0wr1PSXxJdLUK8g7z4VhSIZkawIgnURg2k8v25M9D5qItXyVFjNs
         LlpNmF2LtWGemQvjYBtoD8Dr0V1M0EyDMChtc5o9EKq8RpbehZkKY9+XQ/S0s/ewm0O5
         biOF5ruNu+smTFyXElM0XwGyHUI2y7zryaYQEKwMpwkBqjvKbOST8EuyRxQ1K79XM4Z0
         T8OBXxqNcCVwr/1Gxr7CjohpwQitIVu9f2YRP+7g4rphdbHhTXmG9+fWmM2oz3KhtiLJ
         5gYiUhaZ8hcLxd18HnkQf62+bre+rhI1ecGjLIkpkfN/DR56u0stBQr6mhALqcCkAgR9
         XZqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765655924; x=1766260724;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=P3kwQ9biEaBACXIp3oZ2Yn0De5dcbkOiSVitcTJs1iA=;
        b=d6PgI7GCZPQfShuBxFMrkS+aA+smEJeDE6HN1lG+Jubg/xYyO11P++uOJvoCkzMH95
         knDF+0KsTlQ17zaiaI802jJL37ubNAmKgtxwuL3M4L/KTWpInFIgwiWC0hmdhfzJB6zg
         lURIjVtBZqwnGa/8/BsHVC9klQKiqvRZo9NNVPl465BhJHU24moQHXi1OZ17MA+mZsPi
         Ui71lQicEH1rLXP2f3aVD/WSmJdylL6i7eOia+mNu2aIjlepnCs8u+RHB1QESvSXL2Sl
         oPid/3gJLne0H3y5hUS1tdrz5SgAUH2HlxD3ztckJHWBqltS8EjSTdbT5ExlrspmjNem
         D3fQ==
X-Gm-Message-State: AOJu0Yzx/ujggKl8FIp7YjmND6uPRvSu+WcX7r6+Q/rc+vYBU0iOeLLT
	Ty7lXPVcvdgkLhbEwojDCaexAy3mJx9ZWi5oJG3l0V92oAtwCWucy5Vk8C0jKK99oP7Zhjw0eQv
	mbKFMv7cvokVWIwanElneJ2XoylHDE3M=
X-Gm-Gg: AY/fxX6LGIuyWg1dYcI0kiffFm1P05Z3rm1wcpVL6GzPxF7iDIQbU6r7Dc/8TKy0gaJ
	Zzf9FD6zqkNQKYhtWpnUYTRQ++sUwMlfAJKX3vnipsBdZfsTMn1LENEwrCHcf7qdJrPWGYlAhD9
	heapYeQG9DBDo0LnkDZFYhGM4E88a2mhHiZ/bpT4zk3PSQIAAlAW5eg6EPhJaS9kIzjnxJWUsub
	VwCLQj0KjfOZUUZ3oAVCHSOO0fSHJD+jgEzI9O0/j3SM5UjYJk5csbvMw5SJMOz8SU2/hYJWg==
X-Google-Smtp-Source: AGHT+IGwfy1bB0hDB8Z0R5htGV7CWKMNiEdyr4/B+DSngqvM2/VF2ly9wVm8QKSa3MjXdCPMIi+jYbbyAdNFy4prfEc=
X-Received: by 2002:a05:6808:238d:b0:450:7dc5:542b with SMTP id
 5614622812f47-455ac957d7cmr2520861b6e.34.1765655924002; Sat, 13 Dec 2025
 11:58:44 -0800 (PST)
MIME-Version: 1.0
References: <20251209153953.951218-1-skandigraun@gmail.com>
 <20251209153953.951218-2-skandigraun@gmail.com> <182436.1765653700176088747@lists.openembedded.org>
 <9e898b8b-45d4-4e6a-98aa-a954914a3158@gmail.com>
In-Reply-To: <9e898b8b-45d4-4e6a-98aa-a954914a3158@gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Sun, 14 Dec 2025 01:28:33 +0530
X-Gm-Features: AQt7F2rbirXOTfgaIEIPd0jSmmDSbFPGBwqA6RTSCxTE27iu-9VSfk3gZNQ6GpY
Message-ID: <CADySD0F7L5i9CkbS7ERA__By87Cmzb4npOSaBobF38FMiNNeFg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 2/5] civetweb: ignore CVE-2025-9648
To: Gyorgy Sarvari <skandigraun@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 13 Dec 2025 19:58:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122641

On Sun, Dec 14, 2025 at 1:05=E2=80=AFAM Gyorgy Sarvari <skandigraun@gmail.c=
om> wrote:
>
> On 12/13/25 20:21, Ankur Tyagi via lists.openembedded.org wrote:
> > I don't see the commit[1] which fixes this CVE in the current recipe
> > version.
> >
> > [1]
> > https://github.com/civetweb/civetweb/commit/782e18903515f43bafbf2e66899=
4e82bdfa51133
> >
>
> The recipe fetches b6ef58f4c4c7fbe90fd1065bccf45b143345f1a6, which is
> from 30/Sep/2025.
> The fix is 782e18903515f43bafbf2e668994e82bdfa51133, from 2/Sep/2025
>
>

Sorry for the confusion, I had recipe open from my 'scarthgap'
workspace recipe which fetches
d7ba35bbb649209c66e582d5a0244ba988a15159
Your patch is correct.

> The first and last line are interesting from this log only:
>
> $ ~/git/civetweb]$ git log -n 30 --oneline
> b6ef58f4 (HEAD) Do not scan third party projects  <=3D=3D recipe revision
> 3784be9d AppVeyor: Add Visual Studio 2022
> cafd5f8f Format code
> 3ee51c19 Update sqlite3
> 8543cf79 Appveyor: Deactivate SSL for VS2019 / VS2022
> 9cabe415 Merge branch 'master' of https://github.com/civetweb/civetweb
> b4afd1e3 Merge pull request #1358 from DL6ER/lua-5.5
> c7df0249 Fix timer test
> b20a7bc1 Set minimum CMAKE version for tests
> 2fefc5c8 Add Lua 5.5 support
> 618790d4 Unittest: fix alignment
> acaf7e3f Use atomic operations in timer test
> 4bd10c49 AppVeyor build: Replace obsolete Visual Studio builds by new one
> b3a34ad2 Merge branch 'master' of https://github.com/civetweb/civetweb
> 98dab2e1 Merge pull request #1355 from aryanrahar/fix/uri-len-dup
> 48b58d1b Merge branch 'master' into fix/uri-len-dup
> e06d8d96 Merge pull request #1352 from
> mfranzen0906/feature/replace-asterisk-with-origin
> 7b7bde47 Merge pull request #1350 from Geeoon/various-typo-fixes
> a9900426 Merge pull request #1341 from yubiuser/prevent/CRLF
> c5844556 Merge pull request #1347 from
> krispybyte/fix/uri-processing-heap-overflow
> dfb58aad Merge pull request #1354 from
> civetweb/dependabot/github_actions/master/actions/checkout-5
> 3e7ecedd Update SECURITY.md and LICENSE.md
> d8c74f7c Update README
> 782e1890 Make parsing of URL encoded forms more robust <=3D=3D Referenced=
 fix
>

