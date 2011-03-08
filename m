Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lazy.gopher@gmail.com>) id 1PwrER-0004Tx-1X
	for openembedded-devel@lists.openembedded.org;
	Tue, 08 Mar 2011 08:21:23 +0100
Received: by fxm8 with SMTP id 8so4871497fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Mar 2011 23:19:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=5/uPCn7UzKU9ItnqyxCvgQ+K1mrQyhOQLsNZQ3JoWtA=;
	b=ahFTzndT4hRz1Rmr4AC/zHXWHGut7fw1MHxwpYa9bU8vs7zog6Hpg9JZaGz4fTr/PF
	91XrIpJ4qcAX3lZZ66xC+bj+YSdvVYCVXs0BWg3nR3PAuo3ksawmkeJc5RVnHTqMtOHY
	ZMujhOh3R3YAtcQcEM8GM8/doTsjqMt5OHQwM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=I2mHaEFVYhzh6XoYTdHoz9V+m/qX5GWcQmg4BjXAHoaUGfaaF4HJDJklzK9bot2Fl4
	e9Tp67wTbL/C7rCu18EPAcw65ASHwZ1nzaeZovBobkYBV8y8K93+g/SDB1f/Si+cmj93
	npcVfhZi9RW+D1zkv3VB3SIJyHih52rpBH9YA=
MIME-Version: 1.0
Received: by 10.223.15.152 with SMTP id k24mr3455273faa.96.1299568789314; Mon,
	07 Mar 2011 23:19:49 -0800 (PST)
Received: by 10.223.117.197 with HTTP; Mon, 7 Mar 2011 23:19:49 -0800 (PST)
In-Reply-To: <4D756D6B.9020108@mlbassoc.com>
References: <4D756D6B.9020108@mlbassoc.com>
Date: Tue, 8 Mar 2011 08:19:49 +0100
Message-ID: <AANLkTik0XeJtatUiKjWxKnkd6X=MGwQnf9Pm3_SKhqk=@mail.gmail.com>
From: Maksym Parkachov <lazy.gopher@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Can't build gstreamer-ti
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
X-List-Received-Date: Tue, 08 Mar 2011 07:21:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Gary,

I had the same problem, see this thread:

http://www.mail-archive.com/angstrom-distro-devel@linuxtogo.org/msg04160.ht=
ml

Regards,
Maksym.

On Tue, Mar 8, 2011 at 12:42 AM, Gary Thomas <gary@mlbassoc.com> wrote:
> Using org.openembedded.dev (mainline)
> 569c6db89e7bf06882bd581aa3c4e2862d0eb93d
> =C2=A0DISTRO =3D "angstrom-2010.x"
> =C2=A0MACHINE =3D "beagleboard"
>
> bitbake gstreamer-ti fails with:
> =C2=A0| /bin/sh ../arm-angstrom-linux-gnueabi-libtool --tag=3DCC =C2=A0 -=
-mode=3Dlink
> arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon
> -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb
> --sysroot=3D/work/local/Angstrom_BeagleBoard/tmp/sysroots/armv7a-angstrom=
-linux-gnueabi
> -pthread
> -I/work/local/Angstrom_BeagleBoard/tmp/sysroots/armv7a-angstrom-linux-gnu=
eabi/usr/include/gstreamer-0.10
> -I/work/local/Angstrom_BeagleBoard/tmp/sysroots/armv7a-angstrom-linux-gnu=
eabi/usr/include/glib-2.0
> -I/work/local/Angstrom_BeagleBoard/tmp/sysroots/armv7a-angstrom-linux-gnu=
eabi/usr/lib/glib-2.0/include
> -I/work/local/Angstrom_BeagleBoard/tmp/sysroots/armv7a-angstrom-linux-gnu=
eabi/usr/include/libxml2
> =C2=A0 =C2=A0-Wall =C2=A0-march=3Darmv5t
> -I"/work/local/Angstrom_BeagleBoard/tmp/work/beagleboard-angstrom-linux-g=
nueabi/gstreamer-ti-svnr822-r83+r100/gstreamer_ti/ti_build/ticodecplugin/sr=
c"
> -I"/work/local/Angstrom_BeagleBoard/tmp/sysroots/beagleboard-angstrom-lin=
ux-gnueabi/usr/share/ti/ti-xdctools-tree/packages"
> -I"/work/local/Angstrom_BeagleBoard/tmp/sysroots/beagleboard-angstrom-lin=
ux-gnueabi/usr/share/ti/ti-dsplink-tree"
> -I"/work/local/Angstrom_BeagleBoard/tmp/sysroots/beagleboard-angstrom-lin=
ux-gnueabi/usr/share/ti/ti-framework-components-tree/packages"
> -I"/work/local/Angstrom_BeagleBoard/tmp/sysroots/beagleboard-angstrom-lin=
ux-gnueabi/usr/share/ti/ti-codec-engine-tree/packages"
> -I"/work/local/Angstrom_BeagleBoard/tmp/sysroots/beagleboard-angstrom-lin=
ux-gnueabi/usr/share/ti/ti-xdais-tree/packages"
> -I"/work/local/Angstrom_BeagleBoard/tmp/sysroots/beagleboard-angstrom-lin=
ux-gnueabi/usr/share/ti/ti-codecs-tree/packages"
> -I"/work/local/Angstrom_BeagleBoard/tmp/sysroots/beagleboard-angstrom-lin=
ux-gnueabi/usr/share/ti/ti-linuxutils-tree/packages"
> -I"/work/local/Angstrom_BeagleBoard/tmp/sysroots/beagleboard-angstrom-lin=
ux-gnueabi/usr/share/ti/ti-dmai-tree/packages"
> -I"/work/local/Angstrom_BeagleBoard/tmp/sysroots/beagleboard-angstrom-lin=
ux-gnueabi/usr/share/ti/ti-local-power-manager-tree/packages"
> -I"/work/local/Angstrom_BeagleBoard/tmp/sysroots/beagleboard-angstrom-lin=
ux-gnueabi/usr/share/ti/ti-edma3lld-tree/packages"
> -I"/work/local/Angstrom_BeagleBoard/tmp/sysroots/beagleboard-angstrom-lin=
ux-gnueabi/usr/share/ti/ti-c6accel-tree/soc/c6accelw"
> -I"/work/local/Angstrom_BeagleBoard/tmp/sysroots/beagleboard-angstrom-lin=
ux-gnueabi/usr/share/ti/ti-c6accel-tree/soc/packages"
> -I"/work/local/Angstrom_BeagleBoard/tmp/sysroots/beagleboard-angstrom-lin=
ux-gnueabi/usr/share/ti/ti-xdctools-tree/packages"
> -I"/work/local/Angstrom_BeagleBoard/tmp/work/beagleboard-angstrom-linux-g=
nueabi/gstreamer-ti-svnr822-r83+r100/gstreamer_ti/ti_build/ticodecplugin/sr=
c/gstticodecplugin_omap3530/.."
> =C2=A0-Dxdc_target_types__=3D"gnu/targets/arm/std.h" -Dxdc_target_name__=
=3DGCArmv5T
> -Dxdc_cfg__header__=3D"/work/local/Angstrom_BeagleBoard/tmp/work/beaglebo=
ard-angstrom-linux-gnueabi/gstreamer-ti-svnr822-r83+r100/gstreamer_ti/ti_bu=
ild/ticodecplugin/src/gstticodecplugin_omap3530/package/cfg/gstticodecplugi=
n_omap3530_xv5T.h"
> -I/work/local/Angstrom_BeagleBoard/tmp/sysroots/beagleboard-angstrom-linu=
x-gnueabi/kernel/include
> -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2 -gg=
db2
> -module -avoid-version -export-symbols-regex _*\(gst_\|Gst\|GST_\).*
> -Wl,-T,gstticodecplugin_omap3530/linker.cmd
> -Wl,/work/local/Angstrom_BeagleBoard/tmp/sysroots/beagleboard-angstrom-li=
nux-gnueabi/usr/share/ti/ti-c6accel-tree/soc/c6accelw/lib/c6accelw_omap3530=
.a470MV
> -Wl,-O1 -Wl,--hash-style=3Dgnu -o libgstticodecplugin.la -rpath
> /usr/lib/gstreamer-0.10 libgstticodecplugin_la-gstticodecplugin.lo
> libgstticodecplugin_la-gsttiauddec1.lo
> libgstticodecplugin_la-gsttividdec2.lo
> libgstticodecplugin_la-gsttiimgenc1.lo
> libgstticodecplugin_la-gsttiimgdec1.lo
> libgstticodecplugin_la-gsttidmaibuffertransport.lo
> libgstticodecplugin_la-gsttidmaibuftab.lo
> libgstticodecplugin_la-gstticircbuffer.lo
> libgstticodecplugin_la-gsttidmaivideosink.lo
> libgstticodecplugin_la-gstticodecs.lo
> libgstticodecplugin_la-gstticodecs_platform.lo
> libgstticodecplugin_la-gsttiquicktime_aac.lo
> libgstticodecplugin_la-gsttiquicktime_h264.lo
> libgstticodecplugin_la-gsttividenc1.lo
> libgstticodecplugin_la-gsttiaudenc1.lo
> libgstticodecplugin_la-gstticommonutils.lo
> libgstticodecplugin_la-gsttividresize.lo
> libgstticodecplugin_la-gsttidmaiperf.lo
> libgstticodecplugin_la-gsttiquicktime_mpeg4.lo
> libgstticodecplugin_la-gsttic6xcolorspace.lo
> libgstticodecplugin_la-omapfb.lo yuv.lo -pthread -lgstreamer-0.10
> -lgobject-2.0 -lgmodule-2.0 -lxml2 -lgthread-2.0 -lrt -lglib-2.0 =C2=A0 -=
pthread
> -lgstbase-0.10 -lgstreamer-0.10 -lgobject-2.0 -lgmodule-2.0 -lxml2
> -lgthread-2.0 -lrt -lglib-2.0 =C2=A0 =C2=A0-lgstvideo-0.10 -lgstaudio-0.1=
0 -lm =C2=A0-lX11
> =C2=A0| arm-angstrom-linux-gnueabi-libtool: link: warning: library
> `/work/local/Angstrom_BeagleBoard/tmp/sysroots/armv7a-angstrom-linux-gnue=
abi/usr/lib/libgstbase-0.10.la'
> was moved.
> =C2=A0| /bin/grep:
> /work/local/Angstrom_BeagleBoard/tmp/sysroots/beagleboard-angstrom-linux-=
gnueabi/usr/lib/libgstreamer-0.10.la:
> No such file or directory
> =C2=A0| /bin/sed: can't read
> /work/local/Angstrom_BeagleBoard/tmp/sysroots/beagleboard-angstrom-linux-=
gnueabi/usr/lib/libgstreamer-0.10.la:
> No such file or directory
> =C2=A0| arm-angstrom-linux-gnueabi-libtool: link:
> `/work/local/Angstrom_BeagleBoard/tmp/sysroots/beagleboard-angstrom-linux=
-gnueabi/usr/lib/libgstreamer-0.10.la'
> is not a valid libtool archive
>
> Any ideas how to fix this?
>
> Thanks
>
> --
> ------------------------------------------------------------
> Gary Thomas =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=
=A0Consulting for the
> MLB Associates =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =
=C2=A0Embedded world
> ------------------------------------------------------------
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


