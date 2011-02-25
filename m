Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Pswcf-0002RE-Ol
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Feb 2011 13:18:14 +0100
Received: by gyg13 with SMTP id 13so688005gyg.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Feb 2011 04:16:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer; bh=ECV4JWV0E1Cv+1jAWomFSuTevqJh52yeJBqNep1jkho=;
	b=P7YorIMiQD3aO9lnXx+nN7msAt648Rg5LajIlmTtqeznjCfO35GhxGHLciRPTZ2e/T
	dOaUqt4We66xTYPFDZPHizMAwFPM5maU1twyKQWQEzETwBHpN4CUYOYSmIw/2AfP31lc
	6+jgnlV/CM0qaSCUPlHS+i2vw+FmhxCLmlTRg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	b=BK8DqMEtQEOrY1iDzf68lbEzRLGzyjoz7HfDPld9bk5HZv3rDl6GXDEfwqMyh7Zs3I
	9lfOxMfVurYcxyzI9EsPNMWaugSvV26ov67PDMDeRb4c3mNr+QNJigtJW7DgRuJPsSOG
	MAbrNcbCFw7JolPJFQOhFwIY6Kmml7/vZmzLA=
Received: by 10.236.197.73 with SMTP id s49mr3971539yhn.88.1298636087801;
	Fri, 25 Feb 2011 04:14:47 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id u45sm358919yhn.9.2011.02.25.04.14.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 25 Feb 2011 04:14:46 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 25 Feb 2011 12:14:34 +0000
Message-Id: <1298636075-26972-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.3
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 1/2] freerdp: bump SRCREV and change license to Apache-2.0
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
X-List-Received-Date: Fri, 25 Feb 2011 12:18:14 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 recipes/freerdp/freerdp.inc    |    4 ++--
 recipes/freerdp/freerdp_git.bb |    8 +++-----
 2 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/recipes/freerdp/freerdp.inc b/recipes/freerdp/freerdp.inc
index 0b9c9ac..c75175e 100644
--- a/recipes/freerdp/freerdp.inc
+++ b/recipes/freerdp/freerdp.inc
@@ -5,9 +5,9 @@ DESCRIPTION = "FreeRDP RDP client"
 HOMEPAGE = "http://freerdp.sourceforge.net"
 DEPENDS = "virtual/libx11 openssl libxcursor cups alsa-lib"
 SECTION = "x11/network"
-LICENSE = "GPL"
+LICENSE = "Apache-2.0"
 
-INC_PR = "r4"
+INC_PR = "r5"
 
 inherit pkgconfig autotools
 
diff --git a/recipes/freerdp/freerdp_git.bb b/recipes/freerdp/freerdp_git.bb
index 37d0041..1ed2a19 100644
--- a/recipes/freerdp/freerdp_git.bb
+++ b/recipes/freerdp/freerdp_git.bb
@@ -7,11 +7,9 @@ inherit gitpkgv
 
 PV = "gitr${SRCPV}"
 PKGV = "${GITPKGVTAG}"
+PR = "${INC_PR}.0"
 
-SRCREV = "aec5dd5807dbcd0989bb15124dcac157bb0412bc"
-PR = "${INC_PR}.4"
+SRCREV = "6f7eb2abb077d60a09eeb66a10ad97d102336d3c"
+SRC_URI = "git://freerdp.git.sourceforge.net/gitroot/freerdp/freerdp.git;protocol=git"
 
 S = "${WORKDIR}/git"
-
-
-SRC_URI = "git://freerdp.git.sourceforge.net/gitroot/freerdp/freerdp.git;protocol=git"
-- 
1.7.2.3



