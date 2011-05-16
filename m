Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QLueh-0002bZ-9p
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 May 2011 12:04:03 +0200
Received: by eye27 with SMTP id 27so1241902eye.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 May 2011 03:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=H9LCzZvaXnHiGWLpI4mMYIux97ylw0u2AkHIgcttVbY=;
	b=kakXfRBnhdRPorl9NlbMPjQ2obB0lw81VLU0j7bsUT2cfImFa+iNVDM/8sS5bczLhY
	Yk/M31TXluSlsrAZM1VbAXB1fyIvHrj/Dc9iXR0MmQsxHtYUDuzfem6VGhyBefJK7Rw5
	Q8JOFG1nnv7nLkZHDNEOD3hgc4OLte2oraI2o=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=mLIla/ZnCByQFEuILFxhmxfahN3iDlwo79mQMxOxfcEeikUFTjp9JcuXUlb33d/eEG
	U4VbExZLwSoVP7TKDv3Sx7JyJqy+ILtSLXErBrDYvDOs9Ok8LvehgsN4Xbp1eNo8iD1z
	Rlm82YcDeWisQIQUmDz0cCMpM00Cwf9v/nRpk=
Received: by 10.14.53.11 with SMTP id f11mr1506121eec.204.1305540062263; Mon,
	16 May 2011 03:01:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.53.78 with HTTP; Mon, 16 May 2011 03:00:32 -0700 (PDT)
In-Reply-To: <1305532243-7690-1-git-send-email-sgh@sgh.dk>
References: <201105160936.51355.sgh@sgh.dk>
	<1305532243-7690-1-git-send-email-sgh@sgh.dk>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 16 May 2011 03:00:32 -0700
Message-ID: <BANLkTikH4sOR-aupFyQ9ArqF8iXyk0uGtw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] acpid: Make 1.0.10 compile.
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
X-List-Received-Date: Mon, 16 May 2011 10:04:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, May 16, 2011 at 12:50 AM, S=C3=B8ren Holm <sgh@sgh.dk> wrote:
> Patch is tested on i686.
> Compilation failed with the following error :
>
> ERROR: Logfile of failure stored in: /home/sgh/oe-new-oe/build-vmc16/tmp/=
work/i686-angstrom-linux/acpid-1.0.10-r5.1/temp/log.do_compile.14235
> Log data follows:
> | ERROR: Function 'do_compile' failed (see /home/sgh/oe-new-oe/build-vmc1=
6/tmp/work/i686-angstrom-linux/acpid-1.0.10-r5.1/temp/log.do_compile.14235 =
for further information)
> | + cd /home/sgh/oe-new-oe/build-vmc16/tmp/work/i686-angstrom-linux/acpid=
-1.0.10-r5.1/acpid-1.0.10
> | + do_compile
> | + oe_runmake 'CC=3Di686-angstrom-linux-gcc -march=3Dpentiumpro --sysroo=
t=3D/home/sgh/oe-new-oe/build-vmc16/tmp/sysroots/i686-angstrom-linux' CROSS=
=3Di686-angstrom-linux-
> | + oenote make -j 8 'CC=3Di686-angstrom-linux-gcc -march=3Dpentiumpro --=
sysroot=3D/home/sgh/oe-new-oe/build-vmc16/tmp/sysroots/i686-angstrom-linux'=
 CROSS=3Di686-angstrom-linux-
> | + echo NOTE: 'make -j 8 CC=3Di686-angstrom-linux-gcc -march=3Dpentiumpr=
o --sysroot=3D/home/sgh/oe-new-oe/build-vmc16/tmp/sysroots/i686-angstrom-li=
nux CROSS=3Di686-angstrom-linux-'
> | NOTE: make -j 8 CC=3Di686-angstrom-linux-gcc -march=3Dpentiumpro --sysr=
oot=3D/home/sgh/oe-new-oe/build-vmc16/tmp/sysroots/i686-angstrom-linux CROS=
S=3Di686-angstrom-linux-
> | + make -j 8 'CC=3Di686-angstrom-linux-gcc -march=3Dpentiumpro --sysroot=
=3D/home/sgh/oe-new-oe/build-vmc16/tmp/sysroots/i686-angstrom-linux' CROSS=
=3Di686-angstrom-linux-
> | i686-angstrom-linux-gcc -march=3Dpentiumpro --sysroot=3D/home/sgh/oe-ne=
w-oe/build-vmc16/tmp/sysroots/i686-angstrom-linux -W -Wall -Werror -Wundef =
-Wshadow -D_GNU_SOURCE -O2 -g -DVERSION=3D"\"1.0.10\"" =C2=A0 -c -o
> acpid.o acpid.c
> | i686-angstrom-linux-gcc -march=3Dpentiumpro --sysroot=3D/home/sgh/oe-ne=
w-oe/build-vmc16/tmp/sysroots/i686-angstrom-linux -W -Wall -Werror -Wundef =
-Wshadow -D_GNU_SOURCE -O2 -g -DVERSION=3D"\"1.0.10\"" =C2=A0 -c -o
> acpi_ids.o acpi_ids.c
> | i686-angstrom-linux-gcc -march=3Dpentiumpro --sysroot=3D/home/sgh/oe-ne=
w-oe/build-vmc16/tmp/sysroots/i686-angstrom-linux -W -Wall -Werror -Wundef =
-Wshadow -D_GNU_SOURCE -O2 -g -DVERSION=3D"\"1.0.10\"" =C2=A0 -c -o
> connection_list.o connection_list.c
> | i686-angstrom-linux-gcc -march=3Dpentiumpro --sysroot=3D/home/sgh/oe-ne=
w-oe/build-vmc16/tmp/sysroots/i686-angstrom-linux -W -Wall -Werror -Wundef =
-Wshadow -D_GNU_SOURCE -O2 -g -DVERSION=3D"\"1.0.10\"" =C2=A0 -c -o
> event.o event.c
> | i686-angstrom-linux-gcc -march=3Dpentiumpro --sysroot=3D/home/sgh/oe-ne=
w-oe/build-vmc16/tmp/sysroots/i686-angstrom-linux -W -Wall -Werror -Wundef =
-Wshadow -D_GNU_SOURCE -O2 -g -DVERSION=3D"\"1.0.10\"" =C2=A0 -c -o
> input_layer.o input_layer.c
> | i686-angstrom-linux-gcc -march=3Dpentiumpro --sysroot=3D/home/sgh/oe-ne=
w-oe/build-vmc16/tmp/sysroots/i686-angstrom-linux -W -Wall -Werror -Wundef =
-Wshadow -D_GNU_SOURCE -O2 -g -DVERSION=3D"\"1.0.10\"" =C2=A0 -c -o
> libnetlink.o libnetlink.c
> | i686-angstrom-linux-gcc -march=3Dpentiumpro --sysroot=3D/home/sgh/oe-ne=
w-oe/build-vmc16/tmp/sysroots/i686-angstrom-linux -W -Wall -Werror -Wundef =
-Wshadow -D_GNU_SOURCE -O2 -g -DVERSION=3D"\"1.0.10\"" =C2=A0 -c -o
> netlink.o netlink.c
> | i686-angstrom-linux-gcc -march=3Dpentiumpro --sysroot=3D/home/sgh/oe-ne=
w-oe/build-vmc16/tmp/sysroots/i686-angstrom-linux -W -Wall -Werror -Wundef =
-Wshadow -D_GNU_SOURCE -O2 -g -DVERSION=3D"\"1.0.10\"" =C2=A0 -c -o
> proc.o proc.c
> | i686-angstrom-linux-gcc -march=3Dpentiumpro --sysroot=3D/home/sgh/oe-ne=
w-oe/build-vmc16/tmp/sysroots/i686-angstrom-linux -W -Wall -Werror -Wundef =
-Wshadow -D_GNU_SOURCE -O2 -g -DVERSION=3D"\"1.0.10\"" =C2=A0 -c -o
> sock.o sock.c
> | cc1: warnings being treated as errors
> | libnetlink.c: In function 'addraw_l':
> | libnetlink.c:521:56: error: comparison between signed and unsigned inte=
ger expressions
> | make: *** [libnetlink.o] Error 1
> | make: *** Waiting for unfinished jobs....
> | + die 'oe_runmake failed'
> | + oefatal 'oe_runmake failed'
> | + echo FATAL: 'oe_runmake failed'
> | FATAL: oe_runmake failed
> | + exit 1
> NOTE: package acpid-1.0.10-r5.1: task do_compile: Failed

this log message is ugly and has lot of useless information. Just including=
 one
commandline that fails is sufficient. No need to put whatever bitbake puked

> ---
> =C2=A0recipes/acpid/acpid-1.0.10/libnetlink.diff | =C2=A0 15 ++++++++++++=
+++
> =C2=A0recipes/acpid/acpid_1.0.10.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| =C2=A0 =C2=A01 +
> =C2=A02 files changed, 16 insertions(+), 0 deletions(-)
> =C2=A0create mode 100644 recipes/acpid/acpid-1.0.10/libnetlink.diff
>
> diff --git a/recipes/acpid/acpid-1.0.10/libnetlink.diff b/recipes/acpid/a=
cpid-1.0.10/libnetlink.diff
> new file mode 100644
> index 0000000..59ab951
> --- /dev/null
> +++ b/recipes/acpid/acpid-1.0.10/libnetlink.diff
> @@ -0,0 +1,15 @@
> +diff --git a/libnetlink.c b/libnetlink.c
> +index 6f1ceea..d34dfe4 100644
> +--- a/libnetlink.c
> ++++ b/libnetlink.c
> +@@ -518,8 +518,8 @@ int addattr_l(struct nlmsghdr *n, int maxlen, int ty=
pe, const void *data,
> +
> + int addraw_l(struct nlmsghdr *n, int maxlen, const void *data, int len)
> + {
> +- =C2=A0 =C2=A0 =C2=A0if ((int)NLMSG_ALIGN(n->nlmsg_len) + NLMSG_ALIGN(l=
en) > maxlen) {
> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf(stderr, "addra=
w_l ERROR: message exceeded bound of %d\n",maxlen);
> ++ =C2=A0 =C2=A0 =C2=A0if ((int)NLMSG_ALIGN(n->nlmsg_len) + (int)NLMSG_AL=
IGN(len) > maxlen) {
> ++ =C2=A0 =C2=A0 =C2=A0fprintf(stderr, "addraw_l ERROR: message exceeded =
bound of %d\n",maxlen);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;
> + =C2=A0 =C2=A0 =C2=A0 }
> +
> diff --git a/recipes/acpid/acpid_1.0.10.bb b/recipes/acpid/acpid_1.0.10.b=
b
> index 9d3170d..f0a6049 100644
> --- a/recipes/acpid/acpid_1.0.10.bb
> +++ b/recipes/acpid/acpid_1.0.10.bb
> @@ -2,6 +2,7 @@ require acpid.inc
>
> =C2=A0SRC_URI_append =3D " file://event.c.diff \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file=
://netlink.diff \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://l=
ibnetlink.diff \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file=
://gcc44.diff \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file=
://acpid-sys-stat.patch \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0"
> --
> 1.7.4.1
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


