Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Sdq3W-0001fg-Vs
	for openembedded-devel@lists.openembedded.org;
	Sun, 10 Jun 2012 23:52:19 +0200
Received: by mail-we0-f175.google.com with SMTP id g55so1679484wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jun 2012 14:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=oCKAFu3j/iCVORM4Zd+TqoIwKjWIxCl1Oa2cG+0TN8U=;
	b=YgqdCSNtc591fSge1YTbiIeZrFLRQqy7Um7KOTzD6Aw9uXQ//evmNtGH5lv0iv8a/q
	IEvK5lJPyxim2A3drZ0B5IQFnsZJaKPHkMWmGpRHacG3mpUwVF9v69WfOH38mhh+gz8W
	46W6P9bjImsBEcO7mzoyjaQGWEr9UBhhPLCPeKhj6tZVOPVZDfudIzGGwg54gjhks0VS
	f3SPfFJjUxmxASdLKkKByx+0NLy78jUctLhqZYbkoDhkIatq8M7Nx2mXCDXag8guhk/r
	LMuNWQMOy+XXp+r4lpwZnFPzZ+ifp448HfFd14DYakjmZsGr4aBuUuPB/BqGgunr0voT
	0UCQ==
Received: by 10.216.218.138 with SMTP id k10mr5592190wep.222.1339364508674;
	Sun, 10 Jun 2012 14:41:48 -0700 (PDT)
Received: from localhost.localdomain (p5B0A2104.dip.t-dialin.net. [91.10.33.4])
	by mx.google.com with ESMTPS id gc6sm19758306wib.0.2012.06.10.14.41.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 10 Jun 2012 14:41:48 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 10 Jun 2012 23:46:44 +0200
Message-Id: <1339364820-2880-12-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1339364820-2880-1-git-send-email-schnitzeltony@googlemail.com>
References: <1339364820-2880-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [RFC, meta-oe 11/27] cronie: move systemd support to meta-systemd
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
X-List-Received-Date: Sun, 10 Jun 2012 21:52:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../recipes-extended/cronie/cronie/crond.service   |    0
 .../recipes-extended/cronie/cronie_1.4.8.bbappend  |    2 +-
 2 files changed, 1 insertions(+), 1 deletions(-)
 rename {meta-oe => meta-systemd/meta-oe}/recipes-extended/cronie/cronie/crond.service (100%)
 rename {meta-oe => meta-systemd/meta-oe}/recipes-extended/cronie/cronie_1.4.8.bbappend (87%)

diff --git a/meta-oe/recipes-extended/cronie/cronie/crond.service b/meta-systemd/meta-oe/recipes-extended/cronie/cronie/crond.service
similarity index 100%
rename from meta-oe/recipes-extended/cronie/cronie/crond.service
rename to meta-systemd/meta-oe/recipes-extended/cronie/cronie/crond.service
diff --git a/meta-oe/recipes-extended/cronie/cronie_1.4.8.bbappend b/meta-systemd/meta-oe/recipes-extended/cronie/cronie_1.4.8.bbappend
similarity index 87%
rename from meta-oe/recipes-extended/cronie/cronie_1.4.8.bbappend
rename to meta-systemd/meta-oe/recipes-extended/cronie/cronie_1.4.8.bbappend
index 5aedb21..b7899be 100644
--- a/meta-oe/recipes-extended/cronie/cronie_1.4.8.bbappend
+++ b/meta-systemd/meta-oe/recipes-extended/cronie/cronie_1.4.8.bbappend
@@ -1,7 +1,7 @@
 # look for files in the layer first
 FILESEXTRAPATHS := "${THISDIR}/${PN}"
 
-PRINC = "2"
+PRINC := "${@int(PRINC) + 3}"
 
 inherit systemd
 
-- 
1.7.4.4



