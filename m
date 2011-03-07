Received: from hermes.mlbassoc.com ([64.234.241.98] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1Pwk5x-0001Wm-U7
	for openembedded-devel@lists.openembedded.org;
	Tue, 08 Mar 2011 00:44:10 +0100
Received: by mail.chez-thomas.org (Postfix, from userid 999)
	id 111171660513; Mon,  7 Mar 2011 16:42:37 -0700 (MST)
X-Spam-Checker-Version: SpamAssassin 3.3.2-r929478 (2010-03-31) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2-r929478
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by mail.chez-thomas.org (Postfix) with ESMTP id 616AF16604F5;
	Mon,  7 Mar 2011 16:42:35 -0700 (MST)
Message-ID: <4D756D6B.9020108@mlbassoc.com>
Date: Mon, 07 Mar 2011 16:42:35 -0700
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101209 Fedora/3.1.7-0.35.b3pre.fc13
	Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: Can't build gstreamer-ti
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
X-List-Received-Date: Mon, 07 Mar 2011 23:44:10 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Using org.openembedded.dev (mainline) 569c6db89e7bf06882bd581aa3c4e2862d0eb93d
   DISTRO = "angstrom-2010.x"
   MACHINE = "beagleboard"

bitbake gstreamer-ti fails with:
   | /bin/sh ../arm-angstrom-linux-gnueabi-libtool --tag=CC   --mode=link arm-angstrom-linux-gnueabi-gcc -march=armv7-a -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp 
-mthumb-interwork -mno-thumb --sysroot=/work/local/Angstrom_BeagleBoard/tmp/sysroots/armv7a-angstrom-linux-gnueabi -pthread 
-I/work/local/Angstrom_BeagleBoard/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/gstreamer-0.10 
-I/work/local/Angstrom_BeagleBoard/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/glib-2.0 
-I/work/local/Angstrom_BeagleBoard/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/glib-2.0/include 
-I/work/local/Angstrom_BeagleBoard/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/libxml2    -Wall  -march=armv5t 
-I"/work/local/Angstrom_BeagleBoard/tmp/work/beagleboard-angstrom-linux-gnueabi/gstreamer-ti-svnr822-r83+r100/gstreamer_ti/ti_build/ticodecplugin/src" 
-I"/work/local/Angstrom_BeagleBoard/tmp/sysroots/beagleboard-angstrom-linux-gnueabi/usr/share/ti/ti-xdctools-tree/packages" 
-I"/work/local/Angstrom_BeagleBoard/tmp/sysroots/beagleboard-angstrom-linux-gnueabi/usr/share/ti/ti-dsplink-tree" 
-I"/work/local/Angstrom_BeagleBoard/tmp/sysroots/beagleboard-angstrom-linux-gnueabi/usr/share/ti/ti-framework-components-tree/packages" 
-I"/work/local/Angstrom_BeagleBoard/tmp/sysroots/beagleboard-angstrom-linux-gnueabi/usr/share/ti/ti-codec-engine-tree/packages" 
-I"/work/local/Angstrom_BeagleBoard/tmp/sysroots/beagleboard-angstrom-linux-gnueabi/usr/share/ti/ti-xdais-tree/packages" 
-I"/work/local/Angstrom_BeagleBoard/tmp/sysroots/beagleboard-angstrom-linux-gnueabi/usr/share/ti/ti-codecs-tree/packages" 
-I"/work/local/Angstrom_BeagleBoard/tmp/sysroots/beagleboard-angstrom-linux-gnueabi/usr/share/ti/ti-linuxutils-tree/packages" 
-I"/work/local/Angstrom_BeagleBoard/tmp/sysroots/beagleboard-angstrom-linux-gnueabi/usr/share/ti/ti-dmai-tree/packages" 
-I"/work/local/Angstrom_BeagleBoard/tmp/sysroots/beagleboard-angstrom-linux-gnueabi/usr/share/ti/ti-local-power-manager-tree/packages" 
-I"/work/local/Angstrom_BeagleBoard/tmp/sysroots/beagleboard-angstrom-linux-gnueabi/usr/share/ti/ti-edma3lld-tree/packages" 
-I"/work/local/Angstrom_BeagleBoard/tmp/sysroots/beagleboard-angstrom-linux-gnueabi/usr/share/ti/ti-c6accel-tree/soc/c6accelw" 
-I"/work/local/Angstrom_BeagleBoard/tmp/sysroots/beagleboard-angstrom-linux-gnueabi/usr/share/ti/ti-c6accel-tree/soc/packages" 
-I"/work/local/Angstrom_BeagleBoard/tmp/sysroots/beagleboard-angstrom-linux-gnueabi/usr/share/ti/ti-xdctools-tree/packages" 
-I"/work/local/Angstrom_BeagleBoard/tmp/work/beagleboard-angstrom-linux-gnueabi/gstreamer-ti-svnr822-r83+r100/gstreamer_ti/ti_build/ticodecplugin/src/gstticodecplugin_omap3530/.." 
  -Dxdc_target_types__="gnu/targets/arm/std.h" -Dxdc_target_name__=GCArmv5T 
-Dxdc_cfg__header__="/work/local/Angstrom_BeagleBoard/tmp/work/beagleboard-angstrom-linux-gnueabi/gstreamer-ti-svnr822-r83+r100/gstreamer_ti/ti_build/ticodecplugin/src/gstticodecplugin_omap3530/package/cfg/gstticodecplugin_omap3530_xv5T.h" 
-I/work/local/Angstrom_BeagleBoard/tmp/sysroots/beagleboard-angstrom-linux-gnueabi/kernel/include -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2 -ggdb2 
-module -avoid-version -export-symbols-regex _*\(gst_\|Gst\|GST_\).* -Wl,-T,gstticodecplugin_omap3530/linker.cmd 
-Wl,/work/local/Angstrom_BeagleBoard/tmp/sysroots/beagleboard-angstrom-linux-gnueabi/usr/share/ti/ti-c6accel-tree/soc/c6accelw/lib/c6accelw_omap3530.a470MV -Wl,-O1 
-Wl,--hash-style=gnu -o libgstticodecplugin.la -rpath /usr/lib/gstreamer-0.10 libgstticodecplugin_la-gstticodecplugin.lo libgstticodecplugin_la-gsttiauddec1.lo 
libgstticodecplugin_la-gsttividdec2.lo libgstticodecplugin_la-gsttiimgenc1.lo libgstticodecplugin_la-gsttiimgdec1.lo libgstticodecplugin_la-gsttidmaibuffertransport.lo 
libgstticodecplugin_la-gsttidmaibuftab.lo libgstticodecplugin_la-gstticircbuffer.lo libgstticodecplugin_la-gsttidmaivideosink.lo libgstticodecplugin_la-gstticodecs.lo 
libgstticodecplugin_la-gstticodecs_platform.lo libgstticodecplugin_la-gsttiquicktime_aac.lo libgstticodecplugin_la-gsttiquicktime_h264.lo libgstticodecplugin_la-gsttividenc1.lo 
libgstticodecplugin_la-gsttiaudenc1.lo libgstticodecplugin_la-gstticommonutils.lo libgstticodecplugin_la-gsttividresize.lo libgstticodecplugin_la-gsttidmaiperf.lo 
libgstticodecplugin_la-gsttiquicktime_mpeg4.lo libgstticodecplugin_la-gsttic6xcolorspace.lo libgstticodecplugin_la-omapfb.lo yuv.lo -pthread -lgstreamer-0.10 -lgobject-2.0 
-lgmodule-2.0 -lxml2 -lgthread-2.0 -lrt -lglib-2.0   -pthread -lgstbase-0.10 -lgstreamer-0.10 -lgobject-2.0 -lgmodule-2.0 -lxml2 -lgthread-2.0 -lrt -lglib-2.0    -lgstvideo-0.10 
-lgstaudio-0.10 -lm  -lX11
   | arm-angstrom-linux-gnueabi-libtool: link: warning: library `/work/local/Angstrom_BeagleBoard/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/libgstbase-0.10.la' was moved.
   | /bin/grep: /work/local/Angstrom_BeagleBoard/tmp/sysroots/beagleboard-angstrom-linux-gnueabi/usr/lib/libgstreamer-0.10.la: No such file or directory
   | /bin/sed: can't read /work/local/Angstrom_BeagleBoard/tmp/sysroots/beagleboard-angstrom-linux-gnueabi/usr/lib/libgstreamer-0.10.la: No such file or directory
   | arm-angstrom-linux-gnueabi-libtool: link: `/work/local/Angstrom_BeagleBoard/tmp/sysroots/beagleboard-angstrom-linux-gnueabi/usr/lib/libgstreamer-0.10.la' is not a valid 
libtool archive

Any ideas how to fix this?

Thanks

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


