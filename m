Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A39716ACB2
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  2 Jul 2014 06:57:58 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s626w044013495
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 1 Jul 2014 23:58:00 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 1 Jul 2014 23:57:59 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 1 Jul 2014 23:56:56 -0700
Message-ID: <1404284261-42377-30-git-send-email-liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1404284261-42377-1-git-send-email-liezhi.yang@windriver.com>
References: <1404284261-42377-1-git-send-email-liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [meta-oe] [PATCH 29/74] python-ldap: use BPN in SRC_URI
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
X-List-Received-Date: Wed, 02 Jul 2014 06:57:58 -0000
Content-Type: text/plain

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../recipes-devtools/python/python-ldap_2.3.9.bb   |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/python/python-ldap_2.3.9.bb b/meta-oe/recipes-devtools/python/python-ldap_2.3.9.bb
index dfe1522..bc4993b 100644
--- a/meta-oe/recipes-devtools/python/python-ldap_2.3.9.bb
+++ b/meta-oe/recipes-devtools/python/python-ldap_2.3.9.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENCE;md5=a41c82edffa04912007cae1d20cac555"
 HOMEPAGE = "http://www.python-ldap.org/" 
 DEPENDS = "python openldap" 
 
-SRC_URI = "http://pypi.python.org/packages/source/p/${PN}/${PN}-${PV}.tar.gz \ 
+SRC_URI = "http://pypi.python.org/packages/source/p/${BPN}/${BP}.tar.gz \
            file://setup.cfg.patch"
 SRC_URI[md5sum] = "a9f9f16338288d118a1ae6266c993247"
 SRC_URI[sha256sum] = "62f75b21c5ee744408c9d8b59878328b3bdf47899d30e8abf0c09b3ffb893ed4"
-- 
1.7.9.5


