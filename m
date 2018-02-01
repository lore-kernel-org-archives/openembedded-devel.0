Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f68.google.com (mail-pl0-f68.google.com
	[209.85.160.68])
	by mail.openembedded.org (Postfix) with ESMTP id 2F47477D16
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Feb 2018 01:44:26 +0000 (UTC)
Received: by mail-pl0-f68.google.com with SMTP id o13so2259486pli.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Jan 2018 17:44:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=IAhm0AcgYUrlodoMbWeQspYXApIhrtll30cKb+aoKKA=;
	b=bA+vS7TaH9eV0qMHSAQqCjA6y5hRU3qNmKTpUAwwlRNt2hdcjhD1RfTqdkXWAP4onb
	5cfmAGMAkQU+qtFsfQ6Dc8Nh9b58lV4YPTzX2LZM9/tsebCESfLZVDwDyPpd6/RO556Y
	fTXSoYtzUlu9fskNhZ2sV1As/dcZ/GAgZlUhIOIfQlPBoiZvEICxByL3AKOBcA8pIEL1
	6A30wfQ+zEA2C843DRjETUFZ4EyZ1IpYeqXeUONnnFlyMqK/ogVIZdhJnW+6wrwNfGFS
	7F4qTIVmO1NxMJBZsJKm+d4coLrHe1P8jqgtGjNI/H/d5TITe7vhpHtNfOPz6p3wYGph
	FN4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=IAhm0AcgYUrlodoMbWeQspYXApIhrtll30cKb+aoKKA=;
	b=Scniiopz/ZjBPo1uFD+b7LRLn6EfvufuSqHF2Ld+lyj4udRKSoaWaRrq5+wjNYi9w5
	lCoKdR6OJ8m9Z8hbZtDrmAkiKj3yilNC5j1fRqpt1R3s9IFavjpyIhQXpqy286JoOMzb
	kcLPLIW+ZyeqZLjJWGxfNW4CuGhZ/nOFNaIkXonb/3Gn1lR6IMCUNBhM0CuMF8N4eToH
	kpyfIbIsBCPFs8Ak0A1sy2I529Iw6K+RSgwBPjmnCxLzdC0/VLVmdI2SLSO0R4n/Ix0E
	ApKqLAIn34e+o7VzFYXamMO/UhdP8ZWZWL+LMLRdsI5Lnts/5rtUuVAUyCln2uvYdpp/
	dm+Q==
X-Gm-Message-State: AKwxyteT7ZNyiMPd9AYYlzZhxtNC6FUdx08VGBlSHcwLIMyJhu0LafPp
	MesbFsQRqgt8cDIxDp2dnl4foQ==
X-Google-Smtp-Source: AH8x226/r0Y6FoYuqn76uhFy4EX4JAXE4/Yj2cfqSnojI9myI6GeOKIHoP8ll0oq4YcyTMdVPYP5CA==
X-Received: by 2002:a17:902:12f:: with SMTP id
	44-v6mr28880855plb.403.1517449467993; 
	Wed, 31 Jan 2018 17:44:27 -0800 (PST)
Received: from localhost.localdomain ([2601:646:8880:466c::a8d6])
	by smtp.gmail.com with ESMTPSA id
	b63sm48160246pfl.78.2018.01.31.17.44.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 31 Jan 2018 17:44:27 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 31 Jan 2018 17:44:13 -0800
Message-Id: <20180201014414.12948-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.16.1
Subject: [meta-networking][PATCH 1/2] net-snmp: Fix compiler options with paths in net-snmp-config
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
X-List-Received-Date: Thu, 01 Feb 2018 01:44:27 -0000

options which involve paths into workspace are usually filtered out
with the sed command, however currently it does half the job and the
resulting config file gets partial replacements leaving the compiler
options with bad syntax e.g.

-fdebug-prefix-map option is left with -fdebug-prefix-map=
which is not correct syntax, the effect of this is seen in other
recipes which then invoke net-snmp-config script and add the
flags obtained from this script into its own configure scripts
and then tries to execute tests, these tests fail because of
bad compiler options e.g. keepalived where configure tests fails like

| configure: error: *** incorrect CFLAGS from net-snmp-config

this is because of wrong compiler options that it got from
recipe-sysroot/usr/bin/crossscripts/net-snmp-config

This patch tries to be specific about which options should
be skimmed and removes the options completely

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb
index 29cd6b3bf..584593b17 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb
@@ -118,10 +118,10 @@ do_install_append() {
     sed    -e "s@^NSC_SRCDIR=.*@NSC_SRCDIR=.@g" \
         -i ${D}${bindir}/net-snmp-create-v3-user
     sed    -e "s@^NSC_SRCDIR=.*@NSC_SRCDIR=.@g" \
-           -e "s@${STAGING_DIR_NATIVE}[=]*@@g" \
-           -e "s@${STAGING_DIR_HOST}[=]*@@g" \
-           -e "s@${WORKDIR}[=]*@@g" \
-           -e "s@${D}@@g" \
+           -e "s@\([^ ]*-fdebug-prefix-map=[^ ]*\)\1*@@g" \
+           -e "s@\([^ ]*--sysroot=[^ ]*\)\1*@@g" \
+           -e "s@\([^ ]*--with-libtool-sysroot=[^ ]*\)\1*@@g" \
+           -e "s@\([^ ]*--with-install-prefix=[^ ]*\)\1*@@g" \
         -i ${D}${bindir}/net-snmp-config
 
     if [ "${HAS_PERL}" = "1" ]; then
-- 
2.16.1


