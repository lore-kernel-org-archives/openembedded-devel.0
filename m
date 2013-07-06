Return-Path: <net147@gmail.com>
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com
	[209.85.220.48])
	by mail.openembedded.org (Postfix) with ESMTP id 157A26ABED
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  6 Jul 2013 11:48:11 +0000 (UTC)
Received: by mail-pa0-f48.google.com with SMTP id kp12so2929157pab.35
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 06 Jul 2013 04:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=Q+KSlEmj86H7DUNwsrzBIst155eekBPVqDMRfmRvRe4=;
	b=E9JWcoJQjGyw8Q1iKsvetR1r5H8p70NgMWFqn6Tjrt4RlxIxvPA88qwcdtig3XA5/R
	qIQfmvSd5J2BslIxGBRpZovxv++POYRmshztDhiI9H9SRB/1vQraaHN5QXOC2URc9pQg
	hd3hu1HUW+ho8bItHtWeTMTlrAcoawlUnqUnT95FMyLM7Z29nO01MmBkhyCgZ1NFc3MD
	BCcEI9fxopr7lmKlLwakzxZis+GzMofTALMMCY8LvfAr2aDGoCTsArJaOLKHBAwpq/QL
	nheBIBbjceGZFDwdusOKDIvYjQxvN3OfIVjFsQnWYHUI5WCrC7TDPfOtvKfm8Aia2T6f
	QB4Q==
X-Received: by 10.68.27.105 with SMTP id s9mr13515120pbg.29.1373111291928;
	Sat, 06 Jul 2013 04:48:11 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id
	py6sm11931695pbb.33.2013.07.06.04.48.09 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 06 Jul 2013 04:48:11 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  6 Jul 2013 22:03:45 +1000
Message-Id: <1373112225-2084-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [meta-oe][PATCH] samba: remove /var/run from package
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
X-List-Received-Date: Sat, 06 Jul 2013 11:48:11 -0000

The /var/run and /var/run/lock directories are already created by
base-files.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta-oe/recipes-connectivity/samba/samba_3.6.8.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-oe/recipes-connectivity/samba/samba_3.6.8.bb b/meta-oe/recipes-connectivity/samba/samba_3.6.8.bb
index a27a28c..6bd6644 100644
--- a/meta-oe/recipes-connectivity/samba/samba_3.6.8.bb
+++ b/meta-oe/recipes-connectivity/samba/samba_3.6.8.bb
@@ -57,3 +57,8 @@ do_configure() {
 do_compile () {
     base_do_compile
 }
+
+do_install_append() {
+    rm -rf "${D}${localstatedir}/run"
+    rmdir --ignore-fail-on-non-empty "${D}${localstatedir}"
+}
-- 
1.8.3.2


