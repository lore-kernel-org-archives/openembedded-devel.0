Received: from [17.148.16.86] (helo=asmtpout011.mac.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <elvis.dowson@mac.com>) id 1ML274-0006Rj-SK
	for openembedded-devel@lists.openembedded.org;
	Sun, 28 Jun 2009 23:40:39 +0200
MIME-version: 1.0
Received: from [87.201.169.253] by asmtp011.mac.com
	(Sun Java(tm) System Messaging Server 6.3-8.01 (built Dec 16 2008;
	32bit)) with ESMTPSA id <0KLY00KG4X04IP60@asmtp011.mac.com> for
	openembedded-devel@lists.openembedded.org; Sun,
	28 Jun 2009 14:28:59 -0700 (PDT)
Message-id: <C52E42C7-D053-424D-8C0A-8DD4DEEFE90B@mac.com>
From: Elvis Dowson <elvis.dowson@mac.com>
To: OpenEmbedded Developers <openembedded-devel@lists.openembedded.org>
Date: Mon, 29 Jun 2009 01:28:28 +0400
X-Mailer: Apple Mail (2.935.3)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: How to replace linux-omap3-2.6.29 rt2x00 wifi modules with rt73usb wifi module
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
X-List-Received-Date: Sun, 28 Jun 2009 21:40:39 -0000
Content-Type: text/plain; charset=US-ASCII; format=flowed; delsp=yes
Content-Transfer-Encoding: 7BIT

Hi,
	At the moment, the linux-omap3-2.6.29.bb recipe has inbuilt support  
for the Ralink rt2x00 series and rt73 wifi modules in the kernel.

Now the default rt2x00 modules are not working properly for me, and I  
want to incorporate a new driver from the ralinktech website, and get  
it to be incorporated in the linux-omap3-2.6.29 kernel build, and then  
configure the kernel using bitbake -c menuconfig linux-omap3-2.6.29  
command, and see the new kernel module, but have the old ralink rt2x00  
drivers removed.

How can I do this?

Here is the link to the ralink tech website:

http://www.ralinktech.com/ralink/Home/Support/Linux.html


Here is a small recipe that I have created for the rt73usb driver:

DESCRIPTION = "Enhanced Driver for Ralink rt73 USB 802.11g WiFi sticks"
HOMEPAGE = "http://www.ralinktech.com/ralink/Home/Support/Linux.html"
SECTION = "kernel/modules"
LICENSE = "GPL"

PR = "r1"

SRC_URI = "http://www.ralinktech.com.tw/data/drivers/2009_0206_RT73_Linux_STA_Drv1.1.0.2.tar.bz2 
"

inherit module

S = "${WORKDIR}/${PN}-${PV}/Module/"

do_compile_prepend_arm () {
   MAKE_TARGETS="arm"
}

do_compile() {
   export KERNDIR=${STAGING_KERNEL_DIR}
   module_do_compile
}

do_install() {
	install -d ${D}${base_libdir}/modules/${KERNEL_VERSION}
	install -m 0644 rt73usb${KERNEL_OBJECT_SUFFIX} ${D}${base_libdir}/ 
modules/${KERNEL_VERSION}
}


Best regards,

Elvis


