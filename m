Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D6B57701F3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Sep 2014 08:14:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s8G8E4nY029816
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Sep 2014 01:14:04 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Tue, 16 Sep 2014 01:14:03 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 16 Sep 2014 16:14:32 +0800
Message-ID: <1410855272-15776-2-git-send-email-Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1410855272-15776-1-git-send-email-Qi.Chen@windriver.com>
References: <1410855272-15776-1-git-send-email-Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 2/2] hostapd: use ${PN} for SYSTEMD_SERVICE
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
X-List-Received-Date: Tue, 16 Sep 2014 08:14:07 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Use ${PN} for SYSTEMD_SERVICE to avoid errors in case of multilib.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../recipes-connectivity/hostapd/hostapd_2.2.bb    |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-connectivity/hostapd/hostapd_2.2.bb b/meta-oe/recipes-connectivity/hostapd/hostapd_2.2.bb
index f1c6b3a..b75f2b9 100644
--- a/meta-oe/recipes-connectivity/hostapd/hostapd_2.2.bb
+++ b/meta-oe/recipes-connectivity/hostapd/hostapd_2.2.bb
@@ -7,9 +7,9 @@ SUMMARY = "User space daemon for extended IEEE 802.11 management"
 
 inherit update-rc.d systemd
 INITSCRIPT_NAME = "hostapd"
-SYSTEMD_PACKAGES = "hostapd"
-SYSTEMD_SERVICE_hostapd = "hostapd.service"
-SYSTEMD_AUTO_ENABLE_hostapd = "disable"
+
+SYSTEMD_SERVICE_${PN} = "hostapd.service"
+SYSTEMD_AUTO_ENABLE_${PN} = "disable"
 
 DEFAULT_PREFERENCE = "-1"
 
-- 
1.7.9.5


