Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RT75o-0007Vd-Ne
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Nov 2011 08:18:05 +0100
Received: by ywb20 with SMTP id 20so939552ywb.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Nov 2011 23:11:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=I0kA0qcDa5yjE0XxQ8vwDTA5P5HZYeTlJBoBKNOITYw=;
	b=ImRXDbwy7jLuQK66OHJ5QmlqjCGRLHNweTJ+BVtHF2cb/qn4wcDOkAgoI7W9qcb9v+
	mu5VCCwaRK7HB998lkzpgTQwpMkw8CY834b3hWVn/3zQWoSKzII8V5k295qygI7ram/5
	mRSS2ZsFIkqlGMLfbIoICyBCHx4MymsNOOWoI=
MIME-Version: 1.0
Received: by 10.236.193.68 with SMTP id j44mr31781029yhn.97.1322032291877;
	Tue, 22 Nov 2011 23:11:31 -0800 (PST)
Received: by 10.150.157.15 with HTTP; Tue, 22 Nov 2011 23:11:31 -0800 (PST)
In-Reply-To: <20111121131845.D1E9910337@opal>
References: <20111121131845.D1E9910337@opal>
Date: Wed, 23 Nov 2011 08:11:31 +0100
Message-ID: <CA+chaQdUFUswZg-aYtWdEiF0C3fVFtrmMP8uH+AMKtbH2yGkKg@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [oe-commits] Koen Kooi : abiword: update to 2.8.6
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
X-List-Received-Date: Wed, 23 Nov 2011 07:18:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

With 2.8.6 I get

| make[3]: Entering directory
`/OE/shr-core/tmp/work/armv7a-vfp-neon-oe-linux-gnueabi/abiword-2.8.6-r0/ab=
iword-2.8.6/src'
| /bin/sh ../arm-oe-linux-gnueabi-libtool --tag=3DCXX   --mode=3Dlink
arm-oe-linux-gnueabi-g++  -march=3Darmv7-a -fno-tree-vectorize
-mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8
--sysroot=3D/OE/shr-core/tmp/sysroots/nokia900  -O2 -pipe -g
-feliminate-unused-debug-types -fpermissive
-fvisibility-inlines-hidden  --no-undefined -avoid-version
-export-dynamic -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -o
abiword abiword-UnixMain.o libabiword-2.8.la  -pthread -lfribidi -lwv
-lpng -lgsf-1 -lxml2 -lenchant -lz -lgtk-x11-2.0 -lgdk-x11-2.0
-latk-1.0 -lpangoft2-1.0 -lpangocairo-1.0 -lpango-1.0 -lfreetype
-lfontconfig -lrsvg-2 -lm -lgio-2.0 -lgdk_pixbuf-2.0 -lcairo
-lgmodule-2.0 -lgobject-2.0 -lgthread-2.0 -lrt -lglib-2.0   -ljpeg
| arm-oe-linux-gnueabi-libtool: link: arm-oe-linux-gnueabi-g++
-march=3Darmv7-a -fno-tree-vectorize -mthumb-interwork
-mfloat-abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8
--sysroot=3D/OE/shr-core/tmp/sysroots/nokia900 -O2 -pipe -g
-feliminate-unused-debug-types -fpermissive
-fvisibility-inlines-hidden --no-undefined -Wl,-O1
-Wl,--hash-style=3Dgnu -Wl,--as-needed -o .libs/abiword
abiword-UnixMain.o -pthread -Wl,--export-dynamic
./.libs/libabiword-2.8.so -L=3D/usr/lib
/OE/shr-core/tmp/sysroots/nokia900/usr/lib/libfribidi.so
/OE/shr-core/tmp/sysroots/nokia900/usr/lib/libwv.so
/OE/shr-core/tmp/sysroots/nokia900/usr/lib/libgsf-1.so
/OE/shr-core/tmp/sysroots/nokia900/usr/lib/libbz2.so
/OE/shr-core/tmp/sysroots/nokia900/usr/lib/libenchant.so
/OE/shr-core/tmp/sysroots/nokia900/usr/lib/libgtk-x11-2.0.so
/OE/shr-core/tmp/sysroots/nokia900/usr/lib/libgdk-x11-2.0.so
/OE/shr-core/tmp/sysroots/nokia900/usr/lib/libatk-1.0.so
/OE/shr-core/tmp/sysroots/nokia900/usr/lib/librsvg-2.so
/OE/shr-core/tmp/sysroots/nokia900/usr/lib/libxml2.so
/OE/shr-core/tmp/sysroots/nokia900/usr/lib/libpangocairo-1.0.so
/OE/shr-core/tmp/sysroots/nokia900/usr/lib/libpangoft2-1.0.so
/OE/shr-core/tmp/sysroots/nokia900/usr/lib/libstdc++.so
/OE/shr-core/tmp/sysroots/nokia900/usr/lib/libpango-1.0.so
/OE/shr-core/tmp/sysroots/nokia900/usr/lib/libgdk_pixbuf-2.0.so
/OE/shr-core/tmp/sysroots/nokia900/usr/lib/libgio-2.0.so -lresolv
/OE/shr-core/tmp/sysroots/nokia900/usr/lib/libcairo.so
/OE/shr-core/tmp/sysroots/nokia900/usr/lib/libpixman-1.so
/OE/shr-core/tmp/sysroots/nokia900/usr/lib/libfontconfig.so
/OE/shr-core/tmp/sysroots/nokia900/usr/lib/libexpat.so
/OE/shr-core/tmp/sysroots/nokia900/usr/lib/libfreetype.so
/OE/shr-core/tmp/sysroots/nokia900/usr/lib/libpng12.so
/OE/shr-core/tmp/sysroots/nokia900/usr/lib/libXrender.so
/OE/shr-core/tmp/sysroots/nokia900/usr/lib/libX11.so
/OE/shr-core/tmp/sysroots/nokia900/usr/lib/libxcb.so
/OE/shr-core/tmp/sysroots/nokia900/usr/lib/libXau.so
/OE/shr-core/tmp/sysroots/nokia900/usr/lib/libXdmcp.so
/OE/shr-core/tmp/sysroots/nokia900/usr/lib/libERROR: Function
'do_compile' failed (see
/OE/shr-core/tmp/work/armv7a-vfp-neon-oe-linux-gnueabi/abiword-2.8.6-r0/tem=
p/log.do_compile.10916
for further information)
| z.so -lm /OE/shr-core/tmp/sysroots/nokia900/usr/lib/libgmodule-2.0.so
-ldl /OE/shr-core/tmp/sysroots/nokia900/usr/lib/libgobject-2.0.so
/OE/shr-core/tmp/sysroots/nokia900/usr/lib/libffi.so
/OE/shr-core/tmp/sysroots/nokia900/usr/lib/libgthread-2.0.so -lpthread
/OE/shr-core/tmp/sysroots/nokia900/usr/lib/libglib-2.0.so -lrt
/OE/shr-core/tmp/sysroots/nokia900/usr/lib/libjpeg.so -pthread
| arm-oe-linux-gnueabi-g++: error: unrecognized option '--no-undefined'
| make[3]: *** [abiword] Error 1
| make[3]: Leaving directory
`/OE/shr-core/tmp/work/armv7a-vfp-neon-oe-linux-gnueabi/abiword-2.8.6-r0/ab=
iword-2.8.6/src'

Anyone seen this? Looks like missing -Wl, but I didn't look into it
from where I get it.

Maybe it's related to
http://lists.gnu.org/archive/html/libtool/2011-03/msg00015.html and
commiter didn't see it because is using gcc-4.5.

Regards,

On Mon, Nov 21, 2011 at 2:18 PM,  <git@git.openembedded.org> wrote:
> Module: meta-openembedded.git
> Branch: master
> Commit: dea4a2dce2d247dcc9f6233e195b8497039f8547
> URL: =C2=A0 =C2=A0http://git.openembedded.org/?p=3Dmeta-openembedded.git&=
a=3Dcommit;h=3Ddea4a2dce2d247dcc9f6233e195b8497039f8547
>
> Author: Koen Kooi <koen@dominion.thruhere.net>
> Date: =C2=A0 Mon Nov 21 14:15:59 2011 +0100
>
> abiword: update to 2.8.6
>
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>
> ---
>
> =C2=A0.../abiword/abiword-2.5/fix.double.install.patch =C2=A0 | =C2=A0 34=
 -----------
> =C2=A0.../abiword/abiword-embedded_2.5.2.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| =C2=A0 12 ----
> =C2=A0.../abiword/abiword/abiword-cxx-for-ld-fix.patch =C2=A0 | =C2=A0 12=
 ++++
> =C2=A0.../abiword/abiword/autogen-common.sh =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| =C2=A0 28 +++++++++
> =C2=A0meta-gnome/recipes-gnome/abiword/abiword/cdump.pl =C2=A0| =C2=A0 32=
 +++++++++++
> =C2=A0.../recipes-gnome/abiword/abiword/nodolt.patch =C2=A0 =C2=A0 | =C2=
=A0 12 ++++
> =C2=A0meta-gnome/recipes-gnome/abiword/abiword_2.5.2.bb =C2=A0| =C2=A0 =
=C2=A05 --
> =C2=A0meta-gnome/recipes-gnome/abiword/abiword_2.8.6.bb =C2=A0| =C2=A0 59=
 ++++++++++++++++++++
> =C2=A08 files changed, 143 insertions(+), 51 deletions(-)
>
> Diff: =C2=A0 http://git.openembedded.org/?p=3Dmeta-openembedded.git/?a=3D=
commitdiff;h=3Ddea4a2dce2d247dcc9f6233e195b8497039f8547
>
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits
>


