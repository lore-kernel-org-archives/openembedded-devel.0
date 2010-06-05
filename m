Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <matgnt@gmail.com>) id 1OL0cK-000332-Aj
	for openembedded-devel@lists.openembedded.org;
	Sat, 05 Jun 2010 23:09:21 +0200
Received: by fxm9 with SMTP id 9so1447079fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 05 Jun 2010 14:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=uo1BXFeKRGeBLFCJkuazGUuU2q6G7B+Tf0x8TJbKU24=;
	b=EE3xv6mnD6tbII9WGlY9jlx2PY/DRwtnjwHLXsYd+lITgXBOSFjqtUKFUWUyzt52OU
	B8uUXGcD74RCJBs11NmM/8xzqVZn5lmKTn6gVBlIYl1r2PjM4cvXz7O9hcw4ntgUTxix
	cBtraJb7ONkQ8WgIcybHcXtGnT6ZwqquiOhyw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=MJioL3oaT50ZoCtcyDkhqvfR9K13ivYyO5uah9UOAj0oZH3lVCnsjRRGjzG99ZipP+
	NgMOnwQTUkbT0jw0+TDX38pgedcSWQt8oK5R6zuEf8acAqrrhhMyGry71lwfnFsNJWz3
	LJaE3z7yiu8+0jMDsGkWxXHAuBJu58DWWXWw8=
Received: by 10.87.48.34 with SMTP id a34mr19977258fgk.2.1275771902228;
	Sat, 05 Jun 2010 14:05:02 -0700 (PDT)
Received: from localhost.localdomain (z0701.wist.uni-linz.ac.at
	[193.171.42.194])
	by mx.google.com with ESMTPS id 9sm3782882fks.26.2010.06.05.14.05.01
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 05 Jun 2010 14:05:01 -0700 (PDT)
From: =?UTF-8?q?Matthias=20G=C3=BCnther?= <matgnt@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  5 Jun 2010 23:04:30 +0200
Message-Id: <1275771871-5163-2-git-send-email-matgnt@gmail.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1275771871-5163-1-git-send-email-matgnt@gmail.com>
References: <1275771871-5163-1-git-send-email-matgnt@gmail.com>
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: matgnt@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS,
	TVD_SPACE_RATIO autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 1/2] qt4: Add qt4-tools-native_4.7.0-beta1
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
X-List-Received-Date: Sat, 05 Jun 2010 21:09:21 -0000

---
 recipes/qt4/qt4-tools-native_4.7.0-beta1.bb |   12 ++++++++++++
 1 files changed, 12 insertions(+), 0 deletions(-)
 create mode 100644 recipes/qt4/qt4-tools-native_4.7.0-beta1.bb

diff --git a/recipes/qt4/qt4-tools-native_4.7.0-beta1.bb b/recipes/qt4/qt4-tools-native_4.7.0-beta1.bb
new file mode 100644
index 0000000..5d3f55c
--- /dev/null
+++ b/recipes/qt4/qt4-tools-native_4.7.0-beta1.bb
@@ -0,0 +1,12 @@
+DEFAULT_PREFERENCE = "-1"
+
+require qt4-tools-native.inc
+LICENSE = "LGPLv2.1 GPLv3"
+PR = "${INC_PR}.0"
+
+EXTRA_OECONF += " -no-fast -silent -no-rpath"
+
+TOBUILD := "src/tools/bootstrap ${TOBUILD}"
+
+SRC_URI[md5sum] = "128dae41b23bb427b735548c7864703a"
+SRC_URI[sha256sum] = "1107de986e4dda7795d094a2a3b5d85027d780b9b63e9860957cb1d6c56c8929"
-- 
1.7.0.4



