Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E7EC0713E4
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Sep 2014 16:27:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s89GS1bg005025
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 9 Sep 2014 09:28:01 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 9 Sep 2014 09:28:00 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 9 Sep 2014 09:27:51 -0700
Message-ID: <13a81d27a5717322d1b4f9c3da6f7b95ae7190d4.1410279874.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1410279874.git.liezhi.yang@windriver.com>
References: <cover.1410279874.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 07/14] memcached: add bash to RDEPENDS_memcached
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
X-List-Received-Date: Tue, 09 Sep 2014 16:28:02 -0000
Content-Type: text/plain

Bashism:
possible bashism in memcached/etc/init.d/memcached line 40 (bash arrays, ${name[0|*|@]}):
if [ -r "${FILES[0]}" ]; then
possible bashism in memcached/etc/init.d/memcached line 42 (bash arrays, ${name[0|*|@]}):
  for FILE in "${FILES[@]}";
possible bashism in memcached/etc/init.d/memcached line 53 (should be VAR="${VAR}foo"):
      CONFIGS+=($NAME)
possible bashism in memcached/etc/init.d/memcached line 54 (should be 'b = a'):
    elif [ "memcached_$2" == "$NAME" ];
possible bashism in memcached/etc/init.d/memcached line 62 (bash arrays, ${name[0|*|@]}):
  if [ ${#CONFIGS[@]} == 0 ];
possible bashism in memcached/etc/init.d/memcached line 71 (bash arrays, ${name[0|*|@]}):
CONFIG_NUM=${#CONFIGS[@]}
possible bashism in memcached/etc/init.d/memcached line 72 ('((' should be '$(('):
for ((i=0; i < $CONFIG_NUM; i++)); do
possible bashism in memcached/etc/init.d/memcached line 73 (bash arrays, ${name[0|*|@]}):
  NAME=${CONFIGS[${i}]}

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../recipes-support/memcached/memcached_1.4.17.bb  |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/memcached/memcached_1.4.17.bb b/meta-networking/recipes-support/memcached/memcached_1.4.17.bb
index e61bc74..4d93f04 100644
--- a/meta-networking/recipes-support/memcached/memcached_1.4.17.bb
+++ b/meta-networking/recipes-support/memcached/memcached_1.4.17.bb
@@ -15,7 +15,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=7e5ded7363d335e1bb18013ca08046ff"
 inherit autotools
 
 DEPENDS += "libevent"
-RDEPENDS_${PN} += "perl perl-module-posix perl-module-autoloader perl-module-tie-hash"
+RDEPENDS_${PN} += "perl perl-module-posix perl-module-autoloader \
+    perl-module-tie-hash bash \
+    "
 
 SRC_URI = "http://www.memcached.org/files/${BP}.tar.gz \
            file://configure.patch \
-- 
1.7.9.5


