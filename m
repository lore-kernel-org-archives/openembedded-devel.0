Return-Path: <philip.balister@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id 17BB76FFEF
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Aug 2016 18:08:02 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id r128so1750681qkc.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Aug 2016 11:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=bbvCY9eNac1LDg4WAO9STdKYnOWx61G12iP2OdRPJNY=;
	b=cgnMR4JtD5KIYw+sVCVWUTpSo/0it9yfbjfvJ12WXwZIz6OFe1ewCNa71oMkMiZJuf
	XZGec0FQFrmo6+g6L1psHq/2N1Sc/0WTbZUm4yY5FuA0OyS6VqVDeZz2uB/0I/4MnX3p
	TQIrVOWZzJKf6o6EXfMyHQFWT0sLDh3BF053SAYw4nOZvisrYJPKvAk9NpW6yYcTUF0y
	i/NYBfULczP5N0/lNbDGqDYJqs+vsgyNriqbDORbmZmnNfLFD9Q00z4RA0FEJBJn5e7r
	Q3cx987HECiivQ+3y5bVoyrgfcJV5TM+GezmMSbkU/UzY6QoyhFRzyz4fmkbh7M8NJlV
	N+EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=bbvCY9eNac1LDg4WAO9STdKYnOWx61G12iP2OdRPJNY=;
	b=G11rR+LTwSiLYDj6miKmfYZ91Kw7JWeC7iKr5L5BqHE3OOZneYF0dSc9mci8C0k7RL
	FH99jnuY/GBDRpQbBITCdZdO4gNeONMVolmDkX7cQm9RlVqnTyGMIpxklc3Wd9g34b25
	ZOyRL0hb3zNWRbysWXXJYLKD7AaoAFg/TLM05lZ6suPSMRxzqEZIZCkV2reDaJNBC2z3
	BtMbcDAueVcdvDTnxEDD0zefGb6qZjm31d3idyo3L7YMIPLrPNTMp1KvTbJ47IP2oU99
	wXslKruuevzBk6+wNzhsmFHy11Z5LHud+Pc86Hb6XxPIAxIp1GLXqIa0nl4C1PbAZvlj
	1lDw==
X-Gm-Message-State: AE9vXwMYxLunKijgJEAnmjm9z6Kgg1n7MmcXhxA3ApIuOCtRERu5273xn7htwJovPxnjbQ==
X-Received: by 10.55.96.7 with SMTP id u7mr5265009qkb.143.1472062083469;
	Wed, 24 Aug 2016 11:08:03 -0700 (PDT)
Received: from thuvia.localdomain (pool-71-171-12-218.nwrknj.east.verizon.net.
	[71.171.12.218])
	by smtp.gmail.com with ESMTPSA id y4sm5282645qtb.33.2016.08.24.11.08.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 24 Aug 2016 11:08:02 -0700 (PDT)
Sender: Philip Balister <philip.balister@gmail.com>
From: Philip Balister <philip@balister.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 24 Aug 2016 14:07:55 -0400
Message-Id: <1472062075-18352-1-git-send-email-philip@balister.org>
X-Mailer: git-send-email 2.5.5
Subject: [meta-oe][PATCH] qwt: Use ${libdir} to install libraries.
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
X-List-Received-Date: Wed, 24 Aug 2016 18:08:05 -0000

This lets qwt build and package for systems that use lib64.

Signed-off-by: Philip Balister <philip@balister.org>
---
 meta-oe/recipes-qt/qwt/qwt.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-qt/qwt/qwt.inc b/meta-oe/recipes-qt/qwt/qwt.inc
index d3c4ed1..e1b260c 100644
--- a/meta-oe/recipes-qt/qwt/qwt.inc
+++ b/meta-oe/recipes-qt/qwt/qwt.inc
@@ -16,6 +16,7 @@ do_configure_prepend() {
     sed -i -e 's:qtAddLibrary(qwt:qtAddLibrary(qwt)${QT_LIBINFIX}:g' *.prf
     sed -e 's/# QWT_CONFIG     += QwtExamples/QWT_CONFIG     += QwtExamples/g' -i qwtconfig.pri
     sed -i -e 's:/usr/local/qwt-$$QWT_VERSION:${D}${prefix}:g' ${S}/*.pri
+    sed -i -e 's:$${QWT_INSTALL_PREFIX}/lib:${D}${libdir}:g' ${S}/*.pri
 }
 
 do_install() {
-- 
2.5.5


