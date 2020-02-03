Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
	[209.85.214.171])
	by mail.openembedded.org (Postfix) with ESMTP id 526A460C38
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  3 Feb 2020 19:36:32 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id t6so6249403plj.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Feb 2020 11:36:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Q5DvSDXRi74Bv/+LCyKCGzD9NQailx9o6MUoFOO+ESQ=;
	b=GmW3P/HbDHpTQ0TEUSVObD9ltncVwJQWPvSnC8R+/6PnkrqSZeb0SgJCHFZW2T2yjb
	4/+wBTAfpzIbiRRQCYCXk+a8Ad1kLGvHtd2gmfJtSCNa0srUtMW47xrDsub7vmWgMnMD
	bADYRhr3W6c1cUhIQG0uW/WQZPhvib+uQPQXt+DqEYIlQm2T8WMeHA2B4sL7ayUyapxl
	FPC04ylbhORIUpsFPIiAo+7kDHbXm7l8/Xb/DWgeEQR2qEGmOvCQLTP4YjqCf2uTgtid
	Tb4E1MllFjP22miq0GKA+fd+/LUkxgBh3Rja3k5E793gVl9WDS5v6ejEntj54WNe1rWI
	b+og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Q5DvSDXRi74Bv/+LCyKCGzD9NQailx9o6MUoFOO+ESQ=;
	b=SbXzgYx4pQ2dFG1k9jXBB03G8tp2u+uAVCvtxtz9VJqDOwhn3jEwP92UHKxPOH/Hdh
	2UjekDM9EK52Zbinqs2ZYDdlWK+9OF3ckvG3XtFb1vD8W7UppWkixqEq3zdBBLC0GwHy
	mc2Bq89n95EEahABANws2kyttPahuhFE8I9gdPmM8yDS3YOYMLLxaiZLt98OSUQAOcLU
	QAkFcJE0QVYZN7+lIXI7vgs+TzwZkd5w/ToStLNCSsOW0QlHjds5d7JSfC/jgzYnzfye
	QJbUpVnJljXeWX/chaqhpcT7xrHmfBrxYE4HVzypTx750Q4ZECPc2cs0nCXgMysZqC7s
	UJQw==
X-Gm-Message-State: APjAAAWcT/i63CrIW92wgjaBoz8bVkNlkMfghnvYPGb69HGz/9fEDktk
	UqKIS4Hmayf/OIN9KIIw8ULItZ0E9Qk=
X-Google-Smtp-Source: APXvYqwZaTDfcztQ6UmHWAzSnPOlian3eqkO2nVQ52tog3lHecTiYRCcJqQ7be9CXRUd5owfsFNdiw==
X-Received: by 2002:a17:90b:3cc:: with SMTP id
	go12mr673112pjb.89.1580758592667; 
	Mon, 03 Feb 2020 11:36:32 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::1852])
	by smtp.gmail.com with ESMTPSA id
	x23sm17772908pge.89.2020.02.03.11.36.31
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 03 Feb 2020 11:36:32 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  3 Feb 2020 11:36:35 -0800
Message-Id: <20200203193635.2253-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [meta-python2][PATCH] python-six: Update to 1.14.0
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
X-List-Received-Date: Mon, 03 Feb 2020 19:36:32 -0000
Content-Transfer-Encoding: 8bit

Have its own checksums so its not tightly coupled to versions from
oe-core

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes-devtools/python/python-six_1.13.0.bb | 2 --
 recipes-devtools/python/python-six_1.14.0.bb | 6 ++++++
 2 files changed, 6 insertions(+), 2 deletions(-)
 delete mode 100644 recipes-devtools/python/python-six_1.13.0.bb
 create mode 100644 recipes-devtools/python/python-six_1.14.0.bb

diff --git a/recipes-devtools/python/python-six_1.13.0.bb b/recipes-devtools/python/python-six_1.13.0.bb
deleted file mode 100644
index af26e83..0000000
--- a/recipes-devtools/python/python-six_1.13.0.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit pypi setuptools
-require recipes-devtools/python/python-six.inc
diff --git a/recipes-devtools/python/python-six_1.14.0.bb b/recipes-devtools/python/python-six_1.14.0.bb
new file mode 100644
index 0000000..779883a
--- /dev/null
+++ b/recipes-devtools/python/python-six_1.14.0.bb
@@ -0,0 +1,6 @@
+inherit pypi setuptools
+require recipes-devtools/python/python-six.inc
+
+SRC_URI[md5sum] = "21674588a57e649d1a6d977ec3122140"
+SRC_URI[sha256sum] = "236bdbdce46e6e6a3d61a337c0f8b763ca1e8717c03b369e87a7ec7ce1319c0a"
+
-- 
2.25.0


