Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-vk0-f66.google.com (mail-vk0-f66.google.com
	[209.85.213.66])
	by mail.openembedded.org (Postfix) with ESMTP id 54E067198F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Nov 2016 15:38:21 +0000 (UTC)
Received: by mail-vk0-f66.google.com with SMTP id p9so11256175vkd.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Nov 2016 07:38:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:organization;
	bh=58NP1siQ2btC7Qfc8OdS1Jwj3fh+oikOd5+Fco0PeLw=;
	b=Du7HqwxJPBOOZbsVTAecOhgRHiP22dsDZAB3RvYgH+q2IEZVOgFEpKRXj+sTFP20V8
	GLd625sFgeENbZK5Wf5xCDMh85GDzyiFdWy/V5KeLQqlpjHrW/YUJg3Q2OUAjZY7sZRO
	Jfh5nMLWP9Q27XWmgLo/Hdsw9Qu81S7wD1VHUhU3jtyzaXz6z+EIyD+SIGs5yhWb54sq
	M5I5cfhbtq/ZtluFs0N7OLGS4YdwPMjIkAfzP0nUTHOhjqSYCFfOG1GGemYCV5rdVZRL
	b00XPHUwQuuGxaop//dyAg4XLY8aKNzG+1mHPN1zHkxeEmBFDdC6ypjeZbZFr1GHkwjE
	Nobg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=58NP1siQ2btC7Qfc8OdS1Jwj3fh+oikOd5+Fco0PeLw=;
	b=g++sl9gM67acw44jx6ht1AbsjSIpO3AgzC/CEMu7Tn8/89GI3anPWQ8tQ5oBu/UAsC
	RkgmDzGu3sgfLGn0udIsQ7QYf1yDROArgQZ5nKEGHaNQD1NRSgtwY6YATyvvBSnFaGf5
	DxbMOTJaqY/OXzVR6RBaKmS3GQ7efkJBWKy+9kki2pEZAtwxA7UPxgWjwqL/SMrBPaZf
	VxLgMLtalzeJKWIM2o3kF5l0tHfkne5KNyKX4SlUaCy1FISdYV9Q1ztTWrxm3l4ELb9k
	8Njo33DgU4uVNmcRdhIR4Fp/5ZmV0QhD0QYFtKMevkQcKpzng+zkrdFN9M7G1P+m5Hav
	Kqqg==
X-Gm-Message-State: ABUngvfy9SvV1YfoeLBbnRiuy8nDFsNVGvZPnQ1kYywdW1U8iHmfGKOQ+aB4GtYQnmF7MQ==
X-Received: by 10.31.95.210 with SMTP id t201mr3839775vkb.49.1478792302596;
	Thu, 10 Nov 2016 07:38:22 -0800 (PST)
Received: from monster.lab.ossystems.com.br ([187.23.155.148])
	by smtp.gmail.com with ESMTPSA id e34sm1189043uae.1.2016.11.10.07.38.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 10 Nov 2016 07:38:21 -0800 (PST)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 10 Nov 2016 13:37:56 -0200
Message-Id: <1478792276-17772-1-git-send-email-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
Organization: O.S. Systems Software LTDA.
Subject: [meta-python][PATCH] python-humanize, python3-humanize: Add recipe for version 0.5.1
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
X-List-Received-Date: Thu, 10 Nov 2016 15:38:24 -0000

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 meta-python/recipes-devtools/python/python-humanize.inc       | 10 ++++++++++
 meta-python/recipes-devtools/python/python-humanize_0.5.1.bb  |  2 ++
 meta-python/recipes-devtools/python/python3-humanize_0.5.1.bb |  2 ++
 3 files changed, 14 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-humanize.inc
 create mode 100644 meta-python/recipes-devtools/python/python-humanize_0.5.1.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-humanize_0.5.1.bb

diff --git a/meta-python/recipes-devtools/python/python-humanize.inc b/meta-python/recipes-devtools/python/python-humanize.inc
new file mode 100644
index 0000000..d9fac09
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-humanize.inc
@@ -0,0 +1,10 @@
+SUMMARY = "Python humanize utilities"
+HOMEPAGE = "http://github.com/jmoiron/humanize"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENCE;md5=d2eff82fc25dd07c919a02465884f02e"
+
+SRC_URI[md5sum] = "e8473d9dc1b220911cac2edd53b1d973"
+SRC_URI[sha256sum] = "a43f57115831ac7c70de098e6ac46ac13be00d69abbf60bdcac251344785bb19"
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python-humanize_0.5.1.bb b/meta-python/recipes-devtools/python/python-humanize_0.5.1.bb
new file mode 100644
index 0000000..5769309
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-humanize_0.5.1.bb
@@ -0,0 +1,2 @@
+inherit pypi setuptools
+require python-humanize.inc
diff --git a/meta-python/recipes-devtools/python/python3-humanize_0.5.1.bb b/meta-python/recipes-devtools/python/python3-humanize_0.5.1.bb
new file mode 100644
index 0000000..04464ac
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-humanize_0.5.1.bb
@@ -0,0 +1,2 @@
+inherit pypi setuptools3
+require python-humanize.inc
-- 
2.1.4


