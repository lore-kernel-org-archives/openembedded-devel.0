Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id AA9C160589
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Jul 2016 12:51:42 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id q62so10036769qkf.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Jul 2016 05:51:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=KC+EseWMKYLL5Kd/UOGH+zH0CiL7MGJED6ZxovLy5n0=;
	b=WCrjVR+TEY9AVhGHZk/sWj9L8nzbA9RpdSMjjUjyJqODttUbnFJip++KIMGhdnHMg8
	gFY6U8rKJxGJ/YrC7FZtmBqiKLBT8v8T9lJeyNS18ZKbMt9jYN1n6SpYE/4F3uuglfLU
	gQW9Hm0nCFZ4fDghlL4NgVV+OOwUPjdkJVdmEKvS0ZSk+XHspQKUCrzrO/A0IPIw4X3d
	M0izgJGCDlpuKPcXYAqLkSOIKqPr3AunyHVwRzS1isONCvAF00h8RCPOVKH5pU1Bqu9j
	5Bby4aG8EA0cGVqG9B5lyGmY+7kxQUewaPwYOzI9b+RlxG7jfeNRpZL05lMqO9lyXoA6
	M3HQ==
X-Gm-Message-State: ALyK8tJBr63IglONRLgyZKzL+4tUmqRZEIEYGZ6kgFLGXmuUA5YCeXfT7WPEDgyaZDdl0w==
X-Received: by 10.55.140.1 with SMTP id o1mr38219683qkd.143.1468759902736;
	Sun, 17 Jul 2016 05:51:42 -0700 (PDT)
Received: from lnx-desktop.minotaur.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168]) by smtp.gmail.com with ESMTPSA id
	u57sm1340818qta.20.2016.07.17.05.51.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 17 Jul 2016 05:51:42 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 17 Jul 2016 08:51:35 -0400
Message-Id: <1468759895-10992-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Subject: [meta-python][PATCH] python-flask-bcrypt: update package RDEPENDS
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
X-List-Received-Date: Sun, 17 Jul 2016 12:51:44 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-flask-bcrypt_0.7.1.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python-flask-bcrypt_0.7.1.bb b/meta-python/recipes-devtools/python/python-flask-bcrypt_0.7.1.bb
index d08883d..f035862 100644
--- a/meta-python/recipes-devtools/python/python-flask-bcrypt_0.7.1.bb
+++ b/meta-python/recipes-devtools/python/python-flask-bcrypt_0.7.1.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Brcrypt hashing for Flask."
+DESCRIPTION = "Bcrypt hashing for Flask."
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0ee2ee5bee7fe96597770e92db5719a8"
 
@@ -9,4 +9,4 @@ PYPI_PACKAGE = "Flask-Bcrypt"
 
 inherit pypi setuptools
 
-RDEPENDS_${PN} = "python-bcrypt"
+RDEPENDS_${PN} += "${PYTHON_PN}-bcrypt ${PYTHON_PN}-flask"
-- 
1.9.1


