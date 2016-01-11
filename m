Return-Path: <straka.derek@gmail.com>
Received: from mail-qg0-f67.google.com (mail-qg0-f67.google.com
	[209.85.192.67])
	by mail.openembedded.org (Postfix) with ESMTP id D68BA731FC
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Jan 2016 23:01:09 +0000 (UTC)
Received: by mail-qg0-f67.google.com with SMTP id b35so41673319qge.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Jan 2016 15:01:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Kioe3DrHgX4FkwZOhitDTNu39VSIn4MLVSUqU9mR9to=;
	b=XPRm4kLf5maX7vvwJJioihsevMydBFFGHY3myTjIaNtKHOuK6HdJmoxde5/pFndyz9
	er2hwBxIQQ85i6vguKyaIvGZjKLJHkEctt9Pw8g9GUuFgFlZmC7yr1jfNqTYO4rvF/FA
	WSzFfYqLAgfXVYXTFGYdJRClT/081FjIxDPDSX3Iu7kpR1KcPK7NxJC1cjaCseum3P98
	WsT2W8oQ9t0LDQ/OxhEU72FSq9hSvvlaZBWDb/PtoX+rPNfQMlkxyfbmmykDjseLavnv
	IVWtd8AOpy/7C19TIqbS7Xcw9jls0kxHXwcydygM0XlOMm0X8wvPAX7qKQRFq6Z4BkZO
	fqAw==
X-Received: by 10.140.84.197 with SMTP id l63mr38065614qgd.80.1452553270400;
	Mon, 11 Jan 2016 15:01:10 -0800 (PST)
Received: from lnx-desktop.minotaur.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168]) by smtp.gmail.com with ESMTPSA id
	e184sm55575154qkb.40.2016.01.11.15.01.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 11 Jan 2016 15:01:09 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 11 Jan 2016 18:01:00 -0500
Message-Id: <1452553260-4147-2-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1452553260-4147-1-git-send-email-derek@asterius.io>
References: <1452553260-4147-1-git-send-email-derek@asterius.io>
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH v2 2/2] python-jsonpointer: add recipe for 1.10
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
X-List-Received-Date: Mon, 11 Jan 2016 23:01:10 -0000

---
 .../python/python-jsonpointer_1.10.bb                | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-jsonpointer_1.10.bb

diff --git a/meta-python/recipes-devtools/python/python-jsonpointer_1.10.bb b/meta-python/recipes-devtools/python/python-jsonpointer_1.10.bb
new file mode 100644
index 0000000..1af13a9
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-jsonpointer_1.10.bb
@@ -0,0 +1,20 @@
+DESCRIPTION = "Resolve JSON Pointers in Python"
+HOMEPAGE = "https://github.com/stefankoegl/python-json-pointer"
+SECTION = "devel/python"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=32b15c843b7a329130f4e266a281ebb3"
+
+SRCNAME = "jsonpointer"
+
+SRC_URI = " \
+    https://pypi.python.org/packages/source/j/${SRCNAME}/${SRCNAME}-${PV}.tar.gz \
+"
+
+inherit setuptools
+
+SRC_URI[md5sum] = "d68c0c6ad6889e9c94ec0feba719e45e"
+SRC_URI[sha256sum] = "9fa5dcac35eefd53e25d6cd4c310d963c9f0b897641772cd6e5e7b89df7ee0b1"
+
+RDEPENDS_${PN} += "python-re python-json"
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
-- 
1.9.1


