Return-Path: <cynthia.ms.chiu@gmail.com>
Received: from mail-oi0-f68.google.com (mail-oi0-f68.google.com
	[209.85.218.68])
	by mail.openembedded.org (Postfix) with ESMTP id A57696067C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jul 2016 14:57:12 +0000 (UTC)
Received: by mail-oi0-f68.google.com with SMTP id c199so4510604oig.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jul 2016 07:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=lU/DPMByRvOOFLHyLzmqGCjfJIiJuJ1B8yce7RGQ244=;
	b=05+tWbPF7QSCS3hd7QV/UVOz/AheXQ9Hl4ymwlLiWBUzmy5WvGy/MrSsFwT6Y7mIBN
	4FL+rJr5V8qum9pHKpiP1QrCXSaD/I0a+MCDKQkc38tXkCPHukIeEighG8MZszAgq697
	hut01NjlvONj8SFUQ6+J+7K6ptDHJaFVfMsY1Qz815vClIhdnpKGO1OvTc3AtVUqKnh0
	8CbRV4vy8CKEqfKpm5Ukirun+cexaOQoGJyuWgRnVwtuxglHRnPlnRk5M5gE9FYccz0u
	7P1N/XqFNkppd2hjxwgggZTM1ffF6hw/5nnJjnVyhrkZqPeWgzM3EBuANxvEyN3iiQ6r
	tmAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=lU/DPMByRvOOFLHyLzmqGCjfJIiJuJ1B8yce7RGQ244=;
	b=OUXqwIsw7RY0lDQchDiqouJAhD5gg/MAznur/xWiz0Db3C8YOtOYrNGVP6rWeY7YUA
	qxQ9Az794R5y1X9fNUbdQNtA5jV27U53BAexy7I+xLfCfieqWlLxGSz+tWg4BPJ3/9qn
	S0Q3rzU8C/LoyhTuIM9Gsc3/+UOfky0beM/TSimO3hd0C17/0D9kDOsaSjCxLC8V7IjV
	lOk7SitvcRCYqQXxBPrjWCvsswwqo4ht++4dAoey0SknGcP3tIAJzCa0IQOfv6XR+yJ2
	MPhtFpCAevwtrF1PPHyxlFdm/yxCpvUXM9stAEySeBZAKdxZ4e2brSQbES9BmQDr2Kiz
	r9ew==
X-Gm-Message-State: ALyK8tIIKq2jiEX20WwMR+e5je1ESDdhWeqU+28Oh3gFOP0iw1+09EsQiXYWYgMDVGoigg==
X-Received: by 10.157.15.177 with SMTP id d46mr5766674otd.162.1468421832891;
	Wed, 13 Jul 2016 07:57:12 -0700 (PDT)
Received: from cynthia-VirtualBox.int.pason.com ([69.58.16.38])
	by smtp.gmail.com with ESMTPSA id o36sm137561oik.21.2016.07.13.07.57.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 13 Jul 2016 07:57:12 -0700 (PDT)
From: cynthiachiu <cynthia.ms.chiu@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 13 Jul 2016 08:57:07 -0600
Message-Id: <1468421827-11561-1-git-send-email-cynthia.ms.chiu@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-oe][PATCH] CANopenNode: recipe for building the CANopenSocket tools
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
X-List-Received-Date: Wed, 13 Jul 2016 14:57:13 -0000

Initial check-in for the CANopenSocket tools recipe.

Signed-off-by: cynthiachiu <cynthia.ms.chiu@gmail.com>
---
 .../canopennode/canopensocket_git.bb               | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 meta-oe/recipes-extended/canopennode/canopensocket_git.bb

diff --git a/meta-oe/recipes-extended/canopennode/canopensocket_git.bb b/meta-oe/recipes-extended/canopennode/canopensocket_git.bb
new file mode 100644
index 0000000..4506698
--- /dev/null
+++ b/meta-oe/recipes-extended/canopennode/canopensocket_git.bb
@@ -0,0 +1,31 @@
+SUMMARY = "Linux CANOpen tools"
+DESCRIPTION = "Linux CANOpen Protocol Stack Tools"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://gpl-2.0.txt;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+SRC_URI = "git://github.com/CANopenNode/CANopenSocket.git"
+SRCREV = "${AUTOREV}"
+
+S = "${WORKDIR}/git"
+
+do_compile_prepend() {
+    cd ${S}
+    git submodule init
+    git submodule update
+}
+
+do_compile() {
+    cd ${S}/canopend
+    make
+    cd ${S}/canopencomm
+    make
+    cd ${S}/canopencgi
+    make
+}
+
+do_install(){
+    install -d ${D}${bindir}
+    install -m 0755 ${S}/canopend/app/canopend ${D}${bindir}
+    install -m 0755 ${S}/canopencomm/canopencomm ${D}${bindir}
+    install -m 0755 ${S}/canopencgi/canopen.cgi ${D}${bindir}
+}
-- 
1.9.1


