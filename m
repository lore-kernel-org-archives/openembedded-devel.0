Received: from mail-ee0-f44.google.com ([74.125.83.44])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <david.c.nystrom@gmail.com>) id 1Txekc-0007yz-BN
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Jan 2013 15:22:59 +0100
Received: by mail-ee0-f44.google.com with SMTP id l10so3542290eei.31
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Jan 2013 06:07:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=EgXFVnTOjuLTMgkFeuT/L+6FO6gfn7gPdKbwGdLsBos=;
	b=cCykPqyg06Lwgt1S/QMTelDhxrqJJuZN+K2v0QqWN7OPUgxrZLg6cBh4Q9F++j1RZG
	BbHsfiXpYILqZ9IvDN78Q+MKciWpvT6qJr8UrB2ng9n9CHCpbUGB2oR+RT/4w7KM9JDd
	nY0tcIicihot2b6UY0gc8XNiSTlrIJel740NCoxdNn8tLfIFEblskRfZExTpWT2J/ucQ
	h55Gf6QbvKgcleVzOo+lEO5oTIh3huuQmrfB58hCPTqyJtB3qye6cdD5FAyRaHGzwkYY
	qJazSLU6etOjxEnrzzxmslwHBJDAdV33cZGIesrUVxlQQ7Xd1BFl5NtVIB6BL5IYfw0W
	28IQ==
X-Received: by 10.14.223.131 with SMTP id v3mr16154896eep.28.1358863648386;
	Tue, 22 Jan 2013 06:07:28 -0800 (PST)
Received: from nysan (sestofw01.enea.se. [192.36.1.252])
	by mx.google.com with ESMTPS id q44sm27131856eep.5.2013.01.22.06.07.26
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 22 Jan 2013 06:07:27 -0800 (PST)
Received: by nysan (Postfix, from userid 1000)
	id 713E240075E; Tue, 22 Jan 2013 15:07:15 +0100 (CET)
From: david.c.nystrom@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Tue, 22 Jan 2013 15:07:13 +0100
Message-Id: <1358863633-32066-2-git-send-email-david.c.nystrom@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1358863633-32066-1-git-send-email-david.c.nystrom@gmail.com>
References: <1358863633-32066-1-git-send-email-david.c.nystrom@gmail.com>
MIME-Version: 1.0
Cc: =?UTF-8?q?David=20Nystr=C3=B6m?= <david.nystrom@enea.com>
Subject: [meta-oe][PATCHv2] meta-oe/recipes-devtools/python/python-twisted_10.2.0.bb
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
X-List-Received-Date: Tue, 22 Jan 2013 14:23:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: David Nyström <david.nystrom@enea.com>

Signed-off-by: David Nyström <david.nystrom@enea.com>
---
 .../python/python-twisted_10.2.0.bb                |    6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/python/python-twisted_10.2.0.bb b/meta-oe/recipes-devtools/python/python-twisted_10.2.0.bb
index 5215dd6..5320946 100644
--- a/meta-oe/recipes-devtools/python/python-twisted_10.2.0.bb
+++ b/meta-oe/recipes-devtools/python/python-twisted_10.2.0.bb
@@ -7,7 +7,7 @@ SECTION = "console/network"
 #twisted/topfiles/NEWS:655: - Relicensed: Now under the MIT license, rather than LGPL.
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c3159ad36d96a939fcd8f2c2c9b9d08a"
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "http://tmrc.mit.edu/mirror/twisted/Twisted/10.2/Twisted-${PV}.tar.bz2 "
 SRC_URI[md5sum] = "73da62c793269eade8121da336b01ba5"
@@ -62,7 +62,9 @@ FILES_${PN}-test = " \
 "
 
 FILES_${PN}-protocols = " \
-  ${libdir}/${PYTHON_DIR}/site-packages/twisted/protocols/ \
+  ${libdir}/${PYTHON_DIR}/site-packages/twisted/protocols/*.py* \
+  ${libdir}/${PYTHON_DIR}/site-packages/twisted/protocols/gps/ \
+  ${libdir}/${PYTHON_DIR}/site-packages/twisted/protocols/mice/ \
 "
 
 FILES_${PN}-zsh = " \
-- 
1.7.9.5



