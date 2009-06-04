Received: from [17.148.16.97] (helo=asmtpout022.mac.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <elvis.dowson@mac.com>) id 1MC4pj-0005rH-9H
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Jun 2009 06:45:43 +0200
MIME-version: 1.0
Received: from [87.201.169.145] by asmtp022.mac.com
	(Sun Java(tm) System Messaging Server 6.3-8.01 (built Dec 16 2008;
	32bit)) with ESMTPSA id <0KKP00GJH650WG50@asmtp022.mac.com> for
	openembedded-devel@lists.openembedded.org; Wed,
	03 Jun 2009 21:36:40 -0700 (PDT)
Message-id: <58E23116-2D95-4C1C-8C17-EDA168C129F9@mac.com>
From: Elvis Dowson <elvis.dowson@mac.com>
To: OpenEmbedded Developers <openembedded-devel@lists.openembedded.org>
Date: Thu, 04 Jun 2009 08:36:35 +0400
X-Mailer: Apple Mail (2.935.3)
Subject: How to fix OE missing checksum error for some rt2570-k2wrlz recipe
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
X-List-Received-Date: Thu, 04 Jun 2009 04:45:43 -0000
Content-transfer-encoding: 7BIT
Content-type: text/plain; charset=US-ASCII; format=flowed; delsp=yes

Hi,
	I am getting a missing checksum error.

NOTE: Running task 358 of 558 (ID: 2, /tool/overo-oe/user.collection/ 
recipes/rt2x00/rt2570-k2wrlz_1.6.4.bb, do_fetch)
NOTE: Missing checksum
ERROR: rt2570-k2wrlz-1.6.4: http://homepages.tu-darmstadt.de/~p_larbig/wlan/rt2570-k2wrlz-1.6.4.tar.bz2 
  has no entry in conf/checksums.ini, not checking URI
ERROR: Error in executing: /tool/overo-oe/user.collection/recipes/ 
rt2x00/rt2570-k2wrlz_1.6.4.bb

I realize I can get past this error by setting  
OE_ALLOW_INSECURE_DOWNLOADS="1", but how can I fix things so I don't  
have to disable this check just to get past the OE build error and  
properly check the checksum?

Here is the contents of my bitbake recipe:

File: rt2570-k2wrlz_1.6.4.bb
--------------------------------------

DESCRIPTION = "Enhanced Driver for Ralink rt2570 USB 802.11g WiFi  
sticks"
HOMEPAGE = "http://homepages.tu-darmstadt.de/~p_larbig/wlan"
SECTION = "kernel/modules"
LICENSE = "GPL"

PR = "r1"

SRC_URI = "http://homepages.tu-darmstadt.de/~p_larbig/wlan/${PN}-$ 
{PV}.tar.bz2"

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
	install -d ${D}${base_libdir}/modules/${KERNEL_VERSION}/extra
	install -m 0644 rt2570${KERNEL_OBJECT_SUFFIX} ${D}${base_libdir}/ 
modules/${KERNEL_VERSION}/extra/
}


Best regards,

Elvis






