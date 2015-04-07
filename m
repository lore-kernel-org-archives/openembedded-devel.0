Return-Path: <sven.ebenfeld@gmail.com>
Received: from mail-wg0-f50.google.com (mail-wg0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 69CAF65C9C
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Apr 2015 15:05:12 +0000 (UTC)
Received: by wgbdm7 with SMTP id dm7so59315302wgb.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Apr 2015 08:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=jg+TNsMR02P+HIH1zTWstXVP0avayeyaCsY2uijygAI=;
	b=0zFJtUe42gpbHJxF89dPi7NcHtl8GpJicwoZUVrj+wd+U+ihtpNrZ3Q8lDLqNxwlnM
	kUsoNPcAKlAtKtfRpR+4yJcWpgkf8K5O0+8B/0eoPWl0e3ZnaLKdRpRUoHe1BjV4A9HX
	epBs9g6PuXWHKVj1b1SQYYy/KKmrDuRqd7epvwXLBguWiyADNmTj482yps+Y0o3xLjge
	Gc4d6qT0x6V+Eb33kgcL4TNzHox747A4G5xj8eDHJFO3ZC88OLEN484Yc97KUdmIbNni
	gsjzKPc4eF8HrIjF2VhMv+VuuVBtw98bpUBIyDJjIunRSwUAF2sd7o1HocBhH+UX9dDE
	ZMQw==
X-Received: by 10.180.80.199 with SMTP id t7mr5618175wix.52.1428419113668;
	Tue, 07 Apr 2015 08:05:13 -0700 (PDT)
Received: from localhost.localdomain (pD9F9B505.dip0.t-ipconnect.de.
	[217.249.181.5]) by mx.google.com with ESMTPSA id
	dr7sm11370730wib.22.2015.04.07.08.05.12
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 07 Apr 2015 08:05:12 -0700 (PDT)
From: Sven Ebenfeld <sven.ebenfeld@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  7 Apr 2015 17:04:38 +0200
Message-Id: <1428419079-30420-7-git-send-email-sven.ebenfeld@gmail.com>
X-Mailer: git-send-email 1.8.1.rc3
In-Reply-To: <1428419079-30420-6-git-send-email-sven.ebenfeld@gmail.com>
References: <1428419079-30420-1-git-send-email-sven.ebenfeld@gmail.com>
	<1428419079-30420-2-git-send-email-sven.ebenfeld@gmail.com>
	<1428419079-30420-3-git-send-email-sven.ebenfeld@gmail.com>
	<1428419079-30420-4-git-send-email-sven.ebenfeld@gmail.com>
	<1428419079-30420-5-git-send-email-sven.ebenfeld@gmail.com>
	<1428419079-30420-6-git-send-email-sven.ebenfeld@gmail.com>
Subject: [meta-java][PATCH 6/7] openjdk-7: Add libxslt-native as dependency
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
X-List-Received-Date: Tue, 07 Apr 2015 15:05:14 -0000

Signed-off-by: Sven Ebenfeld <sven.ebenfeld@gmail.com>
---
 recipes-core/openjdk/openjdk-7-common.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-core/openjdk/openjdk-7-common.inc b/recipes-core/openjdk/openjdk-7-common.inc
index 29519fa..2bcca07 100644
--- a/recipes-core/openjdk/openjdk-7-common.inc
+++ b/recipes-core/openjdk/openjdk-7-common.inc
@@ -27,7 +27,7 @@ PROVIDES += "${JDKPN}"
 
 DEPENDS = " \
            icedtea7-native zip-native ant-native \
-           zlib \
+           zlib libxslt-native \
 	   jpeg libpng giflib \
            gtk+ glib-2.0 \
            cups fontconfig \
-- 
1.8.1.rc3


