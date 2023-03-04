Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6C94C6FA8E
	for <webhook@archiver.kernel.org>; Sat,  4 Mar 2023 11:03:54 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web11.6828.1677927828347386569
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Mar 2023 03:03:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=xEqf9s9r;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1677927826; i=@fujitsu.com;
	bh=9taMUCRGarwTZASOtB4X1p6fd7QDyPikk6Uy+yG06jE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=xEqf9s9r6CZcNzqQrZ2Fnu0NpLhuF+axqv/U6sRTZRzcoJ1L1d9M+W8YejlwYslO2
	 vAkhMcVQw35htwl0CTHtSv0okawBDSTMwt6sFUY0EC9fiPJS1ggAEdkaoP50yR0XPd
	 0XZAj5m7W7muM/KBDCbGjw6XcnGjpFkvSb+7FKylOS+PFpxaoht5yv6BuLl3+qSCld
	 tK3mrv6k1KEAQCmXcdiJtV0xxd54aFWYgGukS+/mi+3KkDmyyCNOTVU1Jg2IaWcjf7
	 AHxIrerH6HO5TAK246sc+xRj+CWaS4wHfpvB7gDPxPUSm3F8hJ5SzIGHxGjx7epKFG
	 /YyXcLKcrtjdw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrAIsWRWlGSWpSXmKPExsViZ8MxSXeSKnO
  KwYK7rBYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bKWb4F/boVXdf3sTQwPlfrYuTkEBJ4wijx
  +CFvFyMXkH2DSWLF1zdMEM4eRok1XVOZQarYBKQkbtz/zwZiiwjoSyydvQcsziygIvHidw87i
  C0s4CWx7usDFhCbBSh+tvknE4jNK+Ak0Xb1Dli9hICCxJSH78FsTgFniRcX/zJDXAFUs+owI0
  S9oMTJmU9YIOZLSBx88QKqV1Fi9uVmFgi7UqL1wy8oW03i6rlNzBMYBWchaZ+FpH0BI9MqRtP
  i1KKy1CJdU72kosz0jJLcxMwcvcQq3US91FLd8tTiEl0jvcTyYr3U4mK94src5JwUvbzUkk2M
  wMBNKVbbtYNxQt9fvUOMkhxMSqK8k1gZUoT4kvJTKjMSizPii0pzUosPMcpwcChJ8HIoMqcIC
  RalpqdWpGXmAKMIJi3BwaMkwrtFBCjNW1yQmFucmQ6ROsWoy7FpX9cBZiGWvPy8VClxXgFloC
  IBkKKM0jy4EbCIvsQoKyXMy8jAwCDEU5BalJtZgir/ilGcg1FJmPc/yBSezLwSuE2vgI5gAjp
  C4zQDyBEliQgpqQYm3xpD//VXpuXuNzLyaL8qme/4UutpNJ9TKc/pnBWKxroL5lyp678+7Yx9
  xQfjyLs2L989XvfsMVfrVOaFiV8E88Sv1XlaOBr/D+TvvKy8qyamWvxpw7XPK74uU5ls6Lwi3
  3rH/7SNvWsF+05FJm3huZT/zt/Ncoq0y77HAmpbrbs07mRFJPlmOP5K12hcZTtNz33eR6sb6w
  snRH26JcIc1zV76+69x/g1Zjtevee/m1Hq+2L2sw7aFzxLORucI2aGNPkyGGzh638nt2WThGb
  J8dQl53Jv3N916OfSJR1XtuklCsb+vHJ90gntJHeDnw/lt0V7uE5ZkTWzzW6Gyjm99DtZ317/
  T2B+vr1uWrusEktxRqKhFnNRcSIA9x0do2MDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-17.tower-548.messagelabs.com!1677927825!244023!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.103.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 29077 invoked from network); 4 Mar 2023 11:03:46 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-17.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 4 Mar 2023 11:03:46 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id C31EA1000FB
	for <openembedded-devel@lists.openembedded.org>; Sat,  4 Mar 2023 11:03:45 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id B69E51000D2
	for <openembedded-devel@lists.openembedded.org>; Sat,  4 Mar 2023 11:03:45 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Sat, 4 Mar 2023 11:03:44 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [PATCH] [oe] [meta-oe] [PATCH] cryptsetup: upgrade 2.6.0 -> 2.6.1
Date: Sat, 4 Mar 2023 19:03:19 +0800
Message-ID: <1677927799-22851-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1677927799-22851-1-git-send-email-wangmy@fujitsu.com>
References: <1677927799-22851-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Mar 2023 11:03:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101360

From: Wang Mingyu <wangmy@fujitsu.com>

0001-Replace-off64_t-with-off_t.patch
removed since it's includedin 2.6.1.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../0001-Replace-off64_t-with-off_t.patch     | 101 ------------------
 ...ryptsetup_2.6.0.bb => cryptsetup_2.6.1.bb} |   6 +-
 2 files changed, 2 insertions(+), 105 deletions(-)
 delete mode 100644 meta-oe/recipes-crypto/cryptsetup/cryptsetup/0001-Replace-off64_t-with-off_t.patch
 rename meta-oe/recipes-crypto/cryptsetup/{cryptsetup_2.6.0.bb => cryptsetup_2.6.1.bb} (96%)

diff --git a/meta-oe/recipes-crypto/cryptsetup/cryptsetup/0001-Replace-off64_t-with-off_t.patch b/meta-oe/recipes-crypto/cryptsetup/cryptsetup/0001-Replace-off64_t-with-off_t.patch
deleted file mode 100644
index 23aa86c0f..000000000
--- a/meta-oe/recipes-crypto/cryptsetup/cryptsetup/0001-Replace-off64_t-with-off_t.patch
+++ /dev/null
@@ -1,101 +0,0 @@
-From 683d0c525765415be34c269edf9cc066276f9f65 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 18 Dec 2022 13:53:51 -0800
-Subject: [PATCH] Replace off64_t with off_t
-
-AC_SYS_LARGEFILE autoconf macro is in use in configure script which will
-add needed feature macros on commandline to enable 64bit off_t.
-
-Also replace lseek64 with lseek, since it will be same when
-_FILE_OFFSET_BITS=64 is defined on relevant platforms via AC_SYS_LARGEFILE
-
-Upstream-Status: Submitted [https://gitlab.com/cryptsetup/cryptsetup/-/merge_requests/467]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- lib/utils.c                 |  4 ++--
- lib/utils_wipe.c            |  4 ++--
- src/utils_reencrypt_luks1.c | 12 ++++++------
- 3 files changed, 10 insertions(+), 10 deletions(-)
-
-diff --git a/lib/utils.c b/lib/utils.c
-index 9d79ee29..be5f5287 100644
---- a/lib/utils.c
-+++ b/lib/utils.c
-@@ -102,9 +102,9 @@ static int keyfile_seek(int fd, uint64_t bytes)
- 	char tmp[BUFSIZ];
- 	size_t next_read;
- 	ssize_t bytes_r;
--	off64_t r;
-+	off_t r;
- 
--	r = lseek64(fd, bytes, SEEK_CUR);
-+	r = lseek(fd, bytes, SEEK_CUR);
- 	if (r > 0)
- 		return 0;
- 	if (r < 0 && errno != ESPIPE)
-diff --git a/lib/utils_wipe.c b/lib/utils_wipe.c
-index 285a9e77..0c376f44 100644
---- a/lib/utils_wipe.c
-+++ b/lib/utils_wipe.c
-@@ -150,7 +150,7 @@ static int wipe_block(struct crypt_device *cd, int devfd, crypt_wipe_pattern pat
- 	if (blockdev && pattern == CRYPT_WIPE_ZERO &&
- 	    !wipe_zeroout(cd, devfd, offset, wipe_block_size)) {
- 		/* zeroout ioctl does not move offset */
--		if (lseek64(devfd, offset + wipe_block_size, SEEK_SET) < 0) {
-+		if (lseek(devfd, offset + wipe_block_size, SEEK_SET) < 0) {
- 			log_err(cd, _("Cannot seek to device offset."));
- 			return -EINVAL;
- 		}
-@@ -221,7 +221,7 @@ int crypt_wipe_device(struct crypt_device *cd,
- 	if (r)
- 		goto out;
- 
--	if (lseek64(devfd, offset, SEEK_SET) < 0) {
-+	if (lseek(devfd, offset, SEEK_SET) < 0) {
- 		log_err(cd, _("Cannot seek to device offset."));
- 		r = -EINVAL;
- 		goto out;
-diff --git a/src/utils_reencrypt_luks1.c b/src/utils_reencrypt_luks1.c
-index 96368bdb..d83a1da4 100644
---- a/src/utils_reencrypt_luks1.c
-+++ b/src/utils_reencrypt_luks1.c
-@@ -729,8 +729,8 @@ static int copy_data_forward(struct reenc_ctx *rc, int fd_old, int fd_new,
- 
- 	log_dbg("Reencrypting in forward direction.");
- 
--	if (lseek64(fd_old, rc->device_offset, SEEK_SET) < 0 ||
--	    lseek64(fd_new, rc->device_offset, SEEK_SET) < 0) {
-+	if (lseek(fd_old, rc->device_offset, SEEK_SET) < 0 ||
-+	    lseek(fd_new, rc->device_offset, SEEK_SET) < 0) {
- 		log_err(_("Cannot seek to device offset."));
- 		goto out;
- 	}
-@@ -788,7 +788,7 @@ static int copy_data_backward(struct reenc_ctx *rc, int fd_old, int fd_new,
- 			      size_t block_size, void *buf, uint64_t *bytes)
- {
- 	ssize_t s1, s2, working_block;
--	off64_t working_offset;
-+	off_t working_offset;
- 	int r = -EIO;
- 	char *backing_file = NULL;
- 	struct tools_progress_params prog_parms = {
-@@ -827,8 +827,8 @@ static int copy_data_backward(struct reenc_ctx *rc, int fd_old, int fd_new,
- 			working_block = block_size;
- 		}
- 
--		if (lseek64(fd_old, working_offset, SEEK_SET) < 0 ||
--		    lseek64(fd_new, working_offset, SEEK_SET) < 0) {
-+		if (lseek(fd_old, working_offset, SEEK_SET) < 0 ||
-+		    lseek(fd_new, working_offset, SEEK_SET) < 0) {
- 			log_err(_("Cannot seek to device offset."));
- 			goto out;
- 		}
-@@ -874,7 +874,7 @@ static void zero_rest_of_device(int fd, size_t block_size, void *buf,
- 
- 	log_dbg("Zeroing rest of device.");
- 
--	if (lseek64(fd, offset, SEEK_SET) < 0) {
-+	if (lseek(fd, offset, SEEK_SET) < 0) {
- 		log_dbg("Cannot seek to device offset.");
- 		return;
- 	}
diff --git a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.6.0.bb b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.6.1.bb
similarity index 96%
rename from meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.6.0.bb
rename to meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.6.1.bb
index 1d4f44087..293522140 100644
--- a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.6.0.bb
+++ b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.6.1.bb
@@ -19,10 +19,8 @@ DEPENDS = " \
 DEPENDS:append:libc-musl = " argp-standalone"
 LDFLAGS:append:libc-musl = " -largp"
 
-SRC_URI = "${KERNELORG_MIRROR}/linux/utils/${BPN}/v${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}/${BP}.tar.xz \
-           file://0001-Replace-off64_t-with-off_t.patch \
-           "
-SRC_URI[sha256sum] = "44397ba76e75a9cde5b02177bc63cd7af428a785788e3a7067733e7761842735"
+SRC_URI = "${KERNELORG_MIRROR}/linux/utils/${BPN}/v${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}/${BP}.tar.xz"
+SRC_URI[sha256sum] = "410ded65a1072ab9c8e41added37b9729c087fef4d2db02bb4ef529ad6da4693"
 
 inherit autotools gettext pkgconfig
 
-- 
2.34.1


