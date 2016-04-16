Return-Path: <kergoth@gmail.com>
Received: from mail-pa0-f68.google.com (mail-pa0-f68.google.com
	[209.85.220.68])
	by mail.openembedded.org (Postfix) with ESMTP id 5696F60667
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Apr 2016 02:40:45 +0000 (UTC)
Received: by mail-pa0-f68.google.com with SMTP id zy2so11164514pac.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Apr 2016 19:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=ZmEKZwsrBuAvpzFS/fXXfsbQJOE9Cly6jJtr7jJIgzI=;
	b=WSOf7jlg1oT045MFcBnY6IKVWjVb0QaHjofV2oKYyoDL0T2+/VCpqtfnnzjmdaLlx+
	ubZqSR6zuzgZAGP2RP0WBR0fPA/c6x2glz2cB8DqAv9NXsrno7w626KmbTUnsKzZyayO
	A4WpxLvnZDjakA7V7ZBx4hxECef6swx+aNJPQszaQzXwrT7iJEHc6bVeSctPYhaCpxbV
	rIJagNlD2idlMqorPstSnv3mUWkhwONwSjAtUOrQ5AGDtrykuikklrHYgNuTJtBDfAoe
	QpV6KumdZu4x9/xWr9uMuAHOljx3eywlUbjqoOwT///g5J7XIfVfaJA6JrIC5ECL9R2N
	mseg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ZmEKZwsrBuAvpzFS/fXXfsbQJOE9Cly6jJtr7jJIgzI=;
	b=fgGPlP6VZ8xi9SB8apAbtaF4sEfXQpbJJa2PCz7WlJlBXp7feoW53lbO+S2h10jur/
	IIHTgud00fQTPlco7KDdnWFEI4XTvjnGEN4AuH8SU+l3x6OoKeBnBtx1tijw4xoz+3UW
	fVgEzxocteunyE6jEDfEl2/ozjnsPXrpJFj7CDMTsUxWdB6zNhAW9fD1x63pGJc0/T+2
	rB2VyGgyhbNlcVNjf56wDLwXbqQHRQvWR5wBuDOr1FT4tdJOV70xKOEnD/dMh+FhWxnW
	M+nRG2zjJkCWxRFpcztSVsE1I3tVL8g/kaFWfJRYAUdmOUW+b3gkokohNAcEtLtBltTa
	x4Lw==
X-Gm-Message-State: AOPr4FVL4fbkEHuoQR0cZRomVklrEMmsoZKL4BqfANM3xQNMUR/BDDoTn2a4XxdJwEQG3Q==
X-Received: by 10.66.63.98 with SMTP id f2mr34259382pas.123.1460774446249;
	Fri, 15 Apr 2016 19:40:46 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	h2sm67546842pfd.91.2016.04.15.19.40.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 15 Apr 2016 19:40:43 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 15 Apr 2016 19:40:39 -0700
Message-Id: <1460774441-27282-1-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 2.8.0
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [meta-networking][PATCH 1/3] ctdb: drop duplicated DESCRIPTION
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
X-List-Received-Date: Sat, 16 Apr 2016 02:40:47 -0000

From: Christopher Larson <chris_larson@mentor.com>

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta-networking/recipes-support/ctdb/ctdb_2.5.1.bb | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta-networking/recipes-support/ctdb/ctdb_2.5.1.bb b/meta-networking/recipes-support/ctdb/ctdb_2.5.1.bb
index d4c0f86..66c966d 100644
--- a/meta-networking/recipes-support/ctdb/ctdb_2.5.1.bb
+++ b/meta-networking/recipes-support/ctdb/ctdb_2.5.1.bb
@@ -2,10 +2,6 @@ DESCRIPTION = "CTDB is a cluster implementation of the TDB database \
 used by Samba and other projects to store temporary data. If an \
 application is already using TDB for temporary data it is very easy \
 to convert that application to be cluster aware and use CTDB instead."
-DESCRIPTION = "CTDB is a cluster implementation of the TDB database \
-used by Samba and other projects to store temporary data. If an \
-application is already using TDB for temporary data it is very easy \
-to convert that application to be cluster aware and use CTDB instead."
 HOMEPAGE = "https://ctdb.samba.org/"
 LICENSE = "GPL-2.0+ & LGPL-3.0+ & GPL-3.0+"
 
-- 
2.8.0


