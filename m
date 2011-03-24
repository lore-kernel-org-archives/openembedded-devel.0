Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Q2hXh-0002Ql-Bp
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Mar 2011 11:13:25 +0100
Received: by mail-bw0-f47.google.com with SMTP id 10so7237376bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Mar 2011 03:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=QVJxKn+O+j9JowaNfvJYlX0W5vOD24H1KYBQZdTKMFQ=;
	b=cvY+SKPNIhzuKXXg5l58Dnaz9UK82fpgfGjhXAtntqXdg7fbLwh0w+GpZqpLyC6FR3
	QE4DDIg1BxaGWD1QN0LDhFLl0FGKBTnW76gMFk2W2W0ovfQZgpwfH7QSjNxgU2UY66mQ
	oO9Pez5oXd6eVBa4EvverRQZ2bdkNTXuR2ZuI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	b=t5BZA4qKjIdWWIByois4jRUbtRX6P071fzoKciX7r8KAJEUaAze2YxvprfuLXk4aUG
	mIhzuRKDlNqeHj/C/k29Uh/+vNBc35iMeYA+M2uqkk34lNwttJDeNHyXNRPbGU9Jch1H
	T5Bz/UcRE+BnFWD29OYfzOB8U50bw/9jB40M0=
Received: by 10.204.3.146 with SMTP id 18mr3420788bkn.1.1300961495072;
	Thu, 24 Mar 2011 03:11:35 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id t1sm6587030bkx.19.2011.03.24.03.11.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 24 Mar 2011 03:11:34 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 24 Mar 2011 11:11:27 +0100
Message-Id: <25669e8b93f665e329570ce4e4b0f812c46f7e3d.1300961186.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1300961186.git.Martin.Jansa@gmail.com>
References: <cover.1300961186.git.Martin.Jansa@gmail.com>
Subject: [PATCH 6/7] fribidi: fix LICENSE, drop D_P, add LIC_FILES_CHKSUM
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
X-List-Received-Date: Thu, 24 Mar 2011 10:13:25 -0000

---
 .../recipes-devtools/libfribidi/fribidi_0.19.2.bb  |    9 +++------
 1 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/meta-oe/recipes-devtools/libfribidi/fribidi_0.19.2.bb b/meta-oe/recipes-devtools/libfribidi/fribidi_0.19.2.bb
index dd7fb98..fd4ef7a 100644
--- a/meta-oe/recipes-devtools/libfribidi/fribidi_0.19.2.bb
+++ b/meta-oe/recipes-devtools/libfribidi/fribidi_0.19.2.bb
@@ -2,14 +2,12 @@ DESCRIPTION = "Fribidi library for bidirectional text"
 SECTION = "libs"
 PRIORITY = "optional"
 PR = "r1"
-LICENSE = "unknown"
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
+BBCLASSEXTEND = "native"
 
 PROVIDES = "libfribidi"
 
-# Slightly incompatible with 0.10.x, so:
-DEFAULT_PREFERENCE = "-1"
-DEFAULT_PREFERENCE_angstrom = "1"
-
 inherit autotools lib_package pkgconfig
 
 CFLAGS_append = "  -DPAGE_SIZE=4096 "
@@ -18,4 +16,3 @@ SRC_URI = "http://fribidi.org/download/fribidi-${PV}.tar.gz"
 
 SRC_URI[md5sum] = "626db17d2d99b43615ad9d12500f568a"
 SRC_URI[sha256sum] = "49cf91586e48b52fe25872ff66c1da0dff0daac2593f9f300e2af12f44f64177"
-BBCLASSEXTEND = "native"
-- 
1.7.4.1



