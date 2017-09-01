Return-Path: <Jackie.Huang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 06B837848B
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Sep 2017 07:44:15 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v817iHwC015907
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 1 Sep 2017 00:44:17 -0700
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Fri, 1 Sep 2017 00:44:16 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 1 Sep 2017 15:43:29 +0800
Message-ID: <20170901074329.27500-1-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] pmtools: use update-alternatives for acpixtract
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
X-List-Received-Date: Fri, 01 Sep 2017 07:44:17 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

acpixtract is both provided by acpica and pmtools, so use
update-alternatives to fix conflicts:

| file /usr/bin/acpixtract conflicts between attempted installs of
  pmtools-20130209+git0+3ebe0e54c5-r0.i586 and acpica-20170303-r0.i586

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta-oe/recipes-devtools/pmtools/pmtools_git.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-oe/recipes-devtools/pmtools/pmtools_git.bb b/meta-oe/recipes-devtools/pmtools/pmtools_git.bb
index 94fc736b5..8491fc904 100644
--- a/meta-oe/recipes-devtools/pmtools/pmtools_git.bb
+++ b/meta-oe/recipes-devtools/pmtools/pmtools_git.bb
@@ -15,6 +15,11 @@ COMPATIBLE_HOST = "(i.86|x86_64).*-linux"
 
 S = "${WORKDIR}/git"
 
+inherit update-alternatives
+
+ALTERNATIVE_PRIORITY = "90"
+ALTERNATIVE_${PN} = "acpixtract"
+
 do_configure[noexec] = "1"
 do_compile() {
     oe_runmake
-- 
2.11.0


