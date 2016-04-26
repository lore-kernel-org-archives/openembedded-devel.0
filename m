Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com
	[209.85.220.52])
	by mail.openembedded.org (Postfix) with ESMTP id 5E76560670
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Apr 2016 19:18:48 +0000 (UTC)
Received: by mail-pa0-f52.google.com with SMTP id r5so10137456pag.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Apr 2016 12:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=mgxSsXko5OLwH5gIbO6/aI0wOjwqeWHE33V8H8abBjA=;
	b=uGkMOCJRj9dMzbWa9UotZAQIKRCpO2yUsZAE2qU6a31kVpvo4BNiiPtdh9109JjG7V
	PZm2daZ74xtOsoZE8dSa905FcX65pusRz3j6zj4+Lfit5T2iiT9Jqy/IpzgoAE67L48o
	2GcSKeD0BKR2sTU1l23hZo3ol/aXDszo+DxY8CemSTE1N0BCmzOZS3szr8M5Wt0sI92z
	nd3IXURzSJooVcEH0qbOmsCTfKeKvxO5wOMXJFf4qauwvn8IQ1xwVrNszNLLcpIic9iZ
	vsRM0HHTOnNHBC9DYzLTgUnrFSyfhq0SMxUg1ou/yDG3nXOpfANIS2Mb0cvE7yzgJFwe
	pY6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=mgxSsXko5OLwH5gIbO6/aI0wOjwqeWHE33V8H8abBjA=;
	b=Yqha4qh2pkuSZ2KI0MwkUrKAzP9MNsGAnBqNFY0LXKgNZM4gtlAw8Eh2U1JarOfSpp
	nZaNpGGxPw9uO0dZ9r99Pari09EQ0W5OnEM2T/wtMvG46bUJQQY546xYQqcTkXsai/iW
	oNRtxd2zRbxEkEwNwWa1IRBAS1r0Sov1ke/Xlp/VzVpDc+rzg2DFdWeh/3QFYLdyATDU
	53ulkNMSLeIogd/n7vOxtjBn9W1BKBAbEXE/af6VnFTMMEP+dtNStvdQ+cS77iPiifWo
	e3X4N3RwK/hVzG9Kxomyez9J4Sf4owd6IcADrpfGEi0QGPSq6MQXR1iJ0oY+IdgiPOyg
	Lj+Q==
X-Gm-Message-State: AOPr4FWyFoXvYKFeDf5S76anZ/a5FYmKIcF5WchRmRTjXAsRK53E2lTQVjfmgBxLJowsZQ==
X-Received: by 10.66.119.177 with SMTP id kv17mr6096020pab.124.1461698328880; 
	Tue, 26 Apr 2016 12:18:48 -0700 (PDT)
Received: from Pahoa2.mvista.com ([64.2.3.194])
	by smtp.gmail.com with ESMTPSA id 184sm170919pfd.43.2016.04.26.12.18.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 26 Apr 2016 12:18:47 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	joe_macdonald@mentor.com
Date: Tue, 26 Apr 2016 12:18:41 -0700
Message-Id: <1461698321-14530-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
Subject: [meta-networking][V2][PATCH] samba: fix QA warnings.
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
X-List-Received-Date: Tue, 26 Apr 2016 19:18:48 -0000

V2:
Fix
WARN: samba: samba rdepends on libarchive, but it isn't a build dependency?

V1:
WARNING: samba-4.4.2-r0 do_package_qa: QA Issue: samba rdepends on libaio, but it isn't a build dependency, missing libaio in DEPENDS or PACKAGECONFIG? [build-deps]
WARNING: samba-4.4.2-r0 do_package_qa: QA Issue: samba rdepends on lttng-ust, but it isn't a build dependency, missing lttng-ust in DEPENDS or PACKAGECONFIG? [build-deps]

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-networking/recipes-connectivity/samba/samba_4.4.2.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.4.2.bb b/meta-networking/recipes-connectivity/samba/samba_4.4.2.bb
index 9358ca5..63586ba 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.4.2.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.4.2.bb
@@ -27,7 +27,7 @@ inherit systemd waf-samba cpan-base perlnative
 # remove default added RDEPENDS on perl
 RDEPENDS_${PN}_remove = "perl"
 
-DEPENDS += "readline virtual/libiconv zlib popt libtalloc libtdb libtevent libldb krb5 ctdb libbsd"
+DEPENDS += "readline virtual/libiconv zlib popt libtalloc libtdb libtevent libldb krb5 ctdb libbsd libaio"
 
 SYSVINITTYPE_linuxstdbase = "lsb"
 SYSVINITTYPE = "sysv"
@@ -54,6 +54,9 @@ PACKAGECONFIG[systemd] = "--with-systemd,--without-systemd,systemd"
 PACKAGECONFIG[dmapi] = "--with-dmapi,--without-dmapi,dmapi"
 PACKAGECONFIG[zeroconf] = "--enable-avahi,--disable-avahi,avahi"
 PACKAGECONFIG[valgrind] = ",--without-valgrind,valgrind,"
+PACKAGECONFIG[lttng] = "--with-lttng, --without-lttng,lttng-ust"
+PACKAGECONFIG[archive] = "--with-libarchive, --without-libarchive, libarchive"
+
 
 SAMBA4_IDMAP_MODULES="idmap_ad,idmap_rid,idmap_adex,idmap_hash,idmap_tdb2"
 SAMBA4_PDB_MODULES="pdb_tdbsam,${@bb.utils.contains('PACKAGECONFIG', 'ldap', 'pdb_ldap,', '', d)}pdb_ads,pdb_smbpasswd,pdb_wbc_sam,pdb_samba4"
-- 
2.3.5


