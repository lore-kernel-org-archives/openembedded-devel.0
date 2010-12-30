Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PYP61-0000xX-LA for openembedded-devel@lists.openembedded.org;
	Thu, 30 Dec 2010 21:27:37 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PYP5m-0007lx-G2 for openembedded-devel@lists.openembedded.org;
	Thu, 30 Dec 2010 21:27:22 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Dec 2010 21:27:22 +0100
Received: from k.kooi by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Dec 2010 21:27:22 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 30 Dec 2010 21:27:11 +0100
Message-ID: <ifipuv$nbt$1@dough.gmane.org>
References: <4D1C4E4A.5000705@eukrea.com>
	<ifhrie$a01$1@dough.gmane.org>	<ifije4$p3n$1@dough.gmane.org>
	<4D1CD8F2.6000209@eukrea.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.15) Gecko/20101031 Shredder/3.0.11pre
In-Reply-To: <4D1CD8F2.6000209@eukrea.com>
X-Enigmail-Version: 1.0.1
Subject: Re: ti-c6accel-1_01_00_01: link error
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
X-List-Received-Date: Thu, 30 Dec 2010 20:27:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 30-12-10 20:09, Eric Bénard wrote:
> Hi Koen,
> 
> same problems exists with ti-dmai (which also shows another one as a
> bonus ;-)
> 
> oe master + angstrom-2010.x + beagleboard leads to :
> 
> .../... /usr/include -Dxdc_target_name__=arm/GCArmv5T -g -Wall -Werror
> -c -o obj/linux/Capture.omap3530.o470MV linux/Capture.c
> cc1: warnings being treated as errors
> In file included from
> /home/ebenard/OMAP/2010/angstrom-setup-scripts/build/tmp-angstrom_2010_x/sysroots/beagleboard-angstrom-linux-gnueabi/kernel/include/linux/videodev2.h:66:0,
> 
>                  from linux/Capture.c:43:
> /home/ebenard/OMAP/2010/angstrom-setup-scripts/build/tmp-angstrom_2010_x/sysroots/beagleboard-angstrom-linux-gnueabi/kernel/include/linux/types.h:13:2:
> error: #warning "Attempt to use kernel headers from user space, see
> http://kernelnewbies.org/KernelHeaders"
> make[1]: *** [obj/linux/Capture.omap3530.o470MV] Error 1
> 
> this can be "fixed" by removing -Werror in the makefile but then I meet
> the same problem as with ti-c6accel :
> 
> Linking linux/audio_decode1_omap3530.x470MV from appMain.omap3530.o470MV
> linux/main.omap3530.o470MV linux/audio_decode1_omap3530_config/linker.cmd..
> /home/ebenard/OMAP/2010/angstrom-setup-scripts/build/tmp-angstrom_2010_x/sysroots/i686-linux/usr/armv7a/bin/arm-angstrom-linux-gnueabi-gcc
>  -lpthread -lm
> -L/home/ebenard/OMAP/2010/angstrom-setup-scripts/build/tmp-angstrom_2010_x/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib
> -lasound -Wl,-Map,linux/audio_decode1_omap3530.x470MV.map -o
> linux/audio_decode1_omap3530.x470MV appMain.omap3530.o470MV
> linux/main.omap3530.o470MV linux/audio_decode1_omap3530_config/linker.cmd
> /home/ebenard/OMAP/2010/angstrom-setup-scripts/build/tmp-angstrom_2010_x/sysroots/i686-linux/usr/armv7a/lib/gcc/arm-angstrom-linux-gnueabi/4.5.3/../../../../arm-angstrom-linux-gnueabi/bin/ld:
> warning: linux/audio_decode1_omap3530_config/linker.cmd contains output
> sections; did you forget -T?
> /home/ebenard/OMAP/2010/angstrom-setup-scripts/build/tmp-angstrom_2010_x/sysroots/i686-linux/usr/armv7a/lib/gcc/arm-angstrom-linux-gnueabi/4.5.3/../../../../arm-angstrom-linux-gnueabi/bin/ld:
> .gnu.attributes not found for insert
> collect2: ld returned 1 exit status

If you build the new xdctools with the linker hack (
http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=7993e4ca7746a4ca9e7116cc76e6c1da32a76690
) then you only need a few changes to make it all build:

1) edit
conf/distro/include/angstrom-codec-engine-latest-preferred-versions.inc:

- -PREFERRED_VERSION_ti-linuxutils = "2_25_05_11"
+PREFERRED_VERSION_ti-linuxutils = "2_26_01_02"

- -PREFERRED_VERSION_ti-xdctools = "3_20_05_76"
+PREFERRED_VERSION_ti-xdctools = "3_20_06_81"

2) Add -fPIC to C_FLAGS in the c6accel soc/ Makefiles (plural)

3) remove -Werror from DMAI makefiles

4) remove -Werror from gstreamer-ti makefiles

That will get you a succesfull build, but you will have some runtime
problems. My current goal is to get c6accel working on my USRP E100 so
gnuradio can use that, so gst-ti is out of scope for that.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNHOseMkyGM64RGpERAvFLAKCRUN2pJozNFVUR5Z/dR4vcut6sqQCfTXFR
W+ztBNtzo3I2C70qMexOVV8=
=U6CK
-----END PGP SIGNATURE-----



