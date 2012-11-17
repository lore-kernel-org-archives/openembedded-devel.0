Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1TZrdR-00050R-OO
	for openembedded-devel@lists.openembedded.org;
	Sun, 18 Nov 2012 00:17:13 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so1481933eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Nov 2012 15:03:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=a4wuD3/yOG4kjSlYnxSko/PNOUyBOjkl7b+lL0lJCYI=;
	b=mtFrPuhOK1WhIO7e0UpNzFzdLlCuBaaoqZkdS9zxbX2ZCWYfFW4XL+qVLoxWd+gcAr
	oRa1+E6bm937f3ZoitP+xDNM7Ga+cWhnDEv5s1AL8KvA2NAAgIHXduCLMo/xJCUuNZRk
	ZUDAUuqf1Wk4fNMhTiDHDSCQBZifK8xhroxRatWJaignZwZOXBKVrj68fJhMxDkU/Haa
	vDthdZWhYV4eACcLzZR1s5jVbi8ZByxMgNQuMwEuumO3jKmQVZLuIDyxyhqh8HEF+cy8
	BXgJF5T8toF5/nCEw7RRqs8HgCDv9agSNr9QfSEC2pUDO8aVYyFxBDNooJh+eVJPdWG5
	jAlQ==
Received: by 10.14.209.136 with SMTP id s8mr9690218eeo.33.1353193393541;
	Sat, 17 Nov 2012 15:03:13 -0800 (PST)
Received: from otp-agherzan-l1.wrs.com.com (5-13-212-52.residential.rdsnet.ro.
	[5.13.212.52])
	by mx.google.com with ESMTPS id b44sm13444706eep.12.2012.11.17.15.03.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 17 Nov 2012 15:03:12 -0800 (PST)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 18 Nov 2012 01:03:02 +0200
Message-Id: <1353193382-4019-1-git-send-email-andrei@gherzan.ro>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQkl8sYRKqdn/RS5xj6jxo63V+mjFuxm0N9YPmQeEkYXhGQiN+UJ3+extCdagurtH4ctZbpN
Subject: [meta-oe][PATCH] samba: Add rdepends to perl as perl scripts are packaged
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 17 Nov 2012 23:17:13 -0000

Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
---
 meta-oe/recipes-connectivity/samba/samba-basic.inc |    2 ++
 meta-oe/recipes-connectivity/samba/samba_3.6.8.bb  |    2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/samba/samba-basic.inc b/meta-oe/recipes-connectivity/samba/samba-basic.inc
index 5d816f9..f67379d 100644
--- a/meta-oe/recipes-connectivity/samba/samba-basic.inc
+++ b/meta-oe/recipes-connectivity/samba/samba-basic.inc
@@ -11,6 +11,8 @@ EXTRA_OECONF += "\
 
 PACKAGES =+ "winbind winbind-dbg libnetapi libtdb libsmbsharemodes libsmbclient libsmbclient-dev cifs cifs-doc swat"
 
+RDEPENDS_${PN} = "perl"
+
 FILES_winbind-dbg = "${libdir}/idmap/.debug/*.so \
                      ${libdir}/security/.debug/pam_winbind.so \
 "
diff --git a/meta-oe/recipes-connectivity/samba/samba_3.6.8.bb b/meta-oe/recipes-connectivity/samba/samba_3.6.8.bb
index cc09a48..7c54dae 100644
--- a/meta-oe/recipes-connectivity/samba/samba_3.6.8.bb
+++ b/meta-oe/recipes-connectivity/samba/samba_3.6.8.bb
@@ -3,7 +3,7 @@ require samba-basic.inc
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://../COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI += "\
     file://config-h.patch \
-- 
1.7.10.4



