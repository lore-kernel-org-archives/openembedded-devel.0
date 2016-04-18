Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qg0-f68.google.com (mail-qg0-f68.google.com
	[209.85.192.68])
	by mail.openembedded.org (Postfix) with ESMTP id 03512600B3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Apr 2016 19:07:57 +0000 (UTC)
Received: by mail-qg0-f68.google.com with SMTP id m8so6267818qgd.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Apr 2016 12:07:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:organization; bh=4nYkW8exfwEuwu3ksEEmzrZaXegj4AmAvFFCgh9mEZo=;
	b=vI41DveFmUpBCHpoMTpi/CA5HBM5zweqkuFXb1eLnf2v5UUSh3IfshBsh5sQoL6yXo
	30PfCN3twOJTAOZraztzCCZFyKOK0th+cU6GR6+7V90QaFIl2Q2tfyEqignTai75FG4J
	K8iwPOVPMoMRDNtg2tzSjseOHYMraM/KapusLlYafIdGFBd/3sKFrTeNltwvoWQD1/SI
	ABX/2LhubYHf6XLoA7JV5kMqx+uuJxBr3lB+1KtysG1v4uj/1eNXP4RYXugZxIQ/CMlX
	pJ/k69S/HE057yJNXtWOactraekf8I4Fq9Y06beHzD661/stNikKNghWd0mOD6lbehYi
	M4JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=4nYkW8exfwEuwu3ksEEmzrZaXegj4AmAvFFCgh9mEZo=;
	b=mjS3hHfnRmm/bqTuPHwaoPSWzTgqWGa5sSBlM7SoKYPJhXOdDSVtR23OLse43iNCSE
	QGR5rzXO/FPqo49tPEvtd0egbdKg/LFKDRuRRq8JeeAP4n46vKPdHy9QYzVf0QOVX8sj
	KtYwn5vApaiRlPmAWarXcZTXq8KQnlwHFjhiKigftticKyem3U/5R6pysEAv1EhAVEta
	fDchRZOqcuDByRG9A/VkzzHJAkqKdlkUIdL45n1FSiZsSIWMHMrgOA+Q5jbyC0Jq4SjA
	pdYgFN4VwDOhzE2zedMuDJ5xT6/0jGk9d8y5eYg8n3AiwRYMq4gex9DwpIeNgsU2GUnw
	5uRA==
X-Gm-Message-State: AOPr4FX+fnHNIYjYWPP9joQtn34THzZTMmVtsnB18HiWgq5joMJefqB2cmzbP5oFCVRasA==
X-Received: by 10.140.226.19 with SMTP id w19mr47949557qhb.55.1461006477757;
	Mon, 18 Apr 2016 12:07:57 -0700 (PDT)
Received: from monster.lab.ossystems.com.br ([187.23.154.250])
	by smtp.gmail.com with ESMTPSA id
	e14sm27047101qhc.17.2016.04.18.12.07.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 18 Apr 2016 12:07:56 -0700 (PDT)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 18 Apr 2016 16:07:18 -0300
Message-Id: <1461006439-16137-2-git-send-email-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1461006439-16137-1-git-send-email-fabio.berton@ossystems.com.br>
References: <1461006439-16137-1-git-send-email-fabio.berton@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Subject: [meta-python][PATCH 2/3] python-netaddr: Add recipe for version 0.7.18
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
X-List-Received-Date: Mon, 18 Apr 2016 19:07:57 -0000

A network address manipulation library for Python.

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 meta-python/recipes-devtools/python/python-netaddr_0.7.18.bb | 8 ++++++++
 1 file changed, 8 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-netaddr_0.7.18.bb

diff --git a/meta-python/recipes-devtools/python/python-netaddr_0.7.18.bb b/meta-python/recipes-devtools/python/python-netaddr_0.7.18.bb
new file mode 100644
index 0000000..6fdbf19
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-netaddr_0.7.18.bb
@@ -0,0 +1,8 @@
+SUMMARY = "A network address manipulation library for Python."
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b277425f87f3b06d25af45d8b96f9682"
+
+SRC_URI[md5sum] = "c65bb34f8bedfbbca0b316c490cd13a0"
+SRC_URI[sha256sum] = "a1f5c9fcf75ac2579b9995c843dade33009543c04f218ff7c007b3c81695bd19"
+
+inherit pypi setuptools
-- 
2.1.4


