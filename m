Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id EDA676E681
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Apr 2016 16:12:35 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id e190so17989589pfe.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Apr 2016 09:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=RBuaphgda+884opZHCRjzoSHb+J//W+PkNJoO6WQ/oQ=;
	b=c1izxRB2OX7H2K47+9nb2+Vb6FAMqdoFCpzUogMTZ5sEL/BLF8Akwit2LnjvwVXESo
	ToZ1K3qZmw2Gb2J9X7eXw2q02BLdZIks5oA5f9LalCefUffl75y5kAEM+QFfYJe7qv1V
	+dcYsehNOWYVJQJ9M8ZwjulnOoMhG406Y91snt8EaNp0y/VXRTmkBL16YAFylwZR/BqQ
	P7817wv4L846XIpHmqbF5BQufkYf27surUCyjo+jc5YGYpCDvilx1x9sc1xIvxLM1TjH
	HVAMkfj4/oF96KlDWMwGo1l7uFAnMN6bPhzotC9+koS/M0GFy85WdALiS8a3LecQFiWT
	Up1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=RBuaphgda+884opZHCRjzoSHb+J//W+PkNJoO6WQ/oQ=;
	b=Acls4vCuI9T3rhQfEgaA13EKg3vYIvLsGuJtrB2Q6lA2n+oVMwywNwKKmxOP6cfyC8
	mVk5mkSOfUX9HwcF+VuUco8QdmZzuWhnx9hMjcM/grwQHRWehCHNccnln9o9DVBPbhNm
	6gvzO8Sxs918J7ANB3tIdA8U2e0toannJ85jJFOwhEMb/wcsXFMin69es+nRB5VNlNAK
	0X4rBo116WjS1fKoH6wwsAIL3INsfIGZOmhLtISWfnW9zTniIyZWaqlnIkQXkjklUjss
	NavcigINStZ3V9YsYuqQr75HCfLvbYf4dk9wxPr85WlrAO1bA4ojI1pHCqJ2DtsK3XM0
	0vRw==
X-Gm-Message-State: AOPr4FX8USv6KfZu0vlNbA0Guu1+/BPbzaRu3Zkf6rn4WrNrV2mfDOymG88DhIryyR/5ug==
X-Received: by 10.98.93.138 with SMTP id n10mr49913561pfj.43.1461600755851;
	Mon, 25 Apr 2016 09:12:35 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	x126sm29818419pfx.95.2016.04.25.09.12.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 25 Apr 2016 09:12:34 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	joe_macdonald@mentor.com
Date: Mon, 25 Apr 2016 09:12:29 -0700
Message-Id: <1461600749-19432-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
Subject: [meta-networking][PATCH] samba: fix QA warnings.
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
X-List-Received-Date: Mon, 25 Apr 2016 16:12:36 -0000

WARNING: samba-4.4.2-r0 do_package_qa: QA Issue: samba rdepends on libaio, but it isn't a build dependency, missing libaio in DEPENDS or PACKAGECONFIG? [build-deps]
WARNING: samba-4.4.2-r0 do_package_qa: QA Issue: samba rdepends on lttng-ust, but it isn't a build dependency, missing lttng-ust in DEPENDS or PACKAGECONFIG? [build-deps]

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-networking/recipes-connectivity/samba/samba_4.4.2.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.4.2.bb b/meta-networking/recipes-connectivity/samba/samba_4.4.2.bb
index 9358ca5..8ba2aeb 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.4.2.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.4.2.bb
@@ -27,7 +27,7 @@ inherit systemd waf-samba cpan-base perlnative
 # remove default added RDEPENDS on perl
 RDEPENDS_${PN}_remove = "perl"
 
-DEPENDS += "readline virtual/libiconv zlib popt libtalloc libtdb libtevent libldb krb5 ctdb libbsd"
+DEPENDS += "readline virtual/libiconv zlib popt libtalloc libtdb libtevent libldb krb5 ctdb libbsd libaio"
 
 SYSVINITTYPE_linuxstdbase = "lsb"
 SYSVINITTYPE = "sysv"
@@ -54,6 +54,7 @@ PACKAGECONFIG[systemd] = "--with-systemd,--without-systemd,systemd"
 PACKAGECONFIG[dmapi] = "--with-dmapi,--without-dmapi,dmapi"
 PACKAGECONFIG[zeroconf] = "--enable-avahi,--disable-avahi,avahi"
 PACKAGECONFIG[valgrind] = ",--without-valgrind,valgrind,"
+PACKAGECONFIG[lttng] = "--with-lttng, --without-lttng,lttng-ust"
 
 SAMBA4_IDMAP_MODULES="idmap_ad,idmap_rid,idmap_adex,idmap_hash,idmap_tdb2"
 SAMBA4_PDB_MODULES="pdb_tdbsam,${@bb.utils.contains('PACKAGECONFIG', 'ldap', 'pdb_ldap,', '', d)}pdb_ads,pdb_smbpasswd,pdb_wbc_sam,pdb_samba4"
-- 
2.3.5


