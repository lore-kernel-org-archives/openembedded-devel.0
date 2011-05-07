Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QIpmP-0000FI-Gf
	for openembedded-devel@lists.openembedded.org;
	Sun, 08 May 2011 00:15:17 +0200
Received: by gwb11 with SMTP id 11so1644522gwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 May 2011 15:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references;
	bh=opzYCoxIHqJIIxwHssdulQ7a4UxQl6Y0aIChJyapaeA=;
	b=se7bYiLlvNVzaua0uSi6JNzN2YK9zWTUHypuI4tdLno4cprqKUl/BDqaRPS4HsZBfb
	JHz9o2hF/tmeAZJzTX7UIHLUOoDD+/1OGmk3MtEswUqmgzVrl3UDmlNl/0O663bZPhs7
	TVvk5YJQ05ALJa2d3qzyUnUsaR9eTv9v7pzg0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=FdnIB+dyXl1vR+5jfwiv7kJ9BRR5v920Wd6di+7Q7whl7xPigKNjGXg5CeXTsTCVN7
	Ca+yEzmGzy9EClZ/vwDgt/Z9XcC53ZusYIGoH3/kTMiFa4hS4IKoXnZvCM/CkIHdNnqA
	euM3FA/AeIEZhZ5tmoQWd7YM/EMzwM8okhsQo=
Received: by 10.236.19.199 with SMTP id n47mr6133735yhn.376.1304806354012;
	Sat, 07 May 2011 15:12:34 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id g2sm2005922yhc.76.2011.05.07.15.12.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 07 May 2011 15:12:33 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  7 May 2011 22:11:56 +0000
Message-Id: <1304806316-9716-8-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1304806316-9716-7-git-send-email-otavio@ossystems.com.br>
References: <BANLkTi=UexRucCByH0SrL-j0_+dB4DCC7Q@mail.gmail.com>
	<1304806316-9716-1-git-send-email-otavio@ossystems.com.br>
	<1304806316-9716-2-git-send-email-otavio@ossystems.com.br>
	<1304806316-9716-3-git-send-email-otavio@ossystems.com.br>
	<1304806316-9716-4-git-send-email-otavio@ossystems.com.br>
	<1304806316-9716-5-git-send-email-otavio@ossystems.com.br>
	<1304806316-9716-6-git-send-email-otavio@ossystems.com.br>
	<1304806316-9716-7-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 8/8] libinih: add git recipe
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
X-List-Received-Date: Sat, 07 May 2011 22:15:17 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/recipes-support/inih/libinih_git.bb |   18 ++++++++++++++++++
 1 files changed, 18 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-support/inih/libinih_git.bb

diff --git a/meta-oe/recipes-support/inih/libinih_git.bb b/meta-oe/recipes-support/inih/libinih_git.bb
new file mode 100644
index 0000000..24411ca
--- /dev/null
+++ b/meta-oe/recipes-support/inih/libinih_git.bb
@@ -0,0 +1,18 @@
+DESCRIPTION = "C and C++ INI Library"
+HOMEPAGE = "http://code.google.com/p/inih/"
+PRIORITY = "optional"
+PV = "0.0+gitr${SRCPV}"
+PKGV = "${GITPKGVTAG}"
+RDEPENDS_${PN}-dev = ""
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=dae28cbf28207425e0d0b3eb835f4bde"
+
+PR = "r0"
+
+# The github repository provides a cmake and pkg-config integration
+SRCREV = "715cb4dc3d56714d7d53dcd94ae4b41c950119a7"
+SRC_URI = "git://github.com/OSSystems/inih.git;protocol=git"
+
+S = "${WORKDIR}/git"
+
+inherit gitpkgv cmake
-- 
1.7.2.5



