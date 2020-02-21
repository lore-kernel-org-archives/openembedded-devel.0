Return-Path: <Mark.Asselstine@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id EAA8660AC2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Feb 2020 15:21:09 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 01LFKwTl028302
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL);
	Fri, 21 Feb 2020 07:20:59 -0800 (PST)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Fri, 21 Feb 2020 07:20:58 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 21 Feb 2020 10:20:56 -0500
Message-ID: <1582298456-15277-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-oe][PATCH] meta-oe: onig: avoid using 'install' with both -D and -t options
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
X-List-Received-Date: Fri, 21 Feb 2020 15:21:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Older versions of 'install' (prior to 8.23) do not allow the -D and -t
options to be used together. (see coreutils commit 15d092f94a3a
[install: allow options -D and -t to be used together]). On build
hosts such as CentOS7, which has install v8.22, we therefor see a
failure: install:

    failed to access ‘...onig/6.9.4-r0/image/usr/lib64/onig/ptest/tests/’:
        No such file or directory

We definitely don't want to avoid using useful features of tools but
throughout meta-openembedded the mkdir approach is used so let's stick
to it and avoid causing undo issues at the expense of one extra line
of code.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 meta-oe/recipes-support/onig/onig_6.9.4.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/onig/onig_6.9.4.bb b/meta-oe/recipes-support/onig/onig_6.9.4.bb
index cfa86f0..50d9f52 100644
--- a/meta-oe/recipes-support/onig/onig_6.9.4.bb
+++ b/meta-oe/recipes-support/onig/onig_6.9.4.bb
@@ -28,5 +28,6 @@ do_compile_ptest() {
 }
 
 do_install_ptest() {
-    install -Dm0755 -t ${D}${PTEST_PATH}/tests/ ${B}/test/.libs/*
+    mkdir -p ${D}${PTEST_PATH}/tests
+    install -m 0755 -t ${D}${PTEST_PATH}/tests/ ${B}/test/.libs/*
 }
-- 
2.7.4


