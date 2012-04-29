Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SOKAc-0000Gi-2a
	for openembedded-devel@lists.openembedded.org;
	Sun, 29 Apr 2012 04:47:30 +0200
Received: by lagw12 with SMTP id w12so1266796lag.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Apr 2012 19:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=DcjrBX/viP0Dfk0zG/zNiEPA3sH1efpPv57Fe2RqLQM=;
	b=g7mKMELzTxvqUmQVdgLUq6ryx2Pn3gbN2fJ5M5u9hOxt7qskPQFG3GKd6kUEidC9JM
	FJXIH9I31VlXNBhYR5DF7T+X/8USzcJJOyFKDMETwgpWJQ/Wew0ejJG5/6O/Nja3m1mC
	5s6MZkKPrRRIsGtucixc3hDGP5++ThdyPQrtKc7vAzWSgrCzGnZ6HwLG/YwavhdFWAJz
	dFYyyS1gsyzB5X6u/bdBbKTwEMdMRQOwqwHLvmnXBHo9pVC7j77GzpQOmB+QRuTJS02s
	d/1mJx8Wa60CtH6ajoOW9g2HyyXNrL3Qx+j+mcNaGRQlHw4HBLdHuElxe3FI3CuUJZTh
	qEdQ==
Received: by 10.152.145.228 with SMTP id sx4mr14783063lab.45.1335667069701;
	Sat, 28 Apr 2012 19:37:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.152.129.134 with HTTP; Sat, 28 Apr 2012 19:37:18 -0700 (PDT)
In-Reply-To: <1335536785-1585-1-git-send-email-rep.dot.nop@gmail.com>
References: <1335536785-1585-1-git-send-email-rep.dot.nop@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 28 Apr 2012 19:37:18 -0700
Message-ID: <CAMKF1srPQENVJZjYXaqS65gTX0wvAFLUJE58N2kEXfNiU=7BAA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 1/5] runqemu: Use OE_TMPDIR
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
X-List-Received-Date: Sun, 29 Apr 2012 02:47:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

you should send this patch series to openembedded-core mailing list
they belong there

On Fri, Apr 27, 2012 at 7:26 AM, Bernhard Reutner-Fischer
<rep.dot.nop@gmail.com> wrote:
> The error message erroneously talked about TMPDIR.
> Just use OE_TMPDIR everywhere to make the name of the variable obvious.
>
> Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
> ---
> =C2=A0scripts/runqemu | =C2=A0 27 +++++++++++----------------
> =C2=A01 file changed, 11 insertions(+), 16 deletions(-)
>
> diff --git a/scripts/runqemu b/scripts/runqemu
> index caabf61..7c2c4b3 100755
> --- a/scripts/runqemu
> +++ b/scripts/runqemu
> @@ -55,11 +55,6 @@ SCRIPT_QEMU_OPT=3D""
> =C2=A0SCRIPT_QEMU_EXTRA_OPT=3D""
> =C2=A0SCRIPT_KERNEL_OPT=3D""
>
> -# Don't use TMPDIR from the external environment, it may be a distro
> -# variable pointing to /tmp (e.g. within X on OpenSUSE)
> -# Instead, use OE_TMPDIR for passing this in externally.
> -TMPDIR=3D"$OE_TMPDIR"
> -
> =C2=A0# Determine whether the file is a kernel or QEMU image, and set the
> =C2=A0# appropriate variables
> =C2=A0process_filename() {
> @@ -273,8 +268,8 @@ SPITZ_DEFAULT_KERNEL=3DzImage-spitz.bin
> =C2=A0SPITZ_DEFAULT_FSTYPE=3Dext3
>
> =C2=A0setup_tmpdir() {
> - =C2=A0 =C2=A0if [ -z "$TMPDIR" ]; then
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0# Try to get TMPDIR from bitbake
> + =C2=A0 =C2=A0if [ -z "$OE_TMPDIR" ]; then
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0# Try to get OE_TMPDIR from bitbake
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 type -P bitbake &>/dev/null || {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo "In order for this script =
to dynamically infer paths";
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo "to kernels or filesystem =
images, you either need";
> @@ -282,11 +277,11 @@ setup_tmpdir() {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo "before running this scrip=
t" >&2;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exit 1; }
>
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0# We have bitbake in PATH, get TMPDIR from b=
itbake
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0TMPDIR=3D`bitbake -e | grep ^TMPDIR=3D\" | c=
ut -d '=3D' -f2 | cut -d '"' -f2`
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -z "$TMPDIR" ]; then
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0# We have bitbake in PATH, get OE_TMPDIR fro=
m bitbake
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0OE_TMPDIR=3D`bitbake -e | grep ^TMPDIR=3D\" =
| cut -d '=3D' -f2 | cut -d '"' -f2`
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -z "$OE_TMPDIR" ]; then
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo "Error: this script needs =
to be run from your build directory,"
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo "or you need to explicitl=
y set TMPDIR in your environment"
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo "or you need to explicitl=
y set OE_TMPDIR in your environment"
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exit 1
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi
> =C2=A0 =C2=A0 fi
> @@ -303,7 +298,7 @@ setup_sysroot() {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 BUILD_OS=3D`uname | tr '[A-Z]' '[a-z]'`
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 BUILD_SYS=3D"$BUILD_ARCH-$BUILD_OS"
>
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0OECORE_NATIVE_SYSROOT=3D$TMPDIR/sysroots/$BU=
ILD_SYS
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0OECORE_NATIVE_SYSROOT=3D$OE_TMPDIR/sysroots/=
$BUILD_SYS
> =C2=A0 =C2=A0 fi
> =C2=A0}
>
> @@ -348,7 +343,7 @@ fi
> =C2=A0if [ -z "$KERNEL" ]; then
> =C2=A0 =C2=A0 setup_tmpdir
> =C2=A0 =C2=A0 eval kernel_file=3D\$${machine2}_DEFAULT_KERNEL
> - =C2=A0 =C2=A0KERNEL=3D$TMPDIR/deploy/images/$kernel_file
> + =C2=A0 =C2=A0KERNEL=3D$OE_TMPDIR/deploy/images/$kernel_file
>
> =C2=A0 =C2=A0 if [ -z "$KERNEL" ]; then
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo "Error: Unable to determine default kern=
el for MACHINE [$MACHINE]"
> @@ -372,13 +367,13 @@ fi
> =C2=A0# core-image-sato
> =C2=A0if [ "$LAZY_ROOTFS" =3D "true" ]; then
> =C2=A0 =C2=A0 setup_tmpdir
> - =C2=A0 =C2=A0echo "Assuming $ROOTFS really means $TMPDIR/deploy/images/=
$ROOTFS-$MACHINE.$FSTYPE"
> - =C2=A0 =C2=A0ROOTFS=3D$TMPDIR/deploy/images/$ROOTFS-$MACHINE.$FSTYPE
> + =C2=A0 =C2=A0echo "Assuming $ROOTFS really means $OE_TMPDIR/deploy/imag=
es/$ROOTFS-$MACHINE.$FSTYPE"
> + =C2=A0 =C2=A0ROOTFS=3D$OE_TMPDIR/deploy/images/$ROOTFS-$MACHINE.$FSTYPE
> =C2=A0fi
>
> =C2=A0if [ -z "$ROOTFS" ]; then
> =C2=A0 =C2=A0 setup_tmpdir
> - =C2=A0 =C2=A0T=3D$TMPDIR/deploy/images
> + =C2=A0 =C2=A0T=3D$OE_TMPDIR/deploy/images
> =C2=A0 =C2=A0 eval rootfs_list=3D\$${machine2}_DEFAULT_ROOTFS
> =C2=A0 =C2=A0 findimage $T $MACHINE $FSTYPE
>
> --
> 1.7.10
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


