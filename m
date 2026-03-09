Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1DF5FCA177
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 18:43:19 +0000 (UTC)
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22201.1773081798562365086
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Mar 2026 11:43:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UCpZJk4r;
 spf=pass (domain: gmail.com, ip: 209.85.160.47, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-40ea36b56b7so4561938fac.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 09 Mar 2026 11:43:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773081798; cv=none;
        d=google.com; s=arc-20240605;
        b=l2IHpA6SsRDaEvgGKaoZu9zun74tjkZQxOd1tJIaKpxdwVGaxn1wfEAusUS8Rqeh8A
         7ASYRKr2pavbUPte1JSAH4s3qOWKgZ66C9UkBevgrp2Ndvdm6XE5zNR/8tKTFc20xJYt
         HY7GpI1uXqUYP1c0iGyXE4A58V1pWseCg92FKUAIlV851avIllXejxID+cWGjqTGLW4S
         mwKH8Rw9rp+7ovKFxqNLz9k7gbqX8wWDvOxI20VjKMoiHFluxU1XrEM8isrRM3ETa9e9
         Dv/aPJDMZOpOufpzBrqlDdEg/OmG+gt7877ng7o7rPykUZp+Y4IeNbHbZaAHYkSQQBBJ
         DcMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0ZpEfpQwmwXn1b6Attuf1SCtoc7xFHLXl0O7zobHSHg=;
        fh=/pKZqiJO6ZyW8l1F3cqMwIj3cJesZI6SFBUzs2mKL9s=;
        b=WIHXpDGK2aZxRsKipmEJ9VFR5q/Of+hukWc88TEXIyk8iKNJ8pfMEuWssd4egr1uL4
         p8ICgSlf59aWbLq0zf1JQGTzL8YPey/RP41nEmqRXiCO0DEO7BWTW5OeyaKKMxFKN76J
         vNkeshgmde/PTvrCWbhuniaFaLQgh0MiqJ6Y38YpbrDP8LCAHKWpurWre0IFYkDDON2+
         aQHd5gInAOcpp3NB+n6/f32Jn3uYuOzxczAmxIk7ondVJ350UR8PTgR0h+6F+uhqjdGM
         iZw89l9/e6crfNiS20oP55/6GXFoI/5NRwEzObAxu/EOC6OmExM9wm3K2QefQsEBCGo2
         nMEw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773081798; x=1773686598; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0ZpEfpQwmwXn1b6Attuf1SCtoc7xFHLXl0O7zobHSHg=;
        b=UCpZJk4r7EK1UfjuiP6obgmJSIw3746XPZIAuYkL8xowVjScVZVmfEFIY8706V+Rn2
         mdRw9DVg6hrhv79jSUHhu016ZeKObltlR/YFCfiWfmqGANkRwmdtY69vCngHGLOby5LK
         +bU+6OSQLcvv5hd0Pdt0vVTSpc86IpyU3tWIqNpary7SmpCqqRSXGAIVKkLwiX4v5dJF
         EwRq1Zj5O2RvHOyJOlF6XMqQTseT2khU9dRQ0rYBBnLnkMCmBAHra8QaNhcTRnVYeFyA
         0OEynoQHCiPymmY+cRkcGH/hcMDhYdffF0OTxM37MFVIHRCOEgJ3AVEpkrwb2Q1oEq0C
         STFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773081798; x=1773686598;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0ZpEfpQwmwXn1b6Attuf1SCtoc7xFHLXl0O7zobHSHg=;
        b=uLnzkPwVje4DvhYT9uX84Zt8NX5oir2si+2ItqjTnbudoTX4G1cR8Pa2vOfpYVAzSY
         QY2GYooL5Xou0FAQ7N5pbOPpp0dsFaPq/MCcBuFIPaBIbtunU6a1hxY2jgFnoccp/I6e
         +WKT49s1kLQkVznVqWMBLTFRkktSaEFjsJm1Id6LtRko9akY5JSgS9nsAaIOip/HQcwM
         sBXOb7u43dnyzUTqR7XYdXeupN48JUpTM3NFxWzIBnRXWnl2SjyahN4bPbdCXpDY7AJP
         Omc6aCbUvzsNZIfYpAKu+aKAiWWjJTBDpOiQiqecDDGXJ/YFAE3j5LyoARzNlbNwcCUY
         qE9Q==
X-Gm-Message-State: AOJu0YwbWGxunx4T7gkg4gZHXfB6dlecCtOLefLac1lg7Q5fT6mlJHGU
	cxIWkob3pG9ChKXPR7X9UVIx83apGVkIMImfhvmYHics5iXbSy9cw44R0/rouQ6DToXMJnpaBy5
	NcF4G6OcgvAfcJOoDFJ2fePoeRpWB0T2RuA==
X-Gm-Gg: ATEYQzzC+A5Ldsidh/JHSdGY81ec1UBhJjXc19VibXh+PeBo0ZwllI9iwEPtT67fkT0
	kcP+qb6K8CSo+gSKvbihiD+npnCJULYTqUCA1hxwFhblh7WZ4v35hv0hKTIyPc8GGnMm8EquWe0
	wxMH8+w9XM0lbFIwYuVqWXOQUWCj5a5v1of7bhUm5Gv+mhYKecCQiP/2BFX54shjup+jHL1+uEg
	7CYy+ztRB10vNwvp/MG+7tSggwrei2i5EtELxNNPt/pXL9RIhH9VA5ZDTrNwOctjkN2nIIfug5Y
	cxLj9Gj2
X-Received: by 2002:a05:6870:a591:b0:404:3569:5a45 with SMTP id
 586e51a60fabf-416e452471bmr7396156fac.40.1773081797629; Mon, 09 Mar 2026
 11:43:17 -0700 (PDT)
MIME-Version: 1.0
References: <20260309100630.404637-1-andrej.kozemcak@siemens.com> <20260309100630.404637-3-andrej.kozemcak@siemens.com>
In-Reply-To: <20260309100630.404637-3-andrej.kozemcak@siemens.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Tue, 10 Mar 2026 07:43:04 +1300
X-Gm-Features: AaiRm50ikA_F8jAkJpsn1ClikVQ8zE6r8yNPwsQRdedMyOTOUrfsVKWylxwkVLE
Message-ID: <CADySD0GuX278yvh-d-gPBF=VyUA6P-QS8JP_-oSitP7m8C8Dfw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 03/14] grpc: upgrade 1.76.0 -> 1.78.1
To: andrej.kozemcak@siemens.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 Mar 2026 18:43:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125006

On Mon, Mar 9, 2026 at 11:06=E2=80=AFPM Andrej Kozemcak via
lists.openembedded.org
<andrej.kozemcak=3Dsiemens.com@lists.openembedded.org> wrote:
>
> Removed patch included in this release
>
> Changelogs
>
> v1.78.1:
>   https://github.com/grpc/grpc/releases/tag/v1.78.1
>
> v1.78.1:

should be "v1.78.0"

> https://github.com/grpc/grpc/releases/tag/v1.78.0
>
> C++:
> - adding address_sorting dep in naming test build
>
> Signed-off-by: Andrej Kozemcak <andrej.kozemcak@siemens.com>
> ---
>  ...001-build-add-missing-includes-41351.patch | 58 -------------------
>  .../grpc/{grpc_1.76.0.bb =3D> grpc_1.78.1.bb}   |  5 +-
>  2 files changed, 2 insertions(+), 61 deletions(-)
>  delete mode 100644 meta-oe/recipes-devtools/grpc/grpc/0001-build-add-mis=
sing-includes-41351.patch
>  rename meta-oe/recipes-devtools/grpc/{grpc_1.76.0.bb =3D> grpc_1.78.1.bb=
} (95%)
>
> diff --git a/meta-oe/recipes-devtools/grpc/grpc/0001-build-add-missing-in=
cludes-41351.patch b/meta-oe/recipes-devtools/grpc/grpc/0001-build-add-miss=
ing-includes-41351.patch
> deleted file mode 100644
> index bf1f22b906..0000000000
> --- a/meta-oe/recipes-devtools/grpc/grpc/0001-build-add-missing-includes-=
41351.patch
> +++ /dev/null
> @@ -1,58 +0,0 @@
> -From a976f66ac7d1b9f43a3071e22b5014fcfeab04b3 Mon Sep 17 00:00:00 2001
> -From: "Mark D. Roth" <roth@google.com>
> -Date: Tue, 6 Jan 2026 10:09:45 -0800
> -Subject: [PATCH] [build] add missing includes (#41351)
> -
> -Fixes #41305.
> -
> -Closes #41351
> -
> -COPYBARA_INTEGRATE_REVIEW=3Dhttps://github.com/grpc/grpc/pull/41351 from=
 markdroth:add_missing_includes 223be6932adb00d085149c53167c1b0318745f6c
> -PiperOrigin-RevId: 852829597
> -
> -Upstream-Status: Backport [https://github.com/grpc/grpc/commit/d54219b50=
8423f0a2ff6a0b98c16fb6dafd44b84]
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - include/grpc/event_engine/memory_request.h | 2 ++
> - src/core/channelz/v2tov1/property_list.cc  | 1 +
> - src/core/util/glob.cc                      | 2 ++
> - 3 files changed, 5 insertions(+)
> -
> -diff --git a/include/grpc/event_engine/memory_request.h b/include/grpc/e=
vent_engine/memory_request.h
> -index 76bcbb2036..ad8cab842e 100644
> ---- a/include/grpc/event_engine/memory_request.h
> -+++ b/include/grpc/event_engine/memory_request.h
> -@@ -17,6 +17,8 @@
> - #include <grpc/support/port_platform.h>
> - #include <stddef.h>
> -
> -+#include <string>
> -+
> - #include "absl/strings/string_view.h"
> -
> - namespace grpc_event_engine {
> -diff --git a/src/core/channelz/v2tov1/property_list.cc b/src/core/channe=
lz/v2tov1/property_list.cc
> -index 64bbb6307c..03367cce7c 100644
> ---- a/src/core/channelz/v2tov1/property_list.cc
> -+++ b/src/core/channelz/v2tov1/property_list.cc
> -@@ -15,6 +15,7 @@
> - #include "src/core/channelz/v2tov1/property_list.h"
> -
> - #include <cstdint>
> -+#include <limits>
> - #include <optional>
> - #include <string>
> -
> -diff --git a/src/core/util/glob.cc b/src/core/util/glob.cc
> -index 1b1c16e23d..22e54259f0 100644
> ---- a/src/core/util/glob.cc
> -+++ b/src/core/util/glob.cc
> -@@ -12,6 +12,8 @@
> - // See the License for the specific language governing permissions and
> - // limitations under the License.
> -
> -+#include <algorithm>
> -+
> - #include "absl/strings/string_view.h"
> -
> - namespace grpc_core {
> diff --git a/meta-oe/recipes-devtools/grpc/grpc_1.76.0.bb b/meta-oe/recip=
es-devtools/grpc/grpc_1.78.1.bb
> similarity index 95%
> rename from meta-oe/recipes-devtools/grpc/grpc_1.76.0.bb
> rename to meta-oe/recipes-devtools/grpc/grpc_1.78.1.bb
> index 39c9fb98de..6739c659d3 100644
> --- a/meta-oe/recipes-devtools/grpc/grpc_1.76.0.bb
> +++ b/meta-oe/recipes-devtools/grpc/grpc_1.78.1.bb
> @@ -23,11 +23,10 @@ RDEPENDS:${PN}-dev:append:class-native =3D " ${PN}-co=
mpiler"
>  # Both dependencies are mutually exclusive
>  # RDEPENDS:${PN}-dev +=3D "${PN}-compiler"
>
> -SRCREV =3D "f5ffb68d8a2fd603dff16287e90a4ac571e1fec6"
> -BRANCH =3D "v1.76.x"
> +SRCREV =3D "5b6492ea90b2b867a6adad1b10a6edda28e860d1"
> +BRANCH =3D "v1.78.x"
>  SRC_URI =3D "gitsm://github.com/grpc/grpc.git;protocol=3Dhttps;branch=3D=
${BRANCH};tag=3Dv${PV} \
>             file://0001-cmake-Link-with-libatomic-on-rv32-rv64.patch \
> -           file://0001-build-add-missing-includes-41351.patch \
>             "
>
>  inherit cmake pkgconfig
> --
> 2.47.3
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#124976): https://lists.openembedded.org/g/openembedde=
d-devel/message/124976
> Mute This Topic: https://lists.openembedded.org/mt/118218621/3619737
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
nkur.tyagi85@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

