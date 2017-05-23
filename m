Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9C90C7017B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 May 2017 10:24:25 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v4NAOPs0028385
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Tue, 23 May 2017 03:24:25 -0700
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Tue, 23 May 2017 03:24:24 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <Joe_MacDonald@mentor.com>
Date: Tue, 23 May 2017 18:24:23 +0800
Message-ID: <20170523102423.6607-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [meta-networking][PATCH] dante: fix unknown-configure-option QA issue
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
X-List-Received-Date: Tue, 23 May 2017 10:24:26 -0000
Content-Type: text/plain

Fix the following QA issue.

  dante-1.4.1: dante: configure was passed unrecognised options: --disable-krb5 [unknown-configure-option]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta-networking/recipes-protocols/dante/dante_1.4.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-protocols/dante/dante_1.4.1.bb b/meta-networking/recipes-protocols/dante/dante_1.4.1.bb
index 3b07ffe43..ffdab22cf 100644
--- a/meta-networking/recipes-protocols/dante/dante_1.4.1.bb
+++ b/meta-networking/recipes-protocols/dante/dante_1.4.1.bb
@@ -32,7 +32,7 @@ REQUIRED_DISTRO_FEATURES = "pam"
 EXTRA_AUTORECONF = "-I ${S}"
 
 PACKAGECONFIG[libwrap] = ",--disable-libwrap,tcp-wrappers,libwrap"
-PACKAGECONFIG[krb5] = ",--disable-krb5,krb5"
+PACKAGECONFIG[krb5] = ",--without-krb5,krb5"
 
 PACKAGECONFIG ??= ""
 
-- 
2.11.0


