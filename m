Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.31548.1601280084156694515
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Sep 2020 01:01:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=40866 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kMo62-0001Xq-Ft; Mon, 28 Sep 2020 11:01:23 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/6] python3-beautifulsoup4: Upgrade 4.9.1 -> 4.9.2
Date: Mon, 28 Sep 2020 11:00:55 +0300
Message-Id: <20200928080059.18929-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200928080059.18929-1-leon.anavi@konsulko.com>
References: <20200928080059.18929-1-leon.anavi@konsulko.com>
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

- Fixed a bug that caused too many tags to be popped from the tag
  stack during tree building, when encountering a closing tag that
  had no matching opening tag.
- Fixed a bug that inconsistently moved elements over when passing
  a Tag, rather than a list, into Tag.extend().
- Specify the soupsieve dependency in a way that complies with
  PEP 508.
- Change the signatures for BeautifulSoup.insert_before and
  insert_after (which are not implemented) to match
  PageElement.insert_before and insert_after, quieting warnings in
  some IDEs.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...eautifulsoup4_4.9.1.bb => python3-beautifulsoup4_4.9.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-beautifulsoup4_4.9.1.bb => python3-beautifulsoup4_4.9.2.bb} (71%)

diff --git a/meta-python/recipes-devtools/python/python3-beautifulsoup4_4.9.1.bb b/meta-python/recipes-devtools/python/python3-beautifulsoup4_4.9.2.bb
similarity index 71%
rename from meta-python/recipes-devtools/python/python3-beautifulsoup4_4.9.1.bb
rename to meta-python/recipes-devtools/python/python3-beautifulsoup4_4.9.2.bb
index 910de12f8a..fb5fb1a6b8 100644
--- a/meta-python/recipes-devtools/python/python3-beautifulsoup4_4.9.1.bb
+++ b/meta-python/recipes-devtools/python/python3-beautifulsoup4_4.9.2.bb
@@ -3,8 +3,8 @@ HOMEPAGE = " https://www.crummy.com/software/BeautifulSoup/bs4"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING.txt;md5=f2d38d8a40bf73fd4b3d16ca2e5882d1"
 
-SRC_URI[md5sum] = "57502b5b34ccfd97b180260071f5799a"
-SRC_URI[sha256sum] = "73cc4d115b96f79c7d77c1c7f7a0a8d4c57860d1041df407dd1aae7f07a77fd7"
+SRC_URI[md5sum] = "5672f9b9bdfb0c6ab3ef074396bf59aa"
+SRC_URI[sha256sum] = "1edf5e39f3a5bc6e38b235b369128416c7239b34f692acccececb040233032a1"
 
 inherit pypi setuptools3
 
-- 
2.17.1

