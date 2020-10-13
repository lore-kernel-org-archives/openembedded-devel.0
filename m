Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.10024.1602589624027986209
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Oct 2020 04:47:04 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=60446 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kSIlf-00049L-SP; Tue, 13 Oct 2020 14:47:00 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/3] python3-sqlparse: Upgrade 0.3.1 -> 0.4.1
Date: Tue, 13 Oct 2020 14:46:52 +0300
Message-Id: <20201013114654.5610-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
X-OutGoing-Spam-Status: No, score=-0.2
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

Upgrade to release 0.4.1:

- Just removed a debug print statement
- Remove support for end-of-life Python 2.7 and 3.4. Python 3.5+
  is now required.
- Remaining strings that only consist of whitespaces are not
  treated as statements anymore. Code that ignored the last
  element from sqlparse.split() should be updated accordingly
  since that function now doesn't return an empty string as the
  last element in some cases.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...1-sqlparse-change-shebang-to-python3.patch | 90 +++++++++++++++----
 ...rse_0.3.1.bb => python3-sqlparse_0.4.1.bb} |  4 +-
 2 files changed, 77 insertions(+), 17 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-sqlparse_0.3.1.bb => python3-sqlparse_0.4.1.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-sqlparse/0001-sqlparse-change-shebang-to-python3.patch b/meta-python/recipes-devtools/python/python3-sqlparse/0001-sqlparse-change-shebang-to-python3.patch
index ad6c50ff77..94121340d5 100644
--- a/meta-python/recipes-devtools/python/python3-sqlparse/0001-sqlparse-change-shebang-to-python3.patch
+++ b/meta-python/recipes-devtools/python/python3-sqlparse/0001-sqlparse-change-shebang-to-python3.patch
@@ -1,4 +1,4 @@
-From 10c9d3341d64d697f678a64ae707f6bda21565bb Mon Sep 17 00:00:00 2001
+From 7fd00ab8c1b663052d57e735b6b956d5c92fbaed Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Mon, 9 Mar 2020 13:10:37 +0800
 Subject: [PATCH] sqlparse: change shebang to python3
@@ -10,42 +10,102 @@ we can only make this change after python2 is offcially
 dropped.
 
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
+Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
 ---
- setup.py             | 2 +-
- sqlparse/__main__.py | 2 +-
- sqlparse/cli.py      | 2 +-
- 3 files changed, 3 insertions(+), 3 deletions(-)
+ 0001-sqlparse-change-shebang-to-python3.patch | 51 +++++++++++++++++++
+ setup.py                                      |  2 +-
+ sqlparse/__main__.py                          |  2 +-
+ sqlparse/cli.py                               |  2 +-
+ 4 files changed, 54 insertions(+), 3 deletions(-)
+ create mode 100644 0001-sqlparse-change-shebang-to-python3.patch
 
+diff --git a/0001-sqlparse-change-shebang-to-python3.patch b/0001-sqlparse-change-shebang-to-python3.patch
+new file mode 100644
+index 0000000..ad6c50f
+--- /dev/null
++++ b/0001-sqlparse-change-shebang-to-python3.patch
+@@ -0,0 +1,51 @@
++From 10c9d3341d64d697f678a64ae707f6bda21565bb Mon Sep 17 00:00:00 2001
++From: Changqing Li <changqing.li@windriver.com>
++Date: Mon, 9 Mar 2020 13:10:37 +0800
++Subject: [PATCH] sqlparse: change shebang to python3
++
++Upstream-Status: Pending
++
++Don't send upstream since upstream still support python2,
++we can only make this change after python2 is offcially
++dropped.
++
++Signed-off-by: Changqing Li <changqing.li@windriver.com>
++---
++ setup.py             | 2 +-
++ sqlparse/__main__.py | 2 +-
++ sqlparse/cli.py      | 2 +-
++ 3 files changed, 3 insertions(+), 3 deletions(-)
++
++diff --git a/setup.py b/setup.py
++index 345d0ce..ce3abc3 100644
++--- a/setup.py
+++++ b/setup.py
++@@ -1,4 +1,4 @@
++-#!/usr/bin/env python
+++#!/usr/bin/env python3
++ # -*- coding: utf-8 -*-
++ #
++ # Copyright (C) 2009-2018 the sqlparse authors and contributors
++diff --git a/sqlparse/__main__.py b/sqlparse/__main__.py
++index 867d75d..dd0c074 100644
++--- a/sqlparse/__main__.py
+++++ b/sqlparse/__main__.py
++@@ -1,4 +1,4 @@
++-#!/usr/bin/env python
+++#!/usr/bin/env python3
++ # -*- coding: utf-8 -*-
++ #
++ # Copyright (C) 2009-2018 the sqlparse authors and contributors
++diff --git a/sqlparse/cli.py b/sqlparse/cli.py
++index 25555a5..8bf050a 100755
++--- a/sqlparse/cli.py
+++++ b/sqlparse/cli.py
++@@ -1,4 +1,4 @@
++-#!/usr/bin/env python
+++#!/usr/bin/env python3
++ # -*- coding: utf-8 -*-
++ #
++ # Copyright (C) 2009-2018 the sqlparse authors and contributors
++-- 
++2.7.4
++
 diff --git a/setup.py b/setup.py
-index 345d0ce..ce3abc3 100644
+index ede0aff..dc6a323 100644
 --- a/setup.py
 +++ b/setup.py
 @@ -1,4 +1,4 @@
 -#!/usr/bin/env python
 +#!/usr/bin/env python3
- # -*- coding: utf-8 -*-
  #
- # Copyright (C) 2009-2018 the sqlparse authors and contributors
+ # Copyright (C) 2009-2020 the sqlparse authors and contributors
+ # <see AUTHORS file>
 diff --git a/sqlparse/__main__.py b/sqlparse/__main__.py
-index 867d75d..dd0c074 100644
+index 2bf2513..6a3a115 100644
 --- a/sqlparse/__main__.py
 +++ b/sqlparse/__main__.py
 @@ -1,4 +1,4 @@
 -#!/usr/bin/env python
 +#!/usr/bin/env python3
- # -*- coding: utf-8 -*-
  #
- # Copyright (C) 2009-2018 the sqlparse authors and contributors
+ # Copyright (C) 2009-2020 the sqlparse authors and contributors
+ # <see AUTHORS file>
 diff --git a/sqlparse/cli.py b/sqlparse/cli.py
-index 25555a5..8bf050a 100755
+index 7a8aacb..9c727e8 100755
 --- a/sqlparse/cli.py
 +++ b/sqlparse/cli.py
 @@ -1,4 +1,4 @@
 -#!/usr/bin/env python
 +#!/usr/bin/env python3
- # -*- coding: utf-8 -*-
  #
- # Copyright (C) 2009-2018 the sqlparse authors and contributors
+ # Copyright (C) 2009-2020 the sqlparse authors and contributors
+ # <see AUTHORS file>
 -- 
-2.7.4
+2.17.1
 
diff --git a/meta-python/recipes-devtools/python/python3-sqlparse_0.3.1.bb b/meta-python/recipes-devtools/python/python3-sqlparse_0.4.1.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-sqlparse_0.3.1.bb
rename to meta-python/recipes-devtools/python/python3-sqlparse_0.4.1.bb
index 1aef28be03..c8a64c1095 100644
--- a/meta-python/recipes-devtools/python/python3-sqlparse_0.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-sqlparse_0.4.1.bb
@@ -8,8 +8,8 @@ SRC_URI += "file://0001-sqlparse-change-shebang-to-python3.patch \
             file://run-ptest \
 	    "
 
-SRC_URI[md5sum] = "423047887a3590b04dd18f8caf843a2f"
-SRC_URI[sha256sum] = "e162203737712307dfe78860cc56c8da8a852ab2ee33750e33aeadf38d12c548"
+SRC_URI[md5sum] = "eebbc6b5f1033054873033e54b0c1266"
+SRC_URI[sha256sum] = "0f91fd2e829c44362cbcfab3e9ae12e22badaa8a29ad5ff599f9ec109f0454e8"
 
 export BUILD_SYS
 export HOST_SYS
-- 
2.17.1

