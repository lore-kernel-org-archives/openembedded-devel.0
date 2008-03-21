Received: from [66.249.82.234] (helo=wx-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <xjqian@gmail.com>) id 1JciTj-0007gw-Oc
	for openembedded-devel@lists.openembedded.org;
	Fri, 21 Mar 2008 15:44:20 +0100
Received: by wx-out-0506.google.com with SMTP id h27so1654965wxd.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Mar 2008 07:44:17 -0700 (PDT)
Received: by 10.141.78.14 with SMTP id f14mr1320171rvl.119.1206110655538;
	Fri, 21 Mar 2008 07:44:15 -0700 (PDT)
Received: from ?192.168.1.204? ( [24.107.189.117])
	by mx.google.com with ESMTPS id i34sm888006wxd.15.2008.03.21.07.44.08
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 21 Mar 2008 07:44:12 -0700 (PDT)
Message-ID: <47E3C9B2.4050901@gmail.com>
Date: Fri, 21 Mar 2008 09:44:02 -0500
From: Junqian Gordon Xu <xjqian@gmail.com>
User-Agent: Mozilla-Thunderbird 2.0.0.9 (X11/20080110)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: wlan-ng-modules RPROVIDES clean up
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 21 Mar 2008 14:44:20 -0000
Content-Type: multipart/mixed; boundary="------------030901040506020008040701"

--------------030901040506020008040701
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

The change is to rename wlan-ng-modules-p80211 to wlan-ng-modules (a.k.a 
${PN}) to avoid the RPROVIDES embarrassment. Tested working fine on tosa 
images which needs wlan-ng-modules-usb.

I didn't find any other recipe depend on wlan-ng-modules-p80211 in oe, 
however I'm not sure if there is any objection to the change.

Regards
Gordon
#
# old_revision [f7df80732af56b59315ef203e69f092313ec2ddd]
#
# patch "packages/wlan-ng/wlan-ng-modules.inc"
#  from [9474ac9b757e9c7ae8e85ce133a8f7d2357d7522]
#    to [cb2b1d64b9860bb9e6c5fce3801b97cb1376780d]
#
============================================================
--- packages/wlan-ng/wlan-ng-modules.inc	9474ac9b757e9c7ae8e85ce133a8f7d2357d7522
+++ packages/wlan-ng/wlan-ng-modules.inc	cb2b1d64b9860bb9e6c5fce3801b97cb1376780d
@@ -1,9 +1,8 @@ RRECOMMENDS = "wlan-ng-utils"
 DESCRIPTION = "linux-wlan-ng (prism2.x, prism3, pcmcia, pci, usb) driver for 11Mbps wireless lan cards"
 HOMEPAGE = "http://www.linux-wlan.org"
 SECTION = "kernel/modules"
 DEPENDS = "virtual/kernel"
 RRECOMMENDS = "wlan-ng-utils"
-RPROVIDES += "wlan-ng-modules-usb wlan-ng-modules"
 LICENSE = "GPL"
 
 SRC_URI = "file://no-compat.patch;patch=1 \
@@ -57,13 +56,13 @@ do_install() {
         rm -f ${KERNEL_SOURCE}/../../config.mk	
 }
 
-PACKAGES = "${PN}-dbg wlan-ng-modules-usb wlan-ng-modules-cs wlan-ng-modules-pci wlan-ng-modules-p80211"
-FILES_wlan-ng-modules-p80211 = "/lib/modules/${KERNEL_VERSION}/wlan-ng/p80211${KERNEL_OBJECT_SUFFIX}"
+PACKAGES = "${PN}-dbg wlan-ng-modules-usb wlan-ng-modules-cs wlan-ng-modules-pci wlan-ng-modules"
+FILES_wlan-ng-modules = "/lib/modules/${KERNEL_VERSION}/wlan-ng/p80211${KERNEL_OBJECT_SUFFIX}"
 FILES_wlan-ng-modules-usb = "/lib/modules/${KERNEL_VERSION}/wlan-ng/prism2_usb${KERNEL_OBJECT_SUFFIX}"
 FILES_wlan-ng-modules-cs  = "/lib/modules/${KERNEL_VERSION}/wlan-ng/prism2_cs${KERNEL_OBJECT_SUFFIX}"
 FILES_wlan-ng-modules-pci = "/lib/modules/${KERNEL_VERSION}/wlan-ng/prism2_pci${KERNEL_OBJECT_SUFFIX} \
 			     /lib/modules/${KERNEL_VERSION}/wlan-ng/prism2_plx${KERNEL_OBJECT_SUFFIX}"
+RDEPENDS_wlan-ng-modules = "wlan-ng-utils"
+RDEPENDS_wlan-ng-modules-usb = "wlan-ng-modules"
+RDEPENDS_wlan-ng-modules-cs  = "wlan-ng-modules"
+RDEPENDS_wlan-ng-modules-pci = "wlan-ng-modules"
-RDEPENDS_wlan-ng-modules-p80211 = "wlan-ng-utils"
-RDEPENDS_wlan-ng-modules-usb = "wlan-ng-modules-p80211"
-RDEPENDS_wlan-ng-modules-cs  = "wlan-ng-modules-p80211"
-RDEPENDS_wlan-ng-modules-pci = "wlan-ng-modules-p80211"

--------------030901040506020008040701--
