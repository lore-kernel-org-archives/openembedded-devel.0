Return-Path: <cvubrugier@fastmail.fm>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53DBDC3DA4A
	for <webhook@archiver.kernel.org>; Mon, 19 Aug 2024 20:30:55 +0000 (UTC)
Received: from fout2-smtp.messagingengine.com (fout2-smtp.messagingengine.com [103.168.172.145])
 by mx.groups.io with SMTP id smtpd.web11.3016.1724099451633897263
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Aug 2024 13:30:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fastmail.fm header.s=fm1 header.b=iof+uHNK;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=dLVrpoqO;
 spf=pass (domain: fastmail.fm, ip: 103.168.172.145, mailfrom: cvubrugier@fastmail.fm)
Received: from phl-compute-05.internal (phl-compute-05.nyi.internal [10.202.2.45])
	by mailfout.nyi.internal (Postfix) with ESMTP id B8B04138DD81;
	Mon, 19 Aug 2024 16:30:50 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Mon, 19 Aug 2024 16:30:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.fm; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm1; t=1724099450; x=1724185850; bh=3GTMkRYD8yno9VrwfmYhB
	7OU6jnvmtK2KNVC3b56V3M=; b=iof+uHNKCagbBAgKeVnnVQbKOQ0DEdZ/hJ4jz
	lpR7X7dXAAbhAHsYUB06GV2H8zlp3iDuq5nKywUCOzx7durqhsp8Om239MBn/pu9
	noiLMiGGT9RbukNSCFRj6N5w22+KnbyKLMVxwogWHBIkOIV0Adv2vyiw3oRbpAxN
	w40yJOEdPwDOoWiqmDWH+32OJIet/8JQrXGyxykmupXxsWe40fSEzhfv9r0md16z
	hVnwCnjlAxzikm4/VeN3gngfNCPIsIXalvgS1icOrcIPNBlxjwcq+QDGUrDbWuQ9
	vnaslCaOTBBfvNf5NE9nhCu1VKg/3m2n0x+vE6xX6c0WZ4zOQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1724099450; x=1724185850; bh=3GTMkRYD8yno9VrwfmYhB7OU6jnv
	mtK2KNVC3b56V3M=; b=dLVrpoqOL9+eIRlD+kuWA49S+ZKGitJDrpMgud/vYxvq
	8sg7DaHP508hO7FS10ajEfkoYicSCRV3csJZX79lefUEIdzCUp9UzzDSWkVMZjg6
	eR1xa4S83Ve1sLTi/3ACEbNEvy002CaE8g2fv6c+UiMLE8ujPa2MCsAYIWF+Nf/T
	nk5EfpwovCqqEKF5Cca6Eo+rAbW8ViAKJnMKc6+KzX9NNXPB9to6tHZKKQPXU4wW
	7DTppkS9Jkvc3OKm54T8UNAdwmh9/FCfxzhL4LyOPevp+ITMtCqTQrAy7kXpvDHO
	1TPPpEI2saac1Xslj4c6XoJb1Z7Np2hC/nvv0rtHqg==
X-ME-Sender: <xms:eqvDZta88KeFBStPfjAB_tpkobCZUje_H-tHa4dAX59MBwCUmOZWjg>
    <xme:eqvDZkbHZrxUMYpguab9vDVtxMhX-Sa7Nh2F22NZJPY6j2wCWNy16wHd_geXBUZEh
    HT2FULWiK7Weom6_A>
X-ME-Received: <xmr:eqvDZv8UtO643oO-IIwjtyljAq1McwucEApJLWnx1Io23_4M0ko2EHhRc46p70--bYGMjIv3I0sCtJ4tY0JGZs-FU_gSj0qIUD2DCJogyM2u>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddruddugedgudehudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecu
    hfhrohhmpegtvhhusghruhhgihgvrhesfhgrshhtmhgrihhlrdhfmhenucggtffrrghtth
    gvrhhnpefhtedtleefteeiveelkeeiteffveetffeiffeuvdevudffkeehheevheeihefg
    gfenucffohhmrghinhepghgvnhhtohhordhorhhgpdhgihhthhhusgdrtghomhenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegtvhhusghruhhg
    ihgvrhesfhgrshhtmhgrihhlrdhfmhdpnhgspghrtghpthhtohepvddpmhhouggvpehsmh
    htphhouhhtpdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdguvghvvghlsehlihhs
    thhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdprhgtphhtthhopegthhhrihhsthhoph
    hhvgdrvhhuqdgsrhhughhivghrsehsvggrghgrthgvrdgtohhm
X-ME-Proxy: <xmx:eqvDZrp2gS_eJcA8vqT38wpmBh1pO28Qiv0u8jG5KjdkfwrD9BSiVg>
    <xmx:eqvDZopthobtYPkvV4HN2WoQK8_Kp3h_15df5CuxK2fzOsJ7_nQKRA>
    <xmx:eqvDZhQ8xTU7jP9vOkPmJ5h1k6mWXcC9fJTJ-OMIiHi3a-zhlMY0cA>
    <xmx:eqvDZgoeAka2VuRZrq1UcUQWPPQgWdJ4o5MLrL59eg7MhTrYUCMI0Q>
    <xmx:eqvDZv3hGR3OLMrhVRi6sptMvV-JF1qiES45wHG3DDhVuRNEvJlbjD6q>
Feedback-ID: i09e840f8:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 19 Aug 2024 16:30:49 -0400 (EDT)
From: cvubrugier@fastmail.fm
To: openembedded-devel@lists.openembedded.org
Cc: Christophe Vu-Brugier <christophe.vu-brugier@seagate.com>
Subject: [meta-oe][PATCH] nvme-cli: upgrade 2.9.1 -> 2.10.2
Date: Mon, 19 Aug 2024 22:30:35 +0200
Message-ID: <20240819203035.32633-1-cvubrugier@fastmail.fm>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Aug 2024 20:30:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111858

From: Christophe Vu-Brugier <christophe.vu-brugier@seagate.com>

Signed-off-by: Christophe Vu-Brugier <christophe.vu-brugier@seagate.com>
---
 ...0001-nvme-Use-C99-types-for-uint32_t.patch | 88 -------------------
 ...stc-Replace-__uint16_t-with-uint16_t.patch | 34 -------
 .../{nvme-cli_2.9.1.bb => nvme-cli_2.10.2.bb} |  7 +-
 3 files changed, 2 insertions(+), 127 deletions(-)
 delete mode 100644 meta-oe/recipes-bsp/nvme-cli/nvme-cli/0001-nvme-Use-C99-types-for-uint32_t.patch
 delete mode 100644 meta-oe/recipes-bsp/nvme-cli/nvme-cli/0001-plugins-ssstc-Replace-__uint16_t-with-uint16_t.patch
 rename meta-oe/recipes-bsp/nvme-cli/{nvme-cli_2.9.1.bb => nvme-cli_2.10.2.bb} (86%)

diff --git a/meta-oe/recipes-bsp/nvme-cli/nvme-cli/0001-nvme-Use-C99-types-for-uint32_t.patch b/meta-oe/recipes-bsp/nvme-cli/nvme-cli/0001-nvme-Use-C99-types-for-uint32_t.patch
deleted file mode 100644
index be1452af5..000000000
--- a/meta-oe/recipes-bsp/nvme-cli/nvme-cli/0001-nvme-Use-C99-types-for-uint32_t.patch
+++ /dev/null
@@ -1,88 +0,0 @@
-From ac2ff1dbe0b44953de636c50c7d7f8c1e9f1e458 Mon Sep 17 00:00:00 2001
-From: Sam James <sam@gentoo.org>
-Date: Sat, 4 May 2024 09:13:06 +0100
-Subject: [PATCH] nvme: Use C99 types for uint32_t
-
-<stdint.h> provides `uint32_t`, while `u_int_32` is an unofficial/internal
-typedef that glibc happens to provide. This fixes the build on musl.
-
-Bug: https://bugs.gentoo.org/931194
-
-Upstream-Status: Backport [https://github.com/linux-nvme/nvme-cli/commit/ac2ff1dbe0b44953de636c50c7d7f8c1e9f1e458]
-Signed-off-by: Sam James <sam@gentoo.org>
----
- nvme.c        | 13 +++++++------
- util/base64.c |  5 +++--
- 2 files changed, 10 insertions(+), 8 deletions(-)
-
-diff --git a/nvme.c b/nvme.c
-index 46a2399a..5409ddf2 100644
---- a/nvme.c
-+++ b/nvme.c
-@@ -34,6 +34,7 @@
- #include <inttypes.h>
- #include <locale.h>
- #include <stdio.h>
-+#include <stdint.h>
- #include <stdlib.h>
- #include <string.h>
- #include <unistd.h>
-@@ -9081,8 +9082,8 @@ static int check_dhchap_key(int argc, char **argv, struct command *command, stru
- 
- 	unsigned char decoded_key[128];
- 	unsigned int decoded_len;
--	u_int32_t crc = crc32(0L, NULL, 0);
--	u_int32_t key_crc;
-+	uint32_t crc = crc32(0L, NULL, 0);
-+	uint32_t key_crc;
- 	int err = 0, hmac;
- 	struct config {
- 		char	*key;
-@@ -9150,10 +9151,10 @@ static int check_dhchap_key(int argc, char **argv, struct command *command, stru
- 		return -EINVAL;
- 	}
- 	crc = crc32(crc, decoded_key, decoded_len);
--	key_crc = ((u_int32_t)decoded_key[decoded_len]) |
--		   ((u_int32_t)decoded_key[decoded_len + 1] << 8) |
--		   ((u_int32_t)decoded_key[decoded_len + 2] << 16) |
--		   ((u_int32_t)decoded_key[decoded_len + 3] << 24);
-+	key_crc = ((uint32_t)decoded_key[decoded_len]) |
-+		   ((uint32_t)decoded_key[decoded_len + 1] << 8) |
-+		   ((uint32_t)decoded_key[decoded_len + 2] << 16) |
-+		   ((uint32_t)decoded_key[decoded_len + 3] << 24);
- 	if (key_crc != crc) {
- 		nvme_show_error("CRC mismatch (key %08x, crc %08x)", key_crc, crc);
- 		return -EINVAL;
-diff --git a/util/base64.c b/util/base64.c
-index 7f47cda6..0e89f2e9 100644
---- a/util/base64.c
-+++ b/util/base64.c
-@@ -20,6 +20,7 @@
-  * MA  02110-1301, USA.
-  */
- 
-+#include <stdint.h>
- #include <stdlib.h>
- #include <string.h>
- #include <errno.h>
-@@ -42,7 +43,7 @@ static const char base64_table[65] =
- int base64_encode(const unsigned char *src, int srclen, char *dst)
- {
- 	int i, bits = 0;
--	u_int32_t ac = 0;
-+	uint32_t ac = 0;
- 	char *cp = dst;
- 
- 	for (i = 0; i < srclen; i++) {
-@@ -77,7 +78,7 @@ int base64_encode(const unsigned char *src, int srclen, char *dst)
-  */
- int base64_decode(const char *src, int srclen, unsigned char *dst)
- {
--	u_int32_t ac = 0;
-+	uint32_t ac = 0;
- 	int i, bits = 0;
- 	unsigned char *bp = dst;
- 
--- 
-2.45.1
-
diff --git a/meta-oe/recipes-bsp/nvme-cli/nvme-cli/0001-plugins-ssstc-Replace-__uint16_t-with-uint16_t.patch b/meta-oe/recipes-bsp/nvme-cli/nvme-cli/0001-plugins-ssstc-Replace-__uint16_t-with-uint16_t.patch
deleted file mode 100644
index 1881b18aa..000000000
--- a/meta-oe/recipes-bsp/nvme-cli/nvme-cli/0001-plugins-ssstc-Replace-__uint16_t-with-uint16_t.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 47d33d8da7a5b7310a2c2f4328115b439039e46c Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 21 May 2024 14:09:32 -0700
-Subject: [PATCH] plugins/ssstc: Replace __uint16_t with uint16_t
-
-uint16_t is ISO defined and comes from stdint.h, makes it
-portable across glibc and musl on linux.
-
-Upstream-Status: Submitted [https://github.com/linux-nvme/nvme-cli/pull/2351]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- plugins/ssstc/ssstc-nvme.c | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/plugins/ssstc/ssstc-nvme.c b/plugins/ssstc/ssstc-nvme.c
-index 03e4fe3f..302df988 100644
---- a/plugins/ssstc/ssstc-nvme.c
-+++ b/plugins/ssstc/ssstc-nvme.c
-@@ -64,9 +64,9 @@ void show_ssstc_add_smart_log_jsn(struct nvme_additional_smart_log *smart,
- 		unsigned int nsid, const char *devname)
- {
- 	struct json_object *root, *entry_stats, *dev_stats, *multi;
--	__uint16_t wear_level_min = 0;
--	__uint16_t wear_level_max = 0;
--	__uint16_t wear_level_avg = 0;
-+	uint16_t wear_level_min = 0;
-+	uint16_t wear_level_max = 0;
-+	uint16_t wear_level_avg = 0;
- 	uint64_t raw_val = 0;
- 
- 	root = json_create_object();
--- 
-2.45.1
-
diff --git a/meta-oe/recipes-bsp/nvme-cli/nvme-cli_2.9.1.bb b/meta-oe/recipes-bsp/nvme-cli/nvme-cli_2.10.2.bb
similarity index 86%
rename from meta-oe/recipes-bsp/nvme-cli/nvme-cli_2.9.1.bb
rename to meta-oe/recipes-bsp/nvme-cli/nvme-cli_2.10.2.bb
index f4ddec88c..2005a198a 100644
--- a/meta-oe/recipes-bsp/nvme-cli/nvme-cli_2.9.1.bb
+++ b/meta-oe/recipes-bsp/nvme-cli/nvme-cli_2.10.2.bb
@@ -6,12 +6,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8264535c0c4e9c6c335635c4026a8022 \
                     file://ccan/licenses/CC0;md5=c17af43b05840255a6fedc5eda9d56cc \
                     file://ccan/licenses/BSD-MIT;md5=838c366f69b72c5df05c96dff79b35f2"
 DEPENDS = "json-c libnvme"
-SRCREV = "b340fd7dcf1aef76f8d46ab28bef3c170d310887"
+SRCREV = "eeaa08c9a0e9184f3889df0bff3d2a23db6d6294"
 
-SRC_URI = "git://github.com/linux-nvme/nvme-cli.git;branch=master;protocol=https \
-           file://0001-nvme-Use-C99-types-for-uint32_t.patch \
-           file://0001-plugins-ssstc-Replace-__uint16_t-with-uint16_t.patch \
-           "
+SRC_URI = "git://github.com/linux-nvme/nvme-cli.git;branch=master;protocol=https"
 
 S = "${WORKDIR}/git"
 
-- 
2.39.2


