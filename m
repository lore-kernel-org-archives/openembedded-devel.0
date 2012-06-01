Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SaGux-0002IP-CJ
	for openembedded-devel@lists.openembedded.org;
	Fri, 01 Jun 2012 03:44:43 +0200
Received: by dalh21 with SMTP id h21so2126100dal.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 May 2012 18:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=6yVNLwFnNXTQryEoKHUu+Ub3XWskyzymXe0mOfdLJ5s=;
	b=DrGKONvM04od+alhjR1r8/LPfrF7SYbv0GZXelcPNyzuBjL3UnZDkidrBIcaBtWw2j
	VjxlAdpmkQMvUlXVYcnYdVndMMA6a+SLe5AgfUORiT+pcVTU0nLHU2Oq6LMWXK5MSD6O
	uQjWkCsS55bvouL6P8bnzJobWcSVhDB3mRjOoo3m+bY8vrEE8Xor8fjgwtiDx/htVKlS
	fzZm2jYcc4Qv6Q23YNf6NqxV9kXVy9N8JKPpncl0euEcwEuaouKWkiiegSwxgwngxMyy
	HXn+ypkWC5kZ0faGDMGCrINqZywBFGMNkiOmVVqSxHe7ogCsNChXjaGQNEXlWSqoSWdG
	HFFg==
Received: by 10.68.226.99 with SMTP id rr3mr5098383pbc.48.1338514461980;
	Thu, 31 May 2012 18:34:21 -0700 (PDT)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id ms1sm903969pbb.63.2012.05.31.18.34.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 31 May 2012 18:34:20 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 31 May 2012 18:33:23 -0700
Message-Id: <1338514403-9477-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH V2] classes/mirrors.bbclass: update debian snapshot mirror url
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
X-List-Received-Date: Fri, 01 Jun 2012 01:44:43 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 classes/mirrors.bbclass |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/classes/mirrors.bbclass b/classes/mirrors.bbclass
index 71ee5f6..1f509df 100644
--- a/classes/mirrors.bbclass
+++ b/classes/mirrors.bbclass
@@ -1,6 +1,8 @@
 MIRRORS[func] = "0"
 MIRRORS () {
-${DEBIAN_MIRROR}/main	http://snapshot.debian.net/archive/pool
+${DEBIAN_MIRROR}/main   http://snapshot.debian.org/archive/debian-archive/20120328T092752Z/debian/pool
+${DEBIAN_MIRROR}/main   http://snapshot.debian.org/archive/debian-archive/20110127T084257Z/debian/pool
+${DEBIAN_MIRROR}/main   http://snapshot.debian.org/archive/debian-archive/20090802T004153Z/debian/pool
 ${DEBIAN_MIRROR}	ftp://ftp.de.debian.org/debian/pool
 ${DEBIAN_MIRROR}	ftp://ftp.au.debian.org/debian/pool
 ${DEBIAN_MIRROR}	ftp://ftp.cl.debian.org/debian/pool
-- 
1.7.9.5



