Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OZoWm-0003d3-4e
	for openembedded-devel@lists.openembedded.org;
	Fri, 16 Jul 2010 19:16:48 +0200
Received: by ewy7 with SMTP id 7so842194ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jul 2010 10:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=eIxYbtuWIL6UOqY+cVdpCc+8kcrKXECDgIsSF4owDzA=;
	b=SivBZNP7jyI1oc0/maTsb9AnjdC2PPM2Emk2D6XDj+3zU5x2MPFJ3nHC4pMyYJQwWr
	pFSdc3p4sAln5BRKyEjr8pWvgZerlBvg4KO9RgYlRNp22KsfC64zM9zOo2jLngkXTr+w
	L9Vb2LhgsaQVCBKbjYMAFSAGlSnXRKRoc/3mU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=EJ/xNdd6ArcnhePRDJyquAWr8TrkUHU8XdsYJ1/F9u7d+kN+O6qv91P9DTXUqCWK90
	8K2cXobRG7aUwBzEJW3kCGReOFQfBAaDDnBo32nKqSDIijBf5gdUkGQH/x+2MxFt7xvD
	DmUzBKOBI/4OOMHbNXBMGVRHvskJ6ftWVElFc=
Received: by 10.213.33.4 with SMTP id f4mr1321818ebd.58.1279300603908;
	Fri, 16 Jul 2010 10:16:43 -0700 (PDT)
Received: from localhost.localdomain (j200125.upc-j.chello.nl [24.132.200.125])
	by mx.google.com with ESMTPS id z55sm19683910eeh.21.2010.07.16.10.16.43
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 16 Jul 2010 10:16:43 -0700 (PDT)
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 16 Jul 2010 19:16:39 +0200
Message-Id: <1279300599-3978-1-git-send-email-fransmeulenbroeks@gmail.com>
X-Mailer: git-send-email 1.6.4.2
X-SA-Exim-Connect-IP: 209.85.215.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] gcc: added COMPATIBLE_TARGET_SYS
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
X-List-Received-Date: Fri, 16 Jul 2010 17:16:48 -0000

added COMPATIBLE_TARGET_SYS = "(?!nios2)" to gcc-common.inc file
and COMPATIBLE_TARGET_SYS = "" to the 4.1.2 recipe (which at
the moment is the only one that supports nios2)

Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
---
 recipes/gcc/gcc-common.inc |    2 ++
 recipes/gcc/gcc_4.1.2.bb   |    1 +
 2 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/recipes/gcc/gcc-common.inc b/recipes/gcc/gcc-common.inc
index 7aee542..9515f47 100644
--- a/recipes/gcc/gcc-common.inc
+++ b/recipes/gcc/gcc-common.inc
@@ -5,6 +5,8 @@ LICENSE = "GPL"
 
 NATIVEDEPS = ""
 
+COMPATIBLE_TARGET_SYS = "(?!nios2)" 
+
 inherit autotools gettext
 
 FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/gcc-${PV}"
diff --git a/recipes/gcc/gcc_4.1.2.bb b/recipes/gcc/gcc_4.1.2.bb
index 2062ce5..42f530b 100644
--- a/recipes/gcc/gcc_4.1.2.bb
+++ b/recipes/gcc/gcc_4.1.2.bb
@@ -6,3 +6,4 @@ require gcc-package-target.inc
 
 ARCH_FLAGS_FOR_TARGET += "-isystem${STAGING_INCDIR}"
 
+COMPATIBLE_TARGET_SYS = "" 
-- 
1.6.4.2



