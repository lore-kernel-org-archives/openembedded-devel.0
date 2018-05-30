Return-Path: <f.forstmayr@gmail.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id CA2A86006A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 May 2018 06:21:04 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id t11-v6so45582855wmt.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 May 2018 23:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=6SCLhbz15cC8xbPn2IfEEZaNbuWzh0FJLXjg176ZDcc=;
	b=WUzEDa/ZIHSUbnjyg/NBX6kmhSkHoes5CVj9BJfLJr9v0RGgP9e0oihexqP2066IdP
	FG+HORk59hC6p9k6ok3G5tTSW5kN03j+XAaJ9w/eYDKvklhFj0oz9c7mhpypIW0mnXZF
	1Zc3J93CsrjB/K1PZvbuRjz5EjyJ3Zdy5W7Ma9S2xNyy8nbDixf3AYs4SJwcTMH1eHI/
	61QqhNSGXWO/Xk5CuJOBOmnTUBsTE5GgbWieLv565KzcNmfSCCQN4nHwTIoA/uTuD0s5
	RdV8oWIGuGCWV0DPo6ae2JUp5lAq6SQODZARg3BMAhA9kChq+dvjBv7HYXeal5iA7ffW
	ARTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=6SCLhbz15cC8xbPn2IfEEZaNbuWzh0FJLXjg176ZDcc=;
	b=ES2hMMao8q/SgGM0y7mYs8hUrvMONEy0njGzl8cNvaU245uy0BvsMVzsNTDaXhPpsg
	bLVaOUfjeZYfrc3k3NxDAD9NIWWOLIMa9BcZoQyhOZMqgZ6OrnyJ9jKOTkJmf3PKfw1/
	MlgM/rhj9MX2oRjkw2nDDDAgIwKCIepQII+8y5WccqHFqVwiaKnaGF9/2kAvwdVviS55
	w1KYSXx90KCDrNCCqTsWfPB2fK20xpv+70wiEd30qWCAiz4w6QWBtaKkY0HPRMyOLBmU
	p2/qs+DqdaHxfOe9MDhDq1vsq5t6gWJnmoq9EAcGoNsgtImEpri+m6XixYZCmMFCBJrg
	Ebmg==
X-Gm-Message-State: APt69E2QvbjruFaW1FhNoAf7ao48KXa4J6UmoRm5zEIxKIDaVXMhJO91
	Lsn9+L//9QTesnpZc4GGt5zUpg==
X-Google-Smtp-Source: ADUXVKKS7niRW+1vOlE3IGW1IoDPkbcEE5ovwj8sSk0jADK/w4G+vmUGSgHWqV2VC5MR29PsfFNuJg==
X-Received: by 2002:a1c:8ec1:: with SMTP id
	q184-v6mr463419wmd.104.1527661264753; 
	Tue, 29 May 2018 23:21:04 -0700 (PDT)
Received: from localhost.localdomain ([212.68.101.163])
	by smtp.gmail.com with ESMTPSA id
	x16-v6sm14972595wmc.42.2018.05.29.23.21.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 29 May 2018 23:21:03 -0700 (PDT)
From: Franz Forstmayr <f.forstmayr@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 May 2018 07:40:26 +0200
Message-Id: <20180530054028.24766-1-f.forstmayr@gmail.com>
X-Mailer: git-send-email 2.17.0
Cc: Franz Forstmayr <franz.forstmayr@rosenberger.com>
Subject: [meta-python][PATCH 1/3] Added python-periphery package
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
X-List-Received-Date: Wed, 30 May 2018 06:21:05 -0000

From: Franz Forstmayr <franz.forstmayr@rosenberger.com>

---
This patch adds the python periphery package. 
 meta-python/recipes-devtools/python/python-periphery.inc   | 7 +++++++
 .../recipes-devtools/python/python-periphery_1.1.1.bb      | 4 ++++
 .../recipes-devtools/python/python3-periphery_1.1.1.bb     | 4 ++++
 3 files changed, 15 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-periphery.inc
 create mode 100644 meta-python/recipes-devtools/python/python-periphery_1.1.1.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-periphery_1.1.1.bb

diff --git a/meta-python/recipes-devtools/python/python-periphery.inc b/meta-python/recipes-devtools/python/python-periphery.inc
new file mode 100644
index 000000000..539c3579c
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-periphery.inc
@@ -0,0 +1,7 @@
+DESCRIPTION = "A pure Python 2/3 library for peripheral I/O (GPIO, LED, PWM, SPI, I2C, MMIO, Serial) in Linux."
+HOMEPAGE = "http://pythonhosted.org/python-periphery/"
+LICENSE = "MIT"
+
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=063846af82b555d48822cf43dc6db6af"
+
+PYPI_PACKAGE = "python-periphery"
\ No newline at end of file
diff --git a/meta-python/recipes-devtools/python/python-periphery_1.1.1.bb b/meta-python/recipes-devtools/python/python-periphery_1.1.1.bb
new file mode 100644
index 000000000..6ae7fed81
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-periphery_1.1.1.bb
@@ -0,0 +1,4 @@
+inherit pypi setuptools
+require python-periphery.inc
+
+SRC_URI[sha256sum] = "fe8f351934edce72cd919b4eb070878ebff551db5e21aea61e0f446101f0a79f"
\ No newline at end of file
diff --git a/meta-python/recipes-devtools/python/python3-periphery_1.1.1.bb b/meta-python/recipes-devtools/python/python3-periphery_1.1.1.bb
new file mode 100644
index 000000000..ba9a95dbf
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-periphery_1.1.1.bb
@@ -0,0 +1,4 @@
+inherit pypi setuptools3
+require python-periphery.inc
+
+SRC_URI[sha256sum] = "fe8f351934edce72cd919b4eb070878ebff551db5e21aea61e0f446101f0a79f"
\ No newline at end of file
-- 
2.17.0


