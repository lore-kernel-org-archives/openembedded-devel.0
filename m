Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PhSu3-0000LS-UL
	for openembedded-devel@lists.openembedded.org;
	Mon, 24 Jan 2011 21:20:44 +0100
Received: by iyj18 with SMTP id 18so4859812iyj.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Jan 2011 12:19:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=d2KreZxwopGZuzlxGcgiBbj6wxjOPI7qUX4t87r62Xg=;
	b=IJvr4httD2F0lFvaYRv/6Az2vkp/1QD3HuAhODyMTwK9+XZjxm87c3Y/wgGbBB53Yq
	Jsgl6rAy1koDuBEtsHwsLuUsloPVDJOKnZQvwOT/DXtX7qBfn5YwIUTLlyZzAPWvI9zm
	kkKXcT1WBPWEexch0QLw3diQHQfrQyTX0Ae84=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=IokP/p5OLABIp/U1A9uI59BCiVH1E3MsSBGJxow7M81EjqY39pz5OUSC/9KPhH6ggU
	5OUGE/troy/41yaiOfruApQc8Ij4lEgofSSdC7/q4/kie6UapT54B8WvbebiZ+zs/++m
	rRRd/40MzUSipcAJqOemdP/Ajjh4A7XewH4f4=
Received: by 10.42.178.195 with SMTP id bn3mr5372660icb.493.1295900397583;
	Mon, 24 Jan 2011 12:19:57 -0800 (PST)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id jv9sm10163505icb.13.2011.01.24.12.19.56
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 24 Jan 2011 12:19:56 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 24 Jan 2011 12:19:58 -0800
Message-Id: <1295900399-4536-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH 4/5] slugos.inc: Dont lock SRCDATE for ipkg, its not used anymore
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
X-List-Received-Date: Mon, 24 Jan 2011 20:20:44 -0000

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



