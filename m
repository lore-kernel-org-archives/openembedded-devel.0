Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0E8EC600E3
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Feb 2017 05:35:26 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id 204so11078660pge.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Feb 2017 21:35:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=CfQxYzEh7ej+M2HvFoJdvTSvuEU4fevdcGPPn9FW48s=;
	b=HDmaHLzjd5yQuV5CZMOtGSg9uTpfYMY4iARoeJoaGiSwr6/ny1y70JrF+qb8M3RcR7
	4vOG79iqxYKLA/NwRz1ATQVWp0qGrAPRo7MTcLc/XIWapztZ9DK6oNrwYgKHZWjLSnj9
	82xXKE6gfZiaWKZKtSsA6niQYbHTp3flUFzJX/fWHB5cbdNwW+kPfKoiOqQLsVBhcDSN
	ESZGRvTe2JMhvO8LZbxsnRApeV5N7dQcB7Ys5tKtqeErXNA9oPyHWYVlAkDhTXofTJs3
	9aQWBkEPgtt5FuUNHK+LEvpXofmiwv85g4laM8MYU34H3KstwmRhsKq1cGhf8Gn8CQGe
	KOXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=CfQxYzEh7ej+M2HvFoJdvTSvuEU4fevdcGPPn9FW48s=;
	b=lsNF7CPwwFo10tSQMV6t27MZv+hYJVvZHEVIuiGcU6vv8nNYg6GLTb7hbeIPABcQD+
	BjCVHzYpMFXAB+dOUhGV2RYfUiiSiJ0qWmTr0/I6+68FMaZ7OcBQHulybdNFEctLqaLG
	05Tpxq3ECKBQ5qRgKJQujOD9z/OBVkZ35Wexd87gzLV0d/A9lr+jHjxC9jRjxUNQA5Tf
	4jWZ7yPY5k2JwU+Vgjv8tN1+hOaVVltJhSUpvN1WC6rP5SRkyFkh3+jROxpBFolDyiob
	/KOR6xHs5vw35gmeHLoQQGkhLeZyqRMimwvBmnhMWoxZy4aLel7BNdAzw1eA2/MufxUp
	Zabg==
X-Gm-Message-State: AIkVDXKn4+okqF7Xm8+9ysWNfnIrQj+c7HLqQqd26g6QQ2s/wh8iYPnvsDhSaAVhIi8Yqg==
X-Received: by 10.99.154.9 with SMTP id o9mr17960057pge.69.1486445727060;
	Mon, 06 Feb 2017 21:35:27 -0800 (PST)
Received: from localhost.localdomain ([2601:202:4001:9ea0:c634:6bff:fe01:a196])
	by smtp.gmail.com with ESMTPSA id
	t15sm7006086pgn.18.2017.02.06.21.35.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 06 Feb 2017 21:35:26 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	akuster@mvista.com
Date: Tue,  7 Feb 2017 00:35:25 -0500
Message-Id: <20170207053525.2194-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.9.3
Subject: [meta-networking][PATCH] ipsec-tools: change SRC_URI fetcher.
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
X-List-Received-Date: Tue, 07 Feb 2017 05:35:27 -0000

ERROR: ipsec-tools-0.8.2-r0 do_checkuri: Fetcher failure for URL: 'ftp://ftp.netbsd.org/pub/NetBSD/misc/ipsec-tools/0.8/ipsec-tools-0.8.2.tar.bz2'. URL ftp://ftp.netbsd.org/pub/NetBSD/misc/ipsec-tools/0.8/ipsec-tools-0.8.2.tar.bz2 doesn't work
ERROR: ipsec-tools-0.8.2-r0 do_checkuri: Function failed: do_checkuri

https seems more reliable.

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.2.bb b/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.2.bb
index a9b5b95..bf89927 100644
--- a/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.2.bb
+++ b/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.2.bb
@@ -9,7 +9,7 @@ DEPENDS = "virtual/kernel openssl readline flex-native bison-native"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-SRC_URI = "ftp://ftp.netbsd.org/pub/NetBSD/misc/ipsec-tools/0.8/ipsec-tools-${PV}.tar.bz2 \
+SRC_URI = "http://ftp.netbsd.org/pub/NetBSD/misc/ipsec-tools/0.8/ipsec-tools-${PV}.tar.bz2 \
            file://0002-Don-t-link-against-libfl.patch \
            file://configure.patch \
            file://0001-racoon-pfkey-avoid-potential-null-pointer-dereferenc.patch \
-- 
2.9.3


