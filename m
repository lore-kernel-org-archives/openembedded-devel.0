Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
	[209.85.215.171])
	by mail.openembedded.org (Postfix) with ESMTP id 75C8D7EEC2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Jul 2019 16:39:35 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id w10so16490840pgj.7
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Jul 2019 09:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=2hWri7aYP2FEbc9/PC7Id84WQeY74tiFXsDZS+5C2mo=;
	b=BEIp39r2ta7yNfdMHxreOL0Pz+8ErtREZvI6AwC5GDko9PKR+P0zkmDiKLTqfWi0mZ
	UihpS/WdwtFnMjIi3zPxsoO/HCAFGtj7xX0yDCYNcyLNwYANVWxRCgYzv/4BvB7zXlGN
	bya35noSfV/PIM6LjLDyFUZZBtcxQ9s55lzLlGhbPhSWh5TYilEW7rvF6rH4qzngPN5z
	HavjYvANZNaHWyehyT2TiaQ7ZNEhUcJXttnjZr1G5DTKVG6+9QKz6JtqCmMwI/IosrtX
	PtShv2PptC+VU2JMz+BChqi4VZR93YgATqTXOdwY1pOE9qkaNRJNeuznuxZnUjH3hDCe
	7ALg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=2hWri7aYP2FEbc9/PC7Id84WQeY74tiFXsDZS+5C2mo=;
	b=KoTKxlaDeHt43RmvN0Jh5oBaPBHLExY1k+Hc02RLvCCxGu1n4vqj+kuexVQPc80U/g
	u2prS3eFzV6WzCjq60KYbPn9t1cujqELIO9BtZjV7wQvR6aumAKFwA/Wm7ju3EcrEtWU
	CseuTgKFc9XrXZpTE4fxuoPV0nKhCfB9SLHYU5Tx57gFxqw9YAreUGkbbMQxkv0TaUB0
	BTz6VXN3y6Aa6CGO1Bp9DmyaZ2ql8Fuml+QsNwecepexCKKXeSFgtLuzK/uwnBbqUOj1
	mZIRpdBCt6TcYk1TRaW6Sl4JtXKM7NgNKupsKURHRl41pZzJ6hRYX9+EuKMAwDdEL9f6
	VE+w==
X-Gm-Message-State: APjAAAUjgpYM4jex7KZfa8/zD/qhRyo3KtGxkSCPW7F+7Kexg+IVwWq+
	1/0j6v0mHD1IYqL8qC97/T9BAfwiCFA=
X-Google-Smtp-Source: APXvYqw7ReuwTFSNsCaz4B6M/2YHaQBaMdsocXnJkCJQvSHvWeqaNwRPBx4YTOmuEbPwUq7BY/SNvQ==
X-Received: by 2002:a17:90a:9301:: with SMTP id
	p1mr72155749pjo.22.1563727176212; 
	Sun, 21 Jul 2019 09:39:36 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	35sm38763285pgw.91.2019.07.21.09.39.35
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sun, 21 Jul 2019 09:39:35 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 21 Jul 2019 09:39:15 -0700
Message-Id: <20190721163919.32659-10-raj.khem@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190721163919.32659-1-raj.khem@gmail.com>
References: <20190721163919.32659-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 10/14] pam-plugin-ldapdb: Use git fetcher
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
X-List-Received-Date: Sun, 21 Jul 2019 16:39:35 -0000
Content-Transfer-Encoding: 8bit

github archives are not reliable

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/pam/pam-plugin-ldapdb_1.3.bb | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-extended/pam/pam-plugin-ldapdb_1.3.bb b/meta-oe/recipes-extended/pam/pam-plugin-ldapdb_1.3.bb
index c59a259fc3..2fdadcbc9f 100644
--- a/meta-oe/recipes-extended/pam/pam-plugin-ldapdb_1.3.bb
+++ b/meta-oe/recipes-extended/pam/pam-plugin-ldapdb_1.3.bb
@@ -10,11 +10,10 @@ DEPENDS = "libpam openldap"
 inherit distro_features_check
 REQUIRED_DISTRO_FEATURES = "pam"
 
-SRC_URI = "https://github.com/rmbreak/pam_ldapdb/archive/v${PV}.tar.gz;downloadfilename=${BP}.tar.gz"
-SRC_URI[md5sum] = "2dd4f1370fcfe995ee0ad09611109b87"
-SRC_URI[sha256sum] = "8ed92b36523556bb5d9bf3eb33a1035e46041d4be767c8d62136930c0ca0e45b"
+SRCREV = "84d7b260f1ae6857ae36e014c9a5968e8aa1cbe8"
+SRC_URI = "git://github.com/rmbreak/pam_ldapdb"
 
-S = "${WORKDIR}/pam_ldapdb-${PV}"
+S = "${WORKDIR}/git"
 
 do_install () {
     oe_runmake install DESTDIR=${D} PAMDIR=${base_libdir}/security
-- 
2.22.0


