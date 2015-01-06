Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f42.google.com (mail-pa0-f42.google.com
	[209.85.220.42])
	by mail.openembedded.org (Postfix) with ESMTP id 8EA87729BB
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Jan 2015 16:01:11 +0000 (UTC)
Received: by mail-pa0-f42.google.com with SMTP id et14so31364970pad.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Jan 2015 08:01:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=DKc68YPGIoZx/RWoCEA0aDwfEUTmUQtWm1WgYEjYavk=;
	b=FNhDorP5OZRTPKXLmVNnYA02M0fMoPrO6gu4spJey1SHcO5qpDFutJdX/RkhUj73aL
	+SO38hSvX9tDlqzFk9vLevzKDdEoGSzX3CO5JBkMoPIjqd34ogxIjojotwwlU5D/rTdp
	L6s/stbQ+sF4hX5o/17E0Nsr96l7lDwYIfCg7gp46EShZ7Lg+PQflv6bFV9hkk5mNA0q
	cu/Dd7xiM+OMrG/qRkqGdP5rugPplpDVB1jpdE+xw/U1colrgs+WhEx5AVyv7Amfyt6f
	+bTv5JyGjL05bgeWV48dZXkr/63yXCV602tvpgpJfWVbwqKYK6PcYtrMcL/bkmpUu5kX
	omaQ==
X-Received: by 10.70.49.77 with SMTP id s13mr159712379pdn.24.1420560071381;
	Tue, 06 Jan 2015 08:01:11 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by mx.google.com with ESMTPSA id a5sm35458262pat.24.2015.01.06.08.01.09
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 06 Jan 2015 08:01:10 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  6 Jan 2015 08:01:06 -0800
Message-Id: <1420560067-8617-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-oe][PATCH 1/2] log4c: fix expat rdepends issue
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
X-List-Received-Date: Tue, 06 Jan 2015 16:01:11 -0000

add --without-expat

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-support/log4c/log4c_1.2.4.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/log4c/log4c_1.2.4.bb b/meta-oe/recipes-support/log4c/log4c_1.2.4.bb
index 43e0746..0e58db7 100644
--- a/meta-oe/recipes-support/log4c/log4c_1.2.4.bb
+++ b/meta-oe/recipes-support/log4c/log4c_1.2.4.bb
@@ -12,5 +12,7 @@ S = "${WORKDIR}/${PN}-${PV}"
 
 EXTRA_OECONF = "--prefix=/usr"
 
-inherit autotools
+PACKAGECONFIG ??=""
+PACKAGECONFIG[expat] = ", --without-expat, expat, expat"
 
+inherit autotools
-- 
1.9.1


