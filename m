Received: from mail-ie0-f181.google.com ([209.85.223.181])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UFJBd-0005WL-Q7
	for openembedded-devel@lists.openembedded.org;
	Tue, 12 Mar 2013 08:00:19 +0100
Received: by mail-ie0-f181.google.com with SMTP id 17so5799269iea.40
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Mar 2013 23:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=cC0fa/shdzBkv3Le94KMSPO5Tig+cznR6xWPdRSOz10=;
	b=niX5UtN4j5Tg9BuWPBPUpPqVJp0QiKaFhmHv4MpraNpWpjk4M6yjg32eAWB/tGC6Qt
	o4uwwda9sbYcHKErerSoL0JdotvEo8Ewxh4+wGP/B5Ihd/L67WMLw20SE6kAp/irYiPU
	oX5YIT7S40RtxO+/zXgUWOfhu5Ff3E1s110UWT+4WUeIS+qLP6dnwibf7D1a80L3CmiS
	HWoIswylGT+eJ3A2VpxAWRZhU9outwSyA6sVwr3YaekQl5Pifja/xkdvYcOT54kxCMXw
	k/UeoT7wMLDlpdlTf+AT9StbLOEIKzD47cY7yq+1tw6bJnWucAveAqwA6wL4ZoY5QLnI
	WLAA==
X-Received: by 10.50.140.5 with SMTP id rc5mr1412340igb.78.1363070590347;
	Mon, 11 Mar 2013 23:43:10 -0700 (PDT)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id ip2sm17959080igc.5.2013.03.11.23.43.08
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 11 Mar 2013 23:43:09 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 11 Mar 2013 23:42:58 -0700
Message-Id: <1363070578-8438-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-oe][PATCH] lmsensors: Upgrade 3.3.2 -> lmsensors_3.3.3
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
X-List-Received-Date: Tue, 12 Mar 2013 07:00:25 -0000

Fix build with mutlilib enabled architectures
when we have libdir != /usr/lib it always would
not package libsensors.* since they will get
installed into /usr/lib and ignored. So define
LIBDIR properly

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../{lmsensors_3.3.2.bb => lmsensors_3.3.3.bb}     |    8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)
 rename meta-oe/recipes-support/lm_sensors/{lmsensors_3.3.2.bb => lmsensors_3.3.3.bb} (96%)

diff --git a/meta-oe/recipes-support/lm_sensors/lmsensors_3.3.2.bb b/meta-oe/recipes-support/lm_sensors/lmsensors_3.3.3.bb
similarity index 96%
rename from meta-oe/recipes-support/lm_sensors/lmsensors_3.3.2.bb
rename to meta-oe/recipes-support/lm_sensors/lmsensors_3.3.3.bb
index 1a1ef2d..4f15535 100644
--- a/meta-oe/recipes-support/lm_sensors/lmsensors_3.3.2.bb
+++ b/meta-oe/recipes-support/lm_sensors/lmsensors_3.3.3.bb
@@ -11,11 +11,8 @@ SRC_URI = "http://dl.lm-sensors.org/lm-sensors/releases/lm_sensors-${PV}.tar.bz2
            file://fancontrol.init \
            file://sensord.init \
 "
-
-SRC_URI[md5sum] = "f357ba00b080ab102a170f7bf8bb2578"
-SRC_URI[sha256sum] = "f13dd885406841a7352ccfb8b9ccb23c4c057abe3de4258da5444c149a9e3ae1"
-
-PR = "r1"
+SRC_URI[md5sum] = "73c2fcccdab6049d289c5e0c596192a1"
+SRC_URI[sha256sum] = "ecc91ba3d918e96fb7d5eb9acce978af803b130e0b33b08d5ea05b2bfca84955"
 
 inherit update-rc.d
 
@@ -29,6 +26,7 @@ S = "${WORKDIR}/lm_sensors-${PV}"
 
 EXTRA_OEMAKE = 'LINUX=${STAGING_KERNEL_DIR} EXLDFLAGS="${LDFLAGS}" \
 		MACHINE=${TARGET_ARCH} PREFIX=${prefix} MANDIR=${mandir} \
+	        LIBDIR=${libdir} \
 		CC="${CC}" AR="${AR}"'
 
 do_compile() {
-- 
1.7.9.5



