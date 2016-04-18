Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qg0-f68.google.com (mail-qg0-f68.google.com
	[209.85.192.68])
	by mail.openembedded.org (Postfix) with ESMTP id 54203600B3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Apr 2016 19:07:54 +0000 (UTC)
Received: by mail-qg0-f68.google.com with SMTP id f74so208951qge.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Apr 2016 12:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:organization;
	bh=Z1+Do9zu8WVMaQvY4SlSS64SwhHrKwkouhFsECfAi2U=;
	b=d7xgcM9j5GRou1wjLTtQAbS9r7ySnbK4P2F7p5plCzrZPKT5kxyq0XopW31xowxaso
	2h9lgPU2ArhiT6Yfa4tto01jx5+jh46te09RIKV4Io1UAZn6/ioJdWp5OkqsXWx6ap67
	FbIdz6Igrn/CGRW5qnZgjV3MRWBwrLUabwaUm12uQs5UMf1Sa5JFqjlxKSdUGFBjhWj2
	U4srcAvlJOxR1wFFRMHyZEYh1MfokQ1pmPwJeqcEyM44BKHcxD6qUY4sbWdUPPPkPELC
	FtwzU4ZhilFiv/WAKfAm7JYClYsKb1xyvHxYr41TC5tTdT/4w8JSBN+I7/fQdaCEhetD
	EyiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=Z1+Do9zu8WVMaQvY4SlSS64SwhHrKwkouhFsECfAi2U=;
	b=fQOYyC6xinNGYV9DWXSp8Pi3HYDU0jvsvZcZmbSpuENIZ2QiNDCGlmlfAu8rxekCd2
	qq1sKyW+DRjxsk0pCk3Q4iSNtZe05pKP0ggvMff/xFRqTGZ8R43bWalcjfuRoIj3zhw8
	qVvwV205MLwpAww3JuGGcSLMSJaVkYT4zS+Y6+r8wJ175Y2L2qQRo3B4WY5MxmAq5IlN
	TkCL1KO0wctrHJa81fByjCgTwG/BB6sRjXMpJbRMF+Gue1c2x6uKgGtnQR5MuHLiUxDi
	tq7Xl5Lbf1nl6fV2VOlQ2JUR0V7w/46sb1CBvI5u0SabdjIClRNx2GLZCNbmVlyTTSk6
	gj8A==
X-Gm-Message-State: AOPr4FXoiUxASG1QhOKZycAJn6gFfwLiWb4m/Kj+fNMw/R5svC5uon0Uc3+dZmzSQxNreg==
X-Received: by 10.140.23.139 with SMTP id 11mr18970934qgp.62.1461006475068;
	Mon, 18 Apr 2016 12:07:55 -0700 (PDT)
Received: from monster.lab.ossystems.com.br ([187.23.154.250])
	by smtp.gmail.com with ESMTPSA id
	e14sm27047101qhc.17.2016.04.18.12.07.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 18 Apr 2016 12:07:54 -0700 (PDT)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 18 Apr 2016 16:07:17 -0300
Message-Id: <1461006439-16137-1-git-send-email-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
Organization: O.S. Systems Software LTDA.
Subject: [meta-python][PATCH 1/3] python-dominate: Add recipe for version 2.2.0
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
X-List-Received-Date: Mon, 18 Apr 2016 19:07:56 -0000

Dominate is a Python library for creating and manipulating HTML
documents using an elegant DOM API.

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 meta-python/recipes-devtools/python/python-dominate_2.2.0.bb | 10 ++++++++++
 1 file changed, 10 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-dominate_2.2.0.bb

diff --git a/meta-python/recipes-devtools/python/python-dominate_2.2.0.bb b/meta-python/recipes-devtools/python/python-dominate_2.2.0.bb
new file mode 100644
index 0000000..1feaa7e
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-dominate_2.2.0.bb
@@ -0,0 +1,10 @@
+SUMMARY = "Dominate is a Python library for creating and manipulating HTML documents using an elegant DOM API."
+LICENSE = "LGPLv3"
+LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=a30b9a8d0a5585c482c6c5a6d54aaebc"
+
+SRC_URI[md5sum] = "14ee0361db7fbaed982220c09ef8e0b9"
+SRC_URI[sha256sum] = "5032559e0f0835419763b3d1d88ad31ea4fe40935712db86014f2a341c89fa3d"
+
+PYPI_PACKAGE_EXT = "zip"
+
+inherit pypi setuptools
-- 
2.1.4


