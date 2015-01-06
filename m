Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f180.google.com (mail-pd0-f180.google.com
	[209.85.192.180])
	by mail.openembedded.org (Postfix) with ESMTP id B240572952
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Jan 2015 15:59:32 +0000 (UTC)
Received: by mail-pd0-f180.google.com with SMTP id fl12so14932158pdb.25
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Jan 2015 07:59:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=AxQSd/8NSuxLP7BzFGZ2t2W3ZA9nfV5vawo4xq0Xt7Y=;
	b=MCC28sfoGq5OdOFZdmcT5xSQHGSoiiF0DyxQYLltEVWvPjTJ4w97BYmsvRL5hH0RTS
	e36UWBZTY35JRpRWWFgFZXWu9fWrMa3pQ9Bu6iSWVo8HQd3yyKJH9MdMbIQFh3Krc2LD
	1AmoPgQ2MK39TE0jiwAhrog4xbJxmaGuwLU/yoy4d096tpE2tvwNapeibvqVf+49bvnk
	CVhfQHJ++V5oXk43AOkkBJmx5NNdsvaQ067WtokTceoOP1eHRfYHD+WnshZKn3IOJeHq
	fVideujIiRiIFHFYxH8ylBY5HpnCgS719ZUnOE5qZL//BUOGofo7yzDuL3v8kTkJFDle
	dZJw==
X-Received: by 10.66.55.4 with SMTP id n4mr126655832pap.79.1420559973168;
	Tue, 06 Jan 2015 07:59:33 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by mx.google.com with ESMTPSA id
	kr10sm36866390pdb.42.2015.01.06.07.59.30
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 06 Jan 2015 07:59:31 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  6 Jan 2015 07:59:19 -0800
Message-Id: <1420559960-8518-2-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1420559960-8518-1-git-send-email-akuster808@gmail.com>
References: <1420559960-8518-1-git-send-email-akuster808@gmail.com>
Subject: [meta-networking][PATCH 1/2] proftpd: fix rdepends issue
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
X-List-Received-Date: Tue, 06 Jan 2015 15:59:36 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-networking/recipes-daemons/proftpd/proftpd_1.3.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.5.bb b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.5.bb
index cba39e8..7d285a0 100644
--- a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.5.bb
+++ b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.5.bb
@@ -99,4 +99,4 @@ USERADD_PARAM_${PN} = "--system -g ${FTPGROUP} --home-dir /var/lib/${FTPUSER} --
 
 FILES_${PN} += "/home/${FTPUSER}"
 
-RDEPENDS_${PN} += "perl"
+RDEPENDS_${PN} += "perl initscripts-functions"
-- 
1.9.1


