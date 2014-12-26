Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qg0-f41.google.com (mail-qg0-f41.google.com
	[209.85.192.41])
	by mail.openembedded.org (Postfix) with ESMTP id 05745727C7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Dec 2014 19:21:46 +0000 (UTC)
Received: by mail-qg0-f41.google.com with SMTP id e89so5685655qgf.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Dec 2014 11:21:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:organization; bh=JQp9SRaxisXhEv5tjDr1nWm70St5nUSqOPXN4tG2rAM=;
	b=K4w2VbbziLKtqfaxmobMkxUr1eTOFRlptwfjn9aqo3BBMDQqo4LiOk7m0mvoQxxmGy
	GoHE1Wtjq6jHCEK7tiRHNpt1ujzcoIG1X8AzhUbwksL8vLh2bJXG6Izv7RBpbMeAIG8l
	1Lzzg+tatTU9g5hlQgIxxX/PsLFSFZGhaC9ecWDQ/WxLBetVCGnyM/3Cx5sKyOnSoLWs
	hWTYiBMF1uLlqOw4jEP7Kz96M9yCdgYox/RmEXQRlFzfKmtS2/HRQApitKIpJmIlL44q
	EqwqkO3wa+YcJCeEyYsl2Mxm/U5FwsJyh0tHdp7dHeiOqpB9fWTl3vLGmMX2HoX5uauH
	z3hw==
X-Received: by 10.229.225.195 with SMTP id it3mr19880725qcb.24.1419621707329; 
	Fri, 26 Dec 2014 11:21:47 -0800 (PST)
Received: from centrium.lab.ossystems.com.br ([177.100.225.47])
	by mx.google.com with ESMTPSA id
	k11sm26659998qgf.18.2014.12.26.11.21.44
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 26 Dec 2014 11:21:45 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Fri, 26 Dec 2014 17:21:37 -0200
Message-Id: <1419621700-1102-9-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.1.3
In-Reply-To: <1419621700-1102-1-git-send-email-otavio@ossystems.com.br>
References: <1419621700-1102-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 09/12] libspatialite: Fix license format QA error
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
X-List-Received-Date: Fri, 26 Dec 2014 19:21:47 -0000

Fix the following QA error:

,----
| WARNING: Recipe libspatialite, LICENSE (MPLv1.1 GPLv2+ LGPLv2.1+) has
|     invalid format, LICENSES must have operator "([&|() ])" between
|     them.
`----

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/recipes-navigation/libspatialite/libspatialite.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-navigation/libspatialite/libspatialite.inc b/meta-oe/recipes-navigation/libspatialite/libspatialite.inc
index c8d7ec1..b5c3879 100644
--- a/meta-oe/recipes-navigation/libspatialite/libspatialite.inc
+++ b/meta-oe/recipes-navigation/libspatialite/libspatialite.inc
@@ -5,7 +5,7 @@ DEPENDS = "proj geos sqlite3"
 
 INC_PR = "r0"
 
-LICENSE = "MPLv1.1 GPLv2+ LGPLv2.1+"
+LICENSE = "MPLv1.1 & GPLv2+ & LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0e92e1a36cc384b60f5b31dde0bdd39e"
 
 SRC_URI = "http://www.gaia-gis.it/gaia-sins/libspatialite-sources/libspatialite-${PV}.tar.gz"
-- 
2.1.3


