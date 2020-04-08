Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web11.3958.1586311013873566454
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Apr 2020 18:56:54 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.72,357,1580745600"; 
   d="scan'208";a="88653195"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 08 Apr 2020 09:56:52 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 019FD49DF137
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Apr 2020 09:46:26 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 8 Apr 2020 09:56:48 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Wed, 8 Apr 2020 09:56:55 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] postfix: upgrade 3.4.7 -> 3.4.8
Date: Wed, 8 Apr 2020 02:04:05 -0700
Message-ID: <1586336650-19326-2-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1586336650-19326-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1586336650-19326-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 019FD49DF137.AADF6
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../postfix/{postfix_3.4.7.bb => postfix_3.4.8.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-daemons/postfix/{postfix_3.4.7.bb => postfix_3.4.8.bb} (84%)

diff --git a/meta-networking/recipes-daemons/postfix/postfix_3.4.7.bb b/meta-networking/recipes-daemons/postfix/postfix_3.4.8.bb
similarity index 84%
rename from meta-networking/recipes-daemons/postfix/postfix_3.4.7.bb
rename to meta-networking/recipes-daemons/postfix/postfix_3.4.8.bb
index 3699ee58d..5d7f8bc9f 100644
--- a/meta-networking/recipes-daemons/postfix/postfix_3.4.7.bb
+++ b/meta-networking/recipes-daemons/postfix/postfix_3.4.8.bb
@@ -15,7 +15,7 @@ SRC_URI += "ftp://ftp.porcupine.org/mirrors/postfix-release/official/postfix-${P
            file://0001-makedefs-add-lnsl-and-lresolv-to-SYSLIBS-by-default.patch \
            file://0001-Fixed-build-failure-with-glibc-2.30-due-to-dropped-R.patch \
            "
-SRC_URI[md5sum] = "b29ab85e8f6ef7fae132b004e777671b"
-SRC_URI[sha256sum] = "fe3253121d3ba8836a23774225518560b35e40497951ad5bec154afa8205f967"
+SRC_URI[md5sum] = "6944b946887077a28e3dcb375ff53701"
+SRC_URI[sha256sum] = "8d5d429737e0c64514028a82fc006cbb273d2cb98dc40eb1dbbfe102f29a8943"
 
 UPSTREAM_CHECK_REGEX = "postfix\-(?P<pver>3\.3(\.\d+)+).tar.gz"
-- 
2.17.1



