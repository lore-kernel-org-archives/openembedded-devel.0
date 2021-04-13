Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web08.6737.1618307330228807491
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Apr 2021 02:48:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=41218 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lWFf0-0007BP-3F; Tue, 13 Apr 2021 12:48:44 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/4] python3-pandas: Upgrade 1.2.3 -> 1.2.4
Date: Tue, 13 Apr 2021 12:48:34 +0300
Message-Id: <20210413094835.20465-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210413094835.20465-1-leon.anavi@konsulko.com>
References: <20210413094835.20465-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.2.4:

- Fixed regression in DataFrame.sum() when min_count greater than
  the DataFrame shape was passed resulted in a ValueError
- Fixed regression in DataFrame.to_json() raising AttributeError
  when run on PyPy
- Fixed regression in (in)equality comparison of pd.NaT with a
  non-datetimelike numpy array returning a scalar instead of an
  array
- Fixed regression in DataFrame.where() not returning a copy in
  the case of an all True condition
- Fixed regression in DataFrame.replace() raising IndexError when
  regex was a multi-key dictionary
- Fixed regression in repr of floats in an object column not
  respecting float_format when printed in the console or outputted
  through DataFrame.to_string(), DataFrame.to_html(), and
  DataFrame.to_latex()
- Fixed regression in NumPy ufuncs such as np.add not passing
  through all arguments for DataFrame

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-pandas_1.2.3.bb => python3-pandas_1.2.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pandas_1.2.3.bb => python3-pandas_1.2.4.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-pandas_1.2.3.bb b/meta-python/recipes-devtools/python/python3-pandas_1.2.4.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-pandas_1.2.3.bb
rename to meta-python/recipes-devtools/python/python3-pandas_1.2.4.bb
index 8c36c21bb9..54fa910a98 100644
--- a/meta-python/recipes-devtools/python/python3-pandas_1.2.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pandas_1.2.4.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "http://pandas.pydata.org/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c2a8f987b2ce77c368c6b3e1b5b10774"
 
-SRC_URI[sha256sum] = "df6f10b85aef7a5bb25259ad651ad1cc1d6bb09000595cab47e718cbac250b1d"
+SRC_URI[sha256sum] = "649ecab692fade3cbfcf967ff936496b0cfba0af00a55dfaacd82bdda5cb2279"
 
 inherit pypi setuptools3
 
-- 
2.17.1

