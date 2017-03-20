Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f54.google.com (mail-it0-f54.google.com
	[209.85.214.54])
	by mail.openembedded.org (Postfix) with ESMTP id B6A167795C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Mar 2017 13:33:05 +0000 (UTC)
Received: by mail-it0-f54.google.com with SMTP id w124so88584059itb.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Mar 2017 06:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=aQeov1uIBduLK/TWCWwq3YMR8Ws/NLL8C7TINGsaMns=;
	b=JCzGH73ciNxOUILSyt45MrcLQyckWEadpHTyVfGtJKM2uK/h92pbnHK6ZKUPL1N+T1
	PYIJS682Zml/dfOodiZwar5zcciCiCO6RrAXSBH7vHhfHCItdDMpk/1D+4x43ukZUUIg
	eaZCcESbXceYIb9lJRMR0qiw0v2XvmsWkmZuvj8bBQ6c5AWeFmWY4GWBf5X+RWJBsK4V
	pHOTCnH/65q6Pp9+P0lx6roT8CEWWPPMBvyx86miFCEA1Iuzp/moSS5bdgSYuzacBMNV
	y/m+R1YRYs9ZiyOuCiNSnW8CK8q0rZFHWNKNyi0+ERZ5p3DrzLcm8R1y5+96B28ChGjh
	QT6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=aQeov1uIBduLK/TWCWwq3YMR8Ws/NLL8C7TINGsaMns=;
	b=a2biNexRZcMOUxh7ljgjB4j908yS3oLx8j+Y56gBC0j7g6nmYaCzCINoQHVX2uAMJ5
	wzVrfOmpYsEtPQ501e9qeHvDNjvxh1V8ZulcAsgvW82hKJE9KqXa+yUejxrAdgBKUaVq
	YCN5PwBUHARuu+r1Wt3PT0mvfOzamRhWlY7ItX05gMYGIFESQhh1lG0D6Jlm9adkvn59
	9tQvs/jLhG+mukx2KyNRP7f6eXK7MXnYfR1GshYdRQWFc9AnYTW+fuLbi6Stv893eNjM
	nekg2AqmY/KNadlXu3Q2pfmi8CjYd+NH2lkq3ltplXk/1f5kLsFluLgOpJ5TQLl8pDXT
	5DgA==
X-Gm-Message-State: AFeK/H0T2Xl8oxyVfEf4P7ECwNm75f462czSVm+jvGV+gFSBgnCCW2jEu+WBfDXCDzOskXDw
X-Received: by 10.36.84.199 with SMTP id t190mr9979497ita.114.1490016772708;
	Mon, 20 Mar 2017 06:32:52 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8C233.dip0.t-ipconnect.de.
	[93.232.194.51])
	by smtp.gmail.com with ESMTPSA id 123sm166570iow.28.2017.03.20.06.32.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 20 Mar 2017 06:32:51 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Mar 2017 14:32:43 +0100
Message-Id: <32e1d3fa5c6441cd9f67837dd324cb6b76f5cd53.1490016683.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <1489684937.6396.123.camel@intel.com>
References: <1489684937.6396.123.camel@intel.com>
Cc: peter.kjellerstedt@axis.com
Subject: [meta-oe][PATCH] lvm2: libdevicemapper package needs udev rules and dmsetup
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
X-List-Received-Date: Mon, 20 Mar 2017 13:33:06 -0000

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

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta-oe/recipes-support/lvm2/lvm2.inc | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc b/meta-oe/recipes-support/lvm2/lvm2.inc
index 3e79552..c0fe755 100644
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
+RDEPENDS_${PN} += "libdevmapper"
+FILES_libdevmapper = "${sbindir}/dmsetup ${libdir}/libdevmapper.so.* ${nonarch_base_libdir}/udev/rules.d"
 FILES_libdevmapper-dev = " \
     ${libdir}/libdevmapper.so \
     ${libdir}/pkgconfig/devmapper.pc \

base-commit: 6c584374a599f6f8d3607f20ecfc13a67ccf1da1
-- 
git-series 0.9.1

