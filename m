Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 65B416AE1A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Jun 2013 02:32:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r5Q2WDGx005520
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Jun 2013 19:32:14 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Tue, 25 Jun 2013 19:32:13 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 26 Jun 2013 10:32:09 +0800
Message-ID: <702dd5ac09c4e06fcad0b1831217ea3416d6c764.1372213028.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1372213028.git.hongxu.jia@windriver.com>
References: <cover.1372213028.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] qt-x11-free: add missing DEPENDS on libglu for LSB Library Check
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
X-List-Received-Date: Wed, 26 Jun 2013 02:32:12 -0000
Content-Type: text/plain

When libglu is missing in qt-x11-free's DEPENDS, the LSB 4.1 Library
Check will fail:
...
Checking library symbols (libqt-mt.so.3)
Did not find _ZN10QGLContext10currentCtxE (unversioned) in libqt-mt.so.3
Unmangled symbol name: QGLContext::currentCtx
...

[YOCTO #4016]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 recipes-qt3/qt3/qt-x11-free_3.3.7.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt3/qt3/qt-x11-free_3.3.7.bb b/recipes-qt3/qt3/qt-x11-free_3.3.7.bb
index a67dd63..af4fc01 100644
--- a/recipes-qt3/qt3/qt-x11-free_3.3.7.bb
+++ b/recipes-qt3/qt3/qt-x11-free_3.3.7.bb
@@ -1,4 +1,4 @@
-DEPENDS = "qt-x11-free-native freetype virtual/libx11 libxmu libxft libxext libxrender libxrandr libxcursor  virtual/libgl"
+DEPENDS = "qt-x11-free-native freetype virtual/libx11 libxmu libxft libxext libxrender libxrandr libxcursor  virtual/libgl libglu"
 PROVIDES = "qt3x11"
 PR = "${INC_PR}.1"
 
-- 
1.8.1.2


