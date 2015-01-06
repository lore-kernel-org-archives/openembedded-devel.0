Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f178.google.com (mail-pd0-f178.google.com
	[209.85.192.178])
	by mail.openembedded.org (Postfix) with ESMTP id F32A5729D0
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Jan 2015 16:01:14 +0000 (UTC)
Received: by mail-pd0-f178.google.com with SMTP id r10so30779255pdi.9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Jan 2015 08:01:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=OLDLBhkJOWShGX+i7LLTDg92V/+F3ST+dwduVCH8/qc=;
	b=ZbppYDdn0+ZOiuwqFR2c6WLLOX3v9ct6GDRtLnANIoWBDzKGyxzNrdP6SLPc6fpfgL
	KN5vhDyoaF39Y7SJkF96QeKmczC2+M0jdEqQ0wKy8o1lFpz4Ra9rfLmmfBcLZWcNi1ZL
	zyQO/dd6oefofht6sttVLClQyFQwrYYZuq034A1BvTEJw6mnkIyslLVfNuWZsyyi+dFi
	rxK93qt38RqNf9DODTb7LnHjo7wGKKMbw017oOY6YZbPk4p+5b15zH1YubpoIlhbKCY2
	YM8nJPRJ1iptQv2QaWjnYZHR/BQpfxspcxZW/2qHSsc3mdpQBOl5YPlj1SM6n3Xwvn6R
	SJIg==
X-Received: by 10.70.131.198 with SMTP id oo6mr151360244pdb.77.1420560073588; 
	Tue, 06 Jan 2015 08:01:13 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by mx.google.com with ESMTPSA id a5sm35458262pat.24.2015.01.06.08.01.11
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 06 Jan 2015 08:01:12 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  6 Jan 2015 08:01:07 -0800
Message-Id: <1420560067-8617-2-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1420560067-8617-1-git-send-email-akuster808@gmail.com>
References: <1420560067-8617-1-git-send-email-akuster808@gmail.com>
Subject: [meta-oe][PATCH 2/2] libssh: fix krb5 rdepends issue
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
X-List-Received-Date: Tue, 06 Jan 2015 16:01:16 -0000

the default is to build with GSSAPI enable so we need
krb5 support.

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-support/libssh/libssh_0.6.3.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-support/libssh/libssh_0.6.3.bb b/meta-oe/recipes-support/libssh/libssh_0.6.3.bb
index 771a47a..9c5ebf5 100644
--- a/meta-oe/recipes-support/libssh/libssh_0.6.3.bb
+++ b/meta-oe/recipes-support/libssh/libssh_0.6.3.bb
@@ -27,3 +27,6 @@ do_configure_prepend () {
 }
 
 FILES_${PN}-dev += "${libdir}/cmake"
+
+# This builds with GSSAPI enabled as default
+RDEPENDS_${PN} = "krb5"
-- 
1.9.1


