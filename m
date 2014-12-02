Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CFB7760232
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Dec 2014 09:35:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sB29Z2G8015539
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 2 Dec 2014 01:35:02 -0800 (PST)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.174.1; Tue, 2 Dec 2014 01:35:01 -0800
From: Kai Kang <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 2 Dec 2014 17:33:45 +0800
Message-ID: <1417512825-2512-1-git-send-email-kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [128.224.153.152]
Subject: [meta-oe][PATCH] libcanberra: fix installed-vs-shipped warning
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
X-List-Received-Date: Tue, 02 Dec 2014 09:35:08 -0000
Content-Type: text/plain

From: Robert Yang <liezhi.yang@windriver.com>

When build libcanberra for powerpc64 bsp, it shows warning:

WARNING: QA Issue: libcanberra: Files/directories were installed but not shipped
  /lib
  /lib/systemd
  /lib/systemd/system
  /lib/systemd/system/canberra-system-shutdown.service
  /lib/systemd/system/canberra-system-shutdown-reboot.service
  /lib/systemd/system/canberra-system-bootup.service [installed-vs-shipped]

Update FILES_${PN}-systemd to fix it.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta-oe/recipes-support/libcanberra/libcanberra_0.29.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/libcanberra/libcanberra_0.29.bb b/meta-oe/recipes-support/libcanberra/libcanberra_0.29.bb
index cb171ac..0f00b20 100644
--- a/meta-oe/recipes-support/libcanberra/libcanberra_0.29.bb
+++ b/meta-oe/recipes-support/libcanberra/libcanberra_0.29.bb
@@ -59,4 +59,4 @@ FILES_${PN}-gtk3 = "${libdir}/${BPN}-gtk3.so.* \
 FILES_${PN}-gnome = "${libdir}/gnome-settings-daemon-3.0/ \
                      ${datadir}/gdm/ ${datadir}/gnome/"
 
-FILES_${PN}-systemd = "${base_libdir}/systemd/system/*.service"
+FILES_${PN}-systemd = "${systemd_unitdir}/system/*.service"
-- 
1.9.1


