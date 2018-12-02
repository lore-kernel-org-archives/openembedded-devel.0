Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0EBB76C11B
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  2 Dec 2018 10:08:18 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id v6so9165295wrr.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 02 Dec 2018 02:08:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=uakr7Eyao+qNToqIikq00Q0VPwcA+DmHqhA6F6WZFCc=;
	b=fZAfy2BWS1zyc01hq8MtIWzRYf6RD8GhR1JnLQC1s3CZsmA8cHoSJTKyAnKKv7+2jH
	AbyLWWXYxkNbv0oOtn1+KD9WD1a4Qj9VZE/Jvjt4y+yiKRrT4cKE835gaKXKf00MYzvE
	0Gha8DkyZX9+UDQTwjs17ZtZ3NCMWHjwUWNyDrjIQOBVkIAfnWGCeXW0MxVC98sMEK35
	xXuhMXQHII/vDel3IEZcUEHHLoEpf6bJN9Xac1/PqMgI2KlDKNkAg8rfKNqB8TXooiay
	mz7LBEsm8RjL1fx6cri0alNwZ+uoUXKjNgjUFCU2NQKl+c6XZ5+hsj9O0AxKkoj5FYcH
	zQMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=uakr7Eyao+qNToqIikq00Q0VPwcA+DmHqhA6F6WZFCc=;
	b=IpU+LSbyjsgBdRztfxuRR4zT44U6HysyORSTk+0hOJVspLQlkfj0ojk9wp8vtT1md6
	wLrbAyADZmGk+Or2QMGfcpESfDYQ91GMS/Q8rW6cUupBuqxvlL2kaMEx7RXilRT/rxjG
	NeP6phg1fUcRRybn2P+7/3xKRcaTP3GipvpoXJS6I29XsUaJtI5XG43xL9W9BnAG0ua1
	3TZvR+aXE7Rd9Ybezh5+YHNnD9XgqXm5hMpl0p16pN04Td1U3z9q6v4myv/1VRrbmkv4
	wWnrsC2R+QedYqYYb7cjvoYpxjdGYIkQAgZ14jq58hipOq3XtRC0ktaBJM9fRirsOBH8
	dt5g==
X-Gm-Message-State: AA+aEWbDLCxyMnGQWeUC4Fm8IcitQpURA/o2pGpt7Kcre874TC8mYisE
	BawJPIuqZJgsZyuyDaRud/FBOlm5
X-Google-Smtp-Source: AFSGD/WH6PwWc0H4YYrVX88mi+8DGrfNG68P+lcSJluIkowdmexlmcXH46P0mS0DAxuuutUkF0jj0Q==
X-Received: by 2002:adf:a78a:: with SMTP id j10mr10568317wrc.191.1543745299192;
	Sun, 02 Dec 2018 02:08:19 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	t76sm9686877wme.33.2018.12.02.02.08.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 02 Dec 2018 02:08:18 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  2 Dec 2018 11:08:11 +0100
Message-Id: <20181202100811.27327-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] packagegroup-meta-oe: drop ptest packages that do not exist
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
X-List-Received-Date: Sun, 02 Dec 2018 10:08:19 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 08b4bbfc4..2a23a6170 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -234,19 +234,15 @@ RDEPENDS_packagegroup-meta-oe-test ="\
 
 RDEPENDS_packagegroup-meta-oe-ptest = "\
     zeromq-ptest \
-    libxml-ptest \
-    soci-ptest \
     leveldb-ptest \
     psqlodbc-ptest \
     lua-ptest \
     protobuf-ptest \
-    libdbi-ptest \
     rsyslog-ptest \
     oprofile-ptest \
     libteam-ptest \
     uthash-ptest \
     mcelog-ptest \
-    openldap-ptest \
     libee-ptest \
     numactl-ptest \
     poco-ptest \
-- 
2.17.1


