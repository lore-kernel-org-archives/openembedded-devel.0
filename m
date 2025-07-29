Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EE7AC87FC9
	for <webhook@archiver.kernel.org>; Tue, 29 Jul 2025 06:21:08 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
 by mx.groups.io with SMTP id smtpd.web10.1168.1753770058006116369
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Jul 2025 23:20:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iCwYmIWr;
 spf=pass (domain: gmail.com, ip: 209.85.128.178, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-712be7e034cso48415497b3.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 28 Jul 2025 23:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753770057; x=1754374857; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KF23qfzRqgoxaVWJYUmhvVB3iyhK2UDuE6ia+ENTz+M=;
        b=iCwYmIWroImgAMAiTOIxEtZPYfP9MQbfcKrOeNttuWW51TUB8GnBF2X0NhUMu1k3kL
         BQ+BCaw2mNz9P7evg0MOh0WZDVux4GxEPtMCkybtbYBi2m3tFpLXqrpaLoCNshoKLfJ9
         0oMe1KvFdWldCNv3MTY1bj7i80ecZsB4EcxTGRxhr2F4RgihKB8xiD4omRuTWbMiU/ig
         rE+5bYeylxKeorwvQpqsYia5wgB28h8REh76pX0lCh2CUCkKVxZPcJmpR6wwAkwMGFfF
         goSmhmQs2H/RPW/SFpOxbViiQKrh3NZxGoF5Uc1g/NA3W+T8hSI30uo+OMZCrMB1JV2o
         bzOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753770057; x=1754374857;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KF23qfzRqgoxaVWJYUmhvVB3iyhK2UDuE6ia+ENTz+M=;
        b=Xzp0HNIkSAX1TAUEUg9vCz0VXKjX41fXKYhlX3BamhyCejuFTLngQLtDkW5XOnMwej
         s7EqdUywu6VYUrFQhBuN4xxB7lfk6QAnikKljXitz+pWF8Kjt8vXCJmRkZgzt7uwWFgL
         9R9CfcREgaSkWjs5XxorWXh8BlRvlYOoH26PTjIPIBW+J9H51TI0YDSnOUYBLB3CIRKe
         2BcH5a7zbmK1ObmdnCLnVYyphzZVnovsSNJdhwR7xD23g6cduH2cPYlUMZTinVBp1NDb
         /2LZBz9XGS52WcO8cJ/Jfq+8bOX5uOner6YtTcfB1dMy8XoInlxa3+JxqlhmaStLiTH4
         9eAg==
X-Gm-Message-State: AOJu0YzWkwLoqSxZC4OMhy3ko93Hay0wK9mx2mwdLcDotg2Omir1KT7G
	q2aVPbJCdh9KdJszXRfSsNvIhUGqZp683Z2Ch9iIzZR3fqnHoKsqucSPsyo06rG/byhaz/t1fEg
	jvTVLXELWg1SMaBWyKB/N9txUlrHIEms=
X-Gm-Gg: ASbGncv1o9tiUfcZmucjGVfdwuoBWu3pjx0vhjpUGexl139USzWjN2eOlvwsPh4C6tZ
	ke7DwxOX3cj3UR7SEDf7Hiq4wUvWwcRxggiFau+hQH/2ziUVeruLl7f0c1S2alpKFjZiFjHtYKc
	q+MqQAgQZLjmB2o9VTAx3kehHH7vz1dA7lhEkePAZVAfilN1lwo4eQ7l2JdWRBqOBXkH5PjP62Y
	IwAuhiC1VfbOR+CppzKpg==
X-Google-Smtp-Source: AGHT+IEij32HneVARkLDYJHoIyLnl8tfcfrKTpWqZim6kR/S2Y1z4Z4E6Jn+eNkf8QRH4dZfQN+J3ETAun51OcCRYY4=
X-Received: by 2002:a05:690c:9a0b:b0:71a:3312:b918 with SMTP id
 00721157ae682-71a3312bb82mr33584137b3.33.1753770056822; Mon, 28 Jul 2025
 23:20:56 -0700 (PDT)
MIME-Version: 1.0
References: <20250729052222.106925-1-f_l_k@t-online.de>
In-Reply-To: <20250729052222.106925-1-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 28 Jul 2025 23:20:30 -0700
X-Gm-Features: Ac12FXz0_8j_xbxCEKo3-_RBLxr3BxeoT-ccPSr3XH5AiJXcUoJE4qvrNKGfo4I
Message-ID: <CAMKF1spt33vNWRiQrhMSY8Q1QqMYg7LE5J7Zb6-qUt7Hy6bfsQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] waylandpp: update 1.0.0 -> 1.0.1
To: f_l_k@t-online.de
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 29 Jul 2025 06:21:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118753

On Mon, Jul 28, 2025 at 10:22=E2=80=AFPM Markus Volk via
lists.openembedded.org <f_l_k=3Dt-online.de@lists.openembedded.org>
wrote:
>
> This maintenance release fixes missing cstdint includes, wrong quoting in=
 CMakeLists.txt, and adds cmake 4 support.
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  .../0001-include-missing-cstdint.patch        | 59 -------------------
>  ...426020932ebc481ae35c15f644af2f17e88a.patch | 23 --------
>  ...{waylandpp_1.0.0.bb =3D> waylandpp_1.0.1.bb} |  6 +-
>  3 files changed, 2 insertions(+), 86 deletions(-)
>  delete mode 100644 meta-oe/recipes-graphics/wayland/waylandpp/0001-inclu=
de-missing-cstdint.patch
>  delete mode 100644 meta-oe/recipes-graphics/wayland/waylandpp/4576426020=
932ebc481ae35c15f644af2f17e88a.patch
>  rename meta-oe/recipes-graphics/wayland/{waylandpp_1.0.0.bb =3D> wayland=
pp_1.0.1.bb} (88%)
>
> diff --git a/meta-oe/recipes-graphics/wayland/waylandpp/0001-include-miss=
ing-cstdint.patch b/meta-oe/recipes-graphics/wayland/waylandpp/0001-include=
-missing-cstdint.patch
> deleted file mode 100644
> index f2169c43c9..0000000000
> --- a/meta-oe/recipes-graphics/wayland/waylandpp/0001-include-missing-cst=
dint.patch
> +++ /dev/null
> @@ -1,59 +0,0 @@
> -From 5e3243b163aa5d50083b4036c21f84c1204f2023 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Thu, 26 Jan 2023 23:25:05 -0800
> -Subject: [PATCH] include missing <cstdint>
> -
> -gcc 13 moved some includes around and as a result <cstdint> is no longer=
 transitively included [1]. Explicitly include it for uint{32,64}_t.
> -
> -[1] https://gcc.gnu.org/gcc-13/porting_to.html#header-dep-changes
> -
> -Upstream-Status: Submitted [https://github.com/NilsBrause/waylandpp/pull=
/75]
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - include/wayland-client.hpp | 1 +
> - scanner/scanner.cpp        | 3 +++
> - 2 files changed, 4 insertions(+)
> -
> -diff --git a/include/wayland-client.hpp b/include/wayland-client.hpp
> -index a3f782b..4598a0e 100644
> ---- a/include/wayland-client.hpp
> -+++ b/include/wayland-client.hpp
> -@@ -29,6 +29,7 @@
> - /** \file */
> -
> - #include <atomic>
> -+#include <cstdint>
> - #include <functional>
> - #include <memory>
> - #include <string>
> -diff --git a/scanner/scanner.cpp b/scanner/scanner.cpp
> -index bebd71e..c25746a 100644
> ---- a/scanner/scanner.cpp
> -+++ b/scanner/scanner.cpp
> -@@ -15,6 +15,7 @@
> -  *  along with this program.  If not, see <http://www.gnu.org/licenses/=
>.
> -  */
> -
> -+#include <cstdint>
> - #include <fstream>
> - #include <iostream>
> - #include <list>
> -@@ -1106,6 +1107,7 @@ int main(int argc, char *argv[])
> -   wayland_hpp << "#pragma once" << std::endl
> -               << std::endl
> -               << "#include <array>" << std::endl
> -+              << "#include <cstdint>" << std::endl
> -               << "#include <functional>" << std::endl
> -               << "#include <memory>" << std::endl
> -               << "#include <string>" << std::endl
> -@@ -1125,6 +1127,7 @@ int main(int argc, char *argv[])
> -     wayland_server_hpp << "#pragma once" << std::endl
> -                        << std::endl
> -                        << "#include <array>" << std::endl
> -+                       << "#include <cstdint>" << std::endl
> -                        << "#include <functional>" << std::endl
> -                        << "#include <memory>" << std::endl
> -                        << "#include <string>" << std::endl
> ---
> -2.39.1
> -
> diff --git a/meta-oe/recipes-graphics/wayland/waylandpp/4576426020932ebc4=
81ae35c15f644af2f17e88a.patch b/meta-oe/recipes-graphics/wayland/waylandpp/=
4576426020932ebc481ae35c15f644af2f17e88a.patch
> deleted file mode 100644
> index 5011f05f3d..0000000000
> --- a/meta-oe/recipes-graphics/wayland/waylandpp/4576426020932ebc481ae35c=
15f644af2f17e88a.patch
> +++ /dev/null
> @@ -1,23 +0,0 @@
> -From 4576426020932ebc481ae35c15f644af2f17e88a Mon Sep 17 00:00:00 2001
> -From: Alexey Sokolov <alexey@asokolov.org>
> -Date: Sun, 4 May 2025 14:38:52 +0100
> -Subject: [PATCH] Fix build with cmake 4
> -
> -Upstream-Status: Backport
> ----
> - CMakeLists.txt | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/CMakeLists.txt b/CMakeLists.txt
> -index 866477b..8e9d2ad 100644
> ---- a/CMakeLists.txt
> -+++ b/CMakeLists.txt
> -@@ -21,7 +21,7 @@
> - # (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE=
 OF THIS
> - # SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
> -
> --cmake_minimum_required(VERSION 3.4)
> -+cmake_minimum_required(VERSION 3.4...4.0)
> - project(waylandpp VERSION 1.0.0 LANGUAGES CXX)
> -
> - # packages
> diff --git a/meta-oe/recipes-graphics/wayland/waylandpp_1.0.0.bb b/meta-o=
e/recipes-graphics/wayland/waylandpp_1.0.1.bb
> similarity index 88%
> rename from meta-oe/recipes-graphics/wayland/waylandpp_1.0.0.bb
> rename to meta-oe/recipes-graphics/wayland/waylandpp_1.0.1.bb
> index 0e53807cc7..7ea9f3ffec 100644
> --- a/meta-oe/recipes-graphics/wayland/waylandpp_1.0.0.bb
> +++ b/meta-oe/recipes-graphics/wayland/waylandpp_1.0.1.bb
> @@ -3,15 +3,13 @@ LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3aae28cc66d61975114c2b14df215=
407"
>
>  SRC_URI =3D " \
> -       git://github.com/NilsBrause/waylandpp.git;protocol=3Dhttps;branch=
=3Dmaster \
> -       file://0001-include-missing-cstdint.patch \
> -       file://4576426020932ebc481ae35c15f644af2f17e88a.patch \
> +       git://github.com/NilsBrause/waylandpp.git;protocol=3Dhttps;branch=
=3D1.0.x \

it would be good to add tag=3Dv${PV} to SRC_URI as well.
>  "
>
>  DEPENDS =3D "pugixml"
>  DEPENDS:append:class-target =3D " waylandpp-native wayland virtual/egl v=
irtual/libgles2"
>
> -SRCREV =3D "4321ed5c7b4bffa41b8a2a13dc7f3ece1191f4f3"
> +SRCREV =3D "4f208c416f37ea093e4a70a1407abd7d93c889f9"
>
>  inherit cmake pkgconfig features_check
>
> --
> 2.50.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#118752): https://lists.openembedded.org/g/openembedde=
d-devel/message/118752
> Mute This Topic: https://lists.openembedded.org/mt/114426963/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

