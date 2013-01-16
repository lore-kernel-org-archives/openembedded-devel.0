Received: from mail-oa0-f52.google.com ([209.85.219.52])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <colin.foeparker@aclimalabs.com>) id 1TvcKz-0000Db-BG
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Jan 2013 00:24:10 +0100
Received: by mail-oa0-f52.google.com with SMTP id o6so2062687oag.11
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Jan 2013 15:08:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=KiIxSFDrGPbvujsOa+M2nicpquVMzmi3nTGo405Nwog=;
	b=VhgVgRYKb1tUpcfzp1yKAt2SJJlHaErMNnyK9VeGgrIPpeWi2dL4DLdOfLK0eeaxT7
	us4faXZ1N4Cb3O3JhrQ4JG7mEVkd40vTH46BCU/FHtB+BGmrPCC2BDvEkoBJg0K5zYbH
	K+STJYnsAv3v1I+1mdHYZ2VLfChuu3IA7piiSDf7ie6Kwb5AVjV10Pzb0oMvKUGYgsd6
	De3xhF/Tu15L20i8mtMNJp6U4ghNAHA890oJOvXEXpEqZUveyROrfNlH5vKSQ9ICsmC8
	LS0H4HRQKy6qX8gvnpoRYEjNyfBg1E8feVx5xsQGHgmItizjUyggMG8dvhr3CnTjJbr9
	w+vg==
X-Received: by 10.60.12.72 with SMTP id w8mr2376340oeb.83.1358377722608;
	Wed, 16 Jan 2013 15:08:42 -0800 (PST)
Received: from localhost.localdomain
	(108-94-24-230.lightspeed.sntcca.sbcglobal.net. [108.94.24.230])
	by mx.google.com with ESMTPS id 7sm16668045obu.4.2013.01.16.15.08.40
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 16 Jan 2013 15:08:41 -0800 (PST)
From: Colin Foe-Parker <colin.foeparker@aclimalabs.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 16 Jan 2013 15:08:30 -0800
Message-Id: <1358377712-18666-1-git-send-email-colin.foeparker@aclimalabs.com>
X-Mailer: git-send-email 1.7.9.5
X-Gm-Message-State: ALoCoQlWQZA9+/tQoAkwVVyOwz7P+xTCosSD6rp15E3Xd8nNhQKR/f2VUkBTrn0FDqDfTBkQ4MU1
Subject: [PATCH] META-OE: DENZIL Branch: SSVB-CPUBURN-A8: MD5SUM and SHA256SUM don't match source.
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
X-List-Received-Date: Wed, 16 Jan 2013 23:24:10 -0000

Updated the md5sum and sha256sum for the ssvb-cpuburn-a8.S file

Signed-off-by: Colin Foe-Parker <colin.foeparker@aclimalabs.com>
---
 meta-oe/recipes-benchmark/cpuburn/cpuburn-neon.bb |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-benchmark/cpuburn/cpuburn-neon.bb b/meta-oe/recipes-benchmark/cpuburn/cpuburn-neon.bb
index bb9ca1c..68833e6 100644
--- a/meta-oe/recipes-benchmark/cpuburn/cpuburn-neon.bb
+++ b/meta-oe/recipes-benchmark/cpuburn/cpuburn-neon.bb
@@ -13,8 +13,8 @@ SRC_URI = "http://hardwarebug.org/files/burn.S;name=mru \
            http://github.com/downloads/ssvb/ssvb.github.com/ssvb-cpuburn-a8.S;name=ssvb"
 SRC_URI[mru.md5sum] = "823abc72c2cd448e87df9bc5355a4456"
 SRC_URI[mru.sha256sum] = "01d9fc04f83740c513c25401dcc89c11b2a5a6013e70bfca42b7b02129f88cd2"
-SRC_URI[ssvb.md5sum] = "f1af41dcd56e4f0f7e92b67109dc01ed"
-SRC_URI[ssvb.sha256sum] = "95e2267a684be0d848dd6f935e769fa3ed810274ebacddc3fe8ddac4b34838c2"
+SRC_URI[ssvb.md5sum] = "0acc570d943c41c7f8602b9ff6fa111d"
+SRC_URI[ssvb.sha256sum] = "bfddd3226a499ffdf71bb58c05ccdc6dac5bb2c2c3bdb10ac610ee0b60aac087"
 
 S = "${WORKDIR}"
 
-- 
1.7.9.5



