Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1PKfyK-000816-A6
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Nov 2010 00:38:57 +0100
Received: by pzk34 with SMTP id 34so1780942pzk.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Nov 2010 15:37:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=fL8vTuKEKLRRJ49X/EIIWaQoNyCq1lFq7RoGG3Pwk+I=;
	b=aILCXd2xV0ltgjFmwlnHSbbbQPD5VMU0cK9ao3E3fgs5hszMYkE/Vc99WGVtKjNjHH
	mhWoAIDggYmBYafuQtmwOPmNHxL2WwDTry4XPrKFQB0j+GmfPdbFuPzCjYnU+r5wRZkN
	cq48A224mTHy61MKTqTRXwzyjj+0An3ld3TNs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=MiV2IyjHCXBNrffx0C3Q3ces/KS5owW25CE+n+Dwu9XaZSekcRSQhQA/3vc8zLsneM
	yGvlQrNY5ooGwKReUWbFOTCc6pPHBlnAS6YUu9kIuS7IJ3bquMZtVNMKZ8sEgD9s39se
	E2haqgfglAqwnUQrE8Mlnw/ADkv68HtSvKhkg=
Received: by 10.142.12.21 with SMTP id 21mr5730040wfl.430.1290469062571;
	Mon, 22 Nov 2010 15:37:42 -0800 (PST)
Received: from [10.0.0.5] (eth7090.sa.adsl.internode.on.net [150.101.58.177])
	by mx.google.com with ESMTPS id b11sm3724648wff.9.2010.11.22.15.37.40
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 22 Nov 2010 15:37:41 -0800 (PST)
Message-ID: <4CEAFEC1.10601@gmail.com>
Date: Tue, 23 Nov 2010 10:07:37 +1030
From: Graham Gower <graham.gower@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.15) Gecko/20101113 Thunderbird/3.0.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.210.47
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 2/2] udev_124.bb: Fix build when DISTRO_FEATURES lacks "largefile".
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
X-List-Received-Date: Mon, 22 Nov 2010 23:38:57 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit


NOTE: make -e EXTRAS=extras/firmware/ extras/scsi_id/ extras/volume_id/ STRIP=echo libudevdir=/lib/udev libdir=/lib prefix=
  GENHDR   udev_version.h
  CC       udev_device.o
In file included from /mnt/oe/tmp/sysroots/mipsel-oe-linux-uclibc/include/stdlib.h:25:0,
                 from udev_device.c:20:
/mnt/oe/tmp/sysroots/mipsel-oe-linux-uclibc/include/features.h:216:5: error: #error It appears you have defined _FILE_OFFSET_BITS=64. Unfortunately, uClibc was built without large file support enabled.
In file included from /mnt/oe/tmp/sysroots/mipsel-oe-linux-uclibc/include/stdio.h:72:0,
                 from udev_device.c:21:
/mnt/oe/tmp/sysroots/mipsel-oe-linux-uclibc/include/bits/uClibc_stdio.h:61:2: error: #error Sorry... uClibc was built without large file support!
In file included from udev_device.c:21:0:
/mnt/oe/tmp/sysroots/mipsel-oe-linux-uclibc/include/stdio.h:83:26: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'fpos_t'
In file included from udev_device.c:21:0:
/mnt/oe/tmp/sysroots/mipsel-oe-linux-uclibc/include/stdio.h:719:12: error: expected declaration specifiers or '...' before 'fpos_t'
/mnt/oe/tmp/sysroots/mipsel-oe-linux-uclibc/include/stdio.h:721:12: error: expected ';', ',' or ')' before '*' token
udev_device.c: In function 'udev_device_event':
udev_device.c:272:4: warning: cast increases required alignment of target type
udev_device.c:272:4: warning: cast increases required alignment of target type
make: *** [udev_device.o] Error 1
FATAL: oe_runmake failed

Signed-off-by: Graham Gower <graham.gower@gmail.com>
---
 recipes/udev/udev_124.bb |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/recipes/udev/udev_124.bb b/recipes/udev/udev_124.bb
index d0d5420..a6c0e18 100644
--- a/recipes/udev/udev_124.bb
+++ b/recipes/udev/udev_124.bb
@@ -29,6 +29,10 @@ FILES_${PN}-dbg += "${base_libdir}/udev/.debug"
 UDEV_EXTRAS = "extras/firmware/ extras/scsi_id/ extras/volume_id/"
 EXTRA_OEMAKE += "libudevdir=/lib/udev libdir=${base_libdir} prefix="
 
+do_configure_prepend_libc-uclibc() {
+	eval "${@base_contains('DISTRO_FEATURES', 'largefile', '', 'sed -i -e "s/-D_FILE_OFFSET_BITS=64//" ${S}/Makefile', d)}"
+}
+
 do_install () {
 	install -d ${D}${usrsbindir} \
 		   ${D}${sbindir}
-- 
1.7.1



