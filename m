Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
	[209.85.210.178])
	by mail.openembedded.org (Postfix) with ESMTP id 07D187FA0E
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  7 Dec 2019 23:45:38 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id h14so5266657pfe.10
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 Dec 2019 15:45:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=aPj9HZnkoUEp7i/5DX1+B7MSyJhpSlQn/Y6ptIlIAz0=;
	b=fTgQBGrywcwY4+023ELzYNWuXoPPbGOD4QdcpxCKIK3aYwHVcmcRxcWl4qaCPM13f0
	uaNCBNqDV5N6Ownl8UXqHRgZHVzc0HOC4xRUQPxqCJYEI8JtO3PiK9LW+KV+qZmwoyKl
	KBzeEZleKk3MNnKCJ2VjI+N9Yw5ihF/Moj8yyYTUwSAvF92Wki9SmQm2UHXQxd3Ztvad
	3TR/ff092/AG0PiCCY2TMPtR0hEHxmDXpJxc+z5D1tcbkr7oEitBSf6vwO8tAqx4lH7+
	wpz/CHKgwprEALPiGAmnDe7eT2BbeZUREhaYavrEjpkKS0vZ+lFBZoD4qKSkytYHkJBa
	5bTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=aPj9HZnkoUEp7i/5DX1+B7MSyJhpSlQn/Y6ptIlIAz0=;
	b=axIM4PZnTHoxBv64Dk9Ggohf1WCAcA3qL86hWgxWKEI6lxNRlg+PToNpSq6fkL2PSR
	Jj4MI3r8QTDjBEEjk3vwthjQDTpDG5XaYtyP5YdImuNlZTXblmdi5L4Lo9gUvjXAtmad
	FhtQj+ViNrKVQa2LTpkHvS6E/lXVpGUzaGACABA5te+6BGFRrTgltmq0f8HOTe1I1c6W
	+Qyj2WbOd+HsDe6YcQjgKSJYAA8ImZa8weYjoOugJjTxU5Yq9YfyOLXCcsVwdSZT6uF1
	OQlNouBbbBoucrHF4rgbay9Ml4sLv1TbsScTIE3Cc5y1UmNhxnnZ61jF+LYIpcngm4n9
	/dFg==
X-Gm-Message-State: APjAAAVYygxn4Ocm2+7bII1pz1Zgow6iPomAL+coeoy9cqPPcf56lHfc
	+CsFnXWJ5wZ9GkD1yeF1S0FXdFTN6gY=
X-Google-Smtp-Source: APXvYqyXvH8bJuzXk7Q+fj9qwg18adzziPwggTRPNhQyQlucmSDvoQ7vHQYNSL3Ig9H4zpCQs7lSpA==
X-Received: by 2002:a65:4345:: with SMTP id k5mr11484094pgq.252.1575762339239; 
	Sat, 07 Dec 2019 15:45:39 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::afb7])
	by smtp.gmail.com with ESMTPSA id
	h6sm19601553pgq.61.2019.12.07.15.45.38
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 07 Dec 2019 15:45:38 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  7 Dec 2019 15:45:26 -0800
Message-Id: <20191207234529.1222139-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/4] liblockdev: Loosen the regexp for py3
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
X-List-Received-Date: Sat, 07 Dec 2019 23:45:39 -0000
Content-Transfer-Encoding: 8bit

Fixes packaging with py 3.8

ERROR: libblockdev-2.23-r0 do_package: QA Issue: libblockdev: Files/directories were installed but not shipped in any package:
/usr/lib/python3.8
/usr/lib/python3.8/site-packages
/usr/lib/python3.8/site-packages/gi
/usr/lib/python3.8/site-packages/gi/overrides
/usr/lib/python3.8/site-packages/gi/overrides/BlockDev.py

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/libblockdev/libblockdev_2.23.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/libblockdev/libblockdev_2.23.bb b/meta-oe/recipes-extended/libblockdev/libblockdev_2.23.bb
index 761619d9af..3f4eec274f 100644
--- a/meta-oe/recipes-extended/libblockdev/libblockdev_2.23.bb
+++ b/meta-oe/recipes-extended/libblockdev/libblockdev_2.23.bb
@@ -17,7 +17,7 @@ SRC_URI = " \
 
 S = "${WORKDIR}/git"
 
-FILES_${PN} += "${libdir}/python2.7/dist-packages ${libdir}/python3.7/site-packages"
+FILES_${PN} += "${libdir}/python2.7/dist-packages ${libdir}/python3.*/site-packages"
 
 PACKAGECONFIG ??= "python3 lvm dm kmod parted fs escrow btrfs crypto mdraid kbd mpath nvdimm"
 PACKAGECONFIG[python3] = "--with-python3, --without-python3,,python3"
-- 
2.24.0


