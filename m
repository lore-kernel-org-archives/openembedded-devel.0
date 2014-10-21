Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0F2B760672
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Oct 2014 06:01:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s9L61R2t004579
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Oct 2014 23:01:27 -0700 (PDT)
Received: from pek-hostel-vm11.wrs.com (128.224.153.181) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Mon, 20 Oct 2014 23:01:26 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 21 Oct 2014 02:01:25 -0400
Message-ID: <1413871285-30819-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.0.0
MIME-Version: 1.0
Subject: [meta-ruby][PATCH] ruby: make build deterministic by adding PACKAGECONFIG for valgrind
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
X-List-Received-Date: Tue, 21 Oct 2014 06:01:29 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

* disabled by default
* fixes:
ruby/1.9.3-p547-r1.0/ruby-1.9.3-p547/gc.c:43:32:fatal error: valgrind/memcheck.h: No such file or directory

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta-ruby/recipes-devtools/ruby/ruby_1.9.3-p547.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-ruby/recipes-devtools/ruby/ruby_1.9.3-p547.bb b/meta-ruby/recipes-devtools/ruby/ruby_1.9.3-p547.bb
index 2d5938f..834cb71 100644
--- a/meta-ruby/recipes-devtools/ruby/ruby_1.9.3-p547.bb
+++ b/meta-ruby/recipes-devtools/ruby/ruby_1.9.3-p547.bb
@@ -21,6 +21,9 @@ SRC_URI[sha256sum] = "9ba118e4aba04c430bc4d5efb09b31a0277e101c9fd2ef3b80b9c684d7
 # 0001-socket-extconf-hardcode-wide-getaddr-info-test-outco.patch
 UNKNOWN_CONFIGURE_WHITELIST += "--enable-wide-getaddrinfo"
 
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[valgrind] = "--with-valgrind=yes, --with-valgrind=no, valgrind"
+
 EXTRA_OECONF = "\
     --enable-wide-getaddrinfo \
     --disable-versioned-paths \
-- 
2.0.0


