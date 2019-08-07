Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 39C297EFB8
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Aug 2019 05:17:50 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x775HoEC015858
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 6 Aug 2019 22:17:50 -0700 (PDT)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.468.0;
	Tue, 6 Aug 2019 22:17:49 -0700
From: <kai.kang@windriver.com>
To: <schnitzeltony@gmail.com>, <raj.khem@gmail.com>
Date: Wed, 7 Aug 2019 01:17:07 -0400
Message-ID: <20190807051707.8709-3-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20190807051707.8709-1-kai.kang@windriver.com>
References: <20190807051707.8709-1-kai.kang@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-xfce][Patch 2/2] xfce4-settings: rrecommends xfce4-datetime-setter
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
X-List-Received-Date: Wed, 07 Aug 2019 05:17:50 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

xfce4-datetime-setter provides function to set date and time. But it
depends on dbus service org.freedesktop.timedate1 which is provided by
systemd. Make xfce4-settings rrecommends xfce4-datetime-setter only
systemd is set in DISTRO_FEATURES.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.13.7.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.13.7.bb b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.13.7.bb
index e79b0ab0b..2d16a02ce 100644
--- a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.13.7.bb
+++ b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.13.7.bb
@@ -30,3 +30,4 @@ FILES_${PN} += " \
 RRECOMMENDS_${PN} += "adwaita-icon-theme"
 RRECOMMENDS_${PN} += "${@bb.utils.contains('DISTRO_FEATURES','alsa','libcanberra-alsa','',d)}"
 RRECOMMENDS_${PN} += "${@bb.utils.contains('DISTRO_FEATURES','pulseaudio','libcanberra-pulse','',d)}"
+RRECOMMENDS_${PN} += "${@bb.utils.contains('DISTRO_FEATURES','systemd','xfce4-datetime-setter','',d)}"
-- 
2.20.0


