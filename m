Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PhcMP-00058H-13
	for openembedded-devel@lists.openembedded.org;
	Tue, 25 Jan 2011 07:26:37 +0100
Received: by pvd12 with SMTP id 12so938543pvd.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Jan 2011 22:25:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=d2KreZxwopGZuzlxGcgiBbj6wxjOPI7qUX4t87r62Xg=;
	b=bsCvAU+fLiZIWc01gBghEw5N+tzKuXfHu7GD29KG1bK0m4/7plXUw2SqiMJbRumFnq
	1yybO+J8MCTtzz1LpraKIMqVThD1ADmGeecQE3DL9reS1hKWak+p1UuGUFWuOvSmV0A1
	kgN52/r48b+XRJncbZJPfTqLgBXBaqwABI2Z4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=ZNKCuCIfVYq1PShr0fygq3Vqng8JNrdc5pCkT52t61KlgnBTOqSw2VhdnsbhQKBv7h
	1Y2TPAR0DyY+q2ycobRxdHgcNF/FgMN1pvO5/R2He7F/LJYRm8A6Ad8hgn1+YYqAhkxq
	dy/v3pp6/FZ4iSe+x9dvD78eYi69SVN8W8OLY=
Received: by 10.142.173.9 with SMTP id v9mr3099106wfe.266.1295936749573;
	Mon, 24 Jan 2011 22:25:49 -0800 (PST)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id x18sm18429417wfa.23.2011.01.24.22.25.47
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 24 Jan 2011 22:25:48 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 24 Jan 2011 22:25:39 -0800
Message-Id: <1295936745-718-4-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1295936745-718-1-git-send-email-raj.khem@gmail.com>
References: <1295936745-718-1-git-send-email-raj.khem@gmail.com>
Subject: [PATCH 3/9] slugos.inc: Dont lock SRCDATE for ipkg, its not used anymore
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
X-List-Received-Date: Tue, 25 Jan 2011 06:26:37 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 conf/distro/include/slugos.inc |    3 ---
 1 files changed, 0 insertions(+), 3 deletions(-)

diff --git a/conf/distro/include/slugos.inc b/conf/distro/include/slugos.inc
index e59d7f0..837e422 100644
--- a/conf/distro/include/slugos.inc
+++ b/conf/distro/include/slugos.inc
@@ -141,9 +141,6 @@ PREFERRED_PROVIDER_virtual/libx11-native        ?= "libx11-native"
 PREFERRED_PROVIDER_virtual/db			= "db"
 PREFERRED_PROVIDER_virtual/db-native		= "db-native"
 
-SRCDATE_ipkg-utils				?= "20060106"
-SRCDATE_ipkg-utils-native			?= "20060106"
-SRCDATE_ipkg-link				?= "20060106"
 SRCDATE_irssi					?= "20050930"
 
 # We want the newer util-linux package
-- 
1.7.0.4



