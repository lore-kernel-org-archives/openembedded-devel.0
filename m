Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id 82D6160589
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Jul 2016 12:52:58 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id c52so5863818qte.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Jul 2016 05:52:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=QOKKXuWwxDo0wThUosYt3xwcpyE0JPcx4KiPN2rdr48=;
	b=WzMCuttO2aRrIvPbSro5ViP0cBsDy1+pwWgzs2BXwdWv7uXvBo54KwBJEYQw5ZL2t9
	SCnQgLiWw+hUfuQkEyg3+LA/MOwayT3jKirb3bQBpeH19qDJEhySS9cuNgj09HPTVB79
	QD0J69LeS8HTqf3aU0QVAAp2ITHldwvlqiDm/DseJY8EJOWartFpL0lybg9U47x52xZ0
	qVJB2wy+QB/C/chWo6dkk5VTTc63p5IOEeki6nUDpWP9qb4Lqpj2LGW1wrDmKds3KyeA
	DcdW3O6yBbLOaDo4Z0twf5W+FXKcB6C3J0bL+31wJ4yve8NiE7B6or7oQeI+Mp2KxtKM
	llew==
X-Gm-Message-State: ALyK8tIhMArfNa9uh9CBafyaXGTwl47Ddsm28Pn7JydfDWxLd7LkJ7Q8u9mEJbCKyOn1Qw==
X-Received: by 10.200.37.60 with SMTP id 57mr43551530qtm.82.1468759978589;
	Sun, 17 Jul 2016 05:52:58 -0700 (PDT)
Received: from lnx-desktop.minotaur.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168])
	by smtp.gmail.com with ESMTPSA id 55sm1346498qtp.32.2016.07.17.05.52.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 17 Jul 2016 05:52:58 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 17 Jul 2016 08:52:52 -0400
Message-Id: <1468759972-11095-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Subject: [meta-python][PATCH] python-flask-bootstrap: update to version 3.3.6.0 and fix RDEPENDS
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
X-List-Received-Date: Sun, 17 Jul 2016 12:52:58 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/python-flask-bootstrap_3.3.5.7.bb             | 10 ----------
 .../python/python-flask-bootstrap_3.3.6.0.bb             | 16 ++++++++++++++++
 2 files changed, 16 insertions(+), 10 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-flask-bootstrap_3.3.5.7.bb
 create mode 100644 meta-python/recipes-devtools/python/python-flask-bootstrap_3.3.6.0.bb

diff --git a/meta-python/recipes-devtools/python/python-flask-bootstrap_3.3.5.7.bb b/meta-python/recipes-devtools/python/python-flask-bootstrap_3.3.5.7.bb
deleted file mode 100644
index ecf89ae..0000000
--- a/meta-python/recipes-devtools/python/python-flask-bootstrap_3.3.5.7.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-DESCRIPTION = "An extension that includes Bootstrap in your project, without any boilerplate code."
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=f270fbb7d3ea88731bfc00916750c6bc"
-
-SRC_URI[md5sum] = "4471ad68dbf71a3c68e00bd0e1301a9f"
-SRC_URI[sha256sum] = "020bf9fcca6d69dce3b19bcb80852da929a2b1adde6cb4d47a4402f5ce54ef78"
-
-PYPI_PACKAGE = "Flask-Bootstrap"
-
-inherit pypi setuptools
diff --git a/meta-python/recipes-devtools/python/python-flask-bootstrap_3.3.6.0.bb b/meta-python/recipes-devtools/python/python-flask-bootstrap_3.3.6.0.bb
new file mode 100644
index 0000000..a115f23
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-flask-bootstrap_3.3.6.0.bb
@@ -0,0 +1,16 @@
+DESCRIPTION = "An extension that includes Bootstrap in your project, without any boilerplate code."
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=3452e378337a5cc2092d32a140178d5a"
+
+SRC_URI[md5sum] = "b8aedbe51f2bf511af955f2bc288cd8c"
+SRC_URI[sha256sum] = "3a7b71e22596a6d559965e059958960e0bb671adc131537a79edb491a8f31714"
+
+PYPI_PACKAGE = "Flask-Bootstrap"
+
+inherit pypi setuptools
+
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-dominate \
+    ${PYTHON_PN}-flask \
+    ${PYTHON_PN}-visitor \
+    "
-- 
1.9.1


