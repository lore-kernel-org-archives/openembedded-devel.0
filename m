Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f50.google.com (mail-pb0-f50.google.com
	[209.85.160.50])
	by mail.openembedded.org (Postfix) with ESMTP id 159736DAAA
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  7 Dec 2013 00:08:01 +0000 (UTC)
Received: by mail-pb0-f50.google.com with SMTP id rr13so1986506pbb.9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Dec 2013 16:08:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=qoQ8zOIxPS7CsglO8Tjr5RfAM2eKeipmZawb74OEia8=;
	b=b+ILqLFd3uexOptBbuxQwysqvQItGUH92Xqe4QAOaBNf7i2+cUsCXLmvZ5EuqU0Ox/
	brUGSd6KH+8Y5HZszUitg7kU5hcmz4DEare3MEOnXc6oTfdogc/zCSplLBPfYSTWC0yi
	FYwY3M3ZZGSru/tdLPzFMs30239GoZG+juZt6EuDHnkysTYVnATMJebYPFImn3ph8LOk
	pJh2cQ3WUay2dqb8u05mVu90IJ1xN+Ps2SrL+OmwNWqymzalQ1zsjFTr7HrYrnKanADJ
	X9qw53CeWOFnQQl4EqtPIlaB8q3xu+KTctZQbnI460CEptpRcZaPX402CBezR7YPDug4
	samg==
X-Received: by 10.66.2.66 with SMTP id 2mr7179832pas.72.1386374880330;
	Fri, 06 Dec 2013 16:08:00 -0800 (PST)
Received: from ghoda.gateway.pace.com
	(99-57-140-30.lightspeed.sntcca.sbcglobal.net. [99.57.140.30])
	by mx.google.com with ESMTPSA id km1sm303976pbd.13.2013.12.06.16.07.59
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Dec 2013 16:07:59 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  6 Dec 2013 16:08:15 -0800
Message-Id: <1386374895-21685-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [meta-gnome][PATCH] evolution-data-server: Checkout correct branch in SRC_URI
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
X-List-Received-Date: Sat, 07 Dec 2013 00:08:03 -0000

This recipe follows gnome-3.2 release and SHA
in SRCREV also belongs to same branch.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-gnome/recipes-gnome/eds/evolution-data-server_git.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/eds/evolution-data-server_git.bb b/meta-gnome/recipes-gnome/eds/evolution-data-server_git.bb
index 13f6b3b..c454e0c 100644
--- a/meta-gnome/recipes-gnome/eds/evolution-data-server_git.bb
+++ b/meta-gnome/recipes-gnome/eds/evolution-data-server_git.bb
@@ -16,7 +16,7 @@ SRCREV = "a9e4e74ec4473a4fd09e56b690bd4fa72f686687"
 PV = "3.2.3+git${SRCPV}"
 
 SRC_URI = " \
-    git://git.gnome.org/evolution-data-server \
+    git://git.gnome.org/evolution-data-server;branch=gnome-3-2 \
     file://0001-contact-Replace-the-Novell-sample-contact-with-somet.patch \
     file://0002-Fix-for-automake-1.12.x.patch \
     file://0003-Disable-Werror-for-automake.patch \
-- 
1.7.10.4


