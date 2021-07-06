Received: from mail6.pr.hu (mail6.pr.hu [87.242.0.6])
 by mx.groups.io with SMTP id smtpd.web12.2887.1625554697731632796
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Jul 2021 23:58:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pr.hu header.s=pr20170203 header.b=OvjtmWLe;
 spf=pass (domain: pr.hu, ip: 87.242.0.6, mailfrom: zboszor@pr.hu)
Received: from [2a02:808:3:101::5] (helo=mail.pr.hu)
	by frontdoor.pr.hu with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.89)
	(envelope-from <zboszor@pr.hu>)
	id 1m0f28-0002Yh-9p; Tue, 06 Jul 2021 08:58:16 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pr.hu;
	s=pr20170203; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=5Gw1iHjfWrB45deRffw0pRzZ3ktvhfq7WHvftmfVSdI=; b=OvjtmWLeQJPiy1MW8ZrjanEobE
	NNXDKivCPZkHkbr5VUeH/V5zdyaY4YfiA2H2M7+ey/8qIF31H26XQqd6Peo8CNIz0gwvIu1dq/7CX
	COvv3rrYInsjOYoyRLwmFjM6f8NkCGjc9Jjsfu+Ej2g9Wcol5UkdMbu+DSvkt0VKVqvaoN7gqC+V2
	7+BZUZl6CP5wYJvFHJUvyMFcVdQnWBa+S0wo385BWNA7RRIzMfEkgMpVtvciVUssk4lMLhOuzOsQj
	k8i2yDb+mzxnWCN34s0sUYTaEGBkLfva9LtGnuU1Nl+esbo+t3OcM5Pw946LvWxZNO2qJKXa40JIr
	iLrT0Cjw==;
Received: from host-87-242-23-58.prtelecom.hu ([87.242.23.58] helo=localhost.localdomain)
	by mail.pr.hu with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <zboszor@pr.hu>)
	id 1m0f24-0007Qz-2C; Tue, 06 Jul 2021 08:58:14 +0200
From: "Zoltan Boszormenyi" <zboszor@pr.hu>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [meta-oe][PATCH 2/2] mariadb: Upgrade to 10.5.11
Date: Tue,  6 Jul 2021 08:57:49 +0200
Message-Id: <20210706065749.187264-2-zboszor@pr.hu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210706065749.187264-1-zboszor@pr.hu>
References: <20210706065749.187264-1-zboszor@pr.hu>
MIME-Version: 1.0
X-Spam-Score: -0.9 (/)
X-Scan-Signature: f863141675028d675eb61fc829984e23
X-Spam-Tracer: backend.mail.pr.hu -0.9 20210706065814Z
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Zoltán Böszörményi <zboszor@gmail.com>

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 .../{mariadb-native_10.5.10.bb => mariadb-native_10.5.11.bb}    | 0
 meta-oe/recipes-dbs/mysql/mariadb.inc                           | 2 +-
 .../mysql/{mariadb_10.5.10.bb => mariadb_10.5.11.bb}            | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-dbs/mysql/{mariadb-native_10.5.10.bb => mariadb-native_10.5.11.bb} (100%)
 rename meta-oe/recipes-dbs/mysql/{mariadb_10.5.10.bb => mariadb_10.5.11.bb} (100%)

diff --git a/meta-oe/recipes-dbs/mysql/mariadb-native_10.5.10.bb b/meta-oe/recipes-dbs/mysql/mariadb-native_10.5.11.bb
similarity index 100%
rename from meta-oe/recipes-dbs/mysql/mariadb-native_10.5.10.bb
rename to meta-oe/recipes-dbs/mysql/mariadb-native_10.5.11.bb
diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
index 7b1f537fb..71978740b 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -25,7 +25,7 @@ SRC_URI = "https://downloads.mariadb.org/interstitial/${BP}/source/${BP}.tar.gz
           "
 SRC_URI_append_libc-musl = " file://ppc-remove-glibc-dep.patch"
 
-SRC_URI[sha256sum] = "a5ff32f9fcaaf26bf5cba94accc7b246d2d5eb75710d027e40122df6bac0babb"
+SRC_URI[sha256sum] = "761053605fe30ce393f324852117990350840a93b3e6305ef4d2f8c8305cc47a"
 
 UPSTREAM_CHECK_URI = "https://github.com/MariaDB/server/releases"
 
diff --git a/meta-oe/recipes-dbs/mysql/mariadb_10.5.10.bb b/meta-oe/recipes-dbs/mysql/mariadb_10.5.11.bb
similarity index 100%
rename from meta-oe/recipes-dbs/mysql/mariadb_10.5.10.bb
rename to meta-oe/recipes-dbs/mysql/mariadb_10.5.11.bb
-- 
2.31.1

