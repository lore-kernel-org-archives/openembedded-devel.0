Return-Path: <costamagna.gianfranco@gmail.com>
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
	[209.85.221.42])
	by mail.openembedded.org (Postfix) with ESMTP id 04F276BA0E
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Apr 2019 13:11:47 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id g3so11952487wrx.9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Apr 2019 06:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=CS8HH+149HKYUPZD6uJy62T31q1oyGgMw9FDPQKl4Is=;
	b=YNwGvib+M8JmakX8Di1PBwE5fpYi1QGJErp4FF8KIxdt3peWA6e3GwYzf21P1QNhTB
	xl4NfSoVADCg1AqLTJlKPVcdao3fDnJ+BC2Rx1moU/MrunoOucVYlzOjPXt2CUb4xtqm
	NZqXJig8z/+UFWibHNmK7u6+vqiuEwnIR9DftFrs8FMl10DnlDRLGo1174QyPq/1uk9k
	9pLkrx6Vx7rpU0oooo43XfKumxGSyjpYE9pNhjRUm+M/gXFIh8WFjVaUZch/0/Za9cYb
	1nW8M5aq7FWEZoxR5BoWBUQaRDUhLY5CVnosTbCzZ96GGPPLtaC9Q334u+N3nrxw+V4Q
	9L/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=CS8HH+149HKYUPZD6uJy62T31q1oyGgMw9FDPQKl4Is=;
	b=hx+Yya8B1MTeOOTMiJLwQVknPavw4GHZrdmMklM9V6Viip7G2Z7JpLK5yhZNxFezAv
	J/aa0iYkZh5GnE1xOAX68n5b3uopix1Z9tts9ekKmNVUiZp/0mMYepgEAgXZjms2bAAF
	PDZbKNa8U+SAX4qF0LudA1ktliamp2P/XyY0MzOWYzLJCqmwypPQZYNpCTbo5oFO41q8
	ycOaZJXFtl67FS3sDVWuzQLceEHQS3v9sErEjZXTM1GGUixmPf+ZIZfRBLyCe0sHAoGD
	KwrYl1THoAjen9f7e4lGeuvMRo++kfhp/5gO8u1O6Uf1R1mwb1DNmFV/N1ibzBlVJyNW
	8wqA==
X-Gm-Message-State: APjAAAW4TSrqe2GfN7/Rldh+Zk4JNONr7Ci3ighEE3ur7fY6VdpNxcIU
	Usr2iBvUpiTfMOzUd5Q4JLWnyCoK
X-Google-Smtp-Source: APXvYqwYWCE8e/1LYytYK/PgHlNl+EivDVGVgDk2yzWVDPaO4K8bbJzH/Ol5wXsP7nHPw/O8V3GP9w==
X-Received: by 2002:adf:f10c:: with SMTP id r12mr40093987wro.216.1554124308318;
	Mon, 01 Apr 2019 06:11:48 -0700 (PDT)
Received: from Unimatrix05-Bionic.lan
	([2001:b07:5d32:c012:6d2c:49fa:2112:b346])
	by smtp.gmail.com with ESMTPSA id
	t24sm11742565wmi.10.2019.04.01.06.11.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 01 Apr 2019 06:11:47 -0700 (PDT)
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  1 Apr 2019 15:11:41 +0200
Message-Id: <20190401131141.7122-1-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.17.1
Cc: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Subject: [meta-oe][PATCH] libmodbus: start to prefer version 3.1.4 as default
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
X-List-Received-Date: Mon, 01 Apr 2019 13:11:48 -0000

 Now that even Debian testing is using it, and upstream declares this version as "very stable",
 it might be time to switch using it as default
---
 meta-oe/recipes-extended/libmodbus/libmodbus_3.1.4.bb | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta-oe/recipes-extended/libmodbus/libmodbus_3.1.4.bb b/meta-oe/recipes-extended/libmodbus/libmodbus_3.1.4.bb
index d438a0abc..cc45fa7e2 100644
--- a/meta-oe/recipes-extended/libmodbus/libmodbus_3.1.4.bb
+++ b/meta-oe/recipes-extended/libmodbus/libmodbus_3.1.4.bb
@@ -1,7 +1,4 @@
 require libmodbus.inc
 
-# Use the stable branch by default
-DEFAULT_PREFERENCE = "-1"
-
 SRC_URI[md5sum] = "b1a8fd3a40d2db4de51fb0cbcb201806"
 SRC_URI[sha256sum] = "c8c862b0e9a7ba699a49bc98f62bdffdfafd53a5716c0e162696b4bf108d3637"
-- 
2.17.1


