Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qa0-f50.google.com (mail-qa0-f50.google.com
	[209.85.216.50])
	by mail.openembedded.org (Postfix) with ESMTP id 39CF06E589
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Dec 2013 00:31:39 +0000 (UTC)
Received: by mail-qa0-f50.google.com with SMTP id i13so2094587qae.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Dec 2013 16:31:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:organization; bh=MPfUqIF3lA1cJOco6Y4xTjXZxZQ39p+3t1/jAQZit+M=;
	b=LYJrCxHqPq4PrCrYhs6L4P3appXKjaDq81zoA/H3ycJ/vLz9xEi4SULF2unIAVm9NF
	IvCdW5SvCc3X/LZMsq20Cs4xe/rP5x3OCw9PlLA4ns1PK8jNM/GeVLLX6FyfMtI1y8rJ
	V3LnzftUF5QOmz/iK35gdfnX7unNhUZAOFUROC8tDlK2vc1PEcOKEuZygjmkW83PZTjN
	6vdxw88PeyekwoQ6cuN2mJlvwdfVEUf6hVpmhNid9t9ZvEasSsn+ll2YXfVhD8MqbUH5
	uxMSs2Jlmo2ycyX2k4bsBolSktHJwWDUr3JZ1vYdfoQOPTXbO+8BWpINwTh+Ca2nVWJL
	bW/w==
X-Received: by 10.224.138.4 with SMTP id y4mr36998418qat.65.1387240298546;
	Mon, 16 Dec 2013 16:31:38 -0800 (PST)
Received: from nano.lab.ossystems.com.br ([187.90.230.254])
	by mx.google.com with ESMTPSA id hb2sm45371983qeb.6.2013.12.16.16.31.32
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Dec 2013 16:31:37 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by nano.lab.ossystems.com.br (Postfix, from userid 1000)
	id 44F6317643BB5; Mon, 16 Dec 2013 22:31:14 -0200 (BRST)
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Mon, 16 Dec 2013 22:31:01 -0200
Message-Id: <1387240261-7045-6-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.8.4.3
In-Reply-To: <1387240261-7045-1-git-send-email-otavio@ossystems.com.br>
References: <1387240261-7045-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe PATCH v2 6/6] geos: Fix -dev installation and upgrade path
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
X-List-Received-Date: Tue, 17 Dec 2013 00:31:39 -0000

Using 'lib_package' renames the binaries and we need a transitional
package to be used as upgrade path. This is done using an empty 'geos'
package which installs the new ones as runtime dependency.

This same package is used to satisfy -dev dependency of geos package
allowing for its inclusion into SDK.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
Changes in v2:
- new patch

 meta-oe/recipes-navigation/geos/geos.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-navigation/geos/geos.inc b/meta-oe/recipes-navigation/geos/geos.inc
index 5fae12e..2e308b4 100644
--- a/meta-oe/recipes-navigation/geos/geos.inc
+++ b/meta-oe/recipes-navigation/geos/geos.inc
@@ -16,3 +16,6 @@ FILES_${PN}lib += "${libdir}/libgeos-${PV}.so"
 
 DESCRIPTION_${PN}-c1 = "Geometry engine for Geographic Information Systems - C Library"
 FILES_${PN}-c1 += "${libdir}/libgeos_c.so.*"
+
+ALLOW_EMPTY_${PN} = "1"
+RDEPENDS_${PN} += "geoslib ${PN}-c1"
-- 
1.8.4.3


