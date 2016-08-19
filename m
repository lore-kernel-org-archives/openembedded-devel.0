Return-Path: <bkylerussell@gmail.com>
Received: from mail-it0-f68.google.com (mail-it0-f68.google.com
	[209.85.214.68])
	by mail.openembedded.org (Postfix) with ESMTP id 253EE7017B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Aug 2016 21:58:10 +0000 (UTC)
Received: by mail-it0-f68.google.com with SMTP id d65so2029370ith.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Aug 2016 14:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=7oXa5oW23h835apRg/zuwnLTSqXPCulR0oKaSIe90vo=;
	b=m6MACEANKyw/VHJevGsB5rvGYhZQ4KykcZXJIZlAdSA9iB3dK/CB/LnEf+DCRoEm6K
	FRZ6wg0rAxmudrntNI07BpzmF8FEIVWNbhDIAcERZ+xWHeEV+t8VnGY7oP2mwRziwKJy
	KxnO50ji5jOcOxjGn9/s1T5Nt2fIGgKDvAfw7LBDMNoXCjWDjPmQPuExvWz+TxMFD2Lv
	G0mThtb+z3/jgIxy1l9pggB5aHb0RDGUJg1JGEZHFeruWSenayF7OvOw2mz/Bfs5TGWZ
	QlGdh/uRcbSXwiieXhWdzXJuM6Eq/liXgfAEobxaVu6IeeJBSsBAeKeS+oOiJORwhFac
	H6Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=7oXa5oW23h835apRg/zuwnLTSqXPCulR0oKaSIe90vo=;
	b=QXNdNCZfm9ieCVZvkUCs7mROszDOQQm+AL6kJBKSR09Bb4V/TfW84EBv3srezNWlLC
	HH+ukZt6b4QVrrM4RfX37+GuCFDaMH04CIDtfN7SLA0o/O0QwWPGya62Ozdb8xsykWa5
	VVhKxp52c+Lpf9srcN4eEqlWgLjYTNOSHb5fmveiXEnjcyBU9NcTWN9xlzyfpaWFfEJj
	W+y9GCQBDsQhYjnBSHnwHBLIakd/m/CVi6pSuSCXftg4Hgdou0iTaCM5AhN5ehdNfhGW
	ajrjjfKpgaXPGAzKQFlS01z/+v6LB/S7JH0a6BlJrPGbyTlDS6e3MvMtijeP+/oSwKI3
	UFQQ==
X-Gm-Message-State: AEkoousqH0DE7L07G3EGO55JkwE2DiE9rTKrQGeSrssKm89pIgOduOEftcyN46qNuZKQ9A==
X-Received: by 10.36.125.137 with SMTP id b131mr8837661itc.55.1471643891308;
	Fri, 19 Aug 2016 14:58:11 -0700 (PDT)
Received: from brrussell-Latitude-E6530.natcky.rr.com
	([2605:a000:1707:fb:9d01:5959:8426:336])
	by smtp.gmail.com with ESMTPSA id 16sm4207616iol.23.2016.08.19.14.58.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 19 Aug 2016 14:58:10 -0700 (PDT)
From: Kyle Russell <bkylerussell@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 19 Aug 2016 17:58:01 -0400
Message-Id: <1471643882-14235-1-git-send-email-bkylerussell@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-java][PATCH 1/2] rhino-native should depend on classpath-native
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
X-List-Received-Date: Fri, 19 Aug 2016 21:58:11 -0000

rhino's do_compile task passes
${STAGING_DATADIR_NATIVE}/classpath/glibj.zip to javac.  This glibj.zip
archive comes from the classpath-native package.

Signed-off-by: Kyle Russell <bkylerussell@gmail.com>
---
 recipes-core/rhino/rhino_1.7r4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-core/rhino/rhino_1.7r4.bb b/recipes-core/rhino/rhino_1.7r4.bb
index 7898d23..30d5a62 100644
--- a/recipes-core/rhino/rhino_1.7r4.bb
+++ b/recipes-core/rhino/rhino_1.7r4.bb
@@ -2,6 +2,8 @@ DESCRIPTION = "Lexical analyzer generator for Java"
 LICENSE = "MPL-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=8e2372bdbf22c99279ae4599a13cc458"
 
+DEPENDS_class-native += "classpath-native"
+
 BBCLASSEXTEND = "native"
 
 inherit java-library
-- 
2.7.4


