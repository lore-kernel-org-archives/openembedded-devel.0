Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCE27FEDA17
	for <webhook@archiver.kernel.org>; Wed, 18 Mar 2026 00:44:43 +0000 (UTC)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4157.1773794674942643610
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Mar 2026 17:44:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=P+D1YTdU;
 spf=pass (domain: gmail.com, ip: 209.85.210.52, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-7d773a4af0aso3014039a34.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 17 Mar 2026 17:44:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773794674; cv=none;
        d=google.com; s=arc-20240605;
        b=f/PN637Fr5JCdlgWAIanRSBgrpviLdyC3HKOHl91xLJkVGxY+0PmdDu29XJ10Ntotq
         aPafpElI6YRifgS5VRjW1E4HSZWaCfSxF0CtE0SmG5KI3hQP/1kf/D7ao/lVyOkIFwvC
         w92h7wij5wEtMAefZyg7QbTbsCc85ly5GgsyU8ai1XTwEgKaeEz6xZHUq5keO+ertPip
         /8Rx/hsC55WGV/PhwddPRPzRVyQIJ2tCvo+K4tlrYmi0C8SfHPi5/Ctrs0xr4yOF24P6
         nV23I32O1IxH761sijDKhwe5lLMNvF9dOnxXZlkuGa1ETM3N8ClvospZGwMj+Mndoq8Y
         So0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FaMAwvaFcMEv4LRcGhiFHcieT4y0e2dzjrnL1Z8u+vQ=;
        fh=PqrvWOQDuMW7DBEZMtJk4sUef2SPa7RI/TJA4C6UjCM=;
        b=VnUSKyCWoG80BCHRq29KeqYiulbywzdpKPb8Eo4JNeThmalBRFAK/uEz47s2FT0CnN
         K0UzzyLP51FHsGu4jQXb70+yys5SxZNwRYnguOoFxKuDqoUmvU0Zr8F8cNEfXr/InHlp
         aW199U9YDIPnMMzC0pBHC4T9uzGRSAfhVOhKWpD2aWLpAj4MVtJmrOadVUZ+ABbTNaKs
         dzqq9rJxmiRIAUbjm4MmiTp6XMuT+Fik3SKvvpq0RCUjp/d1h22OqF4RTj0HfSka7qr8
         eG11sfdBkSicPlWTTKx/ej5deYFCx3CXVweUVDho4QcCmJj6Fm4x5MCjSmrsvOeb1Po4
         ZUow==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773794674; x=1774399474; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FaMAwvaFcMEv4LRcGhiFHcieT4y0e2dzjrnL1Z8u+vQ=;
        b=P+D1YTdUf1poD1lIfiqxz6C2OE3+UBlBm5wwz3/jEZayB/VhbTvl20KQKLdXO1Gg6M
         p4SK8cNEdSLLgFMwkTcThYYXylknDjHQSue5Uto2lsITa/3Qb+d4XUQXjzpTc/FA3huq
         5z50gcnIVTccZPy+0wcXPMLcVzlNidtfVqzmInr9SdmAcfO6QTAc4xfNanMz1FS8S0P0
         P40YZCYbESRXPyUiprd8vzMp0nHYc9lDPHk3/NdoQ9bRXZ3RxIDB0reKpSzbfwIbTWNz
         FTbuXGGEYA4bjTe6UgJMUicU3rdyXzdcLaxga4tkzSH4vry43G+GMljhO6QJ/DH8kYFl
         sO1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773794674; x=1774399474;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FaMAwvaFcMEv4LRcGhiFHcieT4y0e2dzjrnL1Z8u+vQ=;
        b=pHjAw6NCpvx9RBMzSQc2h4L8wdd1k1kLmIxbONvn/8I2M+5CjtwDCxC5fmOHa+eIXn
         ierLkmhjSkzDsqTeuxMvzZc6zHrb7Iir6rRjebGQBP3V4eiAeEGqEV22hC5k3W+6NTLY
         xB90TqfBtbbAAOrCdytz25dRbv/Ax7iAdVL9AC23jyJYfT4vhwdRPnzqIBse0uSaT7Xj
         42n6NWKEsuewTWB1Z8q5FlYaPESWApRXZ1Q2RbmdgN/HcWd4YztqWbvVZhWd+KtG4zQT
         cGOwKl5kqUh+4B/XNRcwEfwOAgiV0AsiV2c5th/U0xDkUhio2+BLZGUFmlmuZwv2V5rb
         ZkLg==
X-Gm-Message-State: AOJu0Yw7EXzNFPVUBKjvbdX/O3m4yCE36CwH2SnSQ7Cf1kmDjuLYw3+q
	5UdkO5jCB2+lSPmOkb4vO2ICmUb6btO07cxZCCS0IMl87sjPHLA1QMggHtfOd0IMMzfxkOFs4lm
	4rTrMvYTEWkE4xYjOCu61+0fVXFYHF2M=
X-Gm-Gg: ATEYQzw1VxTRH7HaGyYPJIPDMOpzQt4mJRfGsAIqOQuR97bdjj+aD8J+gEPz87V2Czz
	yvAPuVHal0yJ6hqA+W196z0gB8HlBPZ8paiWvGa76lNukG7WFGKtQ1abOtbvV7FlwL5wDHQ4WrC
	HqEhoHeRLwzP7xSRklX0hRWEt0iRz1MiQ/50CK6qBxsYn+g9qArVnvPc19M+eU93c+XPwWKMu1u
	jE404Tj7MZ4fHkPIdIbEqp7dzQ4xs+hQcG/1AEB/yQ3kXUNg3RIwGdekNF2Ym90UjI3zwxZG4//
	k4i1NcOg
X-Received: by 2002:a05:6830:3885:b0:7d7:c5c2:b767 with SMTP id
 46e09a7af769-7d7ca7d54c2mr1047074a34.32.1773794674074; Tue, 17 Mar 2026
 17:44:34 -0700 (PDT)
MIME-Version: 1.0
References: <20260317172346.2862459-1-skandigraun@gmail.com> <20260317172346.2862459-2-skandigraun@gmail.com>
In-Reply-To: <20260317172346.2862459-2-skandigraun@gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Wed, 18 Mar 2026 13:44:23 +1300
X-Gm-Features: AaiRm52Is4JK3R-PO6B81paeoWHEPoZGm14nc-r4ygqNBSjadvqX4-flPwSnv2U
Message-ID: <CADySD0EW-SYsi+fDipkif6-2-irpUG4CAg5m4pt9hnCLeSe4cA@mail.gmail.com>
Subject: Re: [oe] [meta-multimedia][PATCH 2/7] libde265: patch CVE-2025-61147
To: skandigraun@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 18 Mar 2026 00:44:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125337

On Wed, Mar 18, 2026 at 6:23=E2=80=AFAM Gyorgy Sarvari via
lists.openembedded.org <skandigraun=3Dgmail.com@lists.openembedded.org>
wrote:
>
> Details: https://nvd.nist.gov/vuln/detail/CVE-2025-61147
>
> Backport the patch that is referenced by the NVD advisory.
>
New version 1.0.17 is available which includes fix for this CVE.
We can drop this patch and upgrade the recipe[1]

[1] https://lists.openembedded.org/g/openembedded-devel/message/125336

cheers
Ankur

> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> ---
>  .../libde265/libde265/CVE-2025-61147.patch    | 103 ++++++++++++++++++
>  .../libde265/libde265_1.0.16.bb               |   4 +-
>  2 files changed, 106 insertions(+), 1 deletion(-)
>  create mode 100644 meta-multimedia/recipes-multimedia/libde265/libde265/=
CVE-2025-61147.patch
>
> diff --git a/meta-multimedia/recipes-multimedia/libde265/libde265/CVE-202=
5-61147.patch b/meta-multimedia/recipes-multimedia/libde265/libde265/CVE-20=
25-61147.patch
> new file mode 100644
> index 0000000000..56d48f2a7d
> --- /dev/null
> +++ b/meta-multimedia/recipes-multimedia/libde265/libde265/CVE-2025-61147=
.patch
> @@ -0,0 +1,103 @@
> +From d73508b7578964f2115ddf051b8fe9b4445978d4 Mon Sep 17 00:00:00 2001
> +From: Dirk Farin <dirk.farin@gmail.com>
> +Date: Tue, 9 Sep 2025 15:14:05 +0200
> +Subject: [PATCH] check for valid integer command line parameters (#484)
> +
> +CVE: CVE-2025-61147
> +Upstream-Status: Backport [https://github.com/strukturag/libde265/commit=
/8b17e0930f77db07f55e0b89399a8f054ddbecf7]
> +Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> +---
> + CMakeLists.txt   |  2 +-
> + dec265/dec265.cc | 44 +++++++++++++++++++++++++++++++++++++++++---
> + 2 files changed, 42 insertions(+), 4 deletions(-)
> +
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index 4da99216..997945a9 100644
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -5,7 +5,7 @@ project (libde265
> +     VERSION 1.0.16
> + )
> +
> +-set(CMAKE_CXX_STANDARD 11)
> ++set(CMAKE_CXX_STANDARD 17)
> + set(CMAKE_CXX_STANDARD_REQUIRED ON)
> + set(CMAKE_CXX_EXTENSIONS OFF)
> + set(CMAKE_POSITION_INDEPENDENT_CODE ON)
> +diff --git a/dec265/dec265.cc b/dec265/dec265.cc
> +index 79f67cd3..ecf5d131 100644
> +--- a/dec265/dec265.cc
> ++++ b/dec265/dec265.cc
> +@@ -27,6 +27,10 @@
> + #define DO_MEMORY_LOGGING 0
> +
> + #include "de265.h"
> ++#include <stdexcept>
> ++#include <iostream>
> ++#include <optional>
> ++
> + #ifdef HAVE_CONFIG_H
> + #include "config.h"
> + #endif
> +@@ -563,6 +567,40 @@ void (*volatile __malloc_initialize_hook)(void) =3D=
 init_my_hooks;
> + #endif
> +
> +
> ++int parse_param(const char* arg, std::optional<int> lower_bound, std::o=
ptional<int> upper_bound, const char* arg_name)
> ++{
> ++  int value;
> ++
> ++  try {
> ++    size_t len;
> ++    value =3D std::stoi(optarg, &len);
> ++    if (arg[len] !=3D 0) {
> ++      std::cerr << "invalid argument to " << arg_name << "\n";
> ++      exit(5);
> ++    }
> ++  } catch (std::invalid_argument const& ex) {
> ++    std::cerr << "invalid argument to " << arg_name << "\n";
> ++    exit(5);
> ++  }
> ++  catch (std::out_of_range const& ex) {
> ++    std::cerr << "argument to -T is out of range\n";
> ++    exit(5);
> ++  }
> ++
> ++  if (lower_bound && value < *lower_bound) {
> ++    std::cerr << "argument to " << arg_name << " may not be smaller tha=
n " << *lower_bound << "\n";
> ++    exit(5);
> ++  }
> ++
> ++  if (upper_bound && value > *upper_bound) {
> ++    std::cerr << "argument to " << arg_name << " may not be larger than=
 " << *upper_bound << "\n";
> ++    exit(5);
> ++  }
> ++
> ++  return value;
> ++}
> ++
> ++
> + int main(int argc, char** argv)
> + {
> +   while (1) {
> +@@ -578,9 +616,9 @@ int main(int argc, char** argv)
> +
> +     switch (c) {
> +     case 'q': quiet++; break;
> +-    case 't': nThreads=3Datoi(optarg); break;
> ++    case 't': nThreads=3Dparse_param(optarg, 0, std::nullopt, "-t"); br=
eak;
> +     case 'c': check_hash=3Dtrue; break;
> +-    case 'f': max_frames=3Datoi(optarg); break;
> ++    case 'f': max_frames=3Dparse_param(optarg, 1, std::nullopt, "-f"); =
break;
> +     case 'o': write_yuv=3Dtrue; output_filename=3Doptarg; break;
> +     case 'h': show_help=3Dtrue; break;
> +     case 'd': dump_headers=3Dtrue; break;
> +@@ -592,7 +630,7 @@ int main(int argc, char** argv)
> +     case 'm': measure_quality=3Dtrue; reference_filename=3Doptarg; brea=
k;
> +     case 's': show_ssim_map=3Dtrue; break;
> +     case 'e': show_psnr_map=3Dtrue; break;
> +-    case 'T': highestTID=3Datoi(optarg); break;
> ++    case 'T': highestTID =3D parse_param(optarg, 0, std::nullopt, "-T")=
; break;
> +     case 'v': verbosity++; break;
> +     }
> +   }
> diff --git a/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.16.=
bb b/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.16.bb
> index 40910633e8..701f0e5f69 100644
> --- a/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.16.bb
> +++ b/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.16.bb
> @@ -8,7 +8,9 @@ LICENSE =3D "LGPL-3.0-only & MIT"
>  LICENSE_FLAGS =3D "commercial"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D695b556799abb2435c97a113cdca5=
12f"
>
> -SRC_URI =3D "git://github.com/strukturag/libde265.git;branch=3Dmaster;pr=
otocol=3Dhttps;tag=3Dv${PV}"
> +SRC_URI =3D "git://github.com/strukturag/libde265.git;branch=3Dmaster;pr=
otocol=3Dhttps;tag=3Dv${PV} \
> +           file://CVE-2025-61147.patch \
> +           "
>  SRCREV =3D "7ba65889d3d6d8a0d99b5360b028243ba843be3a"
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#125324): https://lists.openembedded.org/g/openembedde=
d-devel/message/125324
> Mute This Topic: https://lists.openembedded.org/mt/118368211/3619737
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
nkur.tyagi85@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

