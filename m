Return-Path: <Mark.Asselstine@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id F011D609BF
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Sep 2014 17:44:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s8NHiZpX027953
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 23 Sep 2014 10:44:36 -0700 (PDT)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Tue, 23 Sep 2014 10:44:35 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <Martin.Jansa@gmail.com>, <openembedded-devel@lists.openembedded.org>
Date: Tue, 23 Sep 2014 13:44:24 -0400
Message-ID: <1411494264-10440-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 1.8.3.2
MIME-Version: 1.0
X-Originating-IP: [128.224.56.18]
Subject: [meta-ruby][PATCH] ruby.inc: DEPEND on libyaml-native
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
X-List-Received-Date: Tue, 23 Sep 2014 17:44:45 -0000
Content-Type: text/plain

Without this dependency we will see warnings when ever we use the
ruby-native from the sysroot

  ...tmp/sysroots/x86_64-linux/usr/lib/ruby/yaml.rb:84:in `<top (required)>':
  It seems your ruby installation is missing psych (for YAML output).
  To eliminate this warning, please install libyaml and reinstall your ruby.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---

By the way I sent two patches on Sept. 5th to the list to add gem
building support to meta-ruby. I have yet to receive any feedback
on these and would like to continue to work to get these in tree.
Anything I can do to help things along?

 meta-ruby/recipes-devtools/ruby/ruby.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ruby/recipes-devtools/ruby/ruby.inc b/meta-ruby/recipes-devtools/ruby/ruby.inc
index e679f27..409a320 100644
--- a/meta-ruby/recipes-devtools/ruby/ruby.inc
+++ b/meta-ruby/recipes-devtools/ruby/ruby.inc
@@ -15,7 +15,7 @@ LIC_FILES_CHKSUM = "\
 "
 
 DEPENDS = "ruby-native zlib openssl tcl libyaml db gdbm readline"
-DEPENDS_class-native = ""
+DEPENDS_class-native = "libyaml-native"
 
 INC_PR = "r1"
 
-- 
1.8.3.2


