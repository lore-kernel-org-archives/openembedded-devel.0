Received: from iwavesystems.com ([124.124.219.234] helo=mail.iwavesystems.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <robinpv@iwavesystems.com>) id 1NX8UY-0005hB-EF
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Jan 2010 08:27:13 +0100
Received: from [192.168.2.45] (ABTS-KK-Static-ILP-150.152.181.122.airtel.in
	[122.181.152.150] (may be forged)) (authenticated bits=0)
	by mail.iwavesystems.com (8.13.6/8.13.6) with ESMTP id o0J7K0of008192
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Jan 2010 12:50:01 +0530
From: robin <robinpv@iwavesystems.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 Jan 2010 12:49:42 +0530
Message-ID: <1263885582.2678.7.camel@ubuntu-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-iwavesystems.com-MailScanner-Information: Please contact the ISP for more
	information
X-iwavesystems.com-MailScanner: Found to be clean
X-iwavesystems.com-MailScanner-From: robinpv@iwavesystems.com
X-SA-Exim-Connect-IP: 124.124.219.234
X-SA-Exim-Mail-From: robinpv@iwavesystems.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Error in "bitbake libgles-omap3"
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
X-List-Received-Date: Tue, 19 Jan 2010 07:27:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

When i did "bitbake libgles-omap3", the OMAP35x_Graphics_SDK_3_00_00_09 
package was installed. but i am getting the below error. looks like
pdsasm file 
alone is generated for x86. Because of which the package is not being
built properly.

I tried cleaning the package, "bitbake  -c clean libgles-omap3", but
again got the same result.
Please shed some light, on how to proceed.

Thanks & Regards,
Robin


NOTE: Running task 421 of 598 (ID:
12, /home/ubuntu/oe/openembedded/recipes/powervr-drivers/libgles-omap3_3.00.00.09.bb, do_package)
arm-angstrom-linux-gnueabi-objcopy: Unable to recognise the format of
the input file
`/home/ubuntu/oe/tmp/work/armv7a-angstrom-linux-gnueabi/libgles-omap3-3.00.00.09-r1/image/usr/bin/pdsasm'
arm-angstrom-linux-gnueabi-strip: Unable to recognise the format of the
input file
`/home/ubuntu/oe/tmp/work/armv7a-angstrom-linux-gnueabi/libgles-omap3-3.00.00.09-r1/image/usr/bin/pdsasm'
arm-angstrom-linux-gnueabi-objcopy: Unable to recognise the format of
the input file
`/home/ubuntu/oe/tmp/work/armv7a-angstrom-linux-gnueabi/libgles-omap3-3.00.00.09-r1/image/usr/bin/pdsasm'
ERROR: runstrip: ''arm-angstrom-linux-gnueabi-strip'
--remove-section=.comment --remove-section=.note
'/home/ubuntu/oe/tmp/work/armv7a-angstrom-linux-gnueabi/libgles-omap3-3.00.00.09-r1/image/usr/bin/pdsasm'' strip command failed
arm-angstrom-linux-gnueabi-objcopy: Unable to recognise the format of
the input file
`/home/ubuntu/oe/tmp/work/armv7a-angstrom-linux-gnueabi/libgles-omap3-3.00.00.09-r1/image/usr/bin/ES3.0/pdsasm'
arm-angstrom-linux-gnueabi-strip: Unable to recognise the format of the
input file
`/home/ubuntu/oe/tmp/work/armv7a-angstrom-linux-gnueabi/libgles-omap3-3.00.00.09-r1/image/usr/bin/ES3.0/pdsasm'
arm-angstrom-linux-gnueabi-objcopy: Unable to recognise the format of
the input file
`/home/ubuntu/oe/tmp/work/armv7a-angstrom-linux-gnueabi/libgles-omap3-3.00.00.09-r1/image/usr/bin/ES3.0/pdsasm'
ERROR: runstrip: ''arm-angstrom-linux-gnueabi-strip'
--remove-section=.comment --remove-section=.note
'/home/ubuntu/oe/tmp/work/armv7a-angstrom-linux-gnueabi/libgles-omap3-3.00.00.09-r1/image/usr/bin/ES3.0/pdsasm'' strip command failed
arm-angstrom-linux-gnueabi-objcopy: Unable to recognise the format of
the input file
`/home/ubuntu/oe/tmp/work/armv7a-angstrom-linux-gnueabi/libgles-omap3-3.00.00.09-r1/image/usr/bin/ES2.0/pdsasm'
arm-angstrom-linux-gnueabi-strip: Unable to recognise the format of the
input file
`/home/ubuntu/oe/tmp/work/armv7a-angstrom-linux-gnueabi/libgles-omap3-3.00.00.09-r1/image/usr/bin/ES2.0/pdsasm'
arm-angstrom-linux-gnueabi-objcopy: Unable to recognise the format of
the input file
`/home/ubuntu/oe/tmp/work/armv7a-angstrom-linux-gnueabi/libgles-omap3-3.00.00.09-r1/image/usr/bin/ES2.0/pdsasm'
ERROR: runstrip: ''arm-angstrom-linux-gnueabi-strip'
--remove-section=.comment --remove-section=.note
'/home/ubuntu/oe/tmp/work/armv7a-angstrom-linux-gnueabi/libgles-omap3-3.00.00.09-r1/image/usr/bin/ES2.0/pdsasm'' strip command failed
NOTE: Multiple libraries (libOpenVGU.so, libpvrPVR2D_FLIPWSEGL.so,
libglslcompiler.so, libpvrPVR2D_X11WSEGL.so, libpvr2d.so, libEGL.so,
libOpenVG.so, libIMGegl.so, libGLESv2.so, libpvrPVR2D_FRONTWSEGL.so,
libsrv_um.so, libpvrPVR2D_BLITWSEGL.so, libGLES_CM.so,
libPVRScopeServices.so) found and LEAD_SONAME not defined
NOTE: Couldn't find shared library provider for libXau.so.0
NOTE: Couldn't find shared library provider for libXau.so.0
NOTE: Couldn't find shared library provider for libXau.so.0
NOTE: Couldn't find shared library provider for libXau.so.0
NOTE: Couldn't find shared library provider for libXau.so.0
NOTE: Couldn't find shared library provider for libXau.so.0
NOTE: Couldn't find shared library provider for libXau.so.0
NOTE: Couldn't find shared library provider for libXau.so.0
NOTE: Couldn't find shared library provider for libXau.so.0
NOTE: Couldn't find shared library provider for libXau.so.0
NOTE: Couldn't find shared library provider for libXau.so.0
NOTE: Couldn't find shared library provider for libXau.so.0
NOTE: Couldn't find shared library provider for libXau.so.0
NOTE: Couldn't find shared library provider for libXau.so.0
NOTE: Couldn't find shared library provider for libXau.so.0
NOTE: package libgles-omap3 skipped
NOTE: package xserver-kdrive-powervrsgx skipped
NOTE: package libgles-omap3-tests skipped
NOTE: package libgles-omap3-demos skipped


------------------------------------------------------------------------------- 
DISCLAIMER: This e-mail and any attachment (s) is for authorised use by the
intended recipient (s) only. It may contain proprietary material, confidential
information and/or be subject to the legal privilege of iWave Systems
Technologies Private Limited. If you have received this message in error,
please notify the originator immediately. If you are not the intended
recipient, you are notified that you are strictly prohibited from retaining,
using, copying, alerting or disclosing the content of this message. Thank you
for your co-operation. 
------------------------------------------------------------------------------


