Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 396AA7E773
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Jul 2019 01:30:38 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x621Ud77023708
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 1 Jul 2019 18:30:39 -0700 (PDT)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.439.0;
	Mon, 1 Jul 2019 18:30:38 -0700
From: <kai.kang@windriver.com>
To: <raj.khem@gmail.com>
Date: Mon, 1 Jul 2019 21:29:10 -0400
Message-ID: <20190702012913.7163-9-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20190702012913.7163-1-kai.kang@windriver.com>
References: <20190702012913.7163-1-kai.kang@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-xfce][Patch 08/11] xfce4-session: 4.13.2 -> 4.13.3
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
X-List-Received-Date: Tue, 02 Jul 2019 01:30:38 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../{xfce4-session_4.13.2.bb => xfce4-session_4.13.3.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-xfce/xfce4-session/{xfce4-session_4.13.2.bb => xfce4-session_4.13.3.bb} (87%)

diff --git a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.13.2.bb b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.13.3.bb
similarity index 87%
rename from meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.13.2.bb
rename to meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.13.3.bb
index dc44c4b0b..dd89e6d77 100644
--- a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.13.2.bb
+++ b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.13.3.bb
@@ -23,8 +23,8 @@ REQUIRED_DISTRO_FEATURES = "x11"
 SRC_URI += " \
     file://0001-configure.in-hard-code-path-to-iceauth.patch \
 "
-SRC_URI[md5sum] = "1306b6166f47cdf6e0c61259abbb621f"
-SRC_URI[sha256sum] = "c0be0c7e602c962d0e8fca63bd86165e60313d07bfb72cf2c3f99ab53e2a22a1"
+SRC_URI[md5sum] = "94eca4dd2280910292abf9692304ce2c"
+SRC_URI[sha256sum] = "eaed34f29aa044d878d60dcb7293a542f48248919e3dcd8df98215121cb6d362"
 
 ALTERNATIVE_${PN} = "x-session-manager"
 ALTERNATIVE_TARGET[x-session-manager] = "${bindir}/xfce4-session"
-- 
2.20.0


