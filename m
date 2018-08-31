Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id DE459795D5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Aug 2018 14:42:02 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id z96-v6so11452805wrb.8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Aug 2018 07:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=VEJE1zDS29H79YJBltiGII95KRscvftajcxA0QVaH0k=;
	b=qvAL7DdaH4kMcF+CBpy++PWZR6GzIhULOM8++vm5s4jbqBllr/LC5sJhXLeCsgnL8m
	Sw1OJ8PJtu355Ny+hs5ZB1cqmaqcZgc4axCJmZNtQhojxojeZGx+7SEY91GrVdzyAElR
	5bqHY0je4M8snEfqthFyyE6h/knMVjGMZPBAgAFElVbmzoe2wqOfCTYpnAOwBh092joE
	HarmVkXsfNEXsi84uXJ2hSXA/HQCILv+/Hh7BuUW7FtVGysSnmJfLpAqAqn9eRMnW+/Z
	mEttTSEo6LmSbmU86y+MSrAjv8ME28mYscM4uOBu8SizogsRP4I1t6mmxgTBFvjN3pXg
	1mtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=VEJE1zDS29H79YJBltiGII95KRscvftajcxA0QVaH0k=;
	b=hca/bTdWdrrScEpJq69QYeon2C/lqnJQp5WZL3B9hXlYOshho/pxMNiusO8GmXuT6U
	No4niS2z3oK9wYN1poFGUi6hFwTbqmBeElpCgz2ZLu/Olo1jZQkQNFqH7vj9TIZXs3EX
	EvXWQKoUCsIo+Wv35CI6U+r9cGhjRxffk7Y7y9OSQX1gjm4MgVyKWX2joTEwK8X+lJcx
	xVXejN8vGENoqoJzaKrslI9PD4ep0SG2WY16PFRbJSX8Odh/X3MCkGogKZB+JrL0TwkA
	U0yjI1lvvLOZgkWoyWvKQz0Sc7GM9+uIEppdCsWMXWCj/jIdZmCPwZxqVMtQKrolnJ5y
	eWaw==
X-Gm-Message-State: APzg51Af70xH2RMZ2nBW0Sk+IF6goSSzziH6i7IRz2xweY1usyV69lmi
	gkTeHr+GanqvyD1AyKUsnTo6iKLcIyM=
X-Google-Smtp-Source: ANB0VdZv9WnSs6jleKVVI6yxcAJ6/7w5qbV6vuE59lkUuJTmoO6TtlwKAnD+5NZhQAzjgZy4FBQLOA==
X-Received: by 2002:a5d:6604:: with SMTP id n4-v6mr400525wru.281.1535726523410;
	Fri, 31 Aug 2018 07:42:03 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	k5-v6sm15190022wrm.96.2018.08.31.07.42.02
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 31 Aug 2018 07:42:02 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 31 Aug 2018 15:42:01 +0100
Message-Id: <20180831144201.5100-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] postgresql: use util-linux's uuid
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
X-List-Received-Date: Fri, 31 Aug 2018 14:42:03 -0000

Postgreqsql was configured to use ossp-uuid but ossp-uuid is dead and everyone
will be building util-linux anyway, so use the libuuid.so from there.

Confusing the option is called e2fs because the library originated in e2fsprogs.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta-oe/recipes-dbs/postgresql/postgresql.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-dbs/postgresql/postgresql.inc b/meta-oe/recipes-dbs/postgresql/postgresql.inc
index 1301060ee5..44a1b30fe0 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql.inc
+++ b/meta-oe/recipes-dbs/postgresql/postgresql.inc
@@ -59,7 +59,7 @@ PACKAGECONFIG ??= "${enable_pam} openssl python uuid libxml tcl nls libxml perl"
 PACKAGECONFIG[pam] = "--with-pam,--without-pam,libpam,"
 PACKAGECONFIG[openssl] = "--with-openssl,--without-openssl,openssl,"
 PACKAGECONFIG[python] = "--with-python,--without-python,python,python"
-PACKAGECONFIG[uuid] = "--with-ossp-uuid,--without-ossp-uuid,ossp-uuid,"
+PACKAGECONFIG[uuid] = "--with-uuid=e2fs,--without-uuid,util-linux,"
 PACKAGECONFIG[tcl] = "--with-tcl --with-tclconfig=${STAGING_BINDIR_CROSS},--without-tcl,tcl tcl-native,"
 PACKAGECONFIG[nls] = "--enable-nls,--disable-nls,,"
 PACKAGECONFIG[libxml] = "--with-libxml,--without-libxml,libxml2,libxml2"
-- 
2.11.0


