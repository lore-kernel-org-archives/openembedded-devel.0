Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Yanjun.Zhu@WINDRIVER.COM>) id 1TZKwV-0000tI-HZ
	for openembedded-devel@lists.openembedded.org;
	Fri, 16 Nov 2012 13:22:45 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qAG8rB8E022261
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Nov 2012 00:54:12 -0800 (PST)
Received: from localhost.localdomain (128.224.153.31) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Fri, 16 Nov 2012 00:53:46 -0800
From: "yanjun.zhu" <yanjun.zhu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 16 Nov 2012 16:53:42 +0800
Message-ID: <1353056022-29560-1-git-send-email-yanjun.zhu@windriver.com>
X-Mailer: git-send-email 1.6.3.1
In-Reply-To: <yes>
References: <yes>
MIME-Version: 1.0
Subject: [PATCH] python: fix for Security Advisory - python - CVE-2012-2135
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 16 Nov 2012 12:22:46 -0000
Content-Type: text/plain

The utf-16 decoder in Python 3.1 through 3.3 does not update the
aligned_end variable after calling the unicode_decode_call_errorhandler
function, which allows remote attackers to obtain sensitive information
(process memory) or cause a denial of service (memory corruption and crash)
via unspecified vectors.

http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2012-2135

Signed-off-by: yanjun.zhu <yanjun.zhu@windriver.com>
---
 .../python/python/python-2.7.2-CVE-2012-2135.patch |   12 ++++++++++++
 recipes-devtools/python/python_2.7.2.bbappend      |    1 +
 2 files changed, 13 insertions(+), 0 deletions(-)
 create mode 100644 recipes-devtools/python/python/python-2.7.2-CVE-2012-2135.patch

diff --git a/recipes-devtools/python/python/python-2.7.2-CVE-2012-2135.patch b/recipes-devtools/python/python/python-2.7.2-CVE-2012-2135.patch
new file mode 100644
index 0000000..b913097
--- /dev/null
+++ b/recipes-devtools/python/python/python-2.7.2-CVE-2012-2135.patch
@@ -0,0 +1,12 @@
+diff -urpN a/Objects/unicodeobject.c b/Objects/unicodeobject.c
+--- a/Objects/unicodeobject.c	2012-11-12 16:25:33.000000000 +0800
++++ b/Objects/unicodeobject.c	2012-11-12 16:26:22.000000000 +0800
+@@ -2568,7 +2568,7 @@ PyUnicode_DecodeUTF16Stateful(const char
+         }
+ 
+         /* UTF-16 code pair: */
+-        if (q >= e) {
++        if (e - q < 2) {
+             errmsg = "unexpected end of data";
+             startinpos = (((const char *)q)-2)-starts;
+             endinpos = ((const char *)e)-starts;
diff --git a/recipes-devtools/python/python_2.7.2.bbappend b/recipes-devtools/python/python_2.7.2.bbappend
index 87be410..64ada6c 100644
--- a/recipes-devtools/python/python_2.7.2.bbappend
+++ b/recipes-devtools/python/python_2.7.2.bbappend
@@ -5,5 +5,6 @@ SRC_URI += "\
     file://python-CVE-2010-3492.patch \
     file://python-2.7.2-CVE-2012-0845.patch \
     file://python-2.7.2-CVE-2012-1150.patch \
+    file://python-2.7.2-CVE-2012-2135.patch \
 "
 PRINC = "2"
-- 
1.6.3.1



