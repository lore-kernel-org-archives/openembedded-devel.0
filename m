Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f175.google.com (mail-ea0-f175.google.com
	[209.85.215.175])
	by mail.openembedded.org (Postfix) with ESMTP id BD5736C782
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Oct 2013 17:03:46 +0000 (UTC)
Received: by mail-ea0-f175.google.com with SMTP id l15so676279eak.34
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Oct 2013 10:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=9jB+PH4hDOHc8GCLsbgYT28EhwSDXp0rr9TVoLhUnzU=;
	b=doc9iMKlKo9JvGzLlAIRcEaMJQKcQOUgMGAd2iU2wRCtRozhhxCrUXp60TVuwrJyoy
	cK/kfXKajIolg118/7hd8Hjbr4Yh+tXzdmDl9cGCH3fgZ/0fhjNf0g9eNBsiVlUfjCtN
	nKLotNs8S3oVI6kXL3FIgrTWdUN48KrXHmr2T3Z+1WnKoYDH1UVZlf77HjH65ANAS7vs
	AD5kgT8uuJpgXeEiFkG9kOY3TMSH2XIQV2+Ib+R7aC+uUuSceG++o8nT5E/957gsyCks
	UGaf3YrIFILIngtk1+YZp0KzDDLGmrUK5/L7cNEAXfEecHisCSH6zH1dVGg3F4KRxD8+
	gtHA==
X-Received: by 10.14.45.70 with SMTP id o46mr6019006eeb.19.1383152628048;
	Wed, 30 Oct 2013 10:03:48 -0700 (PDT)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id d7sm85670733eem.8.2013.10.30.10.03.47
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Oct 2013 10:03:47 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 Oct 2013 18:03:44 +0100
Message-Id: <1383152625-1337-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.4.2
Subject: [meta-systemd][PATCH 1/2] at: Rename bbappend to match new version from oe-core
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
X-List-Received-Date: Wed, 30 Oct 2013 17:03:47 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-extended/at/{at_3.1.13.bbappend => at_3.1.14.bbappend}      | 2 --
 1 file changed, 2 deletions(-)
 rename meta-systemd/oe-core/recipes-extended/at/{at_3.1.13.bbappend => at_3.1.14.bbappend} (93%)

diff --git a/meta-systemd/oe-core/recipes-extended/at/at_3.1.13.bbappend b/meta-systemd/oe-core/recipes-extended/at/at_3.1.14.bbappend
similarity index 93%
rename from meta-systemd/oe-core/recipes-extended/at/at_3.1.13.bbappend
rename to meta-systemd/oe-core/recipes-extended/at/at_3.1.14.bbappend
index cae078a..3a22fe3 100644
--- a/meta-systemd/oe-core/recipes-extended/at/at_3.1.13.bbappend
+++ b/meta-systemd/oe-core/recipes-extended/at/at_3.1.14.bbappend
@@ -1,7 +1,5 @@
 inherit systemd
 
-PRINC := "${@int(PRINC) + 2}"
-
 # look for files in the layer first
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
-- 
1.8.4.2


