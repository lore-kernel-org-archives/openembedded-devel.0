Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Morgan.Little@windriver.com>) id 1SphX1-00074k-BO
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Jul 2012 17:11:47 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q6DCN0VQ017639
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jul 2012 05:23:00 -0700 (PDT)
Received: from localhost.localdomain (128.224.147.201) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Fri, 13 Jul 2012 05:23:00 -0700
From: Morgan Little <morgan.little@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 13 Jul 2012 08:22:41 -0400
Message-ID: <1342182175-6461-7-git-send-email-morgan.little@windriver.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1342182175-6461-1-git-send-email-morgan.little@windriver.com>
References: <1342182175-6461-1-git-send-email-morgan.little@windriver.com>
MIME-Version: 1.0
Subject: [OE-core] [PATCH 06/20] python-pygtk: Update for python-native changes
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
X-List-Received-Date: Fri, 13 Jul 2012 15:12:54 -0000
Content-Type: text/plain

Add pythonnative to the inherits list

Signed-off-by: Morgan Little <morgan.little@windriver.com>
---
 .../recipes-devtools/python/python-pygtk_2.17.0.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/python/python-pygtk_2.17.0.bb b/meta/recipes-devtools/python/python-pygtk_2.17.0.bb
index 603ec5b..06535f9 100644
--- a/meta/recipes-devtools/python/python-pygtk_2.17.0.bb
+++ b/meta/recipes-devtools/python/python-pygtk_2.17.0.bb
@@ -7,7 +7,7 @@ PROVIDES = "python-pygtk2"
 SRCNAME = "pygtk"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7"
-PR = "ml10"
+PR = "ml11"
 
 SRC_URI = "ftp://ftp.gnome.org/pub/gnome/sources/pygtk/2.17/${SRCNAME}-${PV}.tar.bz2 \
            file://fix-gtkunixprint.patch \
@@ -21,7 +21,7 @@ S = "${WORKDIR}/${SRCNAME}-${PV}"
 
 EXTRA_OECONF = "--disable-docs --with-python-includes=${STAGING_INCDIR}/../"
 
-inherit autotools pkgconfig distutils-base
+inherit autotools pkgconfig distutils-base pythonnative
 
 do_configure_prepend() {
 	install -m 0644 ${WORKDIR}/acinclude.m4 ${S}/
-- 
1.7.0.4



