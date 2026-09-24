Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9F18C98304
	for <webhook@archiver.kernel.org>; Thu, 24 Sep 2026 05:10:46 +0000 (UTC)
Received: from newzmoby.atcorp.com (newzmoby.atcorp.com [50.173.197.71])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1882.1790212931430942484
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Sep 2026 18:22:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@atcorp.com header.s=1376564E-C82E-11ED-954F-3FCE35F171BA header.b=JZB6e2YZ;
 spf=pass (domain: atcorp.com, ip: 50.173.197.71, mailfrom: csiltala@atcorp.com)
Received: from localhost (localhost.localdomain [127.0.0.1])
	by newzmoby.atcorp.com (Postfix) with ESMTP id 5364C35A19FA;
	Wed, 23 Sep 2026 20:22:10 -0500 (CDT)
Received: from newzmoby.atcorp.com ([127.0.0.1])
 by localhost (newzmoby.atcorp.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id R6Ro2-kW4Hzd; Wed, 23 Sep 2026 20:22:10 -0500 (CDT)
Received: from localhost (localhost.localdomain [127.0.0.1])
	by newzmoby.atcorp.com (Postfix) with ESMTP id 3606E35A1AC4;
	Wed, 23 Sep 2026 20:22:10 -0500 (CDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 newzmoby.atcorp.com 3606E35A1AC4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=atcorp.com;
	s=1376564E-C82E-11ED-954F-3FCE35F171BA; t=1790212930;
	bh=QEE74SgBkls8Ex7i8t4isSOyV8v1JSAr7rO+zrZiFx8=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=JZB6e2YZfuexpIGJb7no26MqEtpLx/PGejpjxeUd11iN5VIfAjyJo1klvJrF+yYy5
	 g1pfJqe/JPuAWAMN0vyUGFcFvnTuMeM/Hh2GoFtyob66764ga1egyUZuUc+1iOHas9
	 OJRYE/5bxKxrmDWddt633E/l+0M4iF63x/4t6p4T8USjb4l4KaN0PrJd74uZydOmWW
	 FX8ksD75CilZaAzcK/P2RBcJ83+9X031Bo+qaSCMMxlHTuhr5Q9KtEH9JUeLau8xSb
	 xotm0R/c7EflHftGUvROfG1t+pa2ODOWSqfPrlyEpuY9beKRv1PEjrdO6NU5m+3DMA
	 HlBmj7INq7eYA==
Received: from newzmoby.atcorp.com ([127.0.0.1])
 by localhost (newzmoby.atcorp.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id 7dL29ef7kB14; Wed, 23 Sep 2026 20:22:10 -0500 (CDT)
Received: from [192.168.7.109] (unknown [50.173.197.66])
	by newzmoby.atcorp.com (Postfix) with ESMTPSA id EA0F135A19FA;
	Wed, 23 Sep 2026 20:22:09 -0500 (CDT)
Message-ID: <1f05eb15-9a5a-4da3-a57a-21b1c2032e26@atcorp.com>
Date: Wed, 23 Sep 2026 20:22:09 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-networking][PATCH] bmon: upgrade 4.0 -> 5.0
To: Khem Raj <raj.khem@gmail.com>
Cc: ticotimo@gmail.com, openembedded-devel@lists.openembedded.org
References: <20260923012442.3830864-1-csiltala@atcorp.com>
 <CANx9H-DpC+P=Dn+z7dfTpYzerZGbgjZnF-4SuywLt-SzHGtRbw@mail.gmail.com>
 <CAMKF1spqyYgSRYjhjf0bwZLp0mx=dnXxYrYxCsjeiMXTZLjQsg@mail.gmail.com>
 <39ad6438-9787-4696-81aa-b0df5b86f027@atcorp.com>
 <CAMKF1sr7VLnMrF35Vsc4WnWYNxTxTM=6OPWBcqaSiyfyodzwjA@mail.gmail.com>
From: "Corey J. Siltala" <csiltala@atcorp.com>
In-Reply-To: <CAMKF1sr7VLnMrF35Vsc4WnWYNxTxTM=6OPWBcqaSiyfyodzwjA@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------PFYmJrpdJfB3HM2cFpmAXWo7"
Content-Language: en-US
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Sep 2026 05:10:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130274

--------------PFYmJrpdJfB3HM2cFpmAXWo7
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

 From 2ae37918536db0431b0667fc4800a0b15b9e1a80 Mon Sep 17 00:00:00 2001
From: Corey Siltala <csiltala@atcorp.com>
Date: Tue, 22 Sep 2026 19:01:49 -0500
Subject: [PATCH] bmon: upgrade 4.0 -> 5.0

Note: ownership of bmon repo was transferred from Thomas Graf (tgraf)
 =C2=A0 =C2=A0 =C2=A0 to Jafar Al-Gharaibeh (Jafaral)

Fixes:
- out_curses: use xcalloc instead of a fixed buffer
- Avoid trying to include <values.h> on Android
- Fix typographical errors
- curses: Fix seperator lines
- Fix build in FreeBSD/DragonflyBSD
- fix segfault on element removal
- fix: Fix memory leaks in module_set()
- fix: Convert usage of strdup/free to xstrdup/xfree
- Fix compile issue in OpenBSD
- Fix spelling and grammar in docs and comments

Features:
- Allow numeric colors in bmonrc
- curses: Add CTRL-N/CTRL-P for next/previous element
- feat: Add IPv4/IPv6 addresses to additional info
- feat: Add configure option to disable IPv6 in netlink module
- feat: Add ability to toggle TC elements
- curses: render graphs with Braille cells
- display filters for TC ingress and egress
- Add support for JSON output
- Remove the 'Really quit' dialog and just exit cleanly

Misc:
- Update to autoconf of the common era

See full release notes at https://github.com/Jafaral/bmon/releases/tag/v5.0

Signed-off-by: Corey Siltala <csiltala@atcorp.com>
---
 =C2=A0meta-networking/recipes-support/bmon/bmon_4.0.bb | 11 -----------
 =C2=A0meta-networking/recipes-support/bmon/bmon_5.0.bb | 15 ++++++++++++++=
+
 =C2=A02 files changed, 15 insertions(+), 11 deletions(-)
 =C2=A0delete mode 100644 meta-networking/recipes-support/bmon/bmon_4.0.bb
 =C2=A0create mode 100644 meta-networking/recipes-support/bmon/bmon_5.0.bb

diff --git a/meta-networking/recipes-support/bmon/bmon_4.0.bb=20
b/meta-networking/recipes-support/bmon/bmon_4.0.bb
deleted file mode 100644
index f47069471a..0000000000
--- a/meta-networking/recipes-support/bmon/bmon_4.0.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-DESCRIPTION =3D "Portable Bandwidth Monitor and rate estimator"
-LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D=20
"file://${COMMON_LICENSE_DIR}/MIT;md5=3D0835ade698e0bcf8506ecda2f7b4f302"
-# only works with libnl-0.5.0
-DEPENDS =3D "libnl libconfuse ncurses"
-
-SRCREV =3D "1b3f11bde315e221474f7d066ce4efb4ff4d39e3"
-SRC_URI =3D "git://github.com/tgraf/bmon.git;branch=3Dmaster;protocol=3Dht=
tps"
-
-inherit autotools pkgconfig
-
diff --git a/meta-networking/recipes-support/bmon/bmon_5.0.bb=20
b/meta-networking/recipes-support/bmon/bmon_5.0.bb
new file mode 100644
index 0000000000..e1f875dca7
--- /dev/null
+++ b/meta-networking/recipes-support/bmon/bmon_5.0.bb
@@ -0,0 +1,15 @@
+SUMMARY =3D "Portable Bandwidth Monitor and rate estimator"
+HOMEPAGE =3D "https://github.com/Jafaral/bmon"
+SECTION =3D "net"
+
+LICENSE =3D "BSD-2-Clause AND MIT"
+LIC_FILES_CHKSUM =3D=20
"file://LICENSE.MIT;md5=3D544799d0b492f119fa04641d1b8868ed \
+ file://LICENSE.BSD;md5=3D5c262c13b60ebefe3060aed37d334ab6 \
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0"
+DEPENDS =3D "libconfuse libnl ncurses"
+
+SRC_URI =3D=20
"https://github.com/Jafaral/${BPN}/releases/download/v${PV}/${BP}.tar.gz"
+SRC_URI[sha256sum] =3D=20
"6016e41fdda9166b86b09a0ac601a0c453c3b35acdf904c97a8a555459ad73c0"
+
+inherit autotools pkgconfig
+
--=20
2.34.1


On 9/23/2026 12:55 PM, Khem Raj wrote:
>
>
> On Wed, Sep 23, 2026 at 5:26=E2=80=AFAM Corey J. Siltala <csiltala@atcorp=
.com>=20
> wrote:
>
>     Tim, Khem,
>
>     Thomas Graf (tgraf) no longer had time to maintain the project and
>     transferred ownership of the repo to Jafar Al-Gharaibeh (Jafaral).
>     I've added a note to the commit message, addressed the ${BP}
>     comment and some other lints here:
>
>     From ae973d210d65ce5f06c3502b8c311b5188228c65 Mon Sep 17 00:00:00 200=
1
>     From: Corey Siltala <csiltala@atcorp.com> <mailto:csiltala@atcorp.com=
>
>     Date: Tue, 22 Sep 2026 19:01:49 -0500
>     Subject: [PATCH] bmon: upgrade 4.0 -> 5.0
>
>     Note: ownership of bmon repo was transferred from Thomas Graf (tgraf)
>     =C2=A0 =C2=A0 =C2=A0 to Jafar Al-Gharaibeh (Jafaral)
>
>     Fixes:
>     - out_curses: use xcalloc instead of a fixed buffer
>     - Avoid trying to include <values.h> on Android
>     - Fix typographical errors
>     - curses: Fix seperator lines
>     - Fix build in FreeBSD/DragonflyBSD
>     - fix segfault on element removal
>     - fix: Fix memory leaks in module_set()
>     - fix: Convert usage of strdup/free to xstrdup/xfree
>     - Fix compile issue in OpenBSD
>     - Fix spelling and grammar in docs and comments
>
>     Features:
>     - Allow numeric colors in bmonrc
>     - curses: Add CTRL-N/CTRL-P for next/previous element
>     - feat: Add IPv4/IPv6 addresses to additional info
>     - feat: Add configure option to disable IPv6 in netlink module
>     - feat: Add ability to toggle TC elements
>     - curses: render graphs with Braille cells
>     - display filters for TC ingress and egress
>     - Add support for JSON output
>     - Remove the 'Really quit' dialog and just exit cleanly
>
>     Misc:
>     - Update to autoconf of the common era
>
>     See full release notes at
>     https://github.com/Jafaral/bmon/releases/tag/v5.0
>
>     Signed-off-by: Corey Siltala <csiltala@atcorp.com>
>     <mailto:csiltala@atcorp.com>
>     ---
>     =C2=A0meta-networking/recipes-support/bmon/bmon_4.0.bb
>     <http://bmon_4.0.bb> | 11 -----------
>     =C2=A0meta-networking/recipes-support/bmon/bmon_5.0.bb
>     <http://bmon_5.0.bb> | 15 +++++++++++++++
>     =C2=A02 files changed, 15 insertions(+), 11 deletions(-)
>     =C2=A0delete mode 100644
>     meta-networking/recipes-support/bmon/bmon_4.0.bb <http://bmon_4.0.bb>
>     =C2=A0create mode 100644
>     meta-networking/recipes-support/bmon/bmon_5.0.bb <http://bmon_5.0.bb>
>
>     diff --git a/meta-networking/recipes-support/bmon/bmon_4.0.bb
>     <http://bmon_4.0.bb>
>     b/meta-networking/recipes-support/bmon/bmon_4.0.bb
>     <http://bmon_4.0.bb>
>     deleted file mode 100644
>     index f47069471a..0000000000
>     --- a/meta-networking/recipes-support/bmon/bmon_4.0.bb
>     <http://bmon_4.0.bb>
>     +++ /dev/null
>     @@ -1,11 +0,0 @@
>     -DESCRIPTION =3D "Portable Bandwidth Monitor and rate estimator"
>     -LICENSE =3D "MIT"
>     -LIC_FILES_CHKSUM =3D
>     "file://${COMMON_LICENSE_DIR}/MIT;md5=3D0835ade698e0bcf8506ecda2f7b4f=
302"
>     -# only works with libnl-0.5.0
>     -DEPENDS =3D "libnl libconfuse ncurses"
>     -
>     -SRCREV =3D "1b3f11bde315e221474f7d066ce4efb4ff4d39e3"
>     -SRC_URI =3D
>     "git://github.com/tgraf/bmon.git;branch=3Dmaster;protocol=3Dhttps
>     <http://github.com/tgraf/bmon.git;branch=3Dmaster;protocol=3Dhttps>"
>     -
>     -inherit autotools pkgconfig
>     -
>     diff --git a/meta-networking/recipes-support/bmon/bmon_5.0.bb
>     <http://bmon_5.0.bb>
>     b/meta-networking/recipes-support/bmon/bmon_5.0.bb
>     <http://bmon_5.0.bb>
>     new file mode 100644
>     index 0000000000..07c680850b
>     --- /dev/null
>     +++ b/meta-networking/recipes-support/bmon/bmon_5.0.bb
>     <http://bmon_5.0.bb>
>     @@ -0,0 +1,15 @@
>     +SUMMARY =3D "Portable Bandwidth Monitor and rate estimator"
>     +HOMEPAGE =3D "https://github.com/Jafaral/bmon"
>     <https://github.com/Jafaral/bmon>
>     +SECTION =3D "net"
>     +
>     +LICENSE =3D "BSD-2-Clause & MIT"
>
>
> LICENSE is using old syntax and should be upgraded to: "BSD-2-Clause=20
> AND MIT"
>
>     +LIC_FILES_CHKSUM =3D
>     "file://LICENSE.MIT;md5=3D544799d0b492f119fa04641d1b8868ed \
>     + file://LICENSE.BSD;md5=3D5c262c13b60ebefe3060aed37d334ab6 \
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0"
>     +DEPENDS =3D "libconfuse libnl ncurses"
>     +
>     +SRC_URI =3D
>     "https://github.com/Jafaral/${BPN}/releases/download/v${PV}/${BP}.tar=
.gz"
>     <https://github.com/Jafaral/$%7BBPN%7D/releases/download/v$%7BPV%7D/$=
%7BBP%7D.tar.gz>
>     +SRC_URI[sha256sum] =3D
>     "6016e41fdda9166b86b09a0ac601a0c453c3b35acdf904c97a8a555459ad73c0"
>     +
>     +inherit autotools pkgconfig
>     +
>     --=20
>     2.34.1
>
>     Note also that the BSD-2-Clause license is not new, but was not
>     noted in the previous recipe.
>
>     Thanks,
>     Corey
>
>     On 9/22/2026 10:50 PM, Khem Raj wrote:
>>
>>
>>     On Tue, Sep 22, 2026 at 8:11=E2=80=AFPM Tim Orling via
>>     lists.openembedded.org <http://lists.openembedded.org>
>>     <ticotimo=3Dgmail.com@lists.openembedded.org> wrote:
>>
>>
>>
>>         On Tue, Sep 22, 2026 at 7:58=E2=80=AFPM Corey Siltala via
>>         lists.openembedded.org <http://lists.openembedded.org>
>>         <csiltala=3Datcorp.com@lists.openembedded.org> wrote:
>>
>>             Fixes:
>>             - out_curses: use xcalloc instead of a fixed buffer
>>             - Avoid trying to include <values.h> on Android
>>             - Fix typographical errors
>>             - curses: Fix seperator lines
>>             - Fix build in FreeBSD/DragonflyBSD
>>             - fix segfault on element removal
>>             - fix: Fix memory leaks in module_set()
>>             - fix: Convert usage of strdup/free to xstrdup/xfree
>>             - Fix compile issue in OpenBSD
>>             - Fix spelling and grammar in docs and comments
>>
>>             Features:
>>             - Allow numeric colors in bmonrc
>>             - curses: Add CTRL-N/CTRL-P for next/previous element
>>             - feat: Add IPv4/IPv6 addresses to additional info
>>             - feat: Add configure option to disable IPv6 in netlink
>>             module
>>             - feat: Add ability to toggle TC elements
>>             - curses: render graphs with Braille cells
>>             - display filters for TC ingress and egress
>>             - Add support for JSON output
>>             - Remove the 'Really quit' dialog and just exit cleanly
>>
>>             Misc:
>>             - Update to autoconf of the common era
>>
>>             See full release notes at
>>             https://github.com/Jafaral/bmon/releases/tag/v5.0
>>
>>
>>         It would nice to explain why the git repo changed. There is
>>         no mention anywhere that I can find.
>>
>>
>>             Signed-off-by: Corey Siltala <csiltala@atcorp.com>
>>             ---
>>             =C2=A0.../recipes-support/bmon/{bmon_4.0.bb
>>             <http://bmon_4.0.bb> =3D> bmon_5.0.bb <http://bmon_5.0.bb>}
>>             =C2=A0 =C2=A0 | 5 ++---
>>             =C2=A01 file changed, 2 insertions(+), 3 deletions(-)
>>             =C2=A0rename meta-networking/recipes-support/bmon/{bmon_4.0.=
bb
>>             <http://bmon_4.0.bb> =3D> bmon_5.0.bb <http://bmon_5.0.bb>}
>>             (56%)
>>
>>             diff --git
>>             a/meta-networking/recipes-support/bmon/bmon_4.0.bb
>>             <http://bmon_4.0.bb>
>>             b/meta-networking/recipes-support/bmon/bmon_5.0.bb
>>             <http://bmon_5.0.bb>
>>             similarity index 56%
>>             rename from
>>             meta-networking/recipes-support/bmon/bmon_4.0.bb
>>             <http://bmon_4.0.bb>
>>             rename to
>>             meta-networking/recipes-support/bmon/bmon_5.0.bb
>>             <http://bmon_5.0.bb>
>>             index f47069471a..0ceff05984 100644
>>             --- a/meta-networking/recipes-support/bmon/bmon_4.0.bb
>>             <http://bmon_4.0.bb>
>>             +++ b/meta-networking/recipes-support/bmon/bmon_5.0.bb
>>             <http://bmon_5.0.bb>
>>             @@ -1,11 +1,10 @@
>>             =C2=A0DESCRIPTION =3D "Portable Bandwidth Monitor and rate
>>             estimator"
>>             =C2=A0LICENSE =3D "MIT"
>>             =C2=A0LIC_FILES_CHKSUM =3D
>>             "file://${COMMON_LICENSE_DIR}/MIT;md5=3D0835ade698e0bcf8506e=
cda2f7b4f302"
>>             -# only works with libnl-0.5.0
>>             =C2=A0DEPENDS =3D "libnl libconfuse ncurses"
>>
>>             -SRCREV =3D "1b3f11bde315e221474f7d066ce4efb4ff4d39e3"
>>             -SRC_URI =3D
>>             "git://github.com/tgraf/bmon.git;branch=3Dmaster;protocol=3D=
https
>>             <http://github.com/tgraf/bmon.git;branch=3Dmaster;protocol=
=3Dhttps>"
>>             +SRC_URI =3D
>>             "https://github.com/Jafaral/${BPN}/releases/download/v${PV}/=
${BPN}-${PV}.tar.gz
>>             <https://github.com/Jafaral/$%7BBPN%7D/releases/download/v$%=
7BPV%7D/$%7BBPN%7D-$%7BPV%7D.tar.gz>"
>>
>>
>>     you can use BP here instead of BPN-PV which essentially is the
>>     same but concise.
>>
>>             +SRC_URI[sha256sum] =3D
>>             "6016e41fdda9166b86b09a0ac601a0c453c3b35acdf904c97a8a555459a=
d73c0"
>>
>>             =C2=A0inherit autotools pkgconfig
>>
>>             --=20
>>             2.34.1
>>
>>
>>
>>
>>
>>        =20
>>

--------------PFYmJrpdJfB3HM2cFpmAXWo7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-8=
">
  </head>
  <body>
    <p>From 2ae37918536db0431b0667fc4800a0b15b9e1a80 Mon Sep 17 00:00:00
      2001<br>
      From: Corey Siltala <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto=
:csiltala@atcorp.com">&lt;csiltala@atcorp.com&gt;</a><br>
      Date: Tue, 22 Sep 2026 19:01:49 -0500<br>
      Subject: [PATCH] bmon: upgrade 4.0 -&gt; 5.0<br>
      <br>
      Note: ownership of bmon repo was transferred from Thomas Graf
      (tgraf)<br>
      =C2=A0 =C2=A0 =C2=A0 to Jafar Al-Gharaibeh (Jafaral)<br>
      <br>
      Fixes:<br>
      - out_curses: use xcalloc instead of a fixed buffer<br>
      - Avoid trying to include &lt;values.h&gt; on Android<br>
      - Fix typographical errors<br>
      - curses: Fix seperator lines<br>
      - Fix build in FreeBSD/DragonflyBSD<br>
      - fix segfault on element removal<br>
      - fix: Fix memory leaks in module_set()<br>
      - fix: Convert usage of strdup/free to xstrdup/xfree<br>
      - Fix compile issue in OpenBSD<br>
      - Fix spelling and grammar in docs and comments<br>
      <br>
      Features:<br>
      - Allow numeric colors in bmonrc<br>
      - curses: Add CTRL-N/CTRL-P for next/previous element<br>
      - feat: Add IPv4/IPv6 addresses to additional info<br>
      - feat: Add configure option to disable IPv6 in netlink module<br>
      - feat: Add ability to toggle TC elements<br>
      - curses: render graphs with Braille cells<br>
      - display filters for TC ingress and egress<br>
      - Add support for JSON output<br>
      - Remove the 'Really quit' dialog and just exit cleanly<br>
      <br>
      Misc:<br>
      - Update to autoconf of the common era<br>
      <br>
      See full release notes at
      <a class=3D"moz-txt-link-freetext" href=3D"https://github.com/Jafaral=
/bmon/releases/tag/v5.0">https://github.com/Jafaral/bmon/releases/tag/v5.0<=
/a><br>
      <br>
      Signed-off-by: Corey Siltala <a class=3D"moz-txt-link-rfc2396E" href=
=3D"mailto:csiltala@atcorp.com">&lt;csiltala@atcorp.com&gt;</a><br>
      ---<br>
      =C2=A0meta-networking/recipes-support/bmon/bmon_4.0.bb | 11 ---------=
--<br>
      =C2=A0meta-networking/recipes-support/bmon/bmon_5.0.bb | 15
      +++++++++++++++<br>
      =C2=A02 files changed, 15 insertions(+), 11 deletions(-)<br>
      =C2=A0delete mode 100644
      meta-networking/recipes-support/bmon/bmon_4.0.bb<br>
      =C2=A0create mode 100644
      meta-networking/recipes-support/bmon/bmon_5.0.bb<br>
      <br>
      diff --git a/meta-networking/recipes-support/bmon/bmon_4.0.bb
      b/meta-networking/recipes-support/bmon/bmon_4.0.bb<br>
      deleted file mode 100644<br>
      index f47069471a..0000000000<br>
      --- a/meta-networking/recipes-support/bmon/bmon_4.0.bb<br>
      +++ /dev/null<br>
      @@ -1,11 +0,0 @@<br>
      -DESCRIPTION =3D "Portable Bandwidth Monitor and rate estimator"<br>
      -LICENSE =3D "MIT"<br>
      -LIC_FILES_CHKSUM =3D
      <a class=3D"moz-txt-link-rfc2396E" href=3D"file://${COMMON_LICENSE_DI=
R}/MIT;md5=3D0835ade698e0bcf8506ecda2f7b4f302">"file://${COMMON_LICENSE_DIR=
}/MIT;md5=3D0835ade698e0bcf8506ecda2f7b4f302"</a><br>
      -# only works with libnl-0.5.0<br>
      -DEPENDS =3D "libnl libconfuse ncurses"<br>
      -<br>
      -SRCREV =3D "1b3f11bde315e221474f7d066ce4efb4ff4d39e3"<br>
      -SRC_URI =3D
      "git://github.com/tgraf/bmon.git;branch=3Dmaster;protocol=3Dhttps"<br=
>
      -<br>
      -inherit autotools pkgconfig<br>
      -<br>
      diff --git a/meta-networking/recipes-support/bmon/bmon_5.0.bb
      b/meta-networking/recipes-support/bmon/bmon_5.0.bb<br>
      new file mode 100644<br>
      index 0000000000..e1f875dca7<br>
      --- /dev/null<br>
      +++ b/meta-networking/recipes-support/bmon/bmon_5.0.bb<br>
      @@ -0,0 +1,15 @@<br>
      +SUMMARY =3D "Portable Bandwidth Monitor and rate estimator"<br>
      +HOMEPAGE =3D <a class=3D"moz-txt-link-rfc2396E" href=3D"https://gith=
ub.com/Jafaral/bmon">"https://github.com/Jafaral/bmon"</a><br>
      +SECTION =3D "net"<br>
      +<br>
      +LICENSE =3D "BSD-2-Clause AND MIT"<br>
      +LIC_FILES_CHKSUM =3D
      "<a class=3D"moz-txt-link-freetext" href=3D"file://LICENSE.MIT;md5=3D=
544799d0b492f119fa04641d1b8868ed">file://LICENSE.MIT;md5=3D544799d0b492f119=
fa04641d1b8868ed</a> \<br>
      +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0
      <a class=3D"moz-txt-link-freetext" href=3D"file://LICENSE.BSD;md5=3D5=
c262c13b60ebefe3060aed37d334ab6">file://LICENSE.BSD;md5=3D5c262c13b60ebefe3=
060aed37d334ab6</a> \<br>
      +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0"<br>
      +DEPENDS =3D "libconfuse libnl ncurses"<br>
      +<br>
      +SRC_URI =3D
<a class=3D"moz-txt-link-rfc2396E" href=3D"https://github.com/Jafaral/${BPN=
}/releases/download/v${PV}/${BP}.tar.gz">"https://github.com/Jafaral/${BPN}=
/releases/download/v${PV}/${BP}.tar.gz"</a><br>
      +SRC_URI[sha256sum] =3D
      "6016e41fdda9166b86b09a0ac601a0c453c3b35acdf904c97a8a555459ad73c0"<br=
>
      +<br>
      +inherit autotools pkgconfig<br>
      +<br>
      --=C2=A0<br>
      2.34.1<br>
      <br>
      <br>
    </p>
    <div class=3D"moz-cite-prefix">On 9/23/2026 12:55 PM, Khem Raj wrote:<b=
r>
    </div>
    <blockquote type=3D"cite"
cite=3D"mid:CAMKF1sr7VLnMrF35Vsc4WnWYNxTxTM=3D6OPWBcqaSiyfyodzwjA@mail.gmai=
l.com">
      <meta http-equiv=3D"content-type" content=3D"text/html; charset=3DUTF=
-8">
      <div dir=3D"ltr">
        <div dir=3D"ltr"><br>
        </div>
        <br>
        <div class=3D"gmail_quote gmail_quote_container">
          <div dir=3D"ltr" class=3D"gmail_attr">On Wed, Sep 23, 2026 at
            5:26=E2=80=AFAM Corey J. Siltala &lt;<a
              href=3D"mailto:csiltala@atcorp.com" moz-do-not-send=3D"true"
              class=3D"moz-txt-link-freetext">csiltala@atcorp.com</a>&gt;
            wrote:<br>
          </div>
          <blockquote class=3D"gmail_quote"
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">
            <div>
              <p>Tim, Khem,</p>
              <p>Thomas Graf (tgraf) no longer had time to maintain the
                project and transferred ownership of the repo to Jafar
                Al-Gharaibeh (Jafaral). I've added a note to the commit
                message, addressed the ${BP} comment and some other
                lints here:</p>
              <p>From ae973d210d65ce5f06c3502b8c311b5188228c65 Mon Sep
                17 00:00:00 2001<br>
                From: Corey Siltala <a
                  href=3D"mailto:csiltala@atcorp.com" target=3D"_blank"
                  moz-do-not-send=3D"true">&lt;csiltala@atcorp.com&gt;</a><=
br>
                Date: Tue, 22 Sep 2026 19:01:49 -0500<br>
                Subject: [PATCH] bmon: upgrade 4.0 -&gt; 5.0<br>
                <br>
                Note: ownership of bmon repo was transferred from Thomas
                Graf (tgraf)<br>
                =C2=A0 =C2=A0 =C2=A0 to Jafar Al-Gharaibeh (Jafaral)<br>
                <br>
                Fixes:<br>
                - out_curses: use xcalloc instead of a fixed buffer<br>
                - Avoid trying to include &lt;values.h&gt; on Android<br>
                - Fix typographical errors<br>
                - curses: Fix seperator lines<br>
                - Fix build in FreeBSD/DragonflyBSD<br>
                - fix segfault on element removal<br>
                - fix: Fix memory leaks in module_set()<br>
                - fix: Convert usage of strdup/free to xstrdup/xfree<br>
                - Fix compile issue in OpenBSD<br>
                - Fix spelling and grammar in docs and comments<br>
                <br>
                Features:<br>
                - Allow numeric colors in bmonrc<br>
                - curses: Add CTRL-N/CTRL-P for next/previous element<br>
                - feat: Add IPv4/IPv6 addresses to additional info<br>
                - feat: Add configure option to disable IPv6 in netlink
                module<br>
                - feat: Add ability to toggle TC elements<br>
                - curses: render graphs with Braille cells<br>
                - display filters for TC ingress and egress<br>
                - Add support for JSON output<br>
                - Remove the 'Really quit' dialog and just exit cleanly<br>
                <br>
                Misc:<br>
                - Update to autoconf of the common era<br>
                <br>
                See full release notes at <a
href=3D"https://github.com/Jafaral/bmon/releases/tag/v5.0" target=3D"_blank=
"
                  moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">=
https://github.com/Jafaral/bmon/releases/tag/v5.0</a><br>
                <br>
                Signed-off-by: Corey Siltala <a
                  href=3D"mailto:csiltala@atcorp.com" target=3D"_blank"
                  moz-do-not-send=3D"true">&lt;csiltala@atcorp.com&gt;</a><=
br>
                ---<br>
                =C2=A0meta-networking/recipes-support/bmon/<a
                  href=3D"http://bmon_4.0.bb" target=3D"_blank"
                  moz-do-not-send=3D"true">bmon_4.0.bb</a> | 11
                -----------<br>
                =C2=A0meta-networking/recipes-support/bmon/<a
                  href=3D"http://bmon_5.0.bb" target=3D"_blank"
                  moz-do-not-send=3D"true">bmon_5.0.bb</a> | 15
                +++++++++++++++<br>
                =C2=A02 files changed, 15 insertions(+), 11 deletions(-)<br=
>
                =C2=A0delete mode 100644
                meta-networking/recipes-support/bmon/<a
                  href=3D"http://bmon_4.0.bb" target=3D"_blank"
                  moz-do-not-send=3D"true">bmon_4.0.bb</a><br>
                =C2=A0create mode 100644
                meta-networking/recipes-support/bmon/<a
                  href=3D"http://bmon_5.0.bb" target=3D"_blank"
                  moz-do-not-send=3D"true">bmon_5.0.bb</a><br>
                <br>
                diff --git a/meta-networking/recipes-support/bmon/<a
                  href=3D"http://bmon_4.0.bb" target=3D"_blank"
                  moz-do-not-send=3D"true">bmon_4.0.bb</a>
                b/meta-networking/recipes-support/bmon/<a
                  href=3D"http://bmon_4.0.bb" target=3D"_blank"
                  moz-do-not-send=3D"true">bmon_4.0.bb</a><br>
                deleted file mode 100644<br>
                index f47069471a..0000000000<br>
                --- a/meta-networking/recipes-support/bmon/<a
                  href=3D"http://bmon_4.0.bb" target=3D"_blank"
                  moz-do-not-send=3D"true">bmon_4.0.bb</a><br>
                +++ /dev/null<br>
                @@ -1,11 +0,0 @@<br>
                -DESCRIPTION =3D "Portable Bandwidth Monitor and rate
                estimator"<br>
                -LICENSE =3D "MIT"<br>
                -LIC_FILES_CHKSUM =3D <a moz-do-not-send=3D"true">"file://$=
{COMMON_LICENSE_DIR}/MIT;md5=3D0835ade698e0bcf8506ecda2f7b4f302"</a><br>
                -# only works with libnl-0.5.0<br>
                -DEPENDS =3D "libnl libconfuse ncurses"<br>
                -<br>
                -SRCREV =3D "1b3f11bde315e221474f7d066ce4efb4ff4d39e3"<br>
                -SRC_URI =3D "git://<a
href=3D"http://github.com/tgraf/bmon.git;branch=3Dmaster;protocol=3Dhttps"
                  target=3D"_blank" moz-do-not-send=3D"true">github.com/tgr=
af/bmon.git;branch=3Dmaster;protocol=3Dhttps</a>"<br>
                -<br>
                -inherit autotools pkgconfig<br>
                -<br>
                diff --git a/meta-networking/recipes-support/bmon/<a
                  href=3D"http://bmon_5.0.bb" target=3D"_blank"
                  moz-do-not-send=3D"true">bmon_5.0.bb</a>
                b/meta-networking/recipes-support/bmon/<a
                  href=3D"http://bmon_5.0.bb" target=3D"_blank"
                  moz-do-not-send=3D"true">bmon_5.0.bb</a><br>
                new file mode 100644<br>
                index 0000000000..07c680850b<br>
                --- /dev/null<br>
                +++ b/meta-networking/recipes-support/bmon/<a
                  href=3D"http://bmon_5.0.bb" target=3D"_blank"
                  moz-do-not-send=3D"true">bmon_5.0.bb</a><br>
                @@ -0,0 +1,15 @@<br>
                +SUMMARY =3D "Portable Bandwidth Monitor and rate
                estimator"<br>
                +HOMEPAGE =3D <a href=3D"https://github.com/Jafaral/bmon"
                  target=3D"_blank" moz-do-not-send=3D"true">"https://githu=
b.com/Jafaral/bmon"</a><br>
                +SECTION =3D "net"<br>
                +<br>
                +LICENSE =3D "BSD-2-Clause &amp; MIT"<br>
              </p>
            </div>
          </blockquote>
          <div><br>
          </div>
          <div>LICENSE is using old syntax and should be upgraded to:
            "BSD-2-Clause AND MIT"</div>
          <div>=C2=A0</div>
          <blockquote class=3D"gmail_quote"
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">
            <div>
              <p> +LIC_FILES_CHKSUM =3D "<a moz-do-not-send=3D"true">file:/=
/LICENSE.MIT;md5=3D544799d0b492f119fa04641d1b8868ed</a>
                \<br>
                +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 <a moz-do-not-send=3D"true">file://LICENSE.BSD;md5=3D5c262c13=
b60ebefe3060aed37d334ab6</a>
                \<br>
                +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0"<br>
                +DEPENDS =3D "libconfuse libnl ncurses"<br>
                +<br>
                +SRC_URI =3D
                <a
href=3D"https://github.com/Jafaral/$%7BBPN%7D/releases/download/v$%7BPV%7D/=
$%7BBP%7D.tar.gz"
                  target=3D"_blank" moz-do-not-send=3D"true">"https://githu=
b.com/Jafaral/${BPN}/releases/download/v${PV}/${BP}.tar.gz"</a><br>
                +SRC_URI[sha256sum] =3D
                "6016e41fdda9166b86b09a0ac601a0c453c3b35acdf904c97a8a555459=
ad73c0"<br>
                +<br>
                +inherit autotools pkgconfig<br>
                +<br>
                --=C2=A0<br>
                2.34.1<br>
                <br>
                Note also that the BSD-2-Clause license is not new, but
                was not noted in the previous recipe.</p>
              <p>Thanks,<br>
                Corey</p>
              <div>On 9/22/2026 10:50 PM, Khem Raj wrote:<br>
              </div>
              <blockquote type=3D"cite">
                <div dir=3D"ltr">
                  <div dir=3D"ltr"><br>
                  </div>
                  <br>
                  <div class=3D"gmail_quote">
                    <div dir=3D"ltr" class=3D"gmail_attr">On Tue, Sep 22,
                      2026 at 8:11=E2=80=AFPM Tim Orling via <a
                        href=3D"http://lists.openembedded.org"
                        target=3D"_blank" moz-do-not-send=3D"true">lists.op=
enembedded.org</a>
                      &lt;ticotimo=3D<a
                        href=3D"mailto:gmail.com@lists.openembedded.org"
                        target=3D"_blank" moz-do-not-send=3D"true"
                        class=3D"moz-txt-link-freetext">gmail.com@lists.ope=
nembedded.org</a>&gt;
                      wrote:<br>
                    </div>
                    <blockquote class=3D"gmail_quote"
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">
                      <div><br>
                      </div>
                      <div><br>
                        <div class=3D"gmail_quote">
                          <div dir=3D"ltr" class=3D"gmail_attr">On Tue, Sep
                            22, 2026 at 7:58=E2=80=AFPM Corey Siltala via <=
a
                              href=3D"http://lists.openembedded.org"
                              target=3D"_blank" moz-do-not-send=3D"true">li=
sts.openembedded.org</a>
                            &lt;csiltala=3D<a
href=3D"mailto:atcorp.com@lists.openembedded.org" target=3D"_blank"
                              moz-do-not-send=3D"true"
                              class=3D"moz-txt-link-freetext">atcorp.com@li=
sts.openembedded.org</a>&gt;
                            wrote:<br>
                          </div>
                          <blockquote class=3D"gmail_quote"
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">Fixes:<br>
                            - out_curses: use xcalloc instead of a fixed
                            buffer<br>
                            - Avoid trying to include &lt;values.h&gt;
                            on Android<br>
                            - Fix typographical errors<br>
                            - curses: Fix seperator lines<br>
                            - Fix build in FreeBSD/DragonflyBSD<br>
                            - fix segfault on element removal<br>
                            - fix: Fix memory leaks in module_set()<br>
                            - fix: Convert usage of strdup/free to
                            xstrdup/xfree<br>
                            - Fix compile issue in OpenBSD<br>
                            - Fix spelling and grammar in docs and
                            comments<br>
                            <br>
                            Features:<br>
                            - Allow numeric colors in bmonrc<br>
                            - curses: Add CTRL-N/CTRL-P for
                            next/previous element<br>
                            - feat: Add IPv4/IPv6 addresses to
                            additional info<br>
                            - feat: Add configure option to disable IPv6
                            in netlink module<br>
                            - feat: Add ability to toggle TC elements<br>
                            - curses: render graphs with Braille cells<br>
                            - display filters for TC ingress and egress<br>
                            - Add support for JSON output<br>
                            - Remove the 'Really quit' dialog and just
                            exit cleanly<br>
                            <br>
                            Misc:<br>
                            - Update to autoconf of the common era<br>
                            <br>
                            See full release notes at <a
href=3D"https://github.com/Jafaral/bmon/releases/tag/v5.0"
                              rel=3D"noreferrer" target=3D"_blank"
                              moz-do-not-send=3D"true"
                              class=3D"moz-txt-link-freetext">https://githu=
b.com/Jafaral/bmon/releases/tag/v5.0</a><br>
                          </blockquote>
                          <div dir=3D"auto"><br>
                          </div>
                          <div dir=3D"auto">It would nice to explain why
                            the git repo changed. There is no mention
                            anywhere that I can find.</div>
                          <blockquote class=3D"gmail_quote"
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex"><br>
                            Signed-off-by: Corey Siltala &lt;<a
                              href=3D"mailto:csiltala@atcorp.com"
                              target=3D"_blank" moz-do-not-send=3D"true"
                              class=3D"moz-txt-link-freetext">csiltala@atco=
rp.com</a>&gt;<br>
                            ---<br>
                            =C2=A0.../recipes-support/bmon/{<a
                              href=3D"http://bmon_4.0.bb" rel=3D"noreferrer=
"
                              target=3D"_blank" moz-do-not-send=3D"true">bm=
on_4.0.bb</a>
                            =3D&gt; <a href=3D"http://bmon_5.0.bb"
                              rel=3D"noreferrer" target=3D"_blank"
                              moz-do-not-send=3D"true">bmon_5.0.bb</a>}=C2=
=A0 =C2=A0
                            =C2=A0 =C2=A0 | 5 ++---<br>
                            =C2=A01 file changed, 2 insertions(+), 3
                            deletions(-)<br>
                            =C2=A0rename
                            meta-networking/recipes-support/bmon/{<a
                              href=3D"http://bmon_4.0.bb" rel=3D"noreferrer=
"
                              target=3D"_blank" moz-do-not-send=3D"true">bm=
on_4.0.bb</a>
                            =3D&gt; <a href=3D"http://bmon_5.0.bb"
                              rel=3D"noreferrer" target=3D"_blank"
                              moz-do-not-send=3D"true">bmon_5.0.bb</a>}
                            (56%)<br>
                            <br>
                            diff --git
                            a/meta-networking/recipes-support/bmon/<a
                              href=3D"http://bmon_4.0.bb" rel=3D"noreferrer=
"
                              target=3D"_blank" moz-do-not-send=3D"true">bm=
on_4.0.bb</a>
                            b/meta-networking/recipes-support/bmon/<a
                              href=3D"http://bmon_5.0.bb" rel=3D"noreferrer=
"
                              target=3D"_blank" moz-do-not-send=3D"true">bm=
on_5.0.bb</a><br>
                            similarity index 56%<br>
                            rename from
                            meta-networking/recipes-support/bmon/<a
                              href=3D"http://bmon_4.0.bb" rel=3D"noreferrer=
"
                              target=3D"_blank" moz-do-not-send=3D"true">bm=
on_4.0.bb</a><br>
                            rename to
                            meta-networking/recipes-support/bmon/<a
                              href=3D"http://bmon_5.0.bb" rel=3D"noreferrer=
"
                              target=3D"_blank" moz-do-not-send=3D"true">bm=
on_5.0.bb</a><br>
                            index f47069471a..0ceff05984 100644<br>
                            --- a/meta-networking/recipes-support/bmon/<a
                              href=3D"http://bmon_4.0.bb" rel=3D"noreferrer=
"
                              target=3D"_blank" moz-do-not-send=3D"true">bm=
on_4.0.bb</a><br>
                            +++ b/meta-networking/recipes-support/bmon/<a
                              href=3D"http://bmon_5.0.bb" rel=3D"noreferrer=
"
                              target=3D"_blank" moz-do-not-send=3D"true">bm=
on_5.0.bb</a><br>
                            @@ -1,11 +1,10 @@<br>
                            =C2=A0DESCRIPTION =3D "Portable Bandwidth Monit=
or
                            and rate estimator"<br>
                            =C2=A0LICENSE =3D "MIT"<br>
                            =C2=A0LIC_FILES_CHKSUM =3D <a
                              moz-do-not-send=3D"true">"file://${COMMON_LIC=
ENSE_DIR}/MIT;md5=3D0835ade698e0bcf8506ecda2f7b4f302"</a><br>
                            -# only works with libnl-0.5.0<br>
                            =C2=A0DEPENDS =3D "libnl libconfuse ncurses"<br=
>
                            <br>
                            -SRCREV =3D
                            "1b3f11bde315e221474f7d066ce4efb4ff4d39e3"<br>
                            -SRC_URI =3D "git://<a
href=3D"http://github.com/tgraf/bmon.git;branch=3Dmaster;protocol=3Dhttps"
                              rel=3D"noreferrer" target=3D"_blank"
                              moz-do-not-send=3D"true">github.com/tgraf/bmo=
n.git;branch=3Dmaster;protocol=3Dhttps</a>"<br>
                            +SRC_URI =3D "<a
href=3D"https://github.com/Jafaral/$%7BBPN%7D/releases/download/v$%7BPV%7D/=
$%7BBPN%7D-$%7BPV%7D.tar.gz"
                              rel=3D"noreferrer" target=3D"_blank"
                              moz-do-not-send=3D"true">https://github.com/J=
afaral/${BPN}/releases/download/v${PV}/${BPN}-${PV}.tar.gz</a>"<br>
                          </blockquote>
                        </div>
                      </div>
                    </blockquote>
                    <div><br>
                    </div>
                    <div>you can use BP here instead of BPN-PV which
                      essentially is the same but concise.</div>
                    <div>=C2=A0</div>
                    <blockquote class=3D"gmail_quote"
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">
                      <div>
                        <div class=3D"gmail_quote">
                          <blockquote class=3D"gmail_quote"
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">
                            +SRC_URI[sha256sum] =3D
                            "6016e41fdda9166b86b09a0ac601a0c453c3b35acdf904=
c97a8a555459ad73c0"<br>
                            <br>
                            =C2=A0inherit autotools pkgconfig<br>
                            <br>
                            -- <br>
                            2.34.1<br>
                            <br>
                            <br>
                            <br>
                            <br>
                          </blockquote>
                        </div>
                      </div>
                      <br>
                      </blockquote>
                  </div>
                </div>
              </blockquote>
            </div>
          </blockquote>
        </div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------PFYmJrpdJfB3HM2cFpmAXWo7--

