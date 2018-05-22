Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id AF87B72EA2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 May 2018 11:46:14 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id j5-v6so32688775wme.5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 May 2018 04:46:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=/H1/X41QuSPDzNQSp7ij9ByUk/Mr9n5/a90TCpVEm1A=;
	b=UWk/ZMvniwqXh4tmXJRwjIgX9AcVhIe6Zk82rqsx/l+jTtCzOHPNgE9vzTqzvYeD+9
	2utiMm7OvVzZDdvkThuzBQZZcvA0m1b9ayrH7XCddF/ID1KAZMhAVjNtWtdhc3O8FNv2
	vQ8AXES5GS60Bf1DLjhgnwx/8Y2ANpfacpTQO/xGSqFGJwvCIdkgzpCQhdkWW+ZVbMVg
	Y3yEcnX7IxDwpI3q6wZCRzIJ1ARVar/bmMIxfcjRB99xXO6xxmpwIQU0BFoz/gklyECe
	7GPA4wn7EdBD7+i2JVS2iAKAtWb/z7eayb//GYIm3ZJe5aZZVP87rO/qETrXmwhyJon1
	F72w==
X-Gm-Message-State: ALKqPwdqfzb8DlrkN23WuMY3IYvpNWMY3jQ38CkJGNfZdDQo6z38uoVq
	43LJS0fwuBCbm7rxUjY7WBniwBIc
X-Google-Smtp-Source: AB8JxZoUlb7Nmew3oW66iEoNfRl6kyjqBg5BRdTdOwfZMiREc8irlGpszM4iqbHnLbCnEVg2ULRsgA==
X-Received: by 2002:a50:8005:: with SMTP id 5-v6mr1901486eda.130.1526989574718;
	Tue, 22 May 2018 04:46:14 -0700 (PDT)
Received: from tfsielt31850.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	m25-v6sm8636950edf.76.2018.05.22.04.46.13
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 22 May 2018 04:46:13 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 22 May 2018 12:46:13 +0100
Message-Id: <20180522114613.4915-1-git@andred.net>
X-Mailer: git-send-email 2.17.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] krb5: DEPENDS on bison-native
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
X-List-Received-Date: Tue, 22 May 2018 11:46:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <andre.draszik@jci.com>

bison-native is required for the build:

| yacc  getdate.y
| make[2]: yacc: Command not found
| make[2]: *** [<builtin>: getdate.c] Error 127

In most cases, this dependency comes indirectly via toolchain
dependencies, specifically binutils-cross, which pulls
bison-native.

Different setups, such as with external toolchains, or an
upcoming change to OE-core for avoiding exactly this
unnoticed dependency expose this problem, since the correct
dependency is not marked explicitly.

Signed-off-by: André Draszik <andre.draszik@jci.com>
---
 meta-oe/recipes-connectivity/krb5/krb5_1.16.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/krb5/krb5_1.16.bb b/meta-oe/recipes-connectivity/krb5/krb5_1.16.bb
index f95240f54..6eedd2a22 100644
--- a/meta-oe/recipes-connectivity/krb5/krb5_1.16.bb
+++ b/meta-oe/recipes-connectivity/krb5/krb5_1.16.bb
@@ -15,7 +15,7 @@ HOMEPAGE = "http://web.mit.edu/Kerberos/"
 SECTION = "console/network"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${S}/../NOTICE;md5=59b8da652f07186b44782a8454574f30"
-DEPENDS = "ncurses util-linux e2fsprogs e2fsprogs-native openssl"
+DEPENDS = "bison-native ncurses util-linux e2fsprogs e2fsprogs-native openssl"
 
 inherit autotools-brokensep binconfig perlnative systemd update-rc.d
 
-- 
2.17.0


