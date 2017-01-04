Return-Path: <jaragunde@igalia.com>
Received: from smtp4.mundo-r.com (smtp3.mundo-r.com [212.51.32.191])
	by mail.openembedded.org (Postfix) with ESMTP id F1B187199F
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Jan 2017 18:21:38 +0000 (UTC)
IronPort-PHdr: =?us-ascii?q?9a23=3AV/i5uhNHrFMDyIBHs6Yl6mtUPXoX/o7sNwtQ0KIM?=
	=?us-ascii?q?zox0I/rzrarrMEGX3/hxlliBBdydsKMYzbOL+Pm4CSQp2tWoiDg6aptCVhsI24?=
	=?us-ascii?q?09vjcLJ4q7M3D9N+PgdCcgHc5PBxdP9nC/NlVJSo6lPwWB6nK94iQPFRrhKAF7?=
	=?us-ascii?q?Ovr6GpLIj8Swyuu+54Dfbx9GiTe5br5+Ngi6oAXeusULnYdvKbs6xwfUrHdPZ+?=
	=?us-ascii?q?lY335jK0iJnxb76Mew/Zpj/DpVtvk86cNOUrj0crohQ7BAAzsoL2465MvwtRne?=
	=?us-ascii?q?VgSP/WcTUn8XkhVTHQfI6gzxU4rrvSv7sup93zSaPdHzQLspVzmu87tnRRn1gy?=
	=?us-ascii?q?oBKjU38nzYitZogaxbvhyvuhJxzY3Tbo6XOvpxcb/Sc9wBSGpdXctcTTBND5mg?=
	=?us-ascii?q?Y4YNCecKIOZWr5P6p1sLtRawAROjC//oyjBTgX/9wLE30/47HgHJwQwgGc8Bv2?=
	=?us-ascii?q?rJp9vvLqASS/66zajVxjjEbfNZwy3955LHchA8p/GDQKx/fNHQyUkgDQzFilSQ?=
	=?us-ascii?q?ppb/MzyJ0eQNtnGW4ux9Xuysk24qswV8riW1yssxl4XEhJgZx1TA+Clj3Yo4Jd?=
	=?us-ascii?q?21RUhmatC+CpRQrTuVN45uT8MnRGFnpTg1x6UduZ6+YCgK0JMnxwPDa/Cfc4iH?=
	=?us-ascii?q?/BbjVOGJLDd2nn1lfrO+hxe08Ue+0OH8V8a030xOripEiNbArGwC1xvW6sSfS/?=
	=?us-ascii?q?t9+Fmu2SqX2g3X9+1IO104mbfZJpI7xrM9koAfvVnDEyL2gEn2ibWZdkQg+uim?=
	=?us-ascii?q?8eTnZbDmq4eeN4BukAHxKKsumtG5AeslLAcDRGmb+eum273n/E32Wq9GgeExkq?=
	=?us-ascii?q?ncqJzaP9gUpralAw9J1YYu8xG/Dy+439Qeg3YHKUlKdwyagIf0JV7BPen0Auqh?=
	=?us-ascii?q?jFSyjjhrw+vLPrngApXWMnjDi63tfbFl60FCzgo809Vf6IlKBb4cPf38RFL+uM?=
	=?us-ascii?q?bfDh8jPAy+2/znB8ll1oMCRWKPBbeUP73IsV+J+u0iOPeDZJIWuDbnNfcq/eTi?=
	=?us-ascii?q?gmM+mV8YZaOpx4cYaGikHvR6JEWUeWfjjckHEWcLpQozV/LliECBUT5JeXm9Rb?=
	=?us-ascii?q?gw6S08CIKjFY3DXJyigKSd3CenGZ1bfmdGCkyWHnf2doWEXOwBaCWJIs96kj0E?=
	=?us-ascii?q?TqShRJEk1RG1rgP1171nLu/O9iIDr5KwnORysurLmBc/8DZ5A8iQ3ySBQn95mk?=
	=?us-ascii?q?sMRiQqx+Z4uUF7x1KJ3KR0jvAeEsZctN1TVQJvF5fXyOZ9Q/noUw3ceNuEAG4n?=
	=?us-ascii?q?WNi0SWUzR8g4zMIIb0tVGtqrihHKmSGtBulGxPSwGJUo//eEjDDKLMFnxiOe2Q?=
	=?us-ascii?q?=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2CCBQBFOm1Y/5tjdVteHAEBBAEBCgEBF?=
	=?us-ascii?q?wEBBAEBCgEBgw0BAQEBAR9fgQyOSZMCkSSCQoIPgggaDIV8AoFWQRIBAQEBAQE?=
	=?us-ascii?q?BAQEBAWIogjMYgh4GIw8BRhAlAiYCAlcZiHQBr06CJYoqAQEBAQEFAQEBASSBC?=
	=?us-ascii?q?4U6iXOCAAsugl4FmwmGVoprApBXSJF4JgEwhUMbGIFHPTQBAYgwAQEB?=
X-IPAS-Result: =?us-ascii?q?A2CCBQBFOm1Y/5tjdVteHAEBBAEBCgEBFwEBBAEBCgEBgw0?=
	=?us-ascii?q?BAQEBAR9fgQyOSZMCkSSCQoIPgggaDIV8AoFWQRIBAQEBAQEBAQEBAWIogjMYg?=
	=?us-ascii?q?h4GIw8BRhAlAiYCAlcZiHQBr06CJYoqAQEBAQEFAQEBASSBC4U6iXOCAAsugl4?=
	=?us-ascii?q?FmwmGVoprApBXSJF4JgEwhUMbGIFHPTQBAYgwAQEB?=
X-IronPort-AV: E=Sophos;i="5.33,459,1477954800"; d="scan'208";a="96000760"
Received: from fanzine.igalia.com ([91.117.99.155])
	by smtp4.mundo-r.com with ESMTP; 04 Jan 2017 19:11:50 +0100
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
	by fanzine.igalia.com with esmtps 
	(Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
	id 1cOq2Q-00078t-5x; Wed, 04 Jan 2017 19:11:50 +0100
Received: from fanzine.local.igalia.com ([192.168.10.13]
	helo=goomba.local.igalia.com) by mail.igalia.com with esmtps 
	(Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
	id 1cOq2O-0005HI-2h; Wed, 04 Jan 2017 19:11:48 +0100
From: =?UTF-8?q?Jacobo=20Aragunde=20P=C3=A9rez?= <jaragunde@igalia.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Jan 2017 19:11:33 +0100
Message-Id: <1483553494-5687-2-git-send-email-jaragunde@igalia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1483553494-5687-1-git-send-email-jaragunde@igalia.com>
References: <1483553494-5687-1-git-send-email-jaragunde@igalia.com>
MIME-Version: 1.0
Cc: denis@eukrea.com, otavio@ossystems.com.br, eric@eukrea.com
Subject: [meta-browser][PATCH 2/3] chromium: disable CHROMIUM_ENABLE_WAYLAND in the x11 recipe
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
X-List-Received-Date: Wed, 04 Jan 2017 18:21:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The chromium x11 recipe may crash when run with CHROMIUM_ENABLE_WAYLAND
enabled, because it misses some steps that are performed in the
chromium-wayland recipe. Doing this change, we eliminate one possible
failure point.

Also adds a check for x11 in DISTRO_FEATURES.

Signed-off-by: Jacobo Aragunde Pérez <jaragunde@igalia.com>
---
 recipes-browser/chromium/chromium_52.0.2743.76.bb | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/recipes-browser/chromium/chromium_52.0.2743.76.bb b/recipes-browser/chromium/chromium_52.0.2743.76.bb
index 14b519c..a3270e9 100644
--- a/recipes-browser/chromium/chromium_52.0.2743.76.bb
+++ b/recipes-browser/chromium/chromium_52.0.2743.76.bb
@@ -1,3 +1,5 @@
+CHROMIUM_ENABLE_WAYLAND = "0"
+
 include chromium-browser.inc
 
 DEPENDS += "xextproto gtk+ libxi libxss"
@@ -16,3 +18,9 @@ SRC_URI += "\
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0fca02217a5d49a14dfe2d11837bb34d"
 SRC_URI[md5sum] = "0fee71466e1f2dc39ed4549d04b58ee2"
 SRC_URI[sha256sum] = "c54cdc11c3324152f3d5be98dcb4eae2bda0fc9dac7dd5f9010150458d68c18c"
+
+# X11 must be available for this flavor of Chromium
+python() {
+    if not bb.utils.contains('DISTRO_FEATURES', 'x11', True, False, d):
+        raise bb.parse.SkipPackage("X11 is not available")
+}
-- 
2.7.4


