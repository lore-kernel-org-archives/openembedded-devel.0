Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id BC3D66E5CB
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Dec 2016 07:50:51 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id uBS7or9q008506
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Dec 2016 23:50:53 -0800
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Tue, 27 Dec 2016 23:50:52 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 28 Dec 2016 15:46:40 +0800
Message-ID: <20161228074640.21371-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.8.3
MIME-Version: 1.0
Subject: [meta-oe][PATCH] rsyslog: use atomic builtins to avoid race issue
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
X-List-Received-Date: Wed, 28 Dec 2016 07:50:53 -0000
Content-Type: text/plain

rsyslog uses a small program to check if compiler has atomic builtins
or not. This does not work when cross compiling, resulting in potential
race issue. In fact, when running ptest on intel-x86-64 board, we have
met the race problem.

As our compiler gcc, has atomic builtins, we force ap_cv_atomic_builtins
to be 'yes' so that rsyslog could make use of the atomic builtins and avoid
the race issue.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta-oe/recipes-extended/rsyslog/rsyslog_8.22.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_8.22.0.bb b/meta-oe/recipes-extended/rsyslog/rsyslog_8.22.0.bb
index 4e2c122..27162e1 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog_8.22.0.bb
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog_8.22.0.bb
@@ -31,7 +31,7 @@ SRC_URI[sha256sum] = "06e2884181333dccecceaca82827ae24ca7a258b4fbf7b1e07a80d4caa
 
 inherit autotools pkgconfig systemd update-rc.d update-alternatives ptest
 
-EXTRA_OECONF += "--disable-generate-man-pages"
+EXTRA_OECONF += "--disable-generate-man-pages ap_cv_atomic_builtins=yes"
 
 # first line is default yes in configure
 PACKAGECONFIG ??= " \
-- 
2.8.3


