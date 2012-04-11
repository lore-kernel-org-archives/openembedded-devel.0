Received: from sanddollar.geekisp.com ([216.168.135.167])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philip@balister.org>) id 1SI6ws-0004eN-N3
	for openembedded-devel@openembedded.org; Thu, 12 Apr 2012 01:27:39 +0200
Received: (qmail 24854 invoked by uid 1003); 11 Apr 2012 23:11:39 -0000
Received: from unknown (HELO localhost.localdomain)
	(philip@balister.org@157.22.28.13)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	11 Apr 2012 23:11:39 -0000
From: philip@balister.org
To: openembedded-devel@openembedded.org
Date: Wed, 11 Apr 2012 16:11:28 -0700
Message-Id: <1334185891-25460-3-git-send-email-philip@balister.org>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <1334185891-25460-1-git-send-email-philip@balister.org>
References: <1334185891-25460-1-git-send-email-philip@balister.org>
Cc: Philip Balister <philip@opensdr.com>
Subject: [meta-oe 2/5] python-cheetah : Remove DEPENDS on python native packages.
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
X-List-Received-Date: Wed, 11 Apr 2012 23:27:39 -0000

From: Philip Balister <philip@opensdr.com>

The oe-core recipe no longer explicitly provides various -native
packages. THe recipe builds fine without them.

Built fine on distroless config.

Signed-off-by: Philip Balister <philip@opensdr.com>
---
 .../python/python-cheetah_2.4.4.bb                 |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/python/python-cheetah_2.4.4.bb b/meta-oe/recipes-devtools/python/python-cheetah_2.4.4.bb
index c07e969..8f2acea 100644
--- a/meta-oe/recipes-devtools/python/python-cheetah_2.4.4.bb
+++ b/meta-oe/recipes-devtools/python/python-cheetah_2.4.4.bb
@@ -12,8 +12,6 @@ S = "${WORKDIR}/${SRCNAME}-${PV}"
 
 inherit setuptools
 
-RDEPENDS_${PN} = "python-pickle python-pprint"
-
 NATIVE_INSTALL_WORKS = "1"
 BBCLASSEXTEND = "native"
 
-- 
1.7.7.6



