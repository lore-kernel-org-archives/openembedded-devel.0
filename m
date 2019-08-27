Return-Path: <anuj.mittal@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id A93607E5FB
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Aug 2019 02:05:38 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	26 Aug 2019 19:05:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,435,1559545200"; d="scan'208";a="187774053"
Received: from anmitta2-mobl1.png.intel.com ([172.30.199.133])
	by FMSMGA003.fm.intel.com with ESMTP; 26 Aug 2019 19:05:39 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 27 Aug 2019 10:05:36 +0800
Message-Id: <20190827020536.17397-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [meta-multimedia][PATCH] vlc: don't look at host headers for live555
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
X-List-Received-Date: Tue, 27 Aug 2019 02:05:38 -0000
Content-Transfer-Encoding: 8bit

Prevents errors when live555 is installed on build machine:

| ERROR: vlc-3.0.6-r0 do_configure: QA Issue: This autoconf log indicates errors, it looked at host include and/or library paths while determining system capabilities.
| Rerun configure task after fixing this. [configure-unsafe]
| ERROR: vlc-3.0.6-r0 do_configure: Fatal QA errors found, failing task.

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta-multimedia/recipes-multimedia/vlc/vlc.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc.inc b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
index 5c38be31f..7308465b1 100644
--- a/meta-multimedia/recipes-multimedia/vlc/vlc.inc
+++ b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
@@ -51,7 +51,7 @@ inherit ${@bb.utils.contains('PACKAGECONFIG', 'qt5', 'qmake5_paths', '', d)}
 PACKAGECONFIG[mad] = "--enable-mad,--disable-mad,libmad"
 PACKAGECONFIG[a52] = "--enable-a52,--disable-a52,liba52"
 PACKAGECONFIG[jack] = "--enable-jack,--disable-jack,jack"
-PACKAGECONFIG[live555] = "--enable-live555,--disable-live555,live555"
+PACKAGECONFIG[live555] = "--enable-live555 LIVE555_PREFIX=${STAGING_DIR_HOST}${prefix},--disable-live555,live555"
 PACKAGECONFIG[libass] = "--enable-libass,--disable-libass,libass"
 PACKAGECONFIG[postproc] = "--enable-postproc,--disable-postproc,libpostproc"
 PACKAGECONFIG[libva] = "--enable-libva,--disable-libva,libva"
-- 
2.21.0


