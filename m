Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id F2FBD6025E
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  6 Oct 2019 19:14:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46mYFV1nQkz4q
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  6 Oct 2019 21:14:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1570389262;
	bh=N7Ph3UIU1uIsDhZ+iA4Y70pO0vQklNANu0NFtqOnauU=;
	h=From:To:Subject:Date:From;
	b=XeV6tDs0tABcJ7kTHZdQAa9wsGVG0jdb2PbBRsoucloRxXVSes+13Us3q1pt55L0C
	ipRTR0RLDbBfRTebeqw9X8PmSYYNMdjZFhegeLTr1EkOD2CHSkV65QqHLi2kb45sTh
	M+7ZXu+U4lzlRopK3uXgmRCpmh/GUta+WBVW6ceso3qPR0J97RVddHxkEAePKAHc3P
	qL7rwRIZQLdmg7VSfOCEjzYWhVp0NaUYbMDDebsvINIMEKz+2ox2bhW+Fk0Icmd7x1
	Ksdxiun1q4Ywk7DjBu9HOkYlvuzkrAjlHi8uD7syzgCo0dAKkmIQA1aLmPfG7buBUh
	4UMGpl27emfeL2Uzo1U4nY+ucTPQsQEykHJF26TS8aYuT7c90QrxDJPfDpJALPJhiL
	N1vlGjCgFlbONsi++enCNoPmK4VtI8qtTMPije1qnwrZg8oCwDJ7dtDnlX6ecI5BIX
	0IuTLF3G6u+C8ENpbDNdU9RPLaBUEj1K/sc0aYaxzS7FpqJLbz6twnSNqq4bG8++XI
	cIWDg7j/twOl0NkeI/V7h8M/QE+vT0HlzfLh6EORTf3BDtX8SPq0YGRDCGakL1uK2N
	OOUtMTsWKh0u+1Sq0FaoxeEawsngs/HCh6L3+dQoPYtMb3gmz5OHOC7gdQeIGsB6pI
	KjJ39z+yfTGI9DlhnTQjDIpQ=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  6 Oct 2019 22:14:21 +0300
Message-Id: <20191006191421.19247-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] xmlrpc-c: Remove the RDEPENDS on perl
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
X-List-Received-Date: Sun, 06 Oct 2019 19:14:24 -0000

The tools that use perl are no longer built.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.51.03.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.51.03.bb b/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.51.03.bb
index 524263760..6c31b6981 100644
--- a/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.51.03.bb
+++ b/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.51.03.bb
@@ -15,7 +15,6 @@ SRCREV = "343a3b98e54999d67edb644bcd395aa9784fb16e"
 S = "${WORKDIR}/git/stable"
 
 DEPENDS = "libxml2"
-RDEPENDS_${PN} = "perl"
 
 inherit autotools-brokensep binconfig pkgconfig
 
-- 
2.17.1


