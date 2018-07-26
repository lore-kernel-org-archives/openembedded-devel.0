Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 03DDC78C71
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Jul 2018 22:57:53 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id h15-v6so3225690wrs.7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Jul 2018 15:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=VEJE1zDS29H79YJBltiGII95KRscvftajcxA0QVaH0k=;
	b=Y85DKQjUaqubeq1z8PdqArh0qbm1UMo05NluhaSg823+BwUX9zI9UfTU1TT9CgGriv
	+gmRCfO7+clgtmwfmFZCO/08twFVOnvkYVkcVXQ0AoKe1MIbd4CKhZZAgP+GeS1yPgja
	g9IHnt1QFiAr8np1XaaHNJE07weWtuT02txi5+5M0LS7itITiVwEalKNYxAzxk+HJQtg
	s8xpXAImvt4J6fkvrcPVf1trx1Zs5KsxD2dr8v4/OQ3wqIkgrg41Tl3gqkJGbE6G3yt4
	PUIqaOFLErrCSDH789UtieSFoiGTQrukKNVpHMeKIKGYAqk2pabrXWQY9jLOEzvOTL/t
	eccA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=VEJE1zDS29H79YJBltiGII95KRscvftajcxA0QVaH0k=;
	b=sX1HAmTjWQ17JHrvPKw7I+LtyXOI5DuhkELOddn7WacoAEPdxf/i9v9dk7NZ/Vlo/h
	p5lSgvuLYp6iRNeLKejWj7LF2pgj9KBJWmdG3vAAab9PBFaVUjkkL9mv0zpFy9dVDD/V
	OsQXPpaK5I0JKp73zVeANFtOV8+vJwIW2TFvbB1UtOVnwqH+aIyPG4G9H6fmZnISNwAz
	ZC81oXc7BbiGD0EwKLH9dFT4gv0oBxORVUM6Tp0Y1qgURbW3yRSyM2tj6XHTLo6s8GwJ
	/vrluSPHVfLLVnBZ9WzRFY7E9l0SpzMD/m820LzWfYado65kVc0UwZKs7ef79dRz5/0I
	R4Ng==
X-Gm-Message-State: AOUpUlEkWW/ozqOhZsjh5/I0E+l6RsXlIIwAjFUrZ3D07B59DKa50DKG
	7lx2uO3IR/dniuLC2696gz4BcMNU6EA=
X-Google-Smtp-Source: AAOMgpeFlPBIXfAsEwwRaTx58xOdMfeEb4fig5aso27NeGUVv6d3RJAvHOJDTTamdv3q1eyTq7azlw==
X-Received: by 2002:a5d:6550:: with SMTP id
	z16-v6mr2894634wrv.194.1532645873607; 
	Thu, 26 Jul 2018 15:57:53 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	q3-v6sm1987061wmf.21.2018.07.26.15.57.52
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 26 Jul 2018 15:57:52 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 26 Jul 2018 23:57:51 +0100
Message-Id: <20180726225751.3037-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] postgresql: use util-linux's uuid
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
X-List-Received-Date: Thu, 26 Jul 2018 22:57:54 -0000

Postgreqsql was configured to use ossp-uuid but ossp-uuid is dead and everyone
will be building util-linux anyway, so use the libuuid.so from there.

Confusing the option is called e2fs because the library originated in e2fsprogs.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta-oe/recipes-dbs/postgresql/postgresql.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-dbs/postgresql/postgresql.inc b/meta-oe/recipes-dbs/postgresql/postgresql.inc
index 1301060ee5..44a1b30fe0 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql.inc
+++ b/meta-oe/recipes-dbs/postgresql/postgresql.inc
@@ -59,7 +59,7 @@ PACKAGECONFIG ??= "${enable_pam} openssl python uuid libxml tcl nls libxml perl"
 PACKAGECONFIG[pam] = "--with-pam,--without-pam,libpam,"
 PACKAGECONFIG[openssl] = "--with-openssl,--without-openssl,openssl,"
 PACKAGECONFIG[python] = "--with-python,--without-python,python,python"
-PACKAGECONFIG[uuid] = "--with-ossp-uuid,--without-ossp-uuid,ossp-uuid,"
+PACKAGECONFIG[uuid] = "--with-uuid=e2fs,--without-uuid,util-linux,"
 PACKAGECONFIG[tcl] = "--with-tcl --with-tclconfig=${STAGING_BINDIR_CROSS},--without-tcl,tcl tcl-native,"
 PACKAGECONFIG[nls] = "--enable-nls,--disable-nls,,"
 PACKAGECONFIG[libxml] = "--with-libxml,--without-libxml,libxml2,libxml2"
-- 
2.11.0


