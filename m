Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1PKjXp-0004Ur-Ov
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Nov 2010 04:27:52 +0100
Received: by wyb40 with SMTP id 40so983314wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Nov 2010 19:26:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=Was+Hzpw7+YnA777JCV1jEI8wFEG4okZVIzhb/FKirg=;
	b=OcmEHye53wtSexrZAzLsYR1BGeC/5lX9z/hYyWa2+NJNKZj5ezHFe7/lqkEbQD8v0q
	jMGFFYBhq2ZWXuQGWVopmWYcMShxjK7/37WfK93+hOUE4MGCBYeQ6oB7jCQD5W8M0veO
	TKUfGIhsbPGWh4ZU9+D8MTb+hJqLU0BKXHokQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=fKlgxWicVr62FicYpRMXvvXrNqyYc+nVT0lRILaXFXo3YB1BeSDMjbuPQW2PHcJ4WF
	uXx3T746RL/a4K8aSq0Gf1Ek9SOknrJRKQzfP8HfkVjDvJoC8meoolDKTdrzJxYwzQiG
	f5a9PYCDkiplPofPnfE6gczZ4sLGPN/oBrdyE=
MIME-Version: 1.0
Received: by 10.227.143.199 with SMTP id w7mr6947933wbu.20.1290482796737; Mon,
	22 Nov 2010 19:26:36 -0800 (PST)
Received: by 10.227.32.147 with HTTP; Mon, 22 Nov 2010 19:26:36 -0800 (PST)
In-Reply-To: <4CEB3203.9040606@gmail.com>
References: <4CEB3203.9040606@gmail.com>
Date: Tue, 23 Nov 2010 13:56:36 +1030
Message-ID: <AANLkTim=mc=XedcSgkOYc1bFuuNaNw0pM2V2p7ne+670@mail.gmail.com>
From: Graham Gower <graham.gower@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] strace_4.5.20.bb: Fix build on mips{, el} when DISTRO_FEATURES lacks "largefile".
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
X-List-Received-Date: Tue, 23 Nov 2010 03:27:52 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Disregard this one. Clearly I don't know how to use DEFAULT_PREFERENCE.

On 23 November 2010 13:46, Graham Gower <graham.gower@gmail.com> wrote:
>
> | mipsel-oe-linux-uclibc-gcc -march=3Dmips32 -Wall -isystem/mnt/oe/tmp/sy=
sroots/mipsel-oe-linux-uclibc/include -fexpensive-optimizations -fomit-fram=
e-pointer -frename-registers -Os =A0-L/mnt/oe/tmp/sysroots/mipsel-oe-linux-=
uclibc/lib -Wl,-rpath-link,/mnt/oe/tmp/sysroots/mipsel-oe-linux-uclibc/lib =
-Wl,-O1 -o strace strace.o syscall.o count.o util.o desc.o file.o ipc.o io.=
o ioctl.o mem.o net.o process.o bjm.o quota.o resource.o signal.o sock.o sy=
stem.o term.o time.o proc.o scsi.o stream.o
> | syscall.o:(.data.rel.ro+0x14904): undefined reference to `sys_truncate6=
4'
> | syscall.o:(.data.rel.ro+0x14918): undefined reference to `sys_ftruncate=
64'
> | syscall.o:(.data.rel.ro+0x149a4): undefined reference to `sys_getdents6=
4'
> | syscall.o:(.data.rel.ro+0x14c74): undefined reference to `sys_statfs64'
> | syscall.o:(.data.rel.ro+0x14c88): undefined reference to `sys_fstatfs64=
'
> | collect2: ld returned 1 exit status
> | make[1]: *** [strace] Error 1
>
> Signed-off-by: Graham Gower <graham.gower@gmail.com>
> ---
> =A0.../strace/strace-4.5.20/mips-nolargefile.patch =A0 =A0| =A0 41 ++++++=
++++++++++++++
> =A0recipes/strace/strace_4.5.20.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0| =A0 =A04 ++
> =A02 files changed, 45 insertions(+), 0 deletions(-)
> =A0create mode 100644 recipes/strace/strace-4.5.20/mips-nolargefile.patch
>
> diff --git a/recipes/strace/strace-4.5.20/mips-nolargefile.patch b/recipe=
s/strace/strace-4.5.20/mips-nolargefile.patch
> new file mode 100644
> index 0000000..6132356
> --- /dev/null
> +++ b/recipes/strace/strace-4.5.20/mips-nolargefile.patch
> @@ -0,0 +1,41 @@
> +--- strace-4.5.20/linux/mips/syscallent.h.orig 2010-11-23 13:25:49.00000=
0000 +1030
> ++++ strace-4.5.20/linux/mips/syscallent.h =A0 =A0 =A02010-11-23 13:28:23=
.000000000 +1030
> +@@ -4213,15 +4213,24 @@
> + =A0 =A0 =A0 { 0, =A0 =A00, =A0 =A0 =A0printargs, =A0 =A0 =A0 =A0 =A0 =
=A0 =A0"SYS_4208" =A0 =A0 =A0}, /* 4208 */
> + =A0 =A0 =A0 { 0, =A0 =A00, =A0 =A0 =A0printargs, =A0 =A0 =A0 =A0 =A0 =
=A0 =A0"SYS_4209" =A0 =A0 =A0}, /* 4209 */
> + =A0 =A0 =A0 { 6, =A0 =A00, =A0 =A0 =A0sys_mmap, =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 "mmap" =A0 =A0 =A0 =A0 =A0}, /* 4210 */
> ++#ifdef _LFS64_LARGEFILE
> + =A0 =A0 =A0 { 4, =A0 =A0TF, =A0 =A0 sys_truncate64, =A0 =A0 =A0 =A0 "tr=
uncate64" =A0 =A0}, /* 4211 */
> + =A0 =A0 =A0 { 4, =A0 =A0TD, =A0 =A0 sys_ftruncate64, =A0 =A0 =A0 =A0"ft=
runcate64" =A0 }, /* 4212 */
> ++#else
> ++ =A0 =A0 =A0{ 4, =A0 =A0TF, =A0 =A0 printargs, =A0 =A0 =A0 =A0 =A0 =A0 =
=A0"truncate64" =A0 =A0}, /* 4211 */
> ++ =A0 =A0 =A0{ 4, =A0 =A0TD, =A0 =A0 printargs, =A0 =A0 =A0 =A0 =A0 =A0 =
=A0"ftruncate64" =A0 }, /* 4212 */
> ++#endif
> + =A0 =A0 =A0 { 2, =A0 =A0TF, =A0 =A0 printargs, =A0 =A0 =A0 =A0 =A0 =A0 =
=A0"stat64" =A0 =A0 =A0 =A0}, /* 4213 */
> + =A0 =A0 =A0 { 2, =A0 =A0TF, =A0 =A0 sys_lstat64, =A0 =A0 =A0 =A0 =A0 =
=A0"lstat64" =A0 =A0 =A0 }, /* 4214 */
> + =A0 =A0 =A0 { 2, =A0 =A0TD, =A0 =A0 sys_fstat64, =A0 =A0 =A0 =A0 =A0 =
=A0"fstat64" =A0 =A0 =A0 }, /* 4215 */
> + =A0 =A0 =A0 { 2, =A0 =A0TF, =A0 =A0 sys_pivotroot, =A0 =A0 =A0 =A0 =A0"=
pivot_root" =A0 =A0}, /* 4216 */
> + =A0 =A0 =A0 { 3, =A0 =A00, =A0 =A0 =A0printargs, =A0 =A0 =A0 =A0 =A0 =
=A0 =A0"mincore" =A0 =A0 =A0 }, /* 4217 */
> + =A0 =A0 =A0 { 3, =A0 =A00, =A0 =A0 =A0sys_madvise, =A0 =A0 =A0 =A0 =A0 =
=A0"madvise" =A0 =A0 =A0 }, /* 4218 */
> ++#ifdef _LFS64_LARGEFILE
> + =A0 =A0 =A0 { 3, =A0 =A0TF, =A0 =A0 sys_getdents64, =A0 =A0 =A0 =A0 "ge=
tdents64" =A0 =A0}, /* 4219 */
> ++#else
> ++ =A0 =A0 =A0{ 3, =A0 =A0TF, =A0 =A0 printargs, =A0 =A0 =A0 =A0 =A0 =A0 =
=A0"getdents64" =A0 =A0}, /* 4219 */
> ++#endif
> + =A0 =A0 =A0 { 3, =A0 =A0TD, =A0 =A0 sys_fcntl, =A0 =A0 =A0 =A0 =A0 =A0 =
=A0"fcntl64" =A0 =A0 =A0 }, /* 4220 */
> + =A0 =A0 =A0 { 0, =A0 =A00, =A0 =A0 =A0printargs, =A0 =A0 =A0 =A0 =A0 =
=A0 =A0"SYS_4221" =A0 =A0 =A0}, /* 4221 */
> + =A0 =A0 =A0 { 0, =A0 =A00, =A0 =A0 =A0printargs, =A0 =A0 =A0 =A0 =A0 =
=A0 =A0"gettid" =A0 =A0 =A0 =A0}, /* 4222 */
> +@@ -4257,8 +4266,13 @@
> + =A0 =A0 =A0 { 1, =A0 =A00, =A0 =A0 =A0printargs, =A0 =A0 =A0 =A0 =A0 =
=A0 =A0"set_tid_address"}, /* 4252 */
> + =A0 =A0 =A0 { 0, =A0 =A00, =A0 =A0 =A0sys_restart_syscall, =A0 =A0"rest=
art_syscall"}, /* 4253 */
> + =A0 =A0 =A0 { 6, =A0 =A00, =A0 =A0 =A0sys_fadvise64_64, =A0 =A0 =A0 "fa=
dvise64_64" =A0}, /* 4254 */
> ++#ifdef _LFS64_LARGEFILE
> + =A0 =A0 =A0 { 3, =A0 =A0TF, =A0 =A0 sys_statfs64, =A0 =A0 =A0 =A0 =A0 "=
statfs64" =A0 =A0 =A0}, /* 4255 */
> + =A0 =A0 =A0 { 2, =A0 =A0TD, =A0 =A0 sys_fstatfs64, =A0 =A0 =A0 =A0 =A0"=
fstatfs64" =A0 =A0 }, /* 4256 */
> ++#else
> ++ =A0 =A0 =A0{ 3, =A0 =A0TF, =A0 =A0 printargs, =A0 =A0 =A0 =A0 =A0 =A0 =
=A0"statfs64" =A0 =A0 =A0}, /* 4255 */
> ++ =A0 =A0 =A0{ 2, =A0 =A0TD, =A0 =A0 printargs, =A0 =A0 =A0 =A0 =A0 =A0 =
=A0"fstatfs64" =A0 =A0 }, /* 4256 */
> ++#endif
> + =A0 =A0 =A0 { 3, =A0 =A00, =A0 =A0 =A0sys_timer_create, =A0 =A0 =A0 "ti=
mer_create" =A0}, /* 4257 */
> + =A0 =A0 =A0 { 4, =A0 =A00, =A0 =A0 =A0sys_timer_settime, =A0 =A0 =A0"ti=
mer_settime" }, /* 4258 */
> + =A0 =A0 =A0 { 2, =A0 =A00, =A0 =A0 =A0sys_timer_gettime, =A0 =A0 =A0"ti=
mer_gettime" }, /* 4259 */
> diff --git a/recipes/strace/strace_4.5.20.bb b/recipes/strace/strace_4.5.=
20.bb
> index 873ce52..2fd5170 100644
> --- a/recipes/strace/strace_4.5.20.bb
> +++ b/recipes/strace/strace_4.5.20.bb
> @@ -4,9 +4,13 @@ LICENSE =3D "GPL"
> =A0PR =3D "r0"
>
> =A0DEFAULT_PREFERENCE =3D "-1"
> +DEFAULT_PREFERENCE_mipsel_uclibc =3D "1"
> +DEFAULT_PREFERENCE_mips_uclibc =3D "1"
>
> =A0SRC_URI =3D "${SOURCEFORGE_MIRROR}/strace/strace-${PV}.tar.bz2 \
> =A0 =A0 =A0 =A0 =A0 "
> +SRC_URI_append_mipsel +=3D " file://mips-nolargefile.patch "
> +SRC_URI_append_mips +=3D " file://mips-nolargefile.patch "
>
> =A0inherit autotools
>
> --
> 1.7.1
>
>


