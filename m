Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Q9Gv8-0004ov-Ix
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Apr 2011 15:12:46 +0200
Received: by yia13 with SMTP id 13so2165905yia.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Apr 2011 06:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=/EI+N8b6fCEdr6dFlc4JIdYTGwY1hOCY9yLlXMn91Go=;
	b=XTq6thjRldfeXMfxu5wHLJoajPGo9VpARNOgnwK78jqtiozh50ao3qVyNN6yavOCyc
	3/ukugCjmoAdt11LEGAhNzJmpOV5DUUcTYTdVtEb1/g065ylMYgQSxMtDYPi3/Oo46+t
	4VCaPfnN+x7Mp/YXqjOwMuR+o3tRkNmPis/oU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	b=It6vOPyRRNMGMsXqc+G6iqcuNfS7vz/+Q8GnLPQnrp3el2gR1OfRtldNGOpJug5ouB
	gGn/zP9AOYLJwOi7xhCMUOr5RodPmfqEZryHpC/EA9sXQNmioK+r/IPBilWcnztidrDc
	RDr7XYrEuSIoEqBbxy0zPuxZCvdlcaBpDcjsI=
MIME-Version: 1.0
Received: by 10.236.109.103 with SMTP id r67mr36173yhg.207.1302527432111; Mon,
	11 Apr 2011 06:10:32 -0700 (PDT)
Received: by 10.147.114.11 with HTTP; Mon, 11 Apr 2011 06:10:32 -0700 (PDT)
In-Reply-To: <1302182396-4171-5-git-send-email-otavio@ossystems.com.br>
References: <1302182396-4171-1-git-send-email-otavio@ossystems.com.br>
	<1302182396-4171-2-git-send-email-otavio@ossystems.com.br>
	<1302182396-4171-3-git-send-email-otavio@ossystems.com.br>
	<1302182396-4171-4-git-send-email-otavio@ossystems.com.br>
	<1302182396-4171-5-git-send-email-otavio@ossystems.com.br>
Date: Mon, 11 Apr 2011 15:10:32 +0200
Message-ID: <BANLkTikvUTiJSFKYAcD3X9tgFTwVu+X8Bg@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [PATCH 4/6] xserver-xorg (1.9.4): enable xephyr
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
X-List-Received-Date: Mon, 11 Apr 2011 13:12:46 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 7, 2011 at 3:19 PM, Otavio Salvador <otavio@ossystems.com.br> w=
rote:
> ---
> =A0recipes/xorg-xserver/xserver-xorg_1.9.4.bb | =A0 =A04 ++--
> =A01 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/recipes/xorg-xserver/xserver-xorg_1.9.4.bb b/recipes/xorg-xs=
erver/xserver-xorg_1.9.4.bb
> index 89e7a03..cc2dc43 100644
> --- a/recipes/xorg-xserver/xserver-xorg_1.9.4.bb
> +++ b/recipes/xorg-xserver/xserver-xorg_1.9.4.bb
> @@ -6,7 +6,7 @@ require xorg-xserver-common.inc
> =A0DESCRIPTION =3D "the X.Org X server"
> =A0DEPENDS +=3D "pixman libpciaccess openssl dri2proto glproto xorg-minim=
al-fonts font-util-native"
> =A0PE =3D "2"
> -PR =3D "${INC_PR}.0"
> +PR =3D "${INC_PR}.1"
>
> =A0SRC_URI +=3D " \
> =A0 =A0 =A0 =A0 =A0 =A0 file://dolt-fix.patch \
> @@ -25,7 +25,7 @@ do_install_prepend() {
> =A0PACKAGE_ARCH_ion =3D "${MACHINE_ARCH}"
> =A0XINERAMA =3D "${@['--disable-xinerama','--enable-xinerama'][bb.data.ge=
tVar('MACHINE',d) in ['ion']]}"
>
> -EXTRA_OECONF +=3D " ${CONFIG_MANAGER_OPTION} ${XINERAMA} --disable-kdriv=
e --disable-xephyr --disable-xsdl --disable-xfake --disable-xfbdev --disabl=
e-dmx"
> +EXTRA_OECONF +=3D " ${CONFIG_MANAGER_OPTION} ${XINERAMA} --disable-xsdl =
--disable-xfake --disable-xfbdev --disable-dmx"
> =A0EXTRA_OECONF +=3D " --enable-dri2 --disable-unit-tests --disable-docs =
--disable-devel-docs"
>
> =A0export LDFLAGS +=3D " -ldl "

I don't remember exact error I got when I was disabling it few months
ago, but today I've tried to enable it with your patch and got ICE

| make[3]: Leaving directory
`/OE/tmpdir-shr/work/armv4t-oe-linux-gnueabi/xserver-xorg-2_1.10.0.902-r19.=
0+gitr0+ec6e1e45627de2bb851f135df0507a360d0d99e6/git/hw/kdrive/linux'
| Making all in ephyr
| make[3]: Entering directory
`/OE/tmpdir-shr/work/armv4t-oe-linux-gnueabi/xserver-xorg-2_1.10.0.902-r19.=
0+gitr0+ec6e1e45627de2bb851f135df0507a360d0d99e6/git/hw/kdrive/ephyr'
| Making all in man
| make[4]: Entering directory
`/OE/tmpdir-shr/work/armv4t-oe-linux-gnueabi/xserver-xorg-2_1.10.0.902-r19.=
0+gitr0+ec6e1e45627de2bb851f135df0507a360d0d99e6/git/hw/kdrive/ephyr/man'
|   GEN    Xephyr.1
| make[4]: Leaving directory
`/OE/tmpdir-shr/work/armv4t-oe-linux-gnueabi/xserver-xorg-2_1.10.0.902-r19.=
0+gitr0+ec6e1e45627de2bb851f135df0507a360d0d99e6/git/hw/kdrive/ephyr/man'
| make[4]: Entering directory
`/OE/tmpdir-shr/work/armv4t-oe-linux-gnueabi/xserver-xorg-2_1.10.0.902-r19.=
0+gitr0+ec6e1e45627de2bb851f135df0507a360d0d99e6/git/hw/kdrive/ephyr'
|   CC     hostx.lo
|   CC     ephyrvideo.lo
|   CC     ephyrhostvideo.lo
| ephyrhostvideo.c: In function 'ephyrHostXVLogXErrorEvent':
| ephyrhostvideo.c:141:5: warning: format not a string literal,
argument types not checked
| ephyrhostvideo.c:160:9: warning: format not a string literal,
argument types not checked
| ephyrhostvideo.c:192:13: warning: format not a string literal,
argument types not checked
| ephyrhostvideo.c:220:9: warning: format not a string literal,
argument types not checked
| ephyrhostvideo.c:226:5: warning: format not a string literal,
argument types not checked
| ephyrhostvideo.c:230:5: warning: format not a string literal,
argument types not checked
| ephyrvideo.c: In functionERROR: Function 'do_compile' failed (see
/OE/tmpdir-shr/work/armv4t-oe-linux-gnueabi/xserver-xorg-2_1.10.0.902-r19.0=
+gitr0+ec6e1e45627de2bb851f135df0507a360d0d99e6/temp/log.do_compile.22901
for further information)
|  'ephyrGetStill':
| ephyrvideo.c:1243:1: internal compiler error: in
default_secondary_reload, at targhooks.c:762
| Please submit a full bug report,
| with preprocessed source if appropriate.
| See <http://gcc.gnu.org/bugs.html> for instructions.
| make[4]: *** [ephyrvideo.lo] Error 1
| make[4]: *** Waiting for unfinished jobs....
| make[4]: Leaving directory
`/OE/tmpdir-shr/work/armv4t-oe-linux-gnueabi/xserver-xorg-2_1.10.0.902-r19.=
0+gitr0+ec6e1e45627de2bb851f135df0507a360d0d99e6/git/hw/kdrive/ephyr'
| make[3]: *** [all-recursive] Error 1
| make[3]: Leaving directory
`/OE/tmpdir-shr/work/armv4t-oe-linux-gnueabi/xserver-xorg-2_1.10.0.902-r19.=
0+gitr0+ec6e1e45627de2bb851f135df0507a360d0d99e6/git/hw/kdrive/ephyr'
| make[2]: *** [all-recursive] Error 1
| make[2]: Leaving directory
`/OE/tmpdir-shr/work/armv4t-oe-linux-gnueabi/xserver-xorg-2_1.10.0.902-r19.=
0+gitr0+ec6e1e45627de2bb851f135df0507a360d0d99e6/git/hw/kdrive'
| make[1]: *** [all-recursive] Error 1
| make[1]: Leaving directory
`/OE/tmpdir-shr/work/armv4t-oe-linux-gnueabi/xserver-xorg-2_1.10.0.902-r19.=
0+gitr0+ec6e1e45627de2bb851f135df0507a360d0d99e6/git/hw'
| make: *** [all-recursive] Error 1
| + die 'oe_runmake failed'
| + oefatal 'oe_runmake failed'
| + echo FATAL: 'oe_runmake failed'
| FATAL: oe_runmake failed
| + exit 1
NOTE: package xserver-xorg-2_1.10.0.902-r19.0+gitr0+ec6e1e45627de2bb851f135=
df0507a360d0d99e6:
task do_compile: Failed
ERROR: Task 14 (/OE/dev/recipes/xorg-xserver/xserver-xorg_git.bb,
do_compile) failed with exit code '1'
ERROR: '/OE/dev/recipes/xorg-xserver/xserver-xorg_git.bb' failed

are you using sane-toolchain with gcc-4.5?

Regards,


