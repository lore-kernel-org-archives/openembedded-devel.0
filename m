Return-Path: <straka.derek@gmail.com>
Received: from mail-qg0-f68.google.com (mail-qg0-f68.google.com
	[209.85.192.68])
	by mail.openembedded.org (Postfix) with ESMTP id 40504770DE
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Jan 2016 13:18:05 +0000 (UTC)
Received: by mail-qg0-f68.google.com with SMTP id 6so8254189qgy.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Jan 2016 05:18:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=golBVG4Y5EEhjIywG0qUEmCnak2nHhXAcT06YPfZvAI=;
	b=ZiUYhCYVvb8kArtPpGJNzgUYZXnh+KyF3nMHEt8WLVYLNFyt9eFcEEqYGHZKEuZtq8
	AW7YhJw1LYfJ7DBJ+EcGjedGWc4630HWcWeH90S07nivRJid2el51hI/tveIMkdWP1nO
	hNRRnVPf6hdAET/CN/X5AeKVlpoBTyfwGA9tqKyzSyGMJQ1CnLMJF24fpNQKLHBOja1u
	0/23kC0beduSv8QNdOYvejyLTE2Twz1d35Eic0O0SDBhKRcBLLofGdefMzyD4zos6YpP
	f/uHvGgTXRDugkEDUcJJOu+oeXJFwYOMUar7fol5tGpXdgjrbid0JfsDQnZ2v0mvA+W9
	1NTw==
X-Gm-Message-State: AG10YOQkmGvWJpQ0VbH/MomM7lVM18dcfIbJmPGAhjge3tRgkUqOl1jm1CrDogmqFApYfQ==
X-Received: by 10.140.31.197 with SMTP id f63mr15205545qgf.12.1453641486712;
	Sun, 24 Jan 2016 05:18:06 -0800 (PST)
Received: from build-slave.minotaur.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168]) by smtp.gmail.com with ESMTPSA id
	d188sm6865927qkb.9.2016.01.24.05.18.06
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 24 Jan 2016 05:18:06 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 24 Jan 2016 08:17:44 -0500
Message-Id: <6180683641385982dbb76a9062302dac110f6224.1453589999.git.derek@asterius.io>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1453589999.git.derek@asterius.io>
References: <cover.1453589999.git.derek@asterius.io>
In-Reply-To: <cover.1453589999.git.derek@asterius.io>
References: <cover.1453589999.git.derek@asterius.io>
Subject: [meta-python][PATCH 11/13] python-daemonize: update to 2.4.2
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 24 Jan 2016 13:18:06 -0000

---
 .../{python-daemonize_2.4.1.bb => python-daemonize_2.4.2.bb}       | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)
 rename meta-python/recipes-devtools/python/{python-daemonize_2.4.1.bb => python-daemonize_2.4.2.bb} (67%)

diff --git a/meta-python/recipes-devtools/python/python-daemonize_2.4.1.bb b/meta-python/recipes-devtools/python/python-daemonize_2.4.2.bb
similarity index 67%
rename from meta-python/recipes-devtools/python/python-daemonize_2.4.1.bb
rename to meta-python/recipes-devtools/python/python-daemonize_2.4.2.bb
index e10c853..9c0bc8d 100644
--- a/meta-python/recipes-devtools/python/python-daemonize_2.4.1.bb
+++ b/meta-python/recipes-devtools/python/python-daemonize_2.4.2.bb
@@ -1,16 +1,15 @@
 SUMMARY = "Library to enable your code run as a daemon process on Unix-like systems"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=13e982bf1b7b164b9d6d1665dac83873"
-SRCNAME = "daemonize"
 
 inherit pypi
 
+SRC_URI[md5sum] = "bb5b341b94abc15d6788002cafaa9da4"
+SRC_URI[sha256sum] = "c21a94cd676d3fbb718af62e6f22209afc7000a9588169b6fb779d62b04e2378"
+
 RDEPENDS_${PN} = "\
                python-fcntl \
                python-unixadmin \
                python-logging \
                python-resource \
 "
-
-SRC_URI[md5sum] = "f08ad971573a1d83d2d4adab13f59448"
-SRC_URI[sha256sum] = "2fbe8a4af6bafb3f53d64b8c05c073bfff6c8bc829b83563f5774b0052fc656e"
-- 
1.9.1


