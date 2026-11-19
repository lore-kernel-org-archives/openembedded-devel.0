Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1894.1795113465000274553
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Nov 2026 10:37:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=ZPJSMnQA;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8b904d10882so71411b3a.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 10:37:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795113464; x=1795718264; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QP6oPwa70E5kCFOZjGla0Yl4/YlmeEjF3j013wiu/k0=;
        b=ZPJSMnQA21gSpnxgl+lgWHqcoBU7VHXoofE9Gk1aEBmWnk6V562/Lg3TYbVhdhQ+8S
         yeo/bFdJjw5DNGSRrCYkZE+a/kJaJPiGK/RRX/UGCs/oqN+L9O7iENtoMnJYdtgF51/f
         a5vflpbV+aDeTucRjApJve9ETCh9Z6TSqZ1siX/7C29mxqvYgndmkdKw+GbqTzLR+1QC
         Ds8jHd/pL8fd26PXSCgaWjpPJmfBB2jc4E42n/xrv7f9S1nndLAPjg0pFU2CwzS49Z7+
         S/aJW2D5DK4PjuMd5rFSvRYEa9akGFX+MJtXlS9NxaK97qUeFJWu/yYJa5QBytt6CUee
         wHuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795113464; x=1795718264;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QP6oPwa70E5kCFOZjGla0Yl4/YlmeEjF3j013wiu/k0=;
        b=qYPsAkp80jiUB5SyAN3ACYAo/8Z8UhQLQhs3GD26cCrY90WlAoDS1vq4INg2kF1Rec
         Qilm5Tuumt6u6O8N7FROvcLh61Ekuq7mUnnMgfbjVdJqSt3H6sV5zi3rSBnGillke3dE
         r+rLfMOZsOKeto1KrAsz4mXKsHx8i+lVi64YYcsVOGqm3JbldL86NI2Xm2fDDoGX2Njz
         Dp4MdrTX3tBGVu4F5Zde21dVE8ULea+uP7wFl3AcLE+tNMmyZ/oqxFFFpk8n8sFlxOyA
         3TFMnXnesdsT88SulSocwHsFJcrnKUoGthb7zvBaCdmXWwRQB64Yf/fW17aVu6h2Ix1T
         Qapw==
X-Gm-Message-State: APuU4Z/cV+x2rAeSlt8D2V643n/LKaxToyyGVr0KUJ5dUggLY66IA7FZ
	fDWaqAtV0VfmYYNP3Z6ngVafyVyhob1TEdneL6u3otXKfOr78rU6RveAmeZhlg==
X-Gm-Gg: AYBFou3WZ9M0nf3bqy3nXEPRGdsf9sVAFWe3N7APlYWBwd8VjvHnH1Iyd4aJQb0hKXO
	5c4efhV2R3/z3QQTZxSiMBx+KNc5cPTjAavl6t9J0R04hMJCBfR5NabIh63u+pBB4whus+Kxv++
	xiRZFNIvRY6hvyVoeNtu8TkZX1aDVswR0ZnO1aGZhGkruq36QhxfkOcWns+qjvr+y4v5Phu+Yzr
	1fJ5IvGZJZBjasSgltwfVxdRNGfObKef9lYZ3AR0SvoUaHY89ESB/WiWFb1+FA5EbUOmo5JDaQB
	QA0DQbZtGaSpAK7POWUqDBoaAt4HnP1dCZIDKLFMwtkvKRVnsA8mJOyWucULC0W0sxaWI/GtpKD
	e3LhbDysL8C+vFF1mtwpI6bkSvo4MUVXVBdBa+YY3jNsbPrgJ71ovGpAp21q8Kck2gt9n0k8siO
	POdZhkEQANDg8xy9acSjTFDvULFr4Xi1VdtoFK0jyjBd+cPkaQq3oid+CGVcLeSWa1Jwqrd61EJ
	zks3sMaeit0GoX2jUcY3yfUNrKDBHCjUHG7TG0jqvrTVTBS8arGU6+WgX8sWUrZhcq+xtZBekPk
	7yMyOpVVMYXa0jLdZ5hd0sCQMJykkduXUS161miHCVW5CY8q8Zy78moh8tiueQ==
X-Received: by 2002:a05:6a00:419b:b0:881:c881:96e8 with SMTP id d2e1a72fcca58-8c87c388455mr480805b3a.23.1795113464289;
        Thu, 19 Nov 2026 10:37:44 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e4d7basm294518b3a.21.2026.11.19.10.37.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 10:37:43 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [blacksail][PATCH 43/64] webmin: patch CVE-2026-125391
Date: Fri, 20 Nov 2026 07:33:11 +1300
Message-ID: <822648cbe30d20fdcf2f959b3e9849cc6718e37f.1795112941.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795112941.git.ankur.tyagi85@gmail.com>
References: <cover.1795112941.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 18:37:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132733
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-125391

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../webmin/files/CVE-2026-125391.patch        | 37 +++++++++++++++++++
 .../recipes-webadmin/webmin/webmin_2.653.bb   |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta-webserver/recipes-webadmin/webmin/files/CVE-2026-125391.patch

diff --git a/meta-webserver/recipes-webadmin/webmin/files/CVE-2026-125391.patch b/meta-webserver/recipes-webadmin/webmin/files/CVE-2026-125391.patch
new file mode 100644
index 0000000000..077adc95d5
--- /dev/null
+++ b/meta-webserver/recipes-webadmin/webmin/files/CVE-2026-125391.patch
@@ -0,0 +1,37 @@
+From 86791cd2bd1848b3967dc86ae0909493e768db7e Mon Sep 17 00:00:00 2001
+From: Ilia Ross <ilia@ross.gdn>
+Date: Sun, 8 Nov 2026 17:38:12 +0100
+Subject: [PATCH] Fix Samba account option command injection
+
+(cherry picked from commit 18cab89b1fc74ab7e8b1b8b90bbccbe5aba99154)
+CVE: CVE-2026-125391
+Upstream-Status: Backport [https://github.com/webmin/webmin/commit/18cab89b1fc74ab7e8b1b8b90bbccbe5aba99154]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ samba/samba-lib.pl | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/samba/samba-lib.pl b/samba/samba-lib.pl
+index bafd03b8b..2bd90ba26 100755
+--- a/samba/samba-lib.pl
++++ b/samba/samba-lib.pl
+@@ -656,7 +656,8 @@ if ($has_pdbedit) {
+ 		"cd / && $config{'pdbedit'} -a -s $config{'smb_conf'} -t -u ".
+ 		quotemeta($user->{'name'}).
+ 		($config{'sync_gid'} ? " -g $config{'sync_gid'}" : "").
+-		" -c '[".join("", @opts)."]' $ws <$temp 2>&1");
++		" -c ".quotemeta("[".join("", @opts)."]").
++		" $ws <$temp 2>&1");
+ 	$? && &error("$config{'pdbedit'} failed : <pre>$out</pre>");
+ 	}
+ else {
+@@ -700,7 +701,8 @@ if ($has_pdbedit) {
+ 		$out = &backquote_logged(
+ 			"cd / && $config{'pdbedit'} -r -s $config{'smb_conf'} -u ".
+ 			quotemeta($_[0]->{'name'}).
+-			" -c '[".join("", @opts)."]' 2>&1");
++			" -c ".quotemeta("[".join("", @opts)."]").
++			" 2>&1");
+ 		$? && &error("$config{'pdbedit'} failed : <pre>$out</pre>");
+ 		}
+ 	}
diff --git a/meta-webserver/recipes-webadmin/webmin/webmin_2.653.bb b/meta-webserver/recipes-webadmin/webmin/webmin_2.653.bb
index a46c3aad16..e4380e16a0 100644
--- a/meta-webserver/recipes-webadmin/webmin/webmin_2.653.bb
+++ b/meta-webserver/recipes-webadmin/webmin/webmin_2.653.bb
@@ -17,6 +17,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/webadmin/webmin-${PV}.tar.gz \
            file://media-tomb.patch \
            file://mysql-config-fix.patch \
            file://webmin.service \
+           file://CVE-2026-125391.patch \
             "
 SRC_URI[sha256sum] = "9acc680d3d45cee876f36fc8810ce68bb6e44a0365e245a4298a180e0d016696"
 UPSTREAM_CHECK_URI = "http://www.webmin.com/download.html"
