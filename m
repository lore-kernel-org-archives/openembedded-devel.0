Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f176.google.com (mail-we0-f176.google.com
	[74.125.82.176])
	by mail.openembedded.org (Postfix) with ESMTP id 844D36E73C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jan 2014 11:37:20 +0000 (UTC)
Received: by mail-we0-f176.google.com with SMTP id q58so1597799wes.21
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jan 2014 03:37:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=+od/xdje/TOvVtUdgRz7J2qhXblIVrYTJbkQDtGCXkM=;
	b=E3HwlvGYVtQkY+hjI6BO+tZqAoKDJt3t+tipmi7xIbaaZLfyi7J9tHRaa+DopqJhXl
	runBgnkmFghNiREhTzxlF7yhd8kP4Ra9sG5t7hhoWEv7PiLQyE1FPDxsi2TXdTMx+35g
	oB7aSxVsskghS0ul05T46VERKhDb7zFyadQL+FEu7BL/pbnaij8yfq3SNyFgGOgbvLDp
	FGiak6bkVUrmtXRABaGjtD93NX04+joB0Wa0KahPToY22dCda/sBCVhZnP9KAKhBumu3
	0FSgfoqHJ9/RJOLEzMwdNDllhbEW8HW09F/Wp9HJDKgKz6PFWI6Bvaln5lII6IPZ+vng
	lnQg==
X-Gm-Message-State: ALoCoQnav3Aek9qCv1n1zf2ztRLJvHCia1taA0sul3Jp0I682HXHXOS7xNgHXbvJpwwXCzx0fp2I
X-Received: by 10.181.11.133 with SMTP id ei5mr1827375wid.2.1389785841100;
	Wed, 15 Jan 2014 03:37:21 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id ea4sm9087026wib.7.2014.01.15.03.37.20
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 15 Jan 2014 03:37:20 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 15 Jan 2014 11:37:11 +0000
Message-Id: <1389785832-3120-4-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1389785832-3120-1-git-send-email-ross.burton@intel.com>
References: <1389785832-3120-1-git-send-email-ross.burton@intel.com>
Subject: [meta-oe][PATCH 4/5] libsyncml: don't do out-of-tree builds manually
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
X-List-Received-Date: Wed, 15 Jan 2014 11:37:21 -0000

cmake.bbclass as of oe-core 783fb88 defaults to out-of-tree builds.  Use that
functionality instead of passing arguments to EXTRA_OECMAKE and _prepends.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta-oe/recipes-support/opensync/libsyncml_0.5.4.bb |   10 ----------
 1 file changed, 10 deletions(-)

diff --git a/meta-oe/recipes-support/opensync/libsyncml_0.5.4.bb b/meta-oe/recipes-support/opensync/libsyncml_0.5.4.bb
index 0575058..9cf9243 100644
--- a/meta-oe/recipes-support/opensync/libsyncml_0.5.4.bb
+++ b/meta-oe/recipes-support/opensync/libsyncml_0.5.4.bb
@@ -13,17 +13,7 @@ SRC_URI[sha256sum] = "05d6513637adb1300a3a58b6e29d53ab6373c8f370807d0d925bae72b2
 
 inherit cmake pkgconfig
 
-EXTRA_OECMAKE += " . -B${WORKDIR}/build "
-
 PACKAGES += "${PN}-tools"
 
 FILES_${PN}-tools = "${bindir}"
 FILES_${PN} = "${libdir}/*.so.*"
-
-do_build_prepend() {
-    cd ${WORKDIR}/build
-}
-
-do_install_prepend() {
-    cd ${WORKDIR}/build
-}
-- 
1.7.10.4


