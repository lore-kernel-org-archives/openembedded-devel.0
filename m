Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chasemaupin03@gmail.com>) id 1P8vHz-0007nF-Nx
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Oct 2010 15:35:06 +0200
Received: by yxt3 with SMTP id 3so2496126yxt.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Oct 2010 06:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=tOS9BoM+RLhyAC7Fzo4O7nlOuU6Ne7Q3KdPRS41b0iw=;
	b=bBlBUmU08Yj67+zeoQR+xcSOIZfHcOmXjr4b4TvwdoiREqUbkiINEFd1N7EZ2/1l+r
	0gOTMOWhWk3QlvlvtXOFRh/F5RPncSWJIg6nOorDaN8IBM1ds+HIRvSc04ZjxXN1wT3i
	vmNQ+tTao/+q7GOom3j4DVZvsLRLOGB810M6Y=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=enUPSynL42kmUoCJMMRlw/+XaS0ybREaqSaLoeeJbblPzqRXiqGBGagsDo2yrhZPth
	9bJuhZ2j5VWEcINMgD6zplPs+nYFmQT6LjfcMrT8KsGPv/OykUEj0a7Aj5eMoetyWUQF
	8ROiS47lUq69O/sOaj/xUcAEIfkCHFqOG6rZQ=
Received: by 10.150.137.10 with SMTP id k10mr3618313ybd.301.1287668042233;
	Thu, 21 Oct 2010 06:34:02 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id p38sm7984809ybk.16.2010.10.21.06.34.01
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 21 Oct 2010 06:34:01 -0700 (PDT)
From: Chase Maupin <chasemaupin03@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 21 Oct 2010 08:33:27 -0500
Message-Id: <1287668010-11310-20-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1287668010-11310-1-git-send-email-Chase.Maupin@ti.com>
References: <1287668010-11310-1-git-send-email-Chase.Maupin@ti.com>
X-SA-Exim-Connect-IP: 209.85.213.175
X-SA-Exim-Mail-From: chasemaupin03@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: [PATCH 19/22] unifdef: update package LICENSE
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
X-List-Received-Date: Thu, 21 Oct 2010 13:35:10 -0000

* Update the LICENSE fields to reflect the licensing used in
  the source code.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 recipes/unifdef/unifdef-native_2.6.18+git.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/unifdef/unifdef-native_2.6.18+git.bb b/recipes/unifdef/unifdef-native_2.6.18+git.bb
index ae3eb4f..56880a8 100644
--- a/recipes/unifdef/unifdef-native_2.6.18+git.bb
+++ b/recipes/unifdef/unifdef-native_2.6.18+git.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Kernel header preprocessor"
 SECTION = "devel"
-LICENSE = "GPL"
+LICENSE = "FreeBSD"
 
 SRC_URI = "file://unifdef.c"
 
-- 
1.7.0.4



