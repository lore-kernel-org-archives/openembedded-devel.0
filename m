Return-Path: <philip.balister@gmail.com>
Received: from mail-qg0-f43.google.com (mail-qg0-f43.google.com
	[209.85.192.43])
	by mail.openembedded.org (Postfix) with ESMTP id D116875E7D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Aug 2015 17:30:44 +0000 (UTC)
Received: by qgeb6 with SMTP id b6so32252686qge.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Aug 2015 10:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=jDCi94puVdbHXVAkycSyLpiV0A4T1HkrqcQ8fOelmhE=;
	b=PfhOVnDMrrY9AjID01l1yB3QjxTYe76etH9Ph4z4IS6f6jn0c3y3PxHjNv7JWxbVZp
	YWt1JurA3YRfhSe7kJo1BgXG+6E9qrGWeGUIgBDnHoYG4fFap8cfORIodOjK2VTYSRxi
	jMr+FFJZF08gLcQyOnv1UizuVF/EZ8o42kfVR77+bBiNCueAUymnA/52olYw5EQE0Vnu
	K4mUedzH1HbPg4cfA9wxwAOwsuBdZUjrx/OEViM2KR/1MkqtJVgqjsOm7/j5uUcfUFJK
	D4FD1QNp+/u75mzk0JMdI+c6Mmm16C7KT/55IXpk4CQq+tNj5O7bpC31ipyQhd0odAyY
	7Mjw==
X-Received: by 10.140.147.69 with SMTP id 66mr8144150qht.57.1440091845039;
	Thu, 20 Aug 2015 10:30:45 -0700 (PDT)
Received: from thuvia.localdomain
	(pool-108-44-118-114.ronkva.east.verizon.net. [108.44.118.114])
	by smtp.gmail.com with ESMTPSA id
	108sm2653910qgz.17.2015.08.20.10.30.42
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 20 Aug 2015 10:30:43 -0700 (PDT)
Sender: Philip Balister <philip.balister@gmail.com>
From: Philip Balister <philip@balister.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 20 Aug 2015 13:30:39 -0400
Message-Id: <1440091839-17669-1-git-send-email-philip@balister.org>
X-Mailer: git-send-email 2.1.0
Subject: [meta-python][PATCH] python-pyzmq: Update to version 14.7.0.
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
X-List-Received-Date: Thu, 20 Aug 2015 17:30:53 -0000

Signed-off-by: Philip Balister <philip@balister.org>
---
 .../python/{python-pyzmq_14.5.0.bb => python-pyzmq_14.7.0.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pyzmq_14.5.0.bb => python-pyzmq_14.7.0.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python-pyzmq_14.5.0.bb b/meta-python/recipes-devtools/python/python-pyzmq_14.7.0.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python-pyzmq_14.5.0.bb
rename to meta-python/recipes-devtools/python/python-pyzmq_14.7.0.bb
index 626e29d..0d822f5 100644
--- a/meta-python/recipes-devtools/python/python-pyzmq_14.5.0.bb
+++ b/meta-python/recipes-devtools/python/python-pyzmq_14.7.0.bb
@@ -8,8 +8,8 @@ DEPENDS = "zeromq"
 SRC_URI = "https://pypi.python.org/packages/source/p/pyzmq/pyzmq-${PV}.tar.gz \
            file://club-rpath-out.patch \
 "
-SRC_URI[md5sum] = "8d3351a8ca2ca2a272a3f96bcb963e41"
-SRC_URI[sha256sum] = "5d6e045634456cf5496f50871fd3e3a5ede2b90433284dbfe985bb67c97f77bd"
+SRC_URI[md5sum] = "87e3abb33af5794db5ae85c667bbf324"
+SRC_URI[sha256sum] = "77994f80360488e7153e64e5959dc5471531d1648e3a4bff14a714d074a38cc2"
 
 S = "${WORKDIR}/pyzmq-${PV}"
 
-- 
2.1.0


