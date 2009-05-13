Received: from [209.85.219.172] (helo=mail-ew0-f172.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koen.kooi@gmail.com>) id 1M4B3g-0006OE-6G
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 May 2009 11:47:28 +0200
Received: by mail-ew0-f172.google.com with SMTP id 20so593886ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 May 2009 02:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=HS5Jx85Wf0UnteOWpc1LYwnDjCbHfL7rzKNQqeteA+4=;
	b=JS0QUkffzj5t5ZhzIKxr1MKzDPSQ8MKnMj9gheNyUZ2VBOyolUgT4paLK87E3iQ2WE
	AzcHUm2vDOtovVe7rYGPQa0x2NRmToFlTuD379mrV9KhgOQL+z6+0RNuEGQe/xsx/cPf
	2YiUmkFKa7yLf63IbNH0n099dBrSEwDqHOWyU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	b=J8AzL/lWGZQpwEK7MjwtphMXeITwLPQYtRFp7gEqjEGkwu0k9v+NfGWwG6ghqV5ElA
	5puwK7RCzWYG/Ejj4eCUsxBnek9fABhx1UxvV2hlOpCOmEYy7kqae3z7YBj1lPca1zaR
	z3bJuHLD54AOc9I8NUWwyVv36piCBdZHKJROw=
Received: by 10.210.87.11 with SMTP id k11mr953725ebb.7.1242207645707;
	Wed, 13 May 2009 02:40:45 -0700 (PDT)
Received: from localhost (s55917625.adsl.wanadoo.nl [85.145.118.37])
	by mx.google.com with ESMTPS id 5sm1016650eyh.40.2009.05.13.02.40.44
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 13 May 2009 02:40:45 -0700 (PDT)
From: koen.kooi@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Wed, 13 May 2009 11:39:15 +0200
Message-Id: <1242207556-15601-37-git-send-email-k.kooi@student.utwente.nl>
X-Mailer: git-send-email 1.6.1
In-Reply-To: <1242207556-15601-1-git-send-email-k.kooi@student.utwente.nl>
References: <1242207556-15601-1-git-send-email-k.kooi@student.utwente.nl>
Subject: [STABLE][PATCH 36/37] logrotate: remove -s on install
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
X-List-Received-Date: Wed, 13 May 2009 10:09:59 -0000

From: Mike Westerhof <mwester@dls.net>

Signed-off-by: Koen Kooi <koen@openembedded.org>
---
 recipes/logrotate/logrotate_3.7.1.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/logrotate/logrotate_3.7.1.bb b/recipes/logrotate/logrotate_3.7.1.bb
index 0a1647e..61a1306 100644
--- a/recipes/logrotate/logrotate_3.7.1.bb
+++ b/recipes/logrotate/logrotate_3.7.1.bb
@@ -5,7 +5,7 @@ DEPENDS = "popt"
 RDEPENDS = "cron"
 SECTION = "admin"
 LICENSE = "GPL"
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "http://ftp.debian.org/debian/pool/main/l/logrotate/logrotate_${PV}.orig.tar.gz \
 	   file://logrotate-3.7.1.patch;patch=1 \
@@ -21,7 +21,7 @@ do_compile() {
 
 do_install () {
     # Install the binary and conf file
-    install -D -s -m 0755 ${S}/logrotate ${D}${base_sbindir}/logrotate
+    install -D -m 0755 ${S}/logrotate ${D}${base_sbindir}/logrotate
     install -D -m 0644 ${WORKDIR}/logrotate.conf ${D}${sysconfdir}/logrotate.conf
     install -m 0755 -d ${D}${sysconfdir}/logrotate.d
 }
-- 
1.6.1



