Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PsRSO-0001Sr-OZ
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Feb 2011 04:01:34 +0100
Received: by fxm8 with SMTP id 8so117833fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Feb 2011 19:00:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=ZDOJWGPpbBaY3LJ4ygoy734twHeZ8pa+LWnjWH0Bhyk=;
	b=HNnKOResVuHqF+kuJdTpSVpLwT2BlcM7k1XlM09rfzHvfnw9xyF7IniqmrlOiE53v+
	UTFkeAFlYtIn79VdIXXoNNxreAjcF924c38f0OZ4QRSAz4jua2hQWUQdA0cV9VlxEOpu
	PX/YB9GDAZdsbIK/iFxRu0A94KVaubJKmvBaI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=Or1poqzoSCLAh7C1dhT1WBhGZec+fjZTwjB0q54V9KRIWO/tcaIbMITi+Ocg0pba3e
	DZSNAPZkRiollKZDJvdDsSkyU0vQIDThLnbjqTIV57sUzCRQXkZeF6PslQmCu7Kv2vZV
	q6QwD8q+OVELcc1kim3eHUozPk5M5T9Yh51xY=
Received: by 10.223.101.135 with SMTP id c7mr314925fao.76.1298516392135; Wed,
	23 Feb 2011 18:59:52 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.30.151 with HTTP; Wed, 23 Feb 2011 18:59:32 -0800 (PST)
In-Reply-To: <1298511101-5170-1-git-send-email-denis@denix.org>
References: <1298511101-5170-1-git-send-email-denis@denix.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 23 Feb 2011 18:59:32 -0800
Message-ID: <AANLkTi=Qvh8v+GVs_4e1avAbRgsPUuDncsMZ6SK=jQOK@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: Re: [PATCH] busybox: fix udhcp check for NFS rootfs for new style /proc/mounts
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 24 Feb 2011 03:01:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 23, 2011 at 5:31 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> From: Denys Dmytriyenko <denys@ti.com>
>
> * Newer kernels change the format of /proc/mounts slightly when rootfs is
> mounted over NFS.
>
> * Old style:
> /dev/root / nfs <options> 0 0
>
> * New style:
> <server>:<mount> / nfs <options> 0 0
>
> * The regexp in grep can be simplified and rolled into one, but may becom=
e
> less strict...
>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>

OK

Acked-by: Khem Raj <raj.khem@gmail.com>

> ---
> =C2=A0.../busybox-1.13.2/udhcpc-new-nfsroot.patch =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| =C2=A0 16 ++++++++++++++++
> =C2=A0.../busybox-1.18.3/udhcpc-new-nfsroot.patch =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| =C2=A0 16 ++++++++++++++++
> =C2=A0recipes/busybox/busybox_1.13.2.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A02 +-
> =C2=A0recipes/busybox/busybox_1.18.3.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A02 +-
> =C2=A0recipes/busybox/busybox_1.1x.inc =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A01 +
> =C2=A05 files changed, 35 insertions(+), 2 deletions(-)
> =C2=A0create mode 100644 recipes/busybox/busybox-1.13.2/udhcpc-new-nfsroo=
t.patch
> =C2=A0create mode 100644 recipes/busybox/busybox-1.18.3/udhcpc-new-nfsroo=
t.patch
>
> diff --git a/recipes/busybox/busybox-1.13.2/udhcpc-new-nfsroot.patch b/re=
cipes/busybox/busybox-1.13.2/udhcpc-new-nfsroot.patch
> new file mode 100644
> index 0000000..46aaab9
> --- /dev/null
> +++ b/recipes/busybox/busybox-1.13.2/udhcpc-new-nfsroot.patch
> @@ -0,0 +1,16 @@
> +diff -uNr busybox-1.13.2.orig/examples/udhcp/simple.script busybox-1.13.=
2/examples/udhcp/simple.script
> +--- busybox-1.13.2.orig/examples/udhcp/simple.script =C2=A0 2011-02-23 0=
0:30:32.000000000 -0500
> ++++ busybox-1.13.2/examples/udhcp/simple.script =C2=A0 =C2=A0 =C2=A0 =C2=
=A02011-02-23 17:05:37.873381763 -0500
> +@@ -10,7 +10,12 @@
> +
> + # return 0 if root is mounted on a network filesystem
> + root_is_nfs() {
> ++ =C2=A0 =C2=A0 =C2=A0# old style mounts
> + =C2=A0 =C2=A0 =C2=A0 grep -qe '^/dev/root.*\(nfs\|smbfs\|ncp\|coda\) .*=
' /proc/mounts
> ++ =C2=A0 =C2=A0 =C2=A0if ! $? ; then
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# new style mounts
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0grep -qe '^.*:.* / \(n=
fs\|smbfs\|ncp\|coda\) .*' /proc/mounts
> ++ =C2=A0 =C2=A0 =C2=A0fi
> + }
> +
> + case "$1" in
> diff --git a/recipes/busybox/busybox-1.18.3/udhcpc-new-nfsroot.patch b/re=
cipes/busybox/busybox-1.18.3/udhcpc-new-nfsroot.patch
> new file mode 100644
> index 0000000..46aaab9
> --- /dev/null
> +++ b/recipes/busybox/busybox-1.18.3/udhcpc-new-nfsroot.patch
> @@ -0,0 +1,16 @@
> +diff -uNr busybox-1.13.2.orig/examples/udhcp/simple.script busybox-1.13.=
2/examples/udhcp/simple.script
> +--- busybox-1.13.2.orig/examples/udhcp/simple.script =C2=A0 2011-02-23 0=
0:30:32.000000000 -0500
> ++++ busybox-1.13.2/examples/udhcp/simple.script =C2=A0 =C2=A0 =C2=A0 =C2=
=A02011-02-23 17:05:37.873381763 -0500
> +@@ -10,7 +10,12 @@
> +
> + # return 0 if root is mounted on a network filesystem
> + root_is_nfs() {
> ++ =C2=A0 =C2=A0 =C2=A0# old style mounts
> + =C2=A0 =C2=A0 =C2=A0 grep -qe '^/dev/root.*\(nfs\|smbfs\|ncp\|coda\) .*=
' /proc/mounts
> ++ =C2=A0 =C2=A0 =C2=A0if ! $? ; then
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# new style mounts
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0grep -qe '^.*:.* / \(n=
fs\|smbfs\|ncp\|coda\) .*' /proc/mounts
> ++ =C2=A0 =C2=A0 =C2=A0fi
> + }
> +
> + case "$1" in
> diff --git a/recipes/busybox/busybox_1.13.2.bb b/recipes/busybox/busybox_=
1.13.2.bb
> index ef20c62..fca3e93 100644
> --- a/recipes/busybox/busybox_1.13.2.bb
> +++ b/recipes/busybox/busybox_1.13.2.bb
> @@ -1,5 +1,5 @@
> =C2=A0require busybox_1.1x.inc
> -PR =3D "${INC_PR}.3"
> +PR =3D "${INC_PR}.4"
>
> =C2=A0SRC_URI +=3D "\
> =C2=A0 file://busybox-1.13.2-awk.patch \
> diff --git a/recipes/busybox/busybox_1.18.3.bb b/recipes/busybox/busybox_=
1.18.3.bb
> index 633b70b..f85de86 100644
> --- a/recipes/busybox/busybox_1.18.3.bb
> +++ b/recipes/busybox/busybox_1.18.3.bb
> @@ -1,5 +1,5 @@
> =C2=A0require busybox_1.1x.inc
> -PR =3D "${INC_PR}.0"
> +PR =3D "${INC_PR}.1"
>
> =C2=A0SRC_URI +=3D " \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0http://busybox.net/downloads/fixes-1.18.3/busy=
box-1.18.3-buildsys.patch;name=3Dpatch01 \
> diff --git a/recipes/busybox/busybox_1.1x.inc b/recipes/busybox/busybox_1=
.1x.inc
> index 7623944..aefa57f 100644
> --- a/recipes/busybox/busybox_1.1x.inc
> +++ b/recipes/busybox/busybox_1.1x.inc
> @@ -5,6 +5,7 @@ SRC_URI =3D "\
> =C2=A0 file://fdisk_nios2.patch \
> =C2=A0 file://udhcpscript.patch \
> =C2=A0 file://udhcpc-fix-nfsroot.patch \
> + =C2=A0file://udhcpc-new-nfsroot.patch \
> =C2=A0 file://B921600.patch \
> =C2=A0 file://get_header_tar.patch \
> =C2=A0 file://busybox-appletlib-dependency.patch \
> --
> 1.7.0.4
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


