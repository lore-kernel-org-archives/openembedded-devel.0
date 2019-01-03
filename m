Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
	[209.85.221.49])
	by mail.openembedded.org (Postfix) with ESMTP id 6A19B6BDE3
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Jan 2019 01:12:50 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id c14so32232307wrr.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 Jan 2019 17:12:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=KRGY9v3zt2tDXvhqRblNhcvP1yhOu5SGnzP8O/kZZjc=;
	b=f5b5mp9EUWRSErXE/qF4xNqh05VIKRbxRdNdWpIoaaDr2VXU6kaegCL4oyzuq1q1lu
	lHTJeVrrS91b998oe0iusK6vTC55bc8vwTUqsuspH8jv7pCRZImX9zYy7IxSTFVwdXlm
	H59h1nS6j9iZtGpFfOSa+GLBkQBz6ySYvo5oj66vsHmAqWVg2O1EnCmTRmgqBIIBK1EE
	D9O7g5uKMuaqvXIyWMb8+SCS0RIO72jc6S8vNpfkhglOTgZ9WEcOs0NlzJIYgCSngFE6
	Liu4Bi/+Vc8hrYm8JwavAgxH7Iv7mHlE2CU8Yw4rKk//44+YyhtqrgTHWF50TxkvKRdG
	SktQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=KRGY9v3zt2tDXvhqRblNhcvP1yhOu5SGnzP8O/kZZjc=;
	b=ecacFHPFuMQCIO6wqvVTUERNhGaEEfdYJoCx2M0+l+vLvA5LyqZfWenhAgQY7l3gqM
	vIcqBMwp8t4lhujaAe7lJ2Fge9aE6ZS7BG+Ha4mao4yBDd+x5Jqqe+2qalmUp1JxN/5R
	pVfw8QTXM755FyVCuPdY/TrGGLtTxYTJwI5kdW6HTygrKl4kMYjGzq2e5PmPHwkRyQlS
	F9NC+iW4V3mLt763lQ3+rcJxV4PaaeG4uEPMN0yAsyWDN4mBmOnTXn5cMkl60Ji8HGzT
	QCjvdEwqMix33JFYgHTprvO6g/abJqy2ymhqvgyylcHix0b1ZB2vdRcpAKZcJVAH054k
	3nng==
X-Gm-Message-State: AJcUukccaZfE/jhFx+O6UFFxhInvjBD07HkOTuVmf0YtDsAf0zWY3fmR
	qoc2jlDEhbRC8qisL5EmWemR6lT5
X-Google-Smtp-Source: ALg8bN7zCcLCA5opiNXE9oxWL/FWhfnHLpsaonfWBQujUyvIZ2W45xnKVcJVVu/fsUNt8EJFPSD+KQ==
X-Received: by 2002:adf:ff09:: with SMTP id k9mr27804655wrr.97.1546477970717; 
	Wed, 02 Jan 2019 17:12:50 -0800 (PST)
Received: from localhost.localdomain
	(p200300F07BC022001E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc0:2200:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id
	c12sm42400512wrs.82.2019.01.02.17.12.49
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 02 Jan 2019 17:12:49 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  3 Jan 2019 02:12:18 +0100
Message-Id: <20190103011222.7686-4-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190103011222.7686-1-schnitzeltony@gmail.com>
References: <20190103011222.7686-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 4/7] xfce4-taskmanager: upgrade 1.2.1 -> 1.2.2
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
X-List-Received-Date: Thu, 03 Jan 2019 01:12:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

xfce4-taskmanager moved to gtk3

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../xfce4-taskmanager/xfce4-taskmanager_1.2.1.bb       | 10 ----------
 .../xfce4-taskmanager/xfce4-taskmanager_1.2.2.bb       | 10 ++++++++++
 2 files changed, 10 insertions(+), 10 deletions(-)
 delete mode 100644 meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-taskmanager_1.2.1.bb
 create mode 100644 meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-taskmanager_1.2.2.bb

diff --git a/meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-taskmanager_1.2.1.bb b/meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-taskmanager_1.2.1.bb
deleted file mode 100644
index 8afea1d22..000000000
--- a/meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-taskmanager_1.2.1.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-SUMMARY = "Easy to use task manager"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
-
-inherit xfce-app
-
-DEPENDS += "gtk+ cairo libwnck libxmu xfce4-dev-tools-native exo-native"
-
-SRC_URI[md5sum] = "4a2d0b1e8001fb343139a97d57b56eaa"
-SRC_URI[sha256sum] = "22e523e2ee231713f40a48890d8cbae99320ac1173f7c68502f490318e1e0409"
diff --git a/meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-taskmanager_1.2.2.bb b/meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-taskmanager_1.2.2.bb
new file mode 100644
index 000000000..f3a59c96c
--- /dev/null
+++ b/meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-taskmanager_1.2.2.bb
@@ -0,0 +1,10 @@
+SUMMARY = "Easy to use task manager"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+
+inherit xfce-app
+
+DEPENDS += "gtk+3 cairo libwnck libxmu xfce4-dev-tools-native exo-native"
+
+SRC_URI[md5sum] = "6578625ffbe069b138533ff5e77df734"
+SRC_URI[sha256sum] = "e49a61c819a4fd9286a65ae61605984f327c8b26cf939289f644e656bfa20e13"
-- 
2.20.1


