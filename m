Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D9CB36C0ED
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 25 May 2019 12:42:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x4PCg1ZX025664
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 25 May 2019 05:42:01 -0700 (PDT)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.439.0;
	Sat, 25 May 2019 05:42:00 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sat, 25 May 2019 08:41:56 -0400
Message-ID: <20190525124158.184776-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
Subject: [meta-xfce][PATCH 1/3] xfce4-session: 4.13.1 -> 4.13.2
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
X-List-Received-Date: Sat, 25 May 2019 12:42:01 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../{xfce4-session_4.13.1.bb => xfce4-session_4.13.2.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-xfce/xfce4-session/{xfce4-session_4.13.1.bb => xfce4-session_4.13.2.bb} (85%)

diff --git a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.13.1.bb b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.13.2.bb
similarity index 85%
rename from meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.13.1.bb
rename to meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.13.2.bb
index 3b9525fff..1a88e2de7 100644
--- a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.13.1.bb
+++ b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.13.2.bb
@@ -12,8 +12,8 @@ REQUIRED_DISTRO_FEATURES = "x11"
 SRC_URI += " \
     file://0001-configure.in-hard-code-path-to-iceauth.patch \
 "
-SRC_URI[md5sum] = "a47988a2c871a411c19e3af1eefe591e"
-SRC_URI[sha256sum] = "c789f0f8234e06f5266f0c6ccdbdcc3c085e8d9eea06a0eafe8f7cfc4fe23af4"
+SRC_URI[md5sum] = "1306b6166f47cdf6e0c61259abbb621f"
+SRC_URI[sha256sum] = "c0be0c7e602c962d0e8fca63bd86165e60313d07bfb72cf2c3f99ab53e2a22a1"
 
 ALTERNATIVE_${PN} = "x-session-manager"
 ALTERNATIVE_TARGET[x-session-manager] = "${bindir}/xfce4-session"
-- 
2.20.0


