Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web09.6007.1614863170344279109
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Mar 2021 05:06:10 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=34576 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lHng8-0000xG-Ru; Thu, 04 Mar 2021 15:06:09 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 5/5] python3-pandas: Upgrade 1.2.2 -> 1.2.3
Date: Thu,  4 Mar 2021 15:05:54 +0200
Message-Id: <20210304130554.32308-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210304130554.32308-1-leon.anavi@konsulko.com>
References: <20210304130554.32308-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.2.3:

- Fixed regression in to_excel() raising KeyError when giving
  duplicate columns with columns attribute
- Fixed regression in nullable integer unary ops propagating mask
  on assignment
- Fixed regression in DataFrame.__setitem__() not aligning
  DataFrame on right-hand side for boolean indexer
- Fixed regression in to_json() failing to use compression with
  URL-like paths that are internally opened in binary mode or with
  user-provided file objects that are opened in binary mode
- Fixed regression in Series.sort_index() and DataFrame.sort_index(),
  which exited with an ungraceful error when having kwarg
  ascending=None passed. Passing ascending=None is still considered
  invalid, and the improved error message suggests a proper usage
  (ascending must be a boolean or a list-like of boolean)
- Fixed regression in DataFrame.transform() and Series.transform()
  giving incorrect column labels when passed a dictionary with a
  mix of list and non-list values

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-pandas_1.2.2.bb => python3-pandas_1.2.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pandas_1.2.2.bb => python3-pandas_1.2.3.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-pandas_1.2.2.bb b/meta-python/recipes-devtools/python/python3-pandas_1.2.3.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-pandas_1.2.2.bb
rename to meta-python/recipes-devtools/python/python3-pandas_1.2.3.bb
index 7529237866..8c36c21bb9 100644
--- a/meta-python/recipes-devtools/python/python3-pandas_1.2.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pandas_1.2.3.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "http://pandas.pydata.org/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c2a8f987b2ce77c368c6b3e1b5b10774"
 
-SRC_URI[sha256sum] = "14ed84b463e9b84c8ff9308a79b04bf591ae3122a376ee0f62c68a1bd917a773"
+SRC_URI[sha256sum] = "df6f10b85aef7a5bb25259ad651ad1cc1d6bb09000595cab47e718cbac250b1d"
 
 inherit pypi setuptools3
 
-- 
2.17.1

