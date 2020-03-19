Return-Path: <pjtexier@koncepto.io>
Received: from koncepto.io (koncepto.io [195.154.119.111])
	by mail.openembedded.org (Postfix) with ESMTP id 1118860C61
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Mar 2020 13:41:11 +0000 (UTC)
Received: from menoah.home (lfbn-bor-1-1500-88.w193-250.abo.wanadoo.fr
	[193.250.66.88]) by koncepto.io (Postfix) with ESMTPSA id 150576010A;
	Thu, 19 Mar 2020 14:41:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1584625270;
	bh=SEYlHXJUNKRWfCtP2ZpR2opLFQSn0x/qLD4+Ee4Sy30=;
	h=From:To:Cc:Subject:Date:From;
	b=QDlV+FNNZ/z0yPHVQSlb6yT4aABKh9lCOXqVnMdp/DBMv/QGCWZhinSIGpLAKkJEp
	AYGG3/N5lSCtKowYrQ0HGFij3KnBR0x2xZLvGKOqicglIowhNR8DepHg1fw2d+jIVu
	AoNbA88WSc53QAZmSEPwAIaSMVUfPTasJbR1Pr+rJQUj/YgKyTMIjUaYWM2e3m7a9a
	adiieHxlG65UutLpzK6eSo9MmaBlHz+PkZt72KsLoAqR7dQMvV/mmC31WsxU8scGCZ
	ZaRzenWfmDoh1x4j4arMY5dSPEIEk9LRwfzrtPOmvEbYO1a0WYRj5n1jUb2X8ja6jt
	yh7Nnw7opCF2w==
From: Pierre-Jean Texier <pjtexier@koncepto.io>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Mar 2020 14:41:08 +0100
Message-Id: <1584625268-20452-1-git-send-email-pjtexier@koncepto.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][PATCH] libev: upgrade 4.31 -> 4.33
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
X-List-Received-Date: Thu, 19 Mar 2020 13:41:12 -0000

The complete Changes since 4.31 are:

4.33 Wed Mar 18 13:22:29 CET 2020
        - the 4.31 timerfd code wrongly changed the priority of the signal
          fd watcher, which is usually harmless unless signal fds are
          also used (found via cpan tester service).
        - the documentation wrongly claimed that user may modify fd and events
          members in io watchers when the watcher was stopped
          (found by b_jonas).
        - new ev_io_modify mutator which changes only the events member,
          which can be faster. also added ev::io::set (int events) method
          to ev++.h.
        - officially allow a zero events mask for io watchers. this should
          work with older libev versions as well but was not officially
          allowed before.
        - do not wake up every minute when timerfd is used to detect timejumps.
        - do not wake up every minute when periodics are disabled and we have
          a monotonic clock.
        - support a lot more "uncommon" compile time configurations,
          such as ev_embed enabled but ev_timer disabled.
        - use a start/stop wrapper class to reduce code duplication in
          ev++.h and make it needlessly more c++-y.
        - the linux aio backend is no longer compiled in by default.
        - update to libecb version 0x00010008.

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 meta-oe/recipes-connectivity/libev/{libev_4.31.bb => libev_4.33.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-connectivity/libev/{libev_4.31.bb => libev_4.33.bb} (80%)

diff --git a/meta-oe/recipes-connectivity/libev/libev_4.31.bb b/meta-oe/recipes-connectivity/libev/libev_4.33.bb
similarity index 80%
rename from meta-oe/recipes-connectivity/libev/libev_4.31.bb
rename to meta-oe/recipes-connectivity/libev/libev_4.33.bb
index beea855..760c2db 100644
--- a/meta-oe/recipes-connectivity/libev/libev_4.31.bb
+++ b/meta-oe/recipes-connectivity/libev/libev_4.33.bb
@@ -5,8 +5,8 @@ LICENSE = "BSD-2-Clause | GPL-2.0+"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d6ad416afd040c90698edcdf1cbee347"
 
 SRC_URI = "http://dist.schmorp.de/libev/Attic/${BP}.tar.gz"
-SRC_URI[md5sum] = "20111fda0df0a289c152faa2aac91b08"
-SRC_URI[sha256sum] = "ed855d2b52118e32c0c1a6a32bd18c97f9e6711ca511f5ee12de3b9eccc66e5a"
+SRC_URI[md5sum] = "a3433f23583167081bf4acdd5b01b34f"
+SRC_URI[sha256sum] = "507eb7b8d1015fbec5b935f34ebed15bf346bed04a11ab82b8eee848c4205aea"
 
 inherit autotools
 
-- 
2.7.4


