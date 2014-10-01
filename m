Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id 343AE65F77
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Oct 2014 08:19:33 +0000 (UTC)
Received: by mail-wi0-f173.google.com with SMTP id bs8so1107657wib.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Oct 2014 01:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=VFnGBwxRtkkHkhMnLzJzqSdUbMMNYBhxw0NMWaJXBrc=;
	b=dA3vy76v9TIL1bKX32/CoRwDIqtg50dPBfcuDvQtJWeYhKNeDdfVFMxQ2f+9OP88m4
	z6phZArnlNyC1NddjS/CqL7B9Pw93DeWBAj1tYriztP844codthFAdax5qDbZnabIMJQ
	A6bLHuafffXH61pMBO2ATW3gNMRet0Xxxr/78H5f8qlH24DyhMb/pXLTDcBORp4bJ2Vo
	flAqBDiLvLwx1w/+bwLJCdoWy7xU1D/AiXIDJUcjC2Cv290f88a65ZERi4sVHWyPVQ1X
	TFesW5XHCFmcZdV62U54wr+tG2ZnnhUhW6Nf38K0DROxje//Q5AEsI2vXq++VB8ORgRZ
	Tmqw==
X-Received: by 10.194.89.225 with SMTP id br1mr50941327wjb.51.1412151574631;
	Wed, 01 Oct 2014 01:19:34 -0700 (PDT)
Received: from localhost.localdomain
	(ip-176-198-252-251.hsi05.unitymediagroup.de. [176.198.252.251])
	by mx.google.com with ESMTPSA id kx2sm340789wjb.6.2014.10.01.01.19.33
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 01 Oct 2014 01:19:34 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  1 Oct 2014 10:19:11 +0200
Message-Id: <1412151555-19865-12-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1412151555-19865-1-git-send-email-schnitzeltony@googlemail.com>
References: <1412151555-19865-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH][meta-oe 11/15] polkit: update to 0.112
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 01 Oct 2014 08:19:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

checked in logfile: setting up ownership/permission is performed by make install

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../polkit/{polkit_0.111.bb => polkit_0.112.bb}       | 19 ++-----------------
 1 file changed, 2 insertions(+), 17 deletions(-)
 rename meta-oe/recipes-extended/polkit/{polkit_0.111.bb => polkit_0.112.bb} (76%)

diff --git a/meta-oe/recipes-extended/polkit/polkit_0.111.bb b/meta-oe/recipes-extended/polkit/polkit_0.112.bb
similarity index 76%
rename from meta-oe/recipes-extended/polkit/polkit_0.111.bb
rename to meta-oe/recipes-extended/polkit/polkit_0.112.bb
index 4614387..72b182b 100644
--- a/meta-oe/recipes-extended/polkit/polkit_0.111.bb
+++ b/meta-oe/recipes-extended/polkit/polkit_0.112.bb
@@ -23,26 +23,11 @@ SRC_URI = "http://www.freedesktop.org/software/polkit/releases/polkit-${PV}.tar.
            file://0001-configure.ac-Check-only-for-libsystemd-not-libsystem.patch \
 "
 
-SRC_URI[md5sum] = "81b116edf986d8e13502929a171f4e0d"
-SRC_URI[sha256sum] = "02ae544547211b687818c97bcbf19bf6b8b5be7fda93000525a8765c7bed1ea1"
+SRC_URI[md5sum] = "b0f2fa00a55f47c6a5d88e9b73f80127"
+SRC_URI[sha256sum] = "d695f43cba4748a822fbe864dd32c4887c5da1c71694a47693ace5e88fcf6af6"
 
 EXTRA_OECONF = "--with-os-type=moblin --disable-man-pages --disable-introspection"
 
-do_install_append() {
-    # see configure.log for more details
-    chown root:root ${D}${libdir}/${BPN}-1/polkit-agent-helper-1
-    chmod 4755 ${D}${libdir}/${BPN}-1/polkit-agent-helper-1
-
-    chown root:root ${D}${bindir}/pkexec
-    chmod 4755 ${D}${bindir}/pkexec
-
-    chown polkitd:polkitd ${D}${sysconfdir}/${BPN}-1/rules.d
-    chmod 700 ${D}${sysconfdir}/${BPN}-1/rules.d
-
-    chown polkitd:polkitd ${D}${datadir}/${BPN}-1/rules.d
-    chmod 700 ${D}${datadir}/${BPN}-1/rules.d
-}
-
 PACKAGES =+ "${PN}-examples"
 
 FILES_${PN} += " \
-- 
1.8.3.1


