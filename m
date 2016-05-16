Return-Path: <net147@gmail.com>
Received: from mail-pf0-f174.google.com (mail-pf0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id CEBD860125
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 May 2016 00:53:38 +0000 (UTC)
Received: by mail-pf0-f174.google.com with SMTP id y69so60865333pfb.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 May 2016 17:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=4riAsECu5KF9Bbbxx5fDDYbdIDCzySObHWTF6aNVeLw=;
	b=so2jatPANO8iPiVLGAa+bn8FrnMkubPQe7T2uWrvwHNd/CUoNEpONbgDxTaoVF7EAV
	H20AL0hs5+jI3VWl1kzQvkrK7imwR7iLVOQmXt/sDQPnsc6sx1K1UfoM2117AjkWCaMz
	J1j4cmUXi8FoKjDvfIEqZyAMKqAbOwI23iq3YxmJcBvnVY1JrSjBkPs0WuAgjnjcIDTW
	CRHLUUigEwdCbR7Rw7aE9P/Ez4tjw2okznT19UApoIiphmqwEECxxoNHvlE9BsU5nCqY
	3hnJK561U+SG3wNsM9Rki4kZDSmS3Xc6qwuXn+veqb+/6EqFfRr7YSz4tJLN9n9QfWcB
	t2SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=4riAsECu5KF9Bbbxx5fDDYbdIDCzySObHWTF6aNVeLw=;
	b=gP6X038sOQqSggYSZCLYB6dRc0xzKweOSOAThXmhmcdFu53SaGLXqo2gIrFj773lrc
	diInp6fKFbG/yztISZ6evuu3n0LECpr1eaLbCUuYNaFqxz2Ab0diVfRN6wHqga74Lct4
	aEnyqX1obIDdkmjh9bMln+jtWHmJCXPfGjgJAv7D02kqWs0Y8HPjAkOloHH7C3gb4bol
	4kcOAmumcJcAwPZpJC0gUOA3pXCESbVvq198DO1v3MTH6jfqZjAzYBNc6nY51WVCfodN
	Czaml76UdVTxXMEerD+X8zm+/NyKqYu8MnmlSpgnVV5PqKOEJoYweAkA4s05NQIEV1VF
	SevQ==
X-Gm-Message-State: AOPr4FWQQt5Dz3B/CTMzHBPRfk4I+r8Z5WHN/QPETiTXP/OPXZyrFaSoLW1NQ1VxdrNquA==
X-Received: by 10.98.28.84 with SMTP id c81mr41053849pfc.131.1463360019303;
	Sun, 15 May 2016 17:53:39 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by smtp.gmail.com with ESMTPSA id
	vg9sm42847120pab.35.2016.05.15.17.53.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 15 May 2016 17:53:38 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 May 2016 10:53:47 +1000
Message-Id: <1463360027-29381-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 2.8.0
Subject: [meta-qt5][PATCH] qtdatavis3d: add recipe
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
X-List-Received-Date: Mon, 16 May 2016 00:53:39 -0000

Qt Data Visualization module was added in Qt 5.7.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 recipes-qt/qt5/qtdatavis3d_git.bb | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 recipes-qt/qt5/qtdatavis3d_git.bb

diff --git a/recipes-qt/qt5/qtdatavis3d_git.bb b/recipes-qt/qt5/qtdatavis3d_git.bb
new file mode 100644
index 0000000..ccdd1b3
--- /dev/null
+++ b/recipes-qt/qt5/qtdatavis3d_git.bb
@@ -0,0 +1,11 @@
+require qt5.inc
+require qt5-git.inc
+
+LICENSE = "GPL-3.0"
+LIC_FILES_CHKSUM = " \
+    file://LICENSE.GPL3;md5=d32239bcb673463ab874e80d47fae504 \
+"
+
+DEPENDS += "qtbase qtdeclarative qtmultimedia qtxmlpatterns"
+
+SRCREV = "2f6074fde0ec050c77f881e0d2ce265fa93a0fcc"
-- 
2.8.0


