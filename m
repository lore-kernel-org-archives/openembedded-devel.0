Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C7CAD767F1
	for <webhook@archiver.kernel.org>; Thu, 31 Oct 2024 17:23:39 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web11.18136.1730395410633140163
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 31 Oct 2024 10:23:31 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd76.aul.t-online.de (fwd76.aul.t-online.de [10.223.144.102])
	by mailout05.t-online.de (Postfix) with SMTP id 7D59A346;
	Thu, 31 Oct 2024 18:23:28 +0100 (CET)
Received: from [192.168.178.67] ([84.163.35.203]) by fwd76.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1t6YtL-0Y48em0; Thu, 31 Oct 2024 18:23:27 +0100
Date: Thu, 31 Oct 2024 18:25:38 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-oe][PATCH v3] snapper: add recipe
To: Martin Jansa <martin.jansa@gmail.com>
Cc: raj.khem@gmail.com, openembedded-devel@lists.openembedded.org, Khem Raj
	<raj.khem@gmail.com>
Message-Id: <QQD8MS.V8W1IWD2ZRJ81@t-online.de>
In-Reply-To: <CA+chaQcWf6gCEJbQX16zR=B3PUmaR78WCVorvrP4JvQsJAPDPw@mail.gmail.com>
References: <20241020150843.1068181-1-raj.khem@gmail.com>
	<CA+chaQcWf6gCEJbQX16zR=B3PUmaR78WCVorvrP4JvQsJAPDPw@mail.gmail.com>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-1vPCrjVl/ZES6O1mRKs+"
X-TOI-EXPURGATEID: 150726::1730395407-4DFF95E0-2637D2D0/0/0 CLEAN NORMAL
X-TOI-MSGID: 694ed258-d851-4d42-9223-60ed54dba267
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 31 Oct 2024 17:23:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113374

--=-1vPCrjVl/ZES6O1mRKs+
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi Martin,

I think it might help to replace ${libdir}/systemd with=20
${systemd_system_unitdir} in FILES:${PN}

On Thu, Oct 24 2024 at 12:47:46 PM +02:00:00, Martin Jansa=20
<martin.jansa@gmail.com> wrote:
> Hi Markus,
>=20
> this fails with installed-vs-shipped when libdir isn't /usr/lib:
>=20
> ERROR: lib32-snapper-0.11.2-r0 do_package: QA Issue: lib32-snapper:
> Files/directories were installed but not shipped in any package:
>   /usr/lib/systemd
>   /usr/lib/systemd/system
>   /usr/lib/systemd/system/snapper-timeline.timer
>   /usr/lib/systemd/system/snapper-timeline.service
>   /usr/lib/systemd/system/snapper-boot.timer
>   /usr/lib/systemd/system/snapper-cleanup.timer
>   /usr/lib/systemd/system/snapperd.service
>   /usr/lib/systemd/system/snapper-boot.service
>   /usr/lib/systemd/system/snapper-cleanup.service
>   /usr/lib/snapper/systemd-helper
>   /usr/lib/snapper/installation-helper
>   /usr/lib/snapper/plugins
> Please set FILES such that these items are packaged. Alternatively if
> they are unneeded, avoid installing them or delete them within
> do_install.
> lib32-snapper: 12 installed and not shipped files.=20
> [installed-vs-shipped]
>=20
> I've started to modify
> <https://github.com/openSUSE/snapper/blob/master/data/Makefile.am> to
> respect configured libdir (and datadir and systemd paths), but it's
> not that simple as /usr/lib is also hardcoded for the plugins:
> snapper/Hooks.cc:#define GRUB_SCRIPT "/usr/lib/snapper/plugins/grub"
> snapper/Hooks.cc:#define ROLLBACK_SCRIPT=20
> "/usr/lib/snapper/plugins/rollback"
> snapper/PluginsImpl.cc:#define GRUB_SCRIPT=20
> "/usr/lib/snapper/plugins/grub"
> snapper/PluginsImpl.cc:#define ROLLBACK_SCRIPT
> "/usr/lib/snapper/plugins/rollback"
> snapper/SnapperDefines.h:#define PLUGINS_DIR=20
> "/usr/lib/snapper/plugins"
>=20
> should the packaging be changed to use nonarch_libdir and let
> lib32-snapper and snapper conflict with each other? Or is there some
> better way to resolve this?
>=20
> I'm not planning to use snapper, this was just new failure detected in
> my world builds.
>=20
> Regards,
>=20
> On Sun, Oct 20, 2024 at 5:08=E2=80=AFPM Khem Raj via lists.openembedded.o=
rg
> <raj.khem=3Dgmail.com@lists.openembedded.org=20
> <mailto:raj.khem=3Dgmail.com@lists.openembedded.org>> wrote:
>>=20
>>  From: Markus Volk <f_l_k@t-online.de <mailto:f_l_k@t-online.de>>
>>=20
>>  Snapper is a tool for Linux file system snapshot management. Apart=20
>> from
>>  the obvious creation and deletion of snapshots it can compare=20
>> snapshots
>>  and revert differences between them. In simple terms, this allows=20
>> root
>>  and non-root users to view older versions of files and revert=20
>> changes.
>>=20
>>  Signed-off-by: Markus Volk <f_l_k@t-online.de=20
>> <mailto:f_l_k@t-online.de>>
>>  Signed-off-by: Khem Raj <raj.khem@gmail.com=20
>> <mailto:raj.khem@gmail.com>>
>>  ---
>>  v3: More fixes for musl
>>=20
>>   ...x-types.h-for-__u16-__u32-__u64-type.patch | 30 ++++++++++++++
>>   ...002-Use-statvfs-instead-of-statvfs64.patch | 37=20
>> +++++++++++++++++
>>   .../recipes-support/snapper/snapper_0.11.2.bb | 41=20
>> +++++++++++++++++++
>>   3 files changed, 108 insertions(+)
>>   create mode 100644=20
>> meta-oe/recipes-support/snapper/snapper/0001-Include-linux-types.h-for-_=
_u16-__u32-__u64-type.patch
>>   create mode 100644=20
>> meta-oe/recipes-support/snapper/snapper/0002-Use-statvfs-instead-of-stat=
vfs64.patch
>>   create mode 100644=20
>> meta-oe/recipes-support/snapper/snapper_0.11.2.bb
>>=20
>>  diff --git=20
>> a/meta-oe/recipes-support/snapper/snapper/0001-Include-linux-types.h-for=
-__u16-__u32-__u64-type.patch=20
>> b/meta-oe/recipes-support/snapper/snapper/0001-Include-linux-types.h-for=
-__u16-__u32-__u64-type.patch
>>  new file mode 100644
>>  index 0000000000..ec8594629e
>>  --- /dev/null
>>  +++=20
>> b/meta-oe/recipes-support/snapper/snapper/0001-Include-linux-types.h-for=
-__u16-__u32-__u64-type.patch
>>  @@ -0,0 +1,30 @@
>>  +From d103eaeae169708ca567f092182a89b79e5ab9db Mon Sep 17 00:00:00=20
>> 2001
>>  +From: Khem Raj <raj.khem@gmail.com <mailto:raj.khem@gmail.com>>
>>  +Date: Sun, 20 Oct 2024 07:52:33 -0700
>>  +Subject: [PATCH 1/2] Include linux/types.h for __u16/__u32/__u64=20
>> type
>>  +
>>  +This header is included indirectly with glibc but when using musl
>>  +it ends up with compilation failure
>>  +
>>  +BcachefsUtils.cc:85:20: error: use of undeclared identifier '__u32'
>>  +   85 |             args.dirfd =3D (__u32) fddst;
>>  +      |                           ^
>>  +
>>  +Upstream-Status: Submitted=20
>> [<https://github.com/openSUSE/snapper/pull/945>]
>>  +Signed-off-by: Khem Raj <raj.khem@gmail.com=20
>> <mailto:raj.khem@gmail.com>>
>>  +---
>>  + snapper/BcachefsUtils.cc | 1 +
>>  + 1 file changed, 1 insertion(+)
>>  +
>>  +diff --git a/snapper/BcachefsUtils.cc b/snapper/BcachefsUtils.cc
>>  +index e9163ffb..1d328a78 100644
>>  +--- a/snapper/BcachefsUtils.cc
>>  ++++ b/snapper/BcachefsUtils.cc
>>  +@@ -24,6 +24,7 @@
>>  +
>>  + #include <cstring>
>>  + #include <cerrno>
>>  ++#include <linux/types.h>
>>  + #include <sys/stat.h>
>>  + #include <sys/ioctl.h>
>>  +
>>  diff --git=20
>> a/meta-oe/recipes-support/snapper/snapper/0002-Use-statvfs-instead-of-st=
atvfs64.patch=20
>> b/meta-oe/recipes-support/snapper/snapper/0002-Use-statvfs-instead-of-st=
atvfs64.patch
>>  new file mode 100644
>>  index 0000000000..b915fda257
>>  --- /dev/null
>>  +++=20
>> b/meta-oe/recipes-support/snapper/snapper/0002-Use-statvfs-instead-of-st=
atvfs64.patch
>>  @@ -0,0 +1,37 @@
>>  +From 0b39f4484553c796cb300fb4933ea314e91d913b Mon Sep 17 00:00:00=20
>> 2001
>>  +From: Khem Raj <raj.khem@gmail.com <mailto:raj.khem@gmail.com>>
>>  +Date: Sun, 20 Oct 2024 07:55:23 -0700
>>  +Subject: [PATCH 2/2] Use statvfs instead of statvfs64
>>  +
>>  +when using LFS64 these functions are same and also
>>  +on 64bit systems they are same. musl is using 64bit off_t
>>  +by default and does not define LFS64 variants of these functions
>>  +and it ends up in build errors
>>  +
>>  +Taken from Alpine Linux:=20
>> [<https://gitlab.alpinelinux.org/alpine/aports/-/blob/master/testing/sna=
pper/statvfs64.patch>]
>>  +
>>  +Upstream-Status: Submitted=20
>> [<https://github.com/openSUSE/snapper/pull/945>]
>>  +
>>  +Signed-off-by: Markus Volk <f_l_k@t-online.de=20
>> <mailto:f_l_k@t-online.de>>
>>  +Signed-off-by: Khem Raj <raj.khem@gmail.com=20
>> <mailto:raj.khem@gmail.com>>
>>  +---
>>  + snapper/FileUtils.cc | 6 +++---
>>  + 1 file changed, 3 insertions(+), 3 deletions(-)
>>  +
>>  +diff --git a/snapper/FileUtils.cc b/snapper/FileUtils.cc
>>  +index d4034279..4c8578a1 100644
>>  +--- a/snapper/FileUtils.cc
>>  ++++ b/snapper/FileUtils.cc
>>  +@@ -387,9 +387,9 @@ namespace snapper
>>  +     std::pair<unsigned long long, unsigned long long>
>>  +     SDir::statvfs() const
>>  +     {
>>  +-      struct statvfs64 fsbuf;
>>  +-      if (fstatvfs64(dirfd, &fsbuf) !=3D 0)
>>  +-          SN_THROW(IOErrorException(sformat("statvfs64 failed=20
>> path:%s errno:%d (%s)", base_path.c_str(),
>>  ++      struct statvfs fsbuf;
>>  ++      if (fstatvfs(dirfd, &fsbuf) !=3D 0)
>>  ++          SN_THROW(IOErrorException(sformat("statvfs failed=20
>> path:%s errno:%d (%s)", base_path.c_str(),
>>  +                                             errno,=20
>> stringerror(errno).c_str())));
>>  +
>>  +       // f_bavail is used (not f_bfree) since df seems to do the
>>  diff --git a/meta-oe/recipes-support/snapper/snapper_0.11.2.bb=20
>> b/meta-oe/recipes-support/snapper/snapper_0.11.2.bb
>>  new file mode 100644
>>  index 0000000000..840c607309
>>  --- /dev/null
>>  +++ b/meta-oe/recipes-support/snapper/snapper_0.11.2.bb
>>  @@ -0,0 +1,41 @@
>>  +SUMMARY =3D "Snapper is a tool for Linux file system snapshot=20
>> management"
>>  +HOMEPAGE =3D "<https://github.com/openSUSE/snapper>"
>>  +LICENSE =3D "GPL-2.0-only"
>>  +LIC_FILES_CHKSUM =3D=20
>> "file://COPYING;md5=3D751419260aa954499f7abaabaa882bbe"=20
>> <file://copying;md5=3D751419260aa954499f7abaabaa882bbe/>
>>  +
>>  +DEPENDS =3D "acl boost btrfs-tools dbus e2fsprogs json-c libxml2=20
>> lvm2 ncurses zlib"
>>  +
>>  +# Build separation is slightly broken
>>  +inherit autotools-brokensep pkgconfig gettext
>>  +
>>  +SRC_URI =3D " \
>>  +   =20
>> git://github.com/openSUSE/snapper.git;protocol=3Dhttps;branch=3Dmaster \
>>  +   =20
>> file://0001-Include-linux-types.h-for-__u16-__u32-__u64-type.patch=20
>> <file://0001-include-linux-types.h-for-__u16-__u32-__u64-type.patch/>=20
>> \
>>  +    file://0002-Use-statvfs-instead-of-statvfs64.patch=20
>> <file://0002-use-statvfs-instead-of-statvfs64.patch/> \
>>  +"
>>  +SRCREV =3D "6c603565f36e9996d85045c8012cd04aba5f3708"
>>  +
>>  +S =3D "${WORKDIR}/git"
>>  +
>>  +EXTRA_OECONF +=3D "--disable-zypp"
>>  +
>>  +PACKAGECONFIG ?=3D "${@bb.utils.filter=20
>> <mailto:${@bb.utils.filter>('DISTRO_FEATURES', 'api-documentation=20
>> systemd pam', d)}"
>>  +PACKAGECONFIG[pam] =3D "--enable-pam,--disable-pam,libpam"
>>  +PACKAGECONFIG[systemd] =3D "--enable-systemd,--disable-systemd"
>>  +PACKAGECONFIG[api-documentation] =3D=20
>> "--enable-doc,--disable-doc,libxslt-native=20
>> docbook-xsl-stylesheets-native"
>>  +
>>  +# Avoid HOSTTOOLS path in binaries
>>  +export DIFFBIN =3D "${bindir}/diff"
>>  +export RMBIN =3D "${bindir}/rm"
>>  +export TOUCHBIN =3D "${bindir}/touch"
>>  +export CPBIN =3D "${bindir}/cp"
>>  +
>>  +
>>  +do_install:append() {
>>  +       install -d ${D}${sysconfdir}/sysconfig
>>  +       install -m0644 ${S}/data/default-config=20
>> ${D}${sysconfdir}/sysconfig/snapper
>>  +}
>>  +
>>  +FILES:${PN} +=3D "${libdir}/pam_snapper ${libdir}/systemd=20
>> ${libdir}/security ${datadir}"
>>  +# bash is needed for the testsuite
>>  +RDEPENDS:${PN} =3D "bash diffutils util-linux util-linux-mount"
>>=20
>>  -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>  Links: You receive all messages sent to this group.
>>  View/Reply Online (#113067):=20
>> <https://lists.openembedded.org/g/openembedded-devel/message/113067>
>>  Mute This Topic:=20
>> <https://lists.openembedded.org/mt/109116183/3617156>
>>  Group Owner: openembedded-devel+owner@lists.openembedded.org=20
>> <mailto:openembedded-devel+owner@lists.openembedded.org>
>>  Unsubscribe:=20
>> <https://lists.openembedded.org/g/openembedded-devel/unsub>=20
>> [martin.jansa@gmail.com <mailto:martin.jansa@gmail.com>]
>>  -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>=20


--=-1vPCrjVl/ZES6O1mRKs+
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto"><div>Hi Martin,</div><div><br></div><di=
v>I think it might help to replace ${libdir}/systemd with ${systemd_system_=
unitdir} in FILES:${PN}</div></div><div id=3D"geary-quote" dir=3D"auto"><br=
>On Thu, Oct 24 2024 at 12:47:46 PM +02:00:00, Martin Jansa &lt;martin.jans=
a@gmail.com&gt; wrote:<br><blockquote type=3D"cite"><div class=3D"plaintext=
" style=3D"white-space: break-spaces;">Hi Markus,

this fails with installed-vs-shipped when libdir isn't /usr/lib:

ERROR: lib32-snapper-0.11.2-r0 do_package: QA Issue: lib32-snapper:
Files/directories were installed but not shipped in any package:
  /usr/lib/systemd
  /usr/lib/systemd/system
  /usr/lib/systemd/system/snapper-timeline.timer
  /usr/lib/systemd/system/snapper-timeline.service
  /usr/lib/systemd/system/snapper-boot.timer
  /usr/lib/systemd/system/snapper-cleanup.timer
  /usr/lib/systemd/system/snapperd.service
  /usr/lib/systemd/system/snapper-boot.service
  /usr/lib/systemd/system/snapper-cleanup.service
  /usr/lib/snapper/systemd-helper
  /usr/lib/snapper/installation-helper
  /usr/lib/snapper/plugins
Please set FILES such that these items are packaged. Alternatively if
they are unneeded, avoid installing them or delete them within
do_install.
lib32-snapper: 12 installed and not shipped files. [installed-vs-shipped]

I've started to modify
<a href=3D"https://github.com/openSUSE/snapper/blob/master/data/Makefile.am=
">https://github.com/openSUSE/snapper/blob/master/data/Makefile.am</a> to
respect configured libdir (and datadir and systemd paths), but it's
not that simple as /usr/lib is also hardcoded for the plugins:
snapper/Hooks.cc:#define GRUB_SCRIPT "/usr/lib/snapper/plugins/grub"
snapper/Hooks.cc:#define ROLLBACK_SCRIPT "/usr/lib/snapper/plugins/rollback=
"
snapper/PluginsImpl.cc:#define GRUB_SCRIPT "/usr/lib/snapper/plugins/grub"
snapper/PluginsImpl.cc:#define ROLLBACK_SCRIPT
"/usr/lib/snapper/plugins/rollback"
snapper/SnapperDefines.h:#define PLUGINS_DIR "/usr/lib/snapper/plugins"

should the packaging be changed to use nonarch_libdir and let
lib32-snapper and snapper conflict with each other? Or is there some
better way to resolve this?

I'm not planning to use snapper, this was just new failure detected in
my world builds.

Regards,

On Sun, Oct 20, 2024 at 5:08=E2=80=AFPM Khem Raj via lists.openembedded.org
&lt;<a href=3D"mailto:raj.khem=3Dgmail.com@lists.openembedded.org">raj.khem=
=3Dgmail.com@lists.openembedded.org</a>&gt; wrote:
<blockquote>
 From: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de">f_l_k@t-online.=
de</a>&gt;

 Snapper is a tool for Linux file system snapshot management. Apart from
 the obvious creation and deletion of snapshots it can compare snapshots
 and revert differences between them. In simple terms, this allows root
 and non-root users to view older versions of files and revert changes.

 Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de">f_l_k@=
t-online.de</a>&gt;
 Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem=
@gmail.com</a>&gt;
 ---
 v3: More fixes for musl

  ...x-types.h-for-__u16-__u32-__u64-type.patch | 30 ++++++++++++++
  ...002-Use-statvfs-instead-of-statvfs64.patch | 37 +++++++++++++++++
  .../recipes-support/snapper/snapper_0.11.2.bb | 41 +++++++++++++++++++
  3 files changed, 108 insertions(+)
  create mode 100644 meta-oe/recipes-support/snapper/snapper/0001-Include-l=
inux-types.h-for-__u16-__u32-__u64-type.patch
  create mode 100644 meta-oe/recipes-support/snapper/snapper/0002-Use-statv=
fs-instead-of-statvfs64.patch
  create mode 100644 meta-oe/recipes-support/snapper/snapper_0.11.2.bb

 diff --git a/meta-oe/recipes-support/snapper/snapper/0001-Include-linux-ty=
pes.h-for-__u16-__u32-__u64-type.patch b/meta-oe/recipes-support/snapper/sn=
apper/0001-Include-linux-types.h-for-__u16-__u32-__u64-type.patch
 new file mode 100644
 index 0000000000..ec8594629e
 --- /dev/null
 +++ b/meta-oe/recipes-support/snapper/snapper/0001-Include-linux-types.h-f=
or-__u16-__u32-__u64-type.patch
 @@ -0,0 +1,30 @@
 +From d103eaeae169708ca567f092182a89b79e5ab9db Mon Sep 17 00:00:00 2001
 +From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.c=
om</a>&gt;
 +Date: Sun, 20 Oct 2024 07:52:33 -0700
 +Subject: [PATCH 1/2] Include linux/types.h for __u16/__u32/__u64 type
 +
 +This header is included indirectly with glibc but when using musl
 +it ends up with compilation failure
 +
 +BcachefsUtils.cc:85:20: error: use of undeclared identifier '__u32'
 +   85 |             args.dirfd =3D (__u32) fddst;
 +      |                           ^
 +
 +Upstream-Status: Submitted [<a href=3D"https://github.com/openSUSE/snappe=
r/pull/945">https://github.com/openSUSE/snapper/pull/945</a>]
 +Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khe=
m@gmail.com</a>&gt;
 +---
 + snapper/BcachefsUtils.cc | 1 +
 + 1 file changed, 1 insertion(+)
 +
 +diff --git a/snapper/BcachefsUtils.cc b/snapper/BcachefsUtils.cc
 +index e9163ffb..1d328a78 100644
 +--- a/snapper/BcachefsUtils.cc
 ++++ b/snapper/BcachefsUtils.cc
 +@@ -24,6 +24,7 @@
 +
 + #include &lt;cstring&gt;
 + #include &lt;cerrno&gt;
 ++#include &lt;linux/types.h&gt;
 + #include &lt;sys/stat.h&gt;
 + #include &lt;sys/ioctl.h&gt;
 +
 diff --git a/meta-oe/recipes-support/snapper/snapper/0002-Use-statvfs-inst=
ead-of-statvfs64.patch b/meta-oe/recipes-support/snapper/snapper/0002-Use-s=
tatvfs-instead-of-statvfs64.patch
 new file mode 100644
 index 0000000000..b915fda257
 --- /dev/null
 +++ b/meta-oe/recipes-support/snapper/snapper/0002-Use-statvfs-instead-of-=
statvfs64.patch
 @@ -0,0 +1,37 @@
 +From 0b39f4484553c796cb300fb4933ea314e91d913b Mon Sep 17 00:00:00 2001
 +From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.c=
om</a>&gt;
 +Date: Sun, 20 Oct 2024 07:55:23 -0700
 +Subject: [PATCH 2/2] Use statvfs instead of statvfs64
 +
 +when using LFS64 these functions are same and also
 +on 64bit systems they are same. musl is using 64bit off_t
 +by default and does not define LFS64 variants of these functions
 +and it ends up in build errors
 +
 +Taken from Alpine Linux: [<a href=3D"https://gitlab.alpinelinux.org/alpin=
e/aports/-/blob/master/testing/snapper/statvfs64.patch">https://gitlab.alpi=
nelinux.org/alpine/aports/-/blob/master/testing/snapper/statvfs64.patch</a>=
]
 +
 +Upstream-Status: Submitted [<a href=3D"https://github.com/openSUSE/snappe=
r/pull/945">https://github.com/openSUSE/snapper/pull/945</a>]
 +
 +Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de">f_l_k=
@t-online.de</a>&gt;
 +Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khe=
m@gmail.com</a>&gt;
 +---
 + snapper/FileUtils.cc | 6 +++---
 + 1 file changed, 3 insertions(+), 3 deletions(-)
 +
 +diff --git a/snapper/FileUtils.cc b/snapper/FileUtils.cc
 +index d4034279..4c8578a1 100644
 +--- a/snapper/FileUtils.cc
 ++++ b/snapper/FileUtils.cc
 +@@ -387,9 +387,9 @@ namespace snapper
 +     std::pair&lt;unsigned long long, unsigned long long&gt;
 +     SDir::statvfs() const
 +     {
 +-      struct statvfs64 fsbuf;
 +-      if (fstatvfs64(dirfd, &amp;fsbuf) !=3D 0)
 +-          SN_THROW(IOErrorException(sformat("statvfs64 failed path:%s er=
rno:%d (%s)", base_path.c_str(),
 ++      struct statvfs fsbuf;
 ++      if (fstatvfs(dirfd, &amp;fsbuf) !=3D 0)
 ++          SN_THROW(IOErrorException(sformat("statvfs failed path:%s errn=
o:%d (%s)", base_path.c_str(),
 +                                             errno, stringerror(errno).c_=
str())));
 +
 +       // f_bavail is used (not f_bfree) since df seems to do the
 diff --git a/meta-oe/recipes-support/snapper/snapper_0.11.2.bb b/meta-oe/r=
ecipes-support/snapper/snapper_0.11.2.bb
 new file mode 100644
 index 0000000000..840c607309
 --- /dev/null
 +++ b/meta-oe/recipes-support/snapper/snapper_0.11.2.bb
 @@ -0,0 +1,41 @@
 +SUMMARY =3D "Snapper is a tool for Linux file system snapshot management"
 +HOMEPAGE =3D "<a href=3D"https://github.com/openSUSE/snapper">https://git=
hub.com/openSUSE/snapper</a>"
 +LICENSE =3D "GPL-2.0-only"
 +LIC_FILES_CHKSUM =3D "<a href=3D"file://COPYING;md5=3D751419260aa954499f7=
abaabaa882bbe" "=3D"">file://COPYING;md5=3D751419260aa954499f7abaabaa882bbe=
"</a>
 +
 +DEPENDS =3D "acl boost btrfs-tools dbus e2fsprogs json-c libxml2 lvm2 ncu=
rses zlib"
 +
 +# Build separation is slightly broken
 +inherit autotools-brokensep pkgconfig gettext
 +
 +SRC_URI =3D " \
 +    git://github.com/openSUSE/snapper.git;protocol=3Dhttps;branch=3Dmaste=
r \
 +    <a href=3D"file://0001-Include-linux-types.h-for-__u16-__u32-__u64-ty=
pe.patch">file://0001-Include-linux-types.h-for-__u16-__u32-__u64-type.patc=
h</a> \
 +    <a href=3D"file://0002-Use-statvfs-instead-of-statvfs64.patch">file:/=
/0002-Use-statvfs-instead-of-statvfs64.patch</a> \
 +"
 +SRCREV =3D "6c603565f36e9996d85045c8012cd04aba5f3708"
 +
 +S =3D "${WORKDIR}/git"
 +
 +EXTRA_OECONF +=3D "--disable-zypp"
 +
 +PACKAGECONFIG ?=3D "<a href=3D"mailto:${@bb.utils.filter">${@bb.utils.fil=
ter</a>('DISTRO_FEATURES', 'api-documentation systemd pam', d)}"
 +PACKAGECONFIG[pam] =3D "--enable-pam,--disable-pam,libpam"
 +PACKAGECONFIG[systemd] =3D "--enable-systemd,--disable-systemd"
 +PACKAGECONFIG[api-documentation] =3D "--enable-doc,--disable-doc,libxslt-=
native docbook-xsl-stylesheets-native"
 +
 +# Avoid HOSTTOOLS path in binaries
 +export DIFFBIN =3D "${bindir}/diff"
 +export RMBIN =3D "${bindir}/rm"
 +export TOUCHBIN =3D "${bindir}/touch"
 +export CPBIN =3D "${bindir}/cp"
 +
 +
 +do_install:append() {
 +       install -d ${D}${sysconfdir}/sysconfig
 +       install -m0644 ${S}/data/default-config ${D}${sysconfdir}/sysconfi=
g/snapper
 +}
 +
 +FILES:${PN} +=3D "${libdir}/pam_snapper ${libdir}/systemd ${libdir}/secur=
ity ${datadir}"
 +# bash is needed for the testsuite
 +RDEPENDS:${PN} =3D "bash diffutils util-linux util-linux-mount"

 -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
 Links: You receive all messages sent to this group.
 View/Reply Online (#113067): <a href=3D"https://lists.openembedded.org/g/o=
penembedded-devel/message/113067">https://lists.openembedded.org/g/openembe=
dded-devel/message/113067</a>
 Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/109116183/36=
17156">https://lists.openembedded.org/mt/109116183/3617156</a>
 Group Owner: <a href=3D"mailto:openembedded-devel+owner@lists.openembedded=
.org">openembedded-devel+owner@lists.openembedded.org</a>
 Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-deve=
l/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a =
href=3D"mailto:martin.jansa@gmail.com">martin.jansa@gmail.com</a>]
 -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</blockquote></div></blockquote></div>
--=-1vPCrjVl/ZES6O1mRKs+--


