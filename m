Return-Path: <straka.derek@gmail.com>
Received: from mail-qg0-f65.google.com (mail-qg0-f65.google.com
	[209.85.192.65])
	by mail.openembedded.org (Postfix) with ESMTP id BB6046FEE0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Jan 2016 23:01:07 +0000 (UTC)
Received: by mail-qg0-f65.google.com with SMTP id b35so41673219qge.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Jan 2016 15:01:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=from:to:cc:subject:date:message-id;
	bh=klXdRKI3KqzPJYC9uIVnpex5EKf31rXRgl2z41zD+Fo=;
	b=h0ctyRr9SMQIlZ3fdg0rRSpWpk3grVzzH9lf9Ijm0kUVBp0x207KAx+oxAwNp+85Px
	EzTqfvyibZef81xeboM/yBac/6P4fBiAecdK8yT9jtXB5s7x/eNrc1l0bxgewXZgdk/H
	sxcFApI8ezpH+nioLJkD2jBZtEbNIKit8iUAtZqUcfYn2yqzTiYyvK5u1/qhH33+iE1X
	XuiPBe9g4hmD6rWRMLRwskIYTs62WjR1DtFO9w4Zbq9rOMLUWUlvwfQL+DiMSK1BaxVc
	D2fhbMS81LOreixAhufd0CfzRnwnoP7MApGVmCJDfu8GqTbHrU9N2YKNGtpr+C9you5e
	Wagg==
X-Received: by 10.140.101.130 with SMTP id u2mr171430284qge.71.1452553268027; 
	Mon, 11 Jan 2016 15:01:08 -0800 (PST)
Received: from lnx-desktop.minotaur.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168]) by smtp.gmail.com with ESMTPSA id
	e184sm55575154qkb.40.2016.01.11.15.01.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 11 Jan 2016 15:01:07 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 11 Jan 2016 18:00:59 -0500
Message-Id: <1452553260-4147-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH v2 1/2] python-jsonpatch: add recipe for 1.12
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 11 Jan 2016 23:01:08 -0000

---
 .../python/python-jsonpatch_1.12.bb                 | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-jsonpatch_1.12.bb

diff --git a/meta-python/recipes-devtools/python/python-jsonpatch_1.12.bb b/meta-python/recipes-devtools/python/python-jsonpatch_1.12.bb
new file mode 100644
index 0000000..504bb99
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-jsonpatch_1.12.bb
@@ -0,0 +1,21 @@
+SUMMARY  = "Appling JSON patches in Python 2.6+ and 3.x"
+HOMEPAGE = "https://github.com/stefankoegl/python-json-patch"
+SECTION = "devel/python"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=32b15c843b7a329130f4e266a281ebb3"
+
+SRCNAME = "jsonpatch"
+
+SRC_URI = " \
+    https://pypi.python.org/packages/source/j/${SRCNAME}/${SRCNAME}-${PV}.tar.gz \
+"
+
+inherit setuptools
+
+SRC_URI[md5sum] = "76ae3183db5f2a8f85dd7705e9b6f278"
+SRC_URI[sha256sum] = "2e1eb457f9c8dd5dae837ca93c0fe5bd2522c9d44b9b380fb1aab2ab4dec04b1"
+
+RDEPENDS_${PN} += "python-re python-json python-jsonpointer"
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
-- 
1.9.1


