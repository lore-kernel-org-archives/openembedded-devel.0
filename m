Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id EA9BE6AC8B
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  2 Jul 2014 06:57:47 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s626vnaw016262
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 1 Jul 2014 23:57:49 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 1 Jul 2014 23:57:49 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 1 Jul 2014 23:56:41 -0700
Message-ID: <1404284261-42377-15-git-send-email-liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1404284261-42377-1-git-send-email-liezhi.yang@windriver.com>
References: <1404284261-42377-1-git-send-email-liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [meta-multimedia] [PATCH 14/74] openal-soft: use BPN in SRC_URI
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
X-List-Received-Date: Wed, 02 Jul 2014 06:57:50 -0000
Content-Type: text/plain

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../openal/openal-soft_1.15.1.bb                   |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/openal/openal-soft_1.15.1.bb b/meta-multimedia/recipes-multimedia/openal/openal-soft_1.15.1.bb
index b956b84..d11b4d8 100644
--- a/meta-multimedia/recipes-multimedia/openal/openal-soft_1.15.1.bb
+++ b/meta-multimedia/recipes-multimedia/openal/openal-soft_1.15.1.bb
@@ -9,7 +9,7 @@ DEPENDS = "${@base_contains('DISTRO_FEATURES', 'alsa', 'alsa-lib', '', d)} \
            ${@base_contains('DISTRO_FEATURES', 'pulseaudio', 'pulseaudio', '', d)} \
 "
 
-SRC_URI = "http://kcat.strangesoft.net/openal-releases/${PN}-${PV}.tar.bz2"
+SRC_URI = "http://kcat.strangesoft.net/openal-releases/${BP}.tar.bz2"
 SRC_URI[md5sum] = "ea83dec3b9655a27d28e7bc7cae9cd71"
 SRC_URI[sha256sum] = "0e29a162f0841ccb4135ce76e92e8a704589b680a85eddf76f898de5236eb056"
 
-- 
1.7.9.5


