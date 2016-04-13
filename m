Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qg0-f66.google.com (mail-qg0-f66.google.com
	[209.85.192.66])
	by mail.openembedded.org (Postfix) with ESMTP id C4A10601D4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Apr 2016 13:17:23 +0000 (UTC)
Received: by mail-qg0-f66.google.com with SMTP id f105so4541938qge.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Apr 2016 06:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:organization;
	bh=rv+TP87gNArr/dNvnUU+3VUXErR1OI7VvrADGpSjwmE=;
	b=t3X1LOmsA0RuC1i3yFDfQKOtIgHU3w7IVR/JuTf/d5W+pcS5qyO1WL1Oz9IvM2bwZc
	PS2eR7gCjdWvXN8A5HlvxLlzudLrWJDRL/NpKd46Z2dvkQJK1rv1pI+5npx6rcwPVGOy
	fZerEQ2al/phemfKsqQOzSYUreVPkhTaka8yPYbXYMKJHMe++MOeZdf9f0Z9K/amokyg
	qAR3Vm+GDHrxova1muGEr3v1TDGb+piq+3Os6+N13C4zWrlwDPNU/zX9W9wpbq0oMccB
	trJPQp8kNCV/oX0HdlXWcihplYaciFisxe///ZD9avzL5yi/zTRS0MWYl9YB2olgtZqS
	6RQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=rv+TP87gNArr/dNvnUU+3VUXErR1OI7VvrADGpSjwmE=;
	b=IOHHN4SLe32kJWxeG449MFSGbGi3KCS+ZtdZ1F/lLGDQEevX1e4WwomPUhMHXAB3Y/
	rJ5OtHucPzDD58pOIag8x45ehhZuqtpvZwjJrvAzKmHmddLBFNITyF/QbFSnGmWAz7GB
	Jpie00it8TNuVKLoO/PcE7oUg8WYyqzEKE/CtgU5p1GFZDUDRsQP9Z62aLf8eZ3F1sJK
	2uyKYjYvP8lKStcv2F8iquHFAzEVmbMN9bE//8WldvfWkNn7ug350iAZ7Wz2O2JVrDen
	1eMTm6uRgvbNJ5PN5MixlNyGnQm7bjGmNbnuwOnZKVSKKU2FijMl9vKmlM1FBlQSEkqy
	vVPw==
X-Gm-Message-State: AOPr4FX7uA7OWleeXsAhiyq9XUDiJ+GMhXe5NusJV2ixjryItmDGlEqcixP8SqEYbEwbVQ==
X-Received: by 10.140.173.133 with SMTP id t127mr11841783qht.23.1460553443853; 
	Wed, 13 Apr 2016 06:17:23 -0700 (PDT)
Received: from monster.lab.ossystems.com.br ([187.23.154.250])
	by smtp.gmail.com with ESMTPSA id
	s62sm9367206qhe.10.2016.04.13.06.17.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 13 Apr 2016 06:17:22 -0700 (PDT)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 13 Apr 2016 10:16:52 -0300
Message-Id: <1460553420-12533-1-git-send-email-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
Organization: O.S. Systems Software LTDA.
Subject: [meta-python][PATCH 1/9] python-bcrypt: Add recipe for version 2.0.0
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
X-List-Received-Date: Wed, 13 Apr 2016 13:17:23 -0000

It's a modern password hashing for your software and your servers.

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 .../recipes-devtools/python/python-bcrypt_2.0.0.bb        | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-bcrypt_2.0.0.bb

diff --git a/meta-python/recipes-devtools/python/python-bcrypt_2.0.0.bb b/meta-python/recipes-devtools/python/python-bcrypt_2.0.0.bb
new file mode 100644
index 0000000..3cbe33e
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-bcrypt_2.0.0.bb
@@ -0,0 +1,15 @@
+DESCRIPTION = "Modern password hashing for your software and your servers."
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=e19d0fe40c5ce4109e6bcbf4aab2a5bd"
+
+DEPENDS = "python-cffi-native"
+
+SRC_URI[md5sum] = "e7fb17be46904cdb2ae6a062859ee58c"
+SRC_URI[sha256sum] = "8b2d197ef220d10eb74625dde7af3b10daa973ae9a1eadd6366f763fad4387fa"
+
+inherit pypi setuptools
+
+RDEPENDS_${PN} = "\
+    python-cffi \
+    python-six \
+"
-- 
2.1.4


