Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qg0-f68.google.com (mail-qg0-f68.google.com
	[209.85.192.68])
	by mail.openembedded.org (Postfix) with ESMTP id 74C5870031
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Apr 2016 13:17:30 +0000 (UTC)
Received: by mail-qg0-f68.google.com with SMTP id f105so4542361qge.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Apr 2016 06:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:organization; bh=UGD8QmEcaqz9Y+xO2+rKwdwyvDuWeLPey/Z1R7mj3jM=;
	b=r9gjKxeUNae37Z2+/cQhLa2kV/5V/vCyr2A+sqDNERLGbaJi+FwUIiaa8Sj3s+Gb2V
	K48CKuMjpkiDclSG2exbFZ7flp0xLae4B1zAWxspqpLTfo/ipI10whxOkKTu5V3EdhO4
	dQ3hsUdhncXKwvyLgmLXl3WWTdRdtWTZQXdxN7HGqQnUHfJgsiZ3pmfQNTzam7hJpJn6
	Noe/+ZlIi0pWrCIi6b1clxmLP0wBc+XAJpRNQWoaSpZ+DigvNtuNcJXVWdVXmxAOSSN3
	UuN/Yq18GyH47PDyp3sGNBUIKD3FNNw8fq/rits8xOgg5vS84d8HPDPesdG6yvxY7w3b
	f6cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=UGD8QmEcaqz9Y+xO2+rKwdwyvDuWeLPey/Z1R7mj3jM=;
	b=bWcIVf0ftGHWx65MV51zON9hy0bxoclta9R0vc5j3Z+GEPH78HUdZNnqy7tITRPU+F
	PAQHXxVORdMW7W+nfRxinChX4ZdsIiFwMnBUAwVzVOciTl6kZYGqNsUOUSB9usdlpBdi
	s9mD/I3lsZJSCbFW8tThJOdk3pgxZcFs6oWNDnJThALK+U65InV2mMcb1VqiwRuRgUE8
	0WdQEcz6UwFiyC2YOZESzslSjRQashub1tLXIDEkzpVKkkx6BjJmzN7zeABLOgwFN391
	x8rf4wxrWA9YzK9JP319VgQ3TYcYC1s5jDKxsAQ0ncfx0QF1gCvAuO0R5hyZV1SgqiC/
	fpFQ==
X-Gm-Message-State: AOPr4FWcg/O/sG4QcENYHmWgGNG5sZJebxYGDxZca9M3A3jYnqnikw7juC/uAVu642Gr/Q==
X-Received: by 10.140.169.132 with SMTP id p126mr11707493qhp.71.1460553451250; 
	Wed, 13 Apr 2016 06:17:31 -0700 (PDT)
Received: from monster.lab.ossystems.com.br ([187.23.154.250])
	by smtp.gmail.com with ESMTPSA id
	s62sm9367206qhe.10.2016.04.13.06.17.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 13 Apr 2016 06:17:30 -0700 (PDT)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 13 Apr 2016 10:16:55 -0300
Message-Id: <1460553420-12533-4-git-send-email-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1460553420-12533-1-git-send-email-fabio.berton@ossystems.com.br>
References: <1460553420-12533-1-git-send-email-fabio.berton@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Subject: [meta-python][PATCH 4/9] python-flask-bootstrap: Add recipe for version 3.3.5.7
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
X-List-Received-Date: Wed, 13 Apr 2016 13:17:32 -0000

It's an extension that includes Bootstrap in your project, without any
boilerplate code.

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 .../recipes-devtools/python/python-flask-bootstrap_3.3.5.7.bb  | 10 ++++++++++
 1 file changed, 10 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-flask-bootstrap_3.3.5.7.bb

diff --git a/meta-python/recipes-devtools/python/python-flask-bootstrap_3.3.5.7.bb b/meta-python/recipes-devtools/python/python-flask-bootstrap_3.3.5.7.bb
new file mode 100644
index 0000000..ecf89ae
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-flask-bootstrap_3.3.5.7.bb
@@ -0,0 +1,10 @@
+DESCRIPTION = "An extension that includes Bootstrap in your project, without any boilerplate code."
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=f270fbb7d3ea88731bfc00916750c6bc"
+
+SRC_URI[md5sum] = "4471ad68dbf71a3c68e00bd0e1301a9f"
+SRC_URI[sha256sum] = "020bf9fcca6d69dce3b19bcb80852da929a2b1adde6cb4d47a4402f5ce54ef78"
+
+PYPI_PACKAGE = "Flask-Bootstrap"
+
+inherit pypi setuptools
-- 
2.1.4


