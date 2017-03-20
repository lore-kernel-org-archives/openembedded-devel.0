Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f43.google.com (mail-it0-f43.google.com
	[209.85.214.43])
	by mail.openembedded.org (Postfix) with ESMTP id 923BE779B3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Mar 2017 15:15:16 +0000 (UTC)
Received: by mail-it0-f43.google.com with SMTP id w124so91796185itb.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Mar 2017 08:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=fA1mWKMtFIc06c7cf6JZNQRaehe1ibScyh5SK1RoAZ4=;
	b=PJn16UfadjyQyKcjZJ9gt/r5Ing2g2V2DUbt3raXZRzE7A+5vff//IW80jwwIQ0f4P
	WR7dAssofRidOk/tfcsOVLpjeMWk1ii7xsARBQ0gwvJcUR0r7Met3WOIRIeWrjsg4Q3g
	//JZ9Rfcvl/sE32xroHy2iKrrAuKSTmEyUa/yW7VyJ1V0lLBHTTbN2y2pVzyvJCPpP/z
	UuYDVB7cFXDc1fq1BR8/TqVj0/WyW8Hj08WucoXwv+5qtShTiEukd+iNR6PqhNFIyBie
	c1YEJtFuObuBOsKHoH2SsbG9aGclqxT7px4t7iI30rLeErSmzMfSOmtsvA62SAI0uUqs
	rOGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=fA1mWKMtFIc06c7cf6JZNQRaehe1ibScyh5SK1RoAZ4=;
	b=MSLNJbJqKLITYbMV2x30hvb0cMGYhmOvcK0eLjlOHoIOLgwZ5P5vv1gsTjmMFhoBaI
	5N9sfDA903x9YM3TnxLZsX6HrKryVToYdjYQjQrwRMSg9I1VTNcay+uFNw/DyZkZaGNQ
	IjL2mhJzqbksCNqR3xlDWWY1Qooct393m22WB5BAf95zhIHNBWnZ+eDZJDAkBEKHZLCv
	KxitFZ1cj5MtH+cT/ZW/iXtBAsRgoCpaf1HaTvDhYv5kHk6ao2bvxIT8GjiDutnAtlcr
	JQxxZ2jJibipxP2Zu165Vqw9MOfy/YasEM/R1BqNNDb0wV7HdwUZuDxzw46qjZruZz/w
	+heA==
X-Gm-Message-State: AFeK/H1c4Zn9GhUwhj6aaMIskqlDTvbu8Yt0qEz9yFj9eVsqrJQkHoK8+d67RENaj0qpZ0CM
X-Received: by 10.36.197.132 with SMTP id f126mr9685797itg.117.1490022859500; 
	Mon, 20 Mar 2017 08:14:19 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8C233.dip0.t-ipconnect.de.
	[93.232.194.51]) by smtp.gmail.com with ESMTPSA id
	w133sm5345772itf.2.2017.03.20.08.14.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 20 Mar 2017 08:14:18 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Mar 2017 16:14:06 +0100
Message-Id: <8a2dc0af5e5c51e71d154de8180e0b74388a9fa9.1490022750.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <32e1d3fa5c6441cd9f67837dd324cb6b76f5cd53.1490016683.git-series.patrick.ohly@intel.com>
References: <32e1d3fa5c6441cd9f67837dd324cb6b76f5cd53.1490016683.git-series.patrick.ohly@intel.com>
Cc: peter.kjellerstedt@axis.com
Subject: [meta-oe][PATCH v2 1/2] lvm2: libdevicemapper package needs udev rules and dmsetup
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 20 Mar 2017 15:15:17 -0000

Applications like kpartx and cryptsetup were broken by moving only
libdevicemapper itself into a separate package: as a result of that
change, lvm2 was not getting pulled into images anymore although
libdevicemapper depends on dmsetup and udev rules to be fully
functional.

For example, "kpartx -as" started to hang while waiting for the udev
rules to trigger, which is what creates the /dev/mapper/ entries for
the new partitions (see also
https://github.com/docker/docker/issues/22025#issuecomment-243943728).

Putting udev rules and dmsetup also into libdevicemapper is perhaps
counter-intuitive, but necessary to keep the package functioning. A
full lvm2 installation is guaranteed to pull them in, too, both
because of implicit library dependencies and (just to be sure) an
explicit RDEPENDS.

lvm2-native doesn't have packages, so this RDEPENDS must be limited to
the target case.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta-oe/recipes-support/lvm2/lvm2.inc | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc b/meta-oe/recipes-support/lvm2/lvm2.inc
index 3e79552..cfa74d4 100644
--- a/meta-oe/recipes-support/lvm2/lvm2.inc
+++ b/meta-oe/recipes-support/lvm2/lvm2.inc
@@ -83,14 +83,17 @@ SYSTEMD_AUTO_ENABLE = "disable"
 
 TARGET_CC_ARCH += "${LDFLAGS}"
 
-FILES_${PN} += "${libdir}/device-mapper/*.so ${nonarch_base_libdir}/udev"
+FILES_${PN} += "${libdir}/device-mapper/*.so"
 FILES_${PN}-scripts = " \
     ${sbindir}/blkdeactivate \
     ${sbindir}/fsadm \
     ${sbindir}/lvmconf \
     ${sbindir}/lvmdump \
 "
-FILES_libdevmapper = "${libdir}/libdevmapper.so.*"
+# Specified explicitly for the udev rules, just in case that it does not get picked
+# up automatically:
+RDEPENDS_${PN}_append_class-target = " libdevmapper"
+FILES_libdevmapper = "${sbindir}/dmsetup ${libdir}/libdevmapper.so.* ${nonarch_base_libdir}/udev/rules.d"
 FILES_libdevmapper-dev = " \
     ${libdir}/libdevmapper.so \
     ${libdir}/pkgconfig/devmapper.pc \

base-commit: 6c584374a599f6f8d3607f20ecfc13a67ccf1da1
-- 
git-series 0.9.1

