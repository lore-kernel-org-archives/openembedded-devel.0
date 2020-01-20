Return-Path: <dhuo@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 865A27DDA5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Jan 2020 08:27:08 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 00K8Qh0R012326
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Jan 2020 00:26:59 -0800
Received: from pek-lpggp2 (128.224.153.75) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.468.0;
	Mon, 20 Jan 2020 00:26:21 -0800
Received: by pek-lpggp2 (Postfix, from userid 18189)	id 424977214EF; Mon, 20
	Jan 2020 16:25:58 +0800 (CST)
From: De Huo <De.Huo@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 20 Jan 2020 16:25:54 +0800
Message-ID: <20200120082554.161157-2-De.Huo@windriver.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200120082554.161157-1-De.Huo@windriver.com>
References: <20200120082554.161157-1-De.Huo@windriver.com>
MIME-Version: 1.0
Subject: [meta-oe][zeus][PATCH 2/2] kbd: avoid vlock conflict with busybox
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
X-List-Received-Date: Mon, 20 Jan 2020 08:27:13 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Hongxu Jia <hongxu.jia@windriver.com>

busybox as well as vlock utility from meta-oe provides vlock utility
which can conflict when with kbd if pam is a enabled distro_feature

Fixes image build errors

update-alternatives: Error: not linking <rootfs>/usr/bin/vlock to /bin/busybox.suid since <rootfs>/usr/bin/vlock exists and is not a link

ERROR: yoe-qt5-wayland-image-1.0-r0 do_rootfs: Postinstall scriptlets of ['busybox'] have failed. If the intention is to defer them to first boot,
then please place them into pkg_postinst_ontarget_${PN} ().
Deferring to first boot via 'exit 1' is no longer supported.

Signed-off-by: Khem Raj <raj.khem@gmail.com>

The vlock doesn't exist if PAM isn't enabled.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: De Huo <de.huo@windriver.com>
---
 meta/recipes-core/kbd/kbd_2.0.4.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/kbd/kbd_2.0.4.bb b/meta/recipes-core/kbd/kbd_2.0.4.bb
index 17ce6e7a9c..47e76da2b4 100644
--- a/meta/recipes-core/kbd/kbd_2.0.4.bb
+++ b/meta/recipes-core/kbd/kbd_2.0.4.bb
@@ -59,7 +59,8 @@ RDEPENDS_${PN}-ptest = "make"
 
 inherit update-alternatives
 
-ALTERNATIVE_${PN} = "chvt deallocvt fgconsole openvt showkey"
+ALTERNATIVE_${PN} = "chvt deallocvt fgconsole openvt showkey \
+                     ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'vlock','', d)}"
 ALTERNATIVE_PRIORITY = "100"
 
 BBCLASSEXTEND = "native"
-- 
2.23.0


