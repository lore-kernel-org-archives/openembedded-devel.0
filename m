Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1PsdDv-0006qO-GM
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Feb 2011 16:35:23 +0100
Received: by fxm8 with SMTP id 8so609979fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Feb 2011 07:34:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=QgAT6V8jfOUhlwgvb64BkFspBf6dG0P0IpWoL/iej0U=;
	b=xGruLUr+bOf50ZP+Qhg91j7/czZMhU/aUxtXvTyj6XPjxO82qTwq/aUb5z6hh5DDwo
	HRJ8rZyMB8KiD9UB/CS1OAuUXNA/rsD86uFuwn5P6sgbyGoe+l+PIXZbNHuJWd1gvmQY
	oBKmB3YnFWMEZsdZXfIe5ehZ3csDycFTm5oxU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=SKlLTwCScE76pJTiPws1D9JctGVUp5plrxDdsXZL2ELDq5QDtnAgA6cgfXwRP7kdyw
	9U7Gv5S5JXf/MDeIMDqDdy3cQtsyq7eBWMp2fE+ib9zPsvyEHHTcPHQ5W19iPYOhdYzt
	Wu8aExSo6KWRYzKCRW49Gn0UYyGuEHyLhucSA=
Received: by 10.223.112.1 with SMTP id u1mr1188646fap.109.1298561167256;
	Thu, 24 Feb 2011 07:26:07 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id f24sm1079839fak.0.2011.02.24.07.26.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 24 Feb 2011 07:26:05 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 24 Feb 2011 16:25:56 +0100
Message-Id: <1298561156-21514-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH] bitbake.conf: define shared PERSISTENT_DIR
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 24 Feb 2011 15:35:23 -0000

* import from poky
  commit 6a11cf7dfe930461a6660e3b783b546fa2634900
  Author: Richard Purdie <rpurdie@linux.intel.com>
  Date:   Sun May 31 22:23:30 2009 +0100
* we had CACHE var pointing to machine specific dir since
  commit caf077679022f37ce55d758101f130e4e93bd7b5
  Author: Richard Purdie <rpurdie@rpsys.net>
  Date:   Mon Nov 20 17:40:20 2006 +0000

* current bitbake is looking for cache dir like this:
  cachedir = (bb.data.getVar("PERSISTENT_DIR", d, True) or
              bb.data.getVar("CACHE", d, True))
  which without PERSISTENT_DIR defined picks machine-specific CACHE dir
  so LOCALCOUNT numbers in SRCPV keeps rolling with every MACHINE switch
  in same builddir :/

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 conf/bitbake.conf |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/conf/bitbake.conf b/conf/bitbake.conf
index dcc5c70..53bb7b7 100644
--- a/conf/bitbake.conf
+++ b/conf/bitbake.conf
@@ -294,6 +294,8 @@ FILESDIR = "${@bb.which(d.getVar('FILESPATH', 1), '.')}"
 
 TMPDIR = "${TOPDIR}/tmp"
 CACHE = "${TMPDIR}/cache${@['', '/' + str(bb.data.getVar('MACHINE', d, 1))][bool(bb.data.getVar('MACHINE', d, 1))]}"
+# The persistent cache should be shared by all builds
+PERSISTENT_DIR = "${TMPDIR}/cache"
 CO_DIR = "${DL_DIR}"
 CVSDIR = "${CO_DIR}/cvs"
 SVNDIR = "${CO_DIR}/svn"
-- 
1.7.4.1



