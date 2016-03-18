Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 8D07460721
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Mar 2016 16:26:54 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id l68so37595011wml.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Mar 2016 09:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=5si+3qOsOoG8lvXuzRIWOooWSsFzxUotgaFCQcOLg88=;
	b=sMgh/sxShXr4XYGLN7jiHfuuLHzgZj6a051lCKZOjRpV4vAQS6FlkzxUI+5bn10uoJ
	z6AH+Hih5gMOlGE/G32PcJIPb7Ea9DmRKXPhIpQkFZRulhRo4WjIJvPfw27N1Ldmxlt8
	/2tQ9Fs3qt3/bC6LVHwiZ/fXI5o8bovc+Xfa8h/50cOSBhlS179y0m/YnpBuk00ouzSo
	zPtE21rutOlcqEIaxxIH3DkxzQXRsIjXQFbyfZ/vjOmDebJElvyds1Idx+niX2uYu/fb
	IlFt78CcEnnJuSLEqw8yKX40TTOww8eoNlnxn1yaQVZpzOW0H1YYUcKf5G9aNkRWC4UQ
	GPGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=5si+3qOsOoG8lvXuzRIWOooWSsFzxUotgaFCQcOLg88=;
	b=Z+Xo3Xo+lI783VOQy374uZhVsNjLXM79KEDr96LKd0T/dbJVU2er2UIh+16NiIldkY
	dzOINavX3pCb32T1CMw25x2eFZfNs7kNx5XMroS0E3EPZVJ4VcaC8ggjRGJ0FLnlLIal
	TwCO5RzPvUr+A1oKk1kKagkxOou8FiS6B4B7tjdc/oDwbkm6z8Q8mp6Ytu76ZV/VoBlx
	xGeciFGH/JcfIwaMN1c6RqCN0mLoM3+8GSqkQMdokYgHtOgL+Appvr+GcuiWpyjhA8wt
	1AiWfusKzR2JTfGbORa4ujBPAW94YZiNMR2IJFJcdhkIKJfvFLDa+GV9hwvAFuldJTid
	tI3A==
X-Gm-Message-State: AD7BkJJ7VapmWHIozeNI5aU3G5NaxymnZozvZqBfh89EXHTmkaXKWPb9yhwgAtMj2t1Q3Q==
X-Received: by 10.194.143.82 with SMTP id sc18mr16601427wjb.14.1458318414448; 
	Fri, 18 Mar 2016 09:26:54 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id 82sm39554wmd.4.2016.03.18.09.26.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 18 Mar 2016 09:26:53 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 18 Mar 2016 17:30:47 +0100
Message-Id: <1458318648-6295-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.7.3
Subject: [PATCH][meta-oe 1/2] samba: include auth_unix only with pam in PACKAGECONFIG
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
X-List-Received-Date: Fri, 18 Mar 2016 16:26:54 -0000

* fixes:
  WARN: samba: samba rdepends on libpam, but it isn't a build dependency?
  reported by test-dependencies
* log.do_package shows:
  DEBUG: samba: Dependency libpam.so.0 requires package libpam (used by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/samba/4.1.12-r0/packages-split/samba/usr/lib/samba/libauth4.so)
* source4/auth/ntlm/wscript_build shows pam dependency:
  bld.SAMBA_MODULE('auth4_unix',
        source='auth_unix.c',
        subsystem='auth4',
        init_function='auth4_unix_init',
        deps='pam PAM_ERRORS LIBTSOCKET'
        )

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-networking/recipes-connectivity/samba/samba_4.1.12.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.1.12.bb b/meta-networking/recipes-connectivity/samba/samba_4.1.12.bb
index ff58dae..e9e2724 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.1.12.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.1.12.bb
@@ -82,7 +82,7 @@ SRC_URI += "${@bb.utils.contains('PACKAGECONFIG', 'sasl', '', 'file://21-avoid-s
 
 SAMBA4_IDMAP_MODULES="idmap_ad,idmap_rid,idmap_adex,idmap_hash,idmap_tdb2"
 SAMBA4_PDB_MODULES="pdb_tdbsam,${@bb.utils.contains('PACKAGECONFIG', 'ldap', 'pdb_ldap,', '', d)}pdb_ads,pdb_smbpasswd,pdb_wbc_sam,pdb_samba4"
-SAMBA4_AUTH_MODULES="auth_unix,auth_wbc,auth_server,auth_netlogond,auth_script,auth_samba4"
+SAMBA4_AUTH_MODULES="${@bb.utils.contains('PACKAGECONFIG', 'pam', 'auth_unix,', '', d)}auth_wbc,auth_server,auth_netlogond,auth_script,auth_samba4"
 SAMBA4_MODULES="${SAMBA4_IDMAP_MODULES},${SAMBA4_PDB_MODULES},${SAMBA4_AUTH_MODULES}"
 
 SAMBA4_LIBS="heimdal,!zlib,!popt,!talloc,!pytalloc,!pytalloc-util,!tevent,!pytevent,!tdb,!pytdb,!ldb,!pyldb"
-- 
2.7.3


