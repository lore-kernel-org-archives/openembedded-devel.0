Return-Path: <amery@hanoverdisplays.com>
Received: from mail.hanoverdisplays.com (mail.hanoverdisplays.com [62.7.92.68])
	by mail.openembedded.org (Postfix) with ESMTP id 1D56E781F2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Jun 2017 20:24:07 +0000 (UTC)
Received: from localhost (192.168.0.21) by mail.hanoverdisplays.com
	(192.168.0.31) with Microsoft SMTP Server (TLS) id 14.3.319.2;
	Fri, 23 Jun 2017 21:24:07 +0100
From: Alejandro Mery <amery@hanoverdisplays.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 23 Jun 2017 21:23:20 +0100
Message-ID: <20170623202324.69194-3-amery@hanoverdisplays.com>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <20170623202324.69194-1-amery@hanoverdisplays.com>
References: <20170623202324.69194-1-amery@hanoverdisplays.com>
MIME-Version: 1.0
X-Originating-IP: [192.168.0.21]
X-GFI-SMTP-Submission: 1
X-GFI-SMTP-HelloDomain: localhost
X-GFI-SMTP-RemoteIP: 192.168.0.21
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [meta-oe][morty][PATCH 2/6] devmem2: use different filename to avoid checksum conflicts
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
X-List-Received-Date: Fri, 23 Jun 2017 20:24:07 -0000
Content-Type: text/plain

From: Denys Dmytriyenko <denys@ti.com>

The newly resurrected devmem2.c file besides having a new location, also
updates its header, producing different checksums, which would conflict
with any previously cached or mirrored instances. To avoid such conflicts,
use a different filename in fetch(). Rename it back to original name at
unpack() for devmem2-fixups-2.patch to succeed w/o modifications.

WARNING: devmem2-1.0-r7 do_fetch: Fetcher failure for URL: 'http://www.free-electrons.com/pub/mirror/devmem2.c'. Checksum mismatch!
File: '/OE/master/downloads/devmem2.c' has md5 checksum be12c0132a1ae118cbf5e79d98427c1d when e23f236e94be4c429aa1ceac0f01544b was expected
File: '/OE/master/downloads/devmem2.c' has sha256 checksum ec382c90af3ef2f49695ff14a4d6521e58ac482c4e29d6c9ebca8768f699c191 when 3b15515693bae1ebd14d914e46d388edfec2175829ea1576a7a0c8606ebbe639 was expected
If this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:
SRC_URI[md5sum] = "be12c0132a1ae118cbf5e79d98427c1d"
SRC_URI[sha256sum] = "ec382c90af3ef2f49695ff14a4d6521e58ac482c4e29d6c9ebca8768f699c191"
Otherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.

WARNING: devmem2-1.0-r7 do_fetch: Renaming /OE/sources/devmem2.c to /OE/sources/devmem2.c_bad-checksum_be12c0132a1ae118cbf5e79d98427c1d

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/devmem2/devmem2.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/devmem2/devmem2.bb b/meta-oe/recipes-support/devmem2/devmem2.bb
index c42eb5e0b..c86eb2e4b 100644
--- a/meta-oe/recipes-support/devmem2/devmem2.bb
+++ b/meta-oe/recipes-support/devmem2/devmem2.bb
@@ -3,12 +3,16 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://devmem2.c;endline=38;md5=a9eb9f3890384519f435aedf986297cf"
 PR = "r7"
 
-SRC_URI = "http://www.free-electrons.com/pub/mirror/devmem2.c \
+SRC_URI = "http://www.free-electrons.com/pub/mirror/devmem2.c;downloadfilename=devmem2-new.c \
            file://devmem2-fixups-2.patch;apply=yes;striplevel=0"
 S = "${WORKDIR}"
 
 CFLAGS += "-DFORCE_STRICT_ALIGNMENT"
 
+python do_unpack_append() {
+    os.rename("devmem2-new.c", "devmem2.c")
+}
+
 do_compile() {
     ${CC} -o devmem2 devmem2.c ${CFLAGS} ${LDFLAGS}
 }
-- 
2.13.0


