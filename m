Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6FC0F6DF41
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Dec 2013 10:34:09 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rB4AY98e013827
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 4 Dec 2013 02:34:09 -0800 (PST)
Received: from pek-cc-pb05l.wrs.com (128.224.157.65) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Wed, 4 Dec 2013 02:34:08 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 4 Dec 2013 18:33:55 +0800
Message-ID: <1386153235-16411-2-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 1.8.3
In-Reply-To: <1386153235-16411-1-git-send-email-jackie.huang@windriver.com>
References: <1386153235-16411-1-git-send-email-jackie.huang@windriver.com>
MIME-Version: 1.0
Cc: li.wang@windriver.com
Subject: [meta-networking][PATCH 2/2] inetutils: add --with-libreadline-prefix to avoid host contamination
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
X-List-Received-Date: Wed, 04 Dec 2013 10:34:09 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Fix the do_rootfs error:
| Computing transaction...error: Can't install inetutils-telnetd-1.9.1-r1.1@i686: no package provides libreadline.so.5

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta-networking/recipes-connectivity/inetutils/inetutils_1.9.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.1.bb b/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.1.bb
index 59a22aa..edff60a 100644
--- a/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.1.bb
+++ b/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.1.bb
@@ -38,6 +38,7 @@ EXTRA_OECONF = "--with-ncurses-include-dir=${STAGING_INCDIR} \
         --with-path-procnet-dev=/proc/net/dev \
         ${noipv6} \
         --with-path-login=/bin/login \
+        --with-libreadline-prefix=${STAGING_DIR_HOST}${prefix} \
 "
 
 do_configure_prepend () {
-- 
1.8.3


