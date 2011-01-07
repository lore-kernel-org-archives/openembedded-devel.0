Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jefflance01@gmail.com>) id 1PbHua-0008Cb-1j
	for openembedded-devel@lists.openembedded.org;
	Fri, 07 Jan 2011 20:23:44 +0100
Received: by yie16 with SMTP id 16so4859497yie.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 Jan 2011 11:23:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=qHBNuQPrHBVCz2LqCqHeUc7OZ538ZHfGFZSf1zs5+jE=;
	b=ZgxKB0/X2DBLxjSVg3Axeol15CIHY/8kGJromLaSSU1PpTt3eZAXS2ruOUrx75ZvZJ
	1OKBA1kXSUEV9YYAzp56dRcAzEGyuPbR694YseUroOYIlN26xA1c5xg0d7FmZsx6w5VS
	eZtAmNufXRMmDAY+N/EhtIyLJjE8Y83pLQu/k=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=YOoUu0hoDPJpgHZOECbBcZEzXFS6sIwOmKRn6nzjI92hZNIwCiWky7V7ghCw3FrCqI
	rUj5Dc7FgBWhfYX+AWYI72aotHcUdrUQJc/jxOqpPR4hE07o4wGPuJrsCjqR9TPdk7vO
	D4gjCYLAFvTpfWkGubf+GHkgdQ+ay8FO4rPVM=
Received: by 10.151.50.16 with SMTP id c16mr6607317ybk.147.1294428197115;
	Fri, 07 Jan 2011 11:23:17 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id 68sm1590092yhl.19.2011.01.07.11.23.15
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 07 Jan 2011 11:23:16 -0800 (PST)
From: Jeff Lance <jefflance01@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  7 Jan 2011 13:22:39 -0600
Message-Id: <1294428159-5340-1-git-send-email-j-lance1@ti.com>
X-Mailer: git-send-email 1.6.3.3
Cc: Jeff Lance <j-lance1@ti.com>
Subject: [PATCH 1/1] am-sysinfo: update the SRCREV
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
X-List-Received-Date: Fri, 07 Jan 2011 19:23:44 -0000

  * SRCREV update to pull in the following:
    * remove all compiler generated files from this repository
    * Modification for CCSv5 projects to build for arm926ej-s.
    * This is to overcome a CCSv5 limitation where you can't pass in CFLAGS externally
    * This only affects building with CCSv5, it does not affect the Arago build.

Signed-off-by: Jeff Lance <j-lance1@ti.com>
---
 recipes/ti/am-sysinfo_svn.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/ti/am-sysinfo_svn.bb b/recipes/ti/am-sysinfo_svn.bb
index 9193836..07c292d 100644
--- a/recipes/ti/am-sysinfo_svn.bb
+++ b/recipes/ti/am-sysinfo_svn.bb
@@ -4,9 +4,9 @@ LICENSE = "BSD"
 SECTION = "system"
 PRIORITY = "optional"
 
-SRCREV = "2"
+SRCREV = "5"
 PV = "1.0"
-PR = "r1+svnr${SRCPV}"
+PR = "r2+svnr${SRCPV}"
 
 SRC_URI = "svn://gforge.ti.com/svn/am_sysinfo/;module=trunk;proto=https;user=anonymous;pswd=''"
 
-- 
1.6.3.3



