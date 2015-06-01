Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f174.google.com (mail-ig0-f174.google.com
	[209.85.213.174])
	by mail.openembedded.org (Postfix) with ESMTP id 9BF8B7576E
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Jun 2015 18:06:07 +0000 (UTC)
Received: by igbpi8 with SMTP id pi8so68002972igb.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Jun 2015 11:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=8GXb46zHHRJ32uIWx4P97pkjbYe6ekdTQBvkKwrYNJI=;
	b=C47Jqr8PtkV+AGz+OnMU2xPZIn49qPCLBbzDCNsYZS+EeT8/H72KYTJUNUJw/2huHD
	VLlWVX+B0J2czAxL74obxMSIJ/D1YUbRC6TJEVsffc4VOVv02Hc2gdU2L++QGTaONruI
	8ERjeEfC7Y2z+95uWcAETD/9bI9UDWpPkziQseyA/+71BD0AuOovgZtAnrJ9VdsuON3z
	C+9Q+LAX85g9jw5Owmg6tyNEb+KAyOKyFDgFRGy4UBcuJbOfikNbM4ZiDU7p3U3W3GDX
	kWe5DkkAhBRtAkmjGGohn/QWxyF/0Dw1kXfSB7ry/mpX1JwFDeUP/GhZplEREPqQJzZM
	N+6w==
X-Received: by 10.50.136.197 with SMTP id qc5mr3028696igb.6.1433181968262;
	Mon, 01 Jun 2015 11:06:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.3.166 with HTTP; Mon, 1 Jun 2015 11:05:37 -0700 (PDT)
In-Reply-To: <1433032319-13061-1-git-send-email-kergoth@gmail.com>
References: <1433032319-13061-1-git-send-email-kergoth@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 1 Jun 2015 11:05:37 -0700
Message-ID: <CAMKF1srmP=02oMEvuNMPbsdd5u3vvc6fv_QmOtL07ydUTuDC0Q@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] ntimed: add recipe to meta-networking (git version)
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
X-List-Received-Date: Mon, 01 Jun 2015 18:06:08 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, May 30, 2015 at 5:31 PM, Christopher Larson <kergoth@gmail.com> wrote:
> Ntimed is an unreleased ntpd replacement being sponsored by the Linux
> Foundation. Currently it only includes a work-in-progress client, but for
> future use this recipe emits an ntimed-client package and an ntimed meta
> package which will pull in client and server.
>

should it have RCONFLICTS with ntp ?

> Signed-off-by: Christopher Larson <kergoth@gmail.com>
> ---
>  .../ntimed/ntimed/use-ldflags.patch                | 16 +++++++++
>  .../recipes-support/ntimed/ntimed_git.bb           | 41 ++++++++++++++++++++++
>  2 files changed, 57 insertions(+)
>  create mode 100644 meta-networking/recipes-support/ntimed/ntimed/use-ldflags.patch
>  create mode 100644 meta-networking/recipes-support/ntimed/ntimed_git.bb
>
> diff --git a/meta-networking/recipes-support/ntimed/ntimed/use-ldflags.patch b/meta-networking/recipes-support/ntimed/ntimed/use-ldflags.patch
> new file mode 100644
> index 0000000..87a7778
> --- /dev/null
> +++ b/meta-networking/recipes-support/ntimed/ntimed/use-ldflags.patch
> @@ -0,0 +1,16 @@
> +Obey LDFLAGS.
> +
> +Signed-off-by: Christopher Larson <kergoth@gmail.com>
> +Upstream-Status: Pending
> +
> +--- Ntimed.orig/configure      2015-05-30 11:57:59.927796993 -0700
> ++++ Ntimed/configure   2015-05-30 11:58:26.143948894 -0700
> +@@ -142,7 +142,7 @@
> +
> +       echo
> +       echo "ntimed-client:    ${l}"
> +-      echo "  \${CC} \${CFLAGS} -o ntimed-client ${l} -lm"
> ++      echo "  \${CC} \${CFLAGS} -o ntimed-client ${l} \${LDFLAGS} -lm"
> +       echo
> +       echo "clean:"
> +       echo "  rm -f ${l} ntimed-client"
> diff --git a/meta-networking/recipes-support/ntimed/ntimed_git.bb b/meta-networking/recipes-support/ntimed/ntimed_git.bb
> new file mode 100644
> index 0000000..0990541
> --- /dev/null
> +++ b/meta-networking/recipes-support/ntimed/ntimed_git.bb
> @@ -0,0 +1,41 @@
> +SUMMARY = "Network time synchronization software, NTPD replacement"
> +DESCRIPTION = "This is a preview/early-access/alpha/buzzword-of-the-times \
> +release of a new FOSS project written to gradually take over the world of \
> +networked timekeeping."
> +HOMEPAGE = "https://github.com/bsdphk/Ntimed"
> +SECTION = "console/network"
> +
> +LICENSE = "BSD-2-Clause"
> +LIC_FILES_CHKSUM = "file://main.c;startline=2;endline=24;md5=eda11d21005319bb76cbb6f911f0f66d"
> +
> +SRC_URI = "git://github.com/bsdphk/Ntimed \
> +           file://use-ldflags.patch"
> +
> +PV = "0.0+git${SRCPV}"
> +SRCREV = "db0abbb4c80f2ecef6bc5d9639bca5bea28532a2"
> +
> +S = "${WORKDIR}/git"
> +
> +EXTRA_OEMAKE = "\
> +    'CC=${CC}' \
> +    'CFLAGS=${CFLAGS}' \
> +    'LDFLAGS=${LDFLAGS}' \
> +"
> +
> +do_configure () {
> +    sh ./configure
> +}
> +
> +do_compile () {
> +    oe_runmake
> +}
> +
> +do_install () {
> +    install -D -m 0755 ntimed-client ${D}${sbindir}/ntimed-client
> +}
> +
> +ALLOW_EMPTY_${PN} = "1"
> +RDEPENDS_${PN} += "ntimed-client"
> +
> +PACKAGE_BEFORE_PN += "ntimed-client"
> +FILES_ntimed-client = "${sbindir}/ntimed-client"
> --
> 2.2.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

