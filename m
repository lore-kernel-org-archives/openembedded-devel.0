Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 763AB605B3
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Nov 2016 08:06:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id uA98637K019906
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 9 Nov 2016 00:06:03 -0800 (PST)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Wed, 9 Nov 2016 00:06:02 -0800
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 9 Nov 2016 15:58:51 +0800
Message-ID: <20161109075853.12636-2-kai.kang@windriver.com>
X-Mailer: git-send-email 2.10.1
In-Reply-To: <20161109075853.12636-1-kai.kang@windriver.com>
References: <20161109075853.12636-1-kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/3] iozone3: 434 -> 465
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
X-List-Received-Date: Wed, 09 Nov 2016 08:06:02 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Update LIC_FILES_CHKSUM according to:

http://www.iozone.org/docs/Iozone_License.txt

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../recipes-benchmark/iozone3/{iozone3_434.bb => iozone3_465.bb} | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-benchmark/iozone3/{iozone3_434.bb => iozone3_465.bb} (92%)

diff --git a/meta-oe/recipes-benchmark/iozone3/iozone3_434.bb b/meta-oe/recipes-benchmark/iozone3/iozone3_465.bb
similarity index 92%
rename from meta-oe/recipes-benchmark/iozone3/iozone3_434.bb
rename to meta-oe/recipes-benchmark/iozone3/iozone3_465.bb
index daa36ee..67ce885 100644
--- a/meta-oe/recipes-benchmark/iozone3/iozone3_434.bb
+++ b/meta-oe/recipes-benchmark/iozone3/iozone3_465.bb
@@ -3,13 +3,14 @@ HOMEPAGE = "http://www.iozone.org/"
 AUTHOR = "Don Capps <don.capps2@verizon.net>, William D. Norcott <wnorcott@us.oracle.com>"
 SECTION = "console/tests"
 LICENSE = "iozone3"
-LIC_FILES_CHKSUM = "file://iozone.c;beginline=268;endline=272;md5=ab42a6185fd0443978871f11a007ac0b"
-
+LIC_FILES_CHKSUM = "file://iozone.c;beginline=37;endline=48;md5=7331260091868dcad0f9edea735b5f4b \
+    file://iozone.c;beginline=260;endline=266;md5=77f9ee51e45b57a7e7519c4fa0b4f00b \
+"
 SRC_URI = "http://www.iozone.org/src/current/${BPN}_${PV}.tar \
     file://copyright.txt \
 "
-SRC_URI[md5sum] = "3e8f4213581407225065b91774e970ed"
-SRC_URI[sha256sum] = "2c388d9db393a5505b31eca38951883744c69745f687f3c7df5185b4681d462a"
+SRC_URI[md5sum] = "c924e5e46fb1cf8145f420e8e57eb954"
+SRC_URI[sha256sum] = "2e3d72916e7d7340a7c505fc0c3d28553fcc5ff2daf41d811368e55bd4e6a293"
 
 S = "${WORKDIR}/${BPN}_${PV}/src/current/"
 
-- 
2.10.1


