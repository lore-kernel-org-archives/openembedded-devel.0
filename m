Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f45.google.com (mail-wg0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 4D8FA6B4F7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jan 2014 11:37:19 +0000 (UTC)
Received: by mail-wg0-f45.google.com with SMTP id n12so1634479wgh.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jan 2014 03:37:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=aPx1sHKb21yTkuRlgRHy/Lhg+YTUd/feJ7pAm5nmG5I=;
	b=LknA2rMMm5+FqJI0eavWj2d08g3gVDxsln9aqV1IuZWr+4jtgWeyq4f8B/i1U9M6Km
	LsbZC6mLOGflJ0r4PQ6HdzRf92mXN42rsjwrn4VdtK22rOn36aYFMCrmW+3C0zFBrg6B
	26b9KBOTkhiU/INAGIwT9onv2T12uHjKPGcIyhzyqrvWJxIW1Zbb6hRDXyfV5dICWqab
	9SO3LrLHtMPomDkh8cm6RfjGXtH+OWXJYCP2HOlEkWdNKP+ZhDC+gTsO+SbdHmtPGzk6
	L1R8AKUwKjHffJjucBK7826Y/nWtTMRpDBecVbCkG7MdD9h0uo3yWP/TODGAFKNVLmFX
	0GwQ==
X-Gm-Message-State: ALoCoQn7E8N1a5SUQutaRQfu1W9XRI00R3QlUQJT30BagXJJTtbfqDpyI0rqh8XoW7ppu0Tj8+pM
X-Received: by 10.194.241.228 with SMTP id wl4mr1888108wjc.2.1389785840024;
	Wed, 15 Jan 2014 03:37:20 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id ea4sm9087026wib.7.2014.01.15.03.37.18
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 15 Jan 2014 03:37:19 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 15 Jan 2014 11:37:10 +0000
Message-Id: <1389785832-3120-3-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1389785832-3120-1-git-send-email-ross.burton@intel.com>
References: <1389785832-3120-1-git-send-email-ross.burton@intel.com>
Subject: [meta-oe][PATCH 3/5] libssh: don't do out-of-tree builds manually
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 15 Jan 2014 11:37:19 -0000

cmake.bbclass as of oe-core 783fb88 defaults to out-of-tree builds.  Use that
functionality instead of OECMAKE_BUILDPATH/_SOURCEPATH which are no longer used.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta-oe/recipes-support/libssh/libssh_git.bb |    7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/meta-oe/recipes-support/libssh/libssh_git.bb b/meta-oe/recipes-support/libssh/libssh_git.bb
index 73b9ec1..14fd1e4 100644
--- a/meta-oe/recipes-support/libssh/libssh_git.bb
+++ b/meta-oe/recipes-support/libssh/libssh_git.bb
@@ -12,20 +12,17 @@ SRC_URI = "git://git.libssh.org/projects/libssh.git;branch=v0-5"
 SRCREV = "43914a5f07702fe292a968322d5ff2627e0431db"
 S = "${WORKDIR}/git"
 
-OECMAKE_BUILDPATH = "${S}/build"
-OECMAKE_SOURCEPATH = "${S}"
 EXTRA_OECMAKE = " \
     -DWITH_GCRYPT=1 \
     -DWITH_PCAP=1 \
     -DWITH_SFTP=1 \
     -DWITH_ZLIB=1 \
     "
-EXTRA_OEMAKE = "-C ${OECMAKE_BUILDPATH}"
 
 inherit cmake
 
 do_configure_prepend () {
     # Disable building of examples
-    sed -i -e '/add_subdirectory(examples)/s/^/#DONOTWANT/' CMakeLists.txt \
-        || bb_fatal "Failed to disable examples"
+    sed -i -e '/add_subdirectory(examples)/s/^/#DONOTWANT/' ${S}/CMakeLists.txt \
+        || bbfatal "Failed to disable examples"
 }
-- 
1.7.10.4


