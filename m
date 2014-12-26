Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qg0-f53.google.com (mail-qg0-f53.google.com
	[209.85.192.53])
	by mail.openembedded.org (Postfix) with ESMTP id 0AC3B72824
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Dec 2014 19:21:31 +0000 (UTC)
Received: by mail-qg0-f53.google.com with SMTP id l89so7374483qgf.26
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Dec 2014 11:21:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:organization; bh=LpOqecql3qLnMi5+RMR1R4bqWVicRf3D145c2pwOtdw=;
	b=r6DrAG0/ERpOtviU2es3NU9uFWgsfCgT87eeo9ZeIJab1uaJJAYocPMVEJozWZNczY
	gcd+iSLrK1c4LpXWxkmkiteOqkvlsarf0ct0eVBbuelrQ117nR1g3vqLYC9XtIrwnRNq
	RQMSohZJJzkvOQPsZbGfuLt4dgG9auIoWLjbCUaHs+0gTVrOiCJUOH2JMIl7LY7A8fcd
	Wa7zGOfO78SSLX9thjOQrnol/a6HO52/Ucrfws6+jBndk0b8NTySk32IyYZhPbwFo6ZC
	yRfIaiktWJg7TRmPwqxuLtONHLrMPZO/a/C/ZeJy9nne97GiXIPJwfbdyxJkBr8gTMlm
	uwlw==
X-Received: by 10.229.97.73 with SMTP id k9mr71445695qcn.15.1419621692345;
	Fri, 26 Dec 2014 11:21:32 -0800 (PST)
Received: from centrium.lab.ossystems.com.br ([177.100.225.47])
	by mx.google.com with ESMTPSA id
	k11sm26659998qgf.18.2014.12.26.11.21.30
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 26 Dec 2014 11:21:31 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Fri, 26 Dec 2014 17:21:30 -0200
Message-Id: <1419621700-1102-2-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.1.3
In-Reply-To: <1419621700-1102-1-git-send-email-otavio@ossystems.com.br>
References: <1419621700-1102-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 02/12] dash: Fix license format QA error
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
X-List-Received-Date: Fri, 26 Dec 2014 19:21:39 -0000

This adds the & operator to fix the following QA error:

,----
| WARNING: Recipe dash, LICENSE (BSD GPLv2+) has invalid format,
|     LICENSES must have operator "([&|() ])" between them.
`----

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/recipes-extended/dash/dash_0.5.8.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/dash/dash_0.5.8.bb b/meta-oe/recipes-extended/dash/dash_0.5.8.bb
index c3dbd45..c2b5249 100644
--- a/meta-oe/recipes-extended/dash/dash_0.5.8.bb
+++ b/meta-oe/recipes-extended/dash/dash_0.5.8.bb
@@ -2,7 +2,7 @@ SUMMARY = "Small and fast POSIX-compliant shell"
 HOMEPAGE = "http://gondor.apana.org.au/~herbert/dash/"
 SECTION = "System Environment/Shells"
 
-LICENSE = "BSD GPLv2+"
+LICENSE = "BSD & GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b5262b4a1a1bff72b48e935531976d2e"
 
 inherit autotools update-alternatives
-- 
2.1.3


