Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SY9wd-0006fR-G1
	for openembedded-devel@lists.openembedded.org;
	Sat, 26 May 2012 07:53:43 +0200
Received: by dalh21 with SMTP id h21so2245663dal.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 May 2012 22:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=Kruj0zkaz/V+kHBWE/0jqchdMZn6gecl4R012gZogJE=;
	b=Y+jOxjrLirq8w1HwQdTfLjOVuZcSZOSHb8JzdCH2qV7TfoINy5GK9r2jTpVnTMC6Lr
	vBHGcO0944WWF+WGD7JJOdB1zsDd4jtgTB+NbyXWbFOcsXSMzhnIjplpxBgk08ylcnkp
	AJwcOXsKi4WT3DUXa1crAJkE813GtfwHs+e9N2jaPubLtYycqvpNvDS7ZqVnJdHg8MYF
	GNBukdUUZq6bNO1rJZ45OCSZVM8ZKqcrtbox3J2A29D6UM8eNny3N7hvTSNlpQ8Tayad
	diegIsfFvN2XB34OYSE9LWypPigcHteOYJbM/qhEkQUmXdxCiZWUCVkFCljtR8yiwvDq
	v4SQ==
Received: by 10.68.135.229 with SMTP id pv5mr4378505pbb.70.1338011008691;
	Fri, 25 May 2012 22:43:28 -0700 (PDT)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id rk4sm11443101pbc.48.2012.05.25.22.43.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 25 May 2012 22:43:27 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 25 May 2012 22:42:48 -0700
Message-Id: <1338010968-11334-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [2011.03-maintenance][PATCH] classes/mirrors.bbclass: update debian snapshot mirror url
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
X-List-Received-Date: Sat, 26 May 2012 05:53:43 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 classes/mirrors.bbclass |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/classes/mirrors.bbclass b/classes/mirrors.bbclass
index 71ee5f6..bb4f1ec 100644
--- a/classes/mirrors.bbclass
+++ b/classes/mirrors.bbclass
@@ -1,6 +1,6 @@
 MIRRORS[func] = "0"
 MIRRORS () {
-${DEBIAN_MIRROR}/main	http://snapshot.debian.net/archive/pool
+${DEBIAN_MIRROR}/main   http://snapshot.debian.org/archive/debian-archive/20120328T092752Z/debian/pool
 ${DEBIAN_MIRROR}	ftp://ftp.de.debian.org/debian/pool
 ${DEBIAN_MIRROR}	ftp://ftp.au.debian.org/debian/pool
 ${DEBIAN_MIRROR}	ftp://ftp.cl.debian.org/debian/pool
-- 
1.7.9.5



