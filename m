Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.13375.1614269168350538124
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Feb 2021 08:06:08 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=54856 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lFJ9N-0004JR-Dg; Thu, 25 Feb 2021 18:06:06 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/5] python3-cvxopt: Upgrade 1.2.5 -> 1.2.6
Date: Thu, 25 Feb 2021 18:05:42 +0200
Message-Id: <20210225160544.8994-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210225160544.8994-1-leon.anavi@konsulko.com>
References: <20210225160544.8994-1-leon.anavi@konsulko.com>
X-OutGoing-Spam-Status: No, score=-0.5
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - voyager.icnhost.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - konsulko.com
X-Get-Message-Sender-Via: voyager.icnhost.net: authenticated_id: leon@anavi.org
X-Authenticated-Sender: voyager.icnhost.net: leon@anavi.org
X-Source: 
X-Source-Args: 
X-Source-Dir: 

Upgrade to release 1.2.6:

- Change construction of sparse matrix to avoid limitations of
  linear indexing with long int
- Make create_indexlist declaration match definition in dense.c
- Update version, copyright, and documentation
- Fixes typos in examples, documentation

License-Update: Update year

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-cvxopt_1.2.5.bb => python3-cvxopt_1.2.6.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-cvxopt_1.2.5.bb => python3-cvxopt_1.2.6.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-cvxopt_1.2.5.bb b/meta-python/recipes-devtools/python/python3-cvxopt_1.2.6.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-cvxopt_1.2.5.bb
rename to meta-python/recipes-devtools/python/python3-cvxopt_1.2.6.bb
index ef06b56022..360df6a3ef 100644
--- a/meta-python/recipes-devtools/python/python3-cvxopt_1.2.5.bb
+++ b/meta-python/recipes-devtools/python/python3-cvxopt_1.2.6.bb
@@ -1,11 +1,11 @@
 SUMMARY = "Convex optimization package"
 HOMEPAGE = "http://cvxopt.org"
 LICENSE = "GPL-3.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=4905701d14049b3f8e4774c290aeee21"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=ba1a8a73d8ebea5c47a1173aaf476ddd"
 
 SRC_URI = "git://github.com/cvxopt/cvxopt;protocol=https"
 
-SRCREV = "5b59d87007bf6fdea464e14875543b35255b84b2"
+SRCREV = "60fdb838e0bb2d8f32ba51129552c83b55acd2a7"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1

