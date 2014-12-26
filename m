Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qa0-f48.google.com (mail-qa0-f48.google.com
	[209.85.216.48])
	by mail.openembedded.org (Postfix) with ESMTP id 2F566727C7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Dec 2014 19:21:50 +0000 (UTC)
Received: by mail-qa0-f48.google.com with SMTP id k15so4993995qaq.35
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Dec 2014 11:21:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:organization; bh=Tv/O4P7RG+1U6R5AqdHBKE+3EBO73Er2WaJ2ThsegOA=;
	b=fTUF4+CRxDuyq89GNlJk3uTr/TnhlLRmS7k/iXpCD2gphfuOvyLzZ0NO/WZnyVp5fL
	s9nWQ1nqakZihcAPJbJB4YCi3FHnPQo4Xz5+N2CNVs+qnRHLe0SXdKut3Xhm+2foakia
	4UtRsbMIUXH1N2V/gqQxohpIlaJQKnpJ+t4Y8ZAm4LDacF7CECJO8qJ1AvQOVGLLnEbD
	EGueanPKs8w4UpjSwJKhdFpW3toDJcBAFwbbb/SGsGqkc23tkdmS7RMW9lNgc01ZHjD8
	OhuBFNboXPZPEI69bp2sfNamCWGGzokykxijQnPkK9nAR2Egk//YnNLa/+Bk+6OZiVNC
	pHnA==
X-Received: by 10.140.109.132 with SMTP id l4mr67015056qgf.91.1419621711383;
	Fri, 26 Dec 2014 11:21:51 -0800 (PST)
Received: from centrium.lab.ossystems.com.br ([177.100.225.47])
	by mx.google.com with ESMTPSA id
	k11sm26659998qgf.18.2014.12.26.11.21.49
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 26 Dec 2014 11:21:50 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Fri, 26 Dec 2014 17:21:39 -0200
Message-Id: <1419621700-1102-11-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.1.3
In-Reply-To: <1419621700-1102-1-git-send-email-otavio@ossystems.com.br>
References: <1419621700-1102-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 11/12] navit: Fix license format QA error
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
X-List-Received-Date: Fri, 26 Dec 2014 19:21:51 -0000

Fix following QA error:

,----
| WARNING: Recipe navit, LICENSE (GPLv2 LGPLv2) has invalid format,
|     LICENSES must have operator "([&|() ])" between them.
`----

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/recipes-navigation/navit/navit.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-navigation/navit/navit.inc b/meta-oe/recipes-navigation/navit/navit.inc
index 4347436..9d4f4ec 100644
--- a/meta-oe/recipes-navigation/navit/navit.inc
+++ b/meta-oe/recipes-navigation/navit/navit.inc
@@ -1,5 +1,5 @@
 DESCRIPTION = "Navit is a car navigation system with routing engine."
-LICENSE = "GPLv2 LGPLv2"
+LICENSE = "GPLv2 & LGPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ed539d099d6ce08de6ea0dfed9ecb333 \
                     file://LGPL-2;md5=3214f080875748938ba060314b4f727d \
                     file://GPL-2;md5=751419260aa954499f7abaabaa882bbe \
-- 
2.1.3


