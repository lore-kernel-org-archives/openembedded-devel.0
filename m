Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f179.google.com (mail-ig0-f179.google.com
	[209.85.213.179])
	by mail.openembedded.org (Postfix) with ESMTP id 904C573306
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 14 Jun 2015 15:52:07 +0000 (UTC)
Received: by igbos3 with SMTP id os3so3101185igb.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 14 Jun 2015 08:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=lQVk0SN8ZrbF8sSbPcExQMiGJpH/Z2YrJNLfio2bq0A=;
	b=qSn+2xIe4qsEtcnhBIr/HaiEpWKWAvO/6ic7+Z9X2OkXV8vYEoYAR0RP6DmW85sotQ
	9Vqoikv/0rch0TMgm1d4PyqviyxEPiZVofsL9CZSWLFU9YWGYbd0PoJsJo27+5opQGGt
	4ekh2cR6+iZ1l5kE/gkxEbI8U/caI2Pp08JgTqh1XnXs/jLm3d6U6e0t0WjPvgl/WxOm
	RzKqbrAiMfjvI8Rsl7LUeCAMj+NkwPWJ46tbm+4e+XGUSHVXgOhKvwRBIla5KH61YrrN
	spp7EWU81mO2KgRAtDG4trb8nyBDdIDumdyYrj9JBpIBoR42WNyMn6/r/dkUhM+wmYOA
	1kSw==
X-Received: by 10.107.10.89 with SMTP id u86mr29280142ioi.79.1434297128449;
	Sun, 14 Jun 2015 08:52:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.20.83 with HTTP; Sun, 14 Jun 2015 08:51:38 -0700 (PDT)
In-Reply-To: <1433494142-1958-1-git-send-email-lixin.fnst@cn.fujitsu.com>
References: <1433494142-1958-1-git-send-email-lixin.fnst@cn.fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 14 Jun 2015 11:51:38 -0400
Message-ID: <CAMKF1spJ4P5cO4NF9Qbdixere_6_ATEsVPQ74=Mu1WRiBL0isQ@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] rp-pppoe: add systemd support and fix error in the step of do_configure.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 14 Jun 2015 15:52:07 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jun 5, 2015 at 4:49 AM, Li xin <lixin.fnst@cn.fujitsu.com> wrote:
> The error is as follows:
> error: unrecognized command line option '-V'
> conftest.c:9:28: fatal error: ac_nonexistent.h:
> No such file or directory #include <ac_nonexistent.h>.
>
> Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
> ---
>  .../rp-pppoe-3.8/configure.in-Error-fix.patch      | 57 ++++++++++++++++++++++
>  .../rp-pppoe/rp-pppoe-3.8/pppoe-server.service     | 11 +++++
>  .../recipes-protocols/rp-pppoe/rp-pppoe_3.8.bb     | 16 +++++-
>  3 files changed, 82 insertions(+), 2 deletions(-)
>  create mode 100644 meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.8/configure.in-Error-fix.patch
>  create mode 100644 meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.8/pppoe-server.service
>
> diff --git a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.8/configure.in-Error-fix.patch b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.8/configure.in-Error-fix.patch
> new file mode 100644
> index 0000000..1e815f3
> --- /dev/null
> +++ b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.8/configure.in-Error-fix.patch
> @@ -0,0 +1,57 @@
> +From a546942a784a177080d9722dda873bfd7416ad41 Mon Sep 17 00:00:00 2001
> +From: Li xin <lixin.fnst@cn.fujitsu.com>
> +Date: Fri, 10 Apr 2015 13:13:06 +0900
> +Subject: [PATCH] configure.in: Error fix.
> +
> +the error is: conftest.c:9:28: fatal error: ac_nonexistent.h:
> +No such file or directory #include <ac_nonexistent.h>
> +
> +Upstream-Status: pending
> +
> +Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
> +---
> + src/configure.in | 28 ----------------------------
> + 1 file changed, 28 deletions(-)
> +
> +diff --git a/src/configure.in b/src/configure.in
> +index c4f1a8c..74956cc 100644
> +--- a/src/configure.in
> ++++ b/src/configure.in
> +@@ -183,34 +183,6 @@ if test "$GCC" = yes; then
> +       CFLAGS="$CFLAGS -Wall -Wstrict-prototypes -ansi"
> + fi
> +
> +-dnl Figure out packing order of structures
> +-AC_CACHE_CHECK([packing order of bit fields],rpppoe_cv_pack_bitfields,[
> +-AC_TRY_RUN([
> +-union foo {
> +-    struct bar {
> +-      unsigned int ver:4;
> +-      unsigned int type:4;
> +-    } bb;
> +-    unsigned char baz;
> +-};
> +-
> +-int
> +-main(void)
> +-{
> +-    union foo x;
> +-    x.bb.ver = 1;
> +-    x.bb.type = 2;
> +-    if (x.baz == 0x21) {
> +-      return 1;
> +-    } else if (x.baz == 0x12) {
> +-      return 0;
> +-    } else {
> +-      return 2;
> +-    }
> +-}], rpppoe_cv_pack_bitfields=normal, rpppoe_cv_pack_bitfields=rev,
> +-$ECHO "no defaults for cross-compiling"; exit 1)
> +-])
> +-
> + if test "$rpppoe_cv_pack_bitfields" = "rev" ; then
> +       AC_MSG_RESULT(reversed)
> +       AC_DEFINE([PACK_BITFIELDS_REVERSED], [], [Reversed bitfields])
> +--
> +1.8.4.2
> +
> diff --git a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.8/pppoe-server.service b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.8/pppoe-server.service
> new file mode 100644
> index 0000000..41e0b9e
> --- /dev/null
> +++ b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.8/pppoe-server.service
> @@ -0,0 +1,11 @@
> +[Unit]
> +Description=PPPOE Service
> +After=network.target
> +
> +[Service]
> +Type=forking
> +EnvironmentFile=-@SYSCONFDIR@/default/pppoe-server
> +ExecStart=@SBINDIR@/pppoe-server
> +
> +[Install]
> +WantedBy=multi-user.target
> diff --git a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe_3.8.bb b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe_3.8.bb
> index d1b0481..f3bd994 100644
> --- a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe_3.8.bb
> +++ b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe_3.8.bb
> @@ -16,12 +16,21 @@ SRC_URI = "http://www.roaringpenguin.com/files/download/${BP}.tar.gz \
>             file://use-ldflags.patch \
>             file://configure.patch \
>             file://pppoe-server.default \
> -           file://pppoe-server.init"
> +           file://pppoe-server.init \
> +           file://configure.in-Error-fix.patch \
> +           file://pppoe-server.service"
>
>  SRC_URI[md5sum] = "0e32760f498f9cde44081ee6aafc823b"
>  SRC_URI[sha256sum] = "d916e9cfe1e62395f63a5361936fa855f6d0f0a37dc7227b394cdb725f553479"
>
> -inherit autotools-brokensep update-rc.d
> +inherit autotools-brokensep update-rc.d systemd
> +
> +do_install_append() {
> +    install -d ${D}${systemd_unitdir}/system
> +    install -m 0644 ${WORKDIR}/pppoe-server.service ${D}${systemd_unitdir}/system
> +    sed -i -e 's#@SYSCONFDIR@#${sysconfdir}#g' ${D}${systemd_unitdir}/system/pppoe-server.service
> +    sed -i -e 's#@SBINDIR@#${sbindir}#g' ${D}${systemd_unitdir}/system/pppoe-server.service
> +}
>
>  do_install() {
>      # Install init script and default settings
> @@ -33,6 +42,9 @@ do_install() {
>      chmod 4755 ${D}${sbindir}/pppoe
>  }
>
> +SYSTEMD_PACKAGES = "${PN}-server"
> +SYSTEMD_SERVICE_${PN}-server = "pppoe-server.service"
> +SYSTEMD_AUTO_ENABLE = "disable"

again disabled ?

>  # Insert server package before main package
>  PACKAGES = "${PN}-dbg ${PN}-server ${PN}-relay ${PN}-sniff ${PN} ${PN}-doc"
>
> --
> 1.8.4.2
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

